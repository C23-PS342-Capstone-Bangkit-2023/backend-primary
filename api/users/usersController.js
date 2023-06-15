const helper = require('../../utils/helper.js');
const db = require('../../utils/database.js');
const usersSchema = require('./usersSchema');
const addMealsSchema = require('./addMealsSchema');
const moment = require('moment');

const my = async (req, res) => {
  try {
    const token = req.headers.token;
    const deviceid = req.headers.deviceid;

    const searchStatement =
      'SELECT account.name, account.age, account.body_height, account.body_weight, account.gender, account.is_pregnant, session.token, session.token_exp FROM `account` INNER JOIN session ON account.user_id = session.user_id WHERE session.device_id = ?';
    const search = await db.query(searchStatement, [deviceid]);

    if (search[0] === undefined) {
      const resErr = {
        rc: '13',
        message: 'Data tidak ditemukan',
      };
      return res.status(400).json(resErr);
    }

    if (search[0].token_exp > moment().format('YYYY-MM-DD HH:mm:ss')) {
      const resErr = {
        rc: '63',
        message: 'Masa token telah habis',
      };
      return res.status(400).json(resErr);
    }

    if (search[0].token !== token) {
      const resErr = {
        rc: '63',
        message: 'Token tidak cocok',
      };
      return res.status(400).json(resErr);
    }

    const { name, age, body_height, body_weight, gender, is_pregnant } =
      search[0];
    const image_profile =
      'https://storage.googleapis.com/c23-capstone-bucket/assets/Profile/default-profile.png';
    const response = {
      rc: '00',
      message: 'Berhasil get data',
      data: {
        name,
        image_profile,
        age,
        body_height,
        body_weight,
        gender,
        is_pregnant,
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

const userUpdate = async (req, res) => {
  try {
    const token = req.headers.token;
    const deviceid = req.headers.deviceid;

    const searchStatement =
      'SELECT account.user_id, account.name, account.age, account.body_height, account.body_weight, account.gender, account.is_pregnant, session.token, session.token_exp FROM `account` INNER JOIN session ON account.user_id = session.user_id WHERE session.device_id = ?';
    const search = await db.query(searchStatement, [deviceid]);

    if (search[0] === undefined) {
      const resErr = {
        rc: '13',
        message: 'Data tidak ditemukan',
      };
      return res.status(400).json(resErr);
    }

    if (search[0].token_exp > moment().format('YYYY-MM-DD HH:mm:ss')) {
      const resErr = {
        rc: '63',
        message: 'Masa token telah habis',
      };
      return res.status(400).json(resErr);
    }

    if (search[0].token !== token) {
      const resErr = {
        rc: '63',
        message: 'Token tidak cocok',
      };
      return res.status(400).json(resErr);
    }

    const dataDb = {
      name: search[0].name,
      age: search[0].age,
      body_height: search[0].body_height,
      body_weight: search[0].body_weight,
      gender: search[0].gender,
      is_pregnant: search[0].is_pregnant,
    };

    let { name, age, body_height, body_weight, gender, is_pregnant } =
      helper.saveInput(req.body, dataDb);

    name = name.replace(/\w+/g, function (w) {
      return w[0].toUpperCase() + w.slice(1).toLowerCase();
    });

    const updateStatement =
      'UPDATE account SET name=?,age=?,body_height=?,body_weight=?,gender=?,is_pregnant=? WHERE user_id=?';
    const update = await db.query(updateStatement, [
      name,
      age,
      body_height,
      body_weight,
      gender,
      is_pregnant,
      search[0].user_id,
    ]);

    if (update.affectedRows == 0) {
      const resErr = {
        rc: '91',
        message: 'Gagal mengubah kedatabase',
      };

      return res.status(400).json(resErr);
    }

    const response = {
      rc: '00',
      message: 'Berhasil mengubah data',
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

const passwordUpdate = async (req, res) => {
  try {
    const token = req.headers.token;
    const deviceid = req.headers.deviceid;

    const searchStatement =
      'SELECT account.user_id, account.password, session.token, session.token_exp FROM `account` INNER JOIN session ON account.user_id = session.user_id WHERE session.device_id = ?';
    const search = await db.query(searchStatement, [deviceid]);

    if (search[0] === undefined) {
      const resErr = {
        rc: '13',
        message: 'Data tidak ditemukan',
      };
      return res.status(400).json(resErr);
    }

    if (search[0].token_exp > moment().format('YYYY-MM-DD HH:mm:ss')) {
      const resErr = {
        rc: '63',
        message: 'Masa token telah habis',
      };
      return res.status(400).json(resErr);
    }

    if (search[0].token !== token) {
      const resErr = {
        rc: '63',
        message: 'Token tidak cocok',
      };
      return res.status(400).json(resErr);
    }

    const inputCheck = usersSchema.validate(req.body);
    const { value, error } = inputCheck;

    if (error) {
      const response = {
        rc: '05',
        message: error.details[0].message,
      };
      return res.status(400).json(response);
    }

    let { currentPassword, newPassword, confirmPassword } = value;
    let databasePassword = helper.decryption(search[0].password);
    if (currentPassword !== databasePassword) {
      const resErr = {
        rc: '55',
        message: 'Password salah',
      };
      return res.status(400).json(resErr);
    }

    if (newPassword !== confirmPassword) {
      const resErr = {
        rc: '05',
        message: 'Password tidak sama',
      };
      return res.status(400).json(resErr);
    }

    const updateStatement = 'UPDATE account SET password=? WHERE user_id=?';
    const update = await db.query(updateStatement, [
      helper.encryption(newPassword),
      search[0].user_id,
    ]);

    if (update.affectedRows == 0) {
      const resErr = {
        rc: '91',
        message: 'Gagal mengubah kedatabase',
      };

      return res.status(400).json(resErr);
    }

    const response = {
      rc: '00',
      message: 'Berhasil mengubah data',
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

const addMealsHistory = async (req, res) => {
  try {
    const token = req.headers.token;
    const deviceid = req.headers.deviceid;

    const searchStatement =
      'SELECT suggestion_tag.accumalte_tag, account.user_id, session.token, session.token_exp FROM `account` INNER JOIN session ON account.user_id = session.user_id INNER JOIN suggestion_tag ON account.user_id = suggestion_tag.user_id WHERE session.device_id = ?';
    const search = await db.query(searchStatement, [deviceid]);

    if (search[0] === undefined) {
      const resErr = {
        rc: '13',
        message: 'Data tidak ditemukan',
      };
      return res.status(400).json(resErr);
    }

    if (search[0].token_exp > moment().format('YYYY-MM-DD HH:mm:ss')) {
      const resErr = {
        rc: '63',
        message: 'Masa token telah habis',
      };
      return res.status(400).json(resErr);
    }

    if (search[0].token !== token) {
      const resErr = {
        rc: '63',
        message: 'Token tidak cocok',
      };
      return res.status(400).json(resErr);
    }

    const inputCheck = addMealsSchema.validate(req.body);
    const { value, error } = inputCheck;

    if (error) {
      const response = {
        rc: '05',
        message: error.details[0].message,
      };
      return res.status(400).json(response);
    }

    const dateNow = moment();
    let { title, history_date, details } = value;
    const historyId =
      'H-' +
      dateNow.format('DD') +
      (Math.floor(Math.random() * 10) + 1) +
      dateNow.format('MM') +
      (Math.floor(Math.random() * 10) + 1) +
      dateNow.format('YYYY');
    const userId = search[0].user_id;
    title = title.replace(/\w+/g, function (w) {
      return w[0].toUpperCase() + w.slice(1).toLowerCase();
    });
    history_date = dateNow.format('YYYY-MM-DD HH:mm:ss');

    const idMealsArr = details.map((meals) => meals.meal_id);
    const findMealsStatement = `SELECT meal_id, calories, carb, protein, fat, tag FROM meals_data WHERE meal_id IN (${idMealsArr
      .map(() => '?')
      .join(', ')});`;
    const findMeals = await db.query(findMealsStatement, idMealsArr);
    if (findMeals.length !== idMealsArr.length) {
      const resErr = {
        rc: '14',
        message: 'id meals salah',
      };
      return res.status(400).json(resErr);
    }

    const acculumate_tag = JSON.parse(search[0].accumalte_tag);
    const dataAccumulateTag = JSON.stringify(
      helper.generateAccumulateTag(findMeals, acculumate_tag)
    );

    let totalCalories = 0;
    let totalCarb = 0;
    let totalFat = 0;
    let totalProtein = 0;

    const newData = details.map((meals) => {
      const dbObject = findMeals.find((dObj) => dObj.meal_id === meals.meal_id);
      const container = {};
      container.meal_id = meals.meal_id;
      container.serve = meals.serve;
      container.calories = dbObject.calories * meals.serve;
      container.carb = dbObject.carb * meals.serve;
      container.protein = dbObject.protein * meals.serve;
      container.fat = dbObject.fat * meals.serve;

      totalCalories = container.calories;
      totalCarb = container.carb;
      totalProtein = container.protein;
      totalFat = container.fat;
      return container;
    });

    const insertHeaderStatement =
      'INSERT INTO `history`(`history_id`, `user_id`, `title`, `history_date`, `total_calories`, `total_carb`, `total_protein`, `total_fat`) VALUES (?, ?, ?, ?, ?, ?, ?, ?)';
    const insertDetailStatement =
      'INSERT INTO `history_detail`(`history_id`, `meal_id`, `serve`, `calories`, `carb`, `protein`, `fat`) VALUES (?, ?, ?, ?, ?, ?, ?)';
    const updateAccumulateTag =
      'UPDATE suggestion_tag SET accumalte_tag = ? WHERE user_id = ?';
    const connection = await db.getDb();
    try {
      await connection.beginTransaction();
      await connection.query(insertHeaderStatement, [
        historyId,
        userId,
        title,
        history_date,
        totalCalories,
        totalCarb,
        totalProtein,
        totalFat,
      ]);
      //update biar sekali aja insert ke dbnya
      newData.forEach(async (data) => {
        await connection.query(insertDetailStatement, [
          historyId,
          data.meal_id,
          data.serve,
          data.calories,
          data.carb,
          data.protein,
          data.fat,
        ]);
      });
      await connection.query(updateAccumulateTag, [dataAccumulateTag, userId]);
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
      message: 'Berhasil menambahkan makanan hari ini',
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

module.exports = {
  my,
  userUpdate,
  passwordUpdate,
  addMealsHistory,
};