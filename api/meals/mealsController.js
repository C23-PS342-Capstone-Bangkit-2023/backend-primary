const helper = require('../../utils/helper.js');
const db = require('../../utils/database.js');
const mealSchema = require('./mealsSchema');
const moment = require('moment');
const getMeals = async (req, res) => {
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

    let mealName = '%' + (req.body.name ?? '') + '%';
    let getMealStatement = 'SELECT * FROM meals_data WHERE meal_name LIKE ?';
    const getMeal = await db.query(getMealStatement, [mealName.toLowerCase()]);
    if (getMeal[0] !== undefined) {
      const response = {
        rc: '00',
        message: 'Berhasil get data',
        data: getMeal,
      };
      return res.status(200).json(response);
    } else {
      const response = {
        rc: '00',
        message: 'Berhasil get data',
        data: [],
      };
      return res.status(200).json(response);
    }
  } catch (error) {
    const resErr = {
      rc: '30',
      message: 'Kesalahan umum',
    };
    console.info(error);
    return res.status(400).json(resErr);
  }
};

const getMealSingle = async (req, res) => {
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

    let mealId = req.params.id;

    const getMealStatement =
      'SELECT meal_id, meal_name, meal_image, calories, carb, protein, fat, tag FROM meals_data WHERE meal_id=?';
    const getMeal = await db.query(getMealStatement, [mealId]);

    if (getMeal[0] === undefined) {
      const response = {
        rc: '00',
        message: 'Berhasil get data',
        data: [],
      };
      return res.status(200).json(response);
    } else {
      const response = {
        rc: '00',
        message: 'Berhasil get data',
        data: getMeal,
      };
      return res.status(200).json(response);
    }
  } catch (error) {
    const resErr = {
      rc: '30',
      message: 'Kesalahan umum',
    };
    console.info(error);
    return res.status(400).json(resErr);
  }
};

const addMeals = async (req, res) => {
  try {
    const token = req.headers.token;
    const deviceid = req.headers.deviceid;
    const tokenHardCode = 'AkuAdalahGembalaKambing';
    const deviceidHardCode = 'PCiniPunyaBersama';

    if (token !== tokenHardCode && deviceid !== deviceidHardCode) {
      const resErr = {
        rc: '63',
        message: 'token telah habis',
      };
      return res.status(400).json(resErr);
    }

    const cleanData = helper.addMealsAndId(req.body.meal);
    const addMealsStatement = `INSERT INTO meals_data(meal_id, meal_name, meal_image, calories, carb, protein, fat, tag) VALUES ${cleanData.map(
      (single) => {
        const microStatement = `(${Object.keys(single)
          .map(() => '?')
          .join(',')})`;
        return microStatement;
      }
    )}`;

    const newDataInput = cleanData
      .map((single) => Object.keys(single).map((single2) => single[single2]))
      .flat(1);

    const addMeals = await db.query(addMealsStatement, newDataInput);

    if (addMeals.affectedRows == 0) {
      const resErr = {
        rc: '91',
        message: 'Gagal menambahkan meals',
      };
      return res.status(400).json(resErr);
    }

    const response = {
      rc: '00',
      message: 'Berhasil insert data',
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

const updateMeal = async (req, res) => {
  try {
    const token = req.headers.token;
    const deviceid = req.headers.deviceid;
    const tokenHardCode = 'AkuAdalahGembalaKambing';
    const deviceidHardCode = 'PCiniPunyaBersama';
    const idMeals = req.params.id;

    if (token !== tokenHardCode && deviceid !== deviceidHardCode) {
      const resErr = {
        rc: '63',
        message: 'Masa token telah habis',
      };
      return res.status(400).json(resErr);
    }
    const findMealStatement =
      'SELECT meal_name, meal_image, calories, carb, protein, fat, tag FROM meals_data WHERE meal_id = ?';

    const findMealDb = await db.query(findMealStatement, [idMeals]);
    if (findMealDb[0] === undefined) {
      const resErr = {
        rc: '13',
        message: 'Data tidak ditemukan',
      };
      return res.status(400).json(resErr);
    }

    const dataDb = {
      meal_name: findMealDb[0].meal_name,
      meal_image: findMealDb[0].meal_image,
      calories: findMealDb[0].calories,
      carb: findMealDb[0].carb,
      protein: findMealDb[0].protein,
      fat: findMealDb[0].fat,
      tag: findMealDb[0].tag,
    };

    const mealUpdateStatement =
      'UPDATE meals_data SET meal_name=?,meal_image=?,calories=?,carb=?,protein=?,fat=?,tag=? WHERE meal_id=?';

    let { meal_name, meal_image, calories, carb, protein, fat, tag } =
      helper.saveInput(req.body, dataDb);
    meal_name = meal_name.replace(/\w+/g, function (w) {
      return w[0].toUpperCase() + w.slice(1).toLowerCase();
    });
    const mealUpdate = await db.query(mealUpdateStatement, [
      meal_name,
      meal_image,
      calories,
      carb,
      protein,
      fat,
      tag,
      idMeals,
    ]);
    if (mealUpdate.affectedRows == 0) {
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

const deleteMeal = async (req, res) => {
  try {
    const token = req.headers.token;
    const deviceid = req.headers.deviceid;
    const tokenHardCode = 'AkuAdalahGembalaKambing';
    const deviceidHardCode = 'PCiniPunyaBersama';
    const idMeals = req.params.id;

    if (token !== tokenHardCode && deviceid !== deviceidHardCode) {
      const resErr = {
        rc: '63',
        message: 'Masa token telah habis',
      };
      return res.status(400).json(resErr);
    }

    const findMealStatement =
      'SELECT meal_name FROM meals_data WHERE meal_id = ?';

    const findMealDb = await db.query(findMealStatement, [idMeals]);
    if (findMealDb[0] === undefined) {
      const resErr = {
        rc: '13',
        message: 'Data tidak ditemukan',
      };
      return res.status(400).json(resErr);
    }

    const deleteAndSearchStatement = 'DELETE FROM meals_data WHERE meal_id = ?';
    const deleteAndSearch = await db.query(deleteAndSearchStatement, [idMeals]);
    if (deleteAndSearch.affectedRows == 0) {
      const resErr = {
        rc: '91',
        message: 'Gagal menghapus kedatabase',
      };

      return res.status(400).json(resErr);
    }

    const response = {
      rc: '00',
      message: 'Berhasil menghapus data',
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
  addMeals,
  getMeals,
  getMealSingle,
  updateMeal,
  deleteMeal,
};
