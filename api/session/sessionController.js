const helper = require('../../utils/helper.js');
const db = require('../../utils/database.js');
const sessionSchema = require('./sessionSchema');
const moment = require('moment');

const registration = async (req, res) => {
  try {
    const inputCheck = sessionSchema.validate(req.body);
    const { value, error } = inputCheck;

    if (error) {
      const response = {
        rc: '05',
        message: error.details[0].message,
      };
      return res.status(400).json(response);
    }

    const checkloginStatement =
      'SELECT user_id FROM `session` WHERE device_id = ?';
    const checkLogin = await db.query(checkloginStatement, [
      req.headers.deviceid,
    ]);
    if (checkLogin[0] !== undefined) {
      const resErr = {
        rc: '63',
        message: 'device masih login',
      };
      return res.status(400).json(resErr);
    }

    let {
      name,
      username,
      password,
      age,
      body_weight,
      body_height,
      gender,
      is_pregnant,
    } = value;
    const checkUsernameStatement =
      'SELECT username FROM `account` WHERE username = ?';
    const checkUsername = await db.query(checkUsernameStatement, [name]);
    if (checkUsername[0] !== undefined) {
      const resErr = {
        rc: '94',
        message: 'username sudah terpakai, silahkan pilih username lain',
      };
      return res.status(400).json(resErr);
    }

    const dateNow = moment();

    const created_at = dateNow.unix();
    const user_id = helper.generateUserid();
    password = helper.encryption(password);
    name = name.replace(/\w+/g, function (w) {
      return w[0].toUpperCase() + w.slice(1).toLowerCase();
    });

    const token = helper.generateToken();
    const token_exp = dateNow.add(1, 'years').format('YYYY-MM-DD HH:mm:ss');

    const insertAccountStatement =
      'INSERT INTO `account`(`user_id`, `name`, `username`, `password`, `age`, `body_height`, `body_weight`, `gender`, `is_pregnant`, `created_at`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';
    const insertTokenStatement =
      'INSERT INTO `session`(`user_id`, `token`, `token_exp`, `device_id`) VALUES (?, ?, ?, ?)';
    const insertSuggestionTag =
      'INSERT INTO `suggestion_tag` (`user_id`, `accumalte_tag`) VALUES (?,?)';
    const noneObject = JSON.stringify({});
    const connection = await db.getDb();
    try {
      await connection.beginTransaction();
      await connection.query(insertAccountStatement, [
        user_id,
        name,
        username,
        password,
        age,
        body_height,
        body_weight,
        gender,
        is_pregnant,
        created_at,
      ]);
      await connection.query(insertTokenStatement, [
        user_id,
        token,
        token_exp,
        req.headers.deviceid,
      ]);
      await connection.query(insertSuggestionTag, [user_id, noneObject]);
      await connection.commit();
    } catch (error) {
      const resErr = {
        rc: '91',
        message: 'Gagal menyimpan kedatabase',
      };

      await connection.rollback();
      console.info(error);
      return res.status(400).json(resErr);
    }
    const respsonse = {
      rc: '00',
      message: 'Berhasil membuat akun dan token',
      data: {
        token,
        token_exp,
      },
    };

    return res.status(200).json(respsonse);
  } catch (error) {
    const resErr = {
      rc: '30',
      message: 'Kesalahan umum',
    };
    console.info(error);
    return res.status(400).json(resErr);
  }
};

const login = async (req, res) => {
  try {
    let isLogin = 0;
    let { username, password } = req.body;
    if (username === undefined || password === undefined) {
      const resErr = {
        rc: '05',
        message: 'Masukan username dan password',
      };
      return res.status(400).json(resErr);
    }

    const searchAccountStatement =
      'SELECT account.user_id, account.password FROM `account` WHERE account.username = ?';
    const search = await db.query(searchAccountStatement, [username]);

    if (search[0] === undefined) {
      const resErr = {
        rc: '14',
        message: 'Akun tidak ditemukan',
      };
      return res.status(400).json(resErr);
    }

    const searchSessionStatement =
      'SELECT `user_id`, `device_id` FROM `session` WHERE device_id=?';
    const searchSession = await db.query(searchSessionStatement, [
      req.headers.deviceid,
    ]);

    if (searchSession[0] !== undefined) {
      isLogin = 1;
    }

    const decryptPassword = helper.decryption(search[0].password);
    if (decryptPassword !== password) {
      const resErr = {
        rc: '55',
        message: 'Password salah',
      };
      return res.status(400).json(resErr);
    }

    const dateNow = moment();
    const token = helper.generateToken();
    const token_exp = dateNow.add(1, 'years').format('YYYY-MM-DD HH:mm:ss');

    if (isLogin == 0) {
      const createUpdateTokenStatement =
        'INSERT INTO `session`(`user_id`, `token`, `token_exp`, `device_id`) VALUES (?, ?, ?, ?)';
      const createupdateToken = await db.query(createUpdateTokenStatement, [
        search[0].user_id,
        token,
        token_exp,
        req.headers.deviceid,
      ]);

      if (createupdateToken.affectedRows == 0) {
        const resErr = {
          rc: '91',
          message: 'Gagal login',
        };
        return res.status(400).json(resErr);
      }
    } else {
      const createUpdateTokenStatement =
        'UPDATE `session` SET `user_id`=?,`token`=?,`token_exp`=?,`device_id`=? WHERE user_id=?';
      const createupdateToken = await db.query(createUpdateTokenStatement, [
        search[0].user_id,
        token,
        token_exp,
        req.headers.deviceid,
        search[0].user_id,
      ]);

      if (createupdateToken.affectedRows == 0) {
        const resErr = {
          rc: '91',
          message: 'Gagal login',
        };
        return res.status(400).json(resErr);
      }
    }

    const response = {
      rc: '00',
      message: 'Berhasil login',
      data: {
        token,
        token_exp,
      },
    };
    return res.status(200).json(response);
  } catch (error) {
    const resErr = {
      rc: '30',
      message: 'Kesalahan umum',
    };
    console.info(error);
    return res.status(400).json(resErr);
  }
};

const logout = async (req, res) => {
  try {
    const token = req.headers.token;
    const deviceid = req.headers.deviceid;

    const searchStatement =
      'SELECT `user_id`, `token` FROM `session` WHERE device_id=?';
    const search = await db.query(searchStatement, [deviceid]);

    if (search[0] === undefined) {
      const resErr = {
        rc: '14',
        message: 'Data tidak ditemukan',
      };
      return res.status(400).json(resErr);
    }

    if (search[0].token !== token) {
      const resErr = {
        rc: '13',
        message: 'Token tidak diketahui',
      };
      return res.status(400).json(resErr);
    }

    const deleteStatement = 'DELETE FROM `session` WHERE device_id=?';
    const deleteSession = await db.query(deleteStatement, [deviceid]);

    const response = {
      rc: '00',
      message: 'Berhasil logout',
    };
    return res.status(200).json(response);
  } catch (error) {
    const resErr = {
      rc: '30',
      message: 'Kesalahan umum',
    };
    console.info(error);
    return res.status(400).json(resErr);
  }
};

module.exports = {
  registration,
  login,
  logout,
};
