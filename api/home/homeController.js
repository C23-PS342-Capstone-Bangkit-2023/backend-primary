const helper = require('../../utils/helper.js');
const db = require('../../utils/database.js');
const moment = require('moment');

const dataAKG = async (req, res) => {
  try {
    const token = req.headers.token;
    const deviceid = req.headers.deviceid;

    const searchStatement =
      'SELECT account.age, session.token, session.token_exp FROM `account` INNER JOIN session ON account.user_id = session.user_id WHERE session.device_id = ?';
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

    const userAge = search[0].age;
    const requirementData = helper.getRequirement(userAge);
    const calories = requirementData.calories;
    const protein = (calories / 100) * 15;
    const carb = (calories / 100) * 65;
    const fat = (calories / 100) * 20;
    const akg = Math.round(((protein + fat + carb) / calories) * 100);
    const response = {
      rc: '00',
      message: 'Berhasil get data',
      data: {
        akg: akg,
        calories: calories,
        carb: carb,
        protein: protein,
        fat: fat,
        water: requirementData.water,
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

const miniHistory = async (req, res) => {
  try {
    const token = req.headers.token;
    const deviceid = req.headers.deviceid;

    const searchStatement =
      'SELECT account.user_id, session.token, session.token_exp FROM `account` INNER JOIN session ON account.user_id = session.user_id WHERE session.device_id = ?';
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

    const findHsitoryStatement =
      'SELECT title, history_date, total_calories, total_carb, total_protein, total_fat FROM history WHERE user_id = ? ORDER BY history_date DESC LIMIT 3';
    const findHistory = await db.query(findHsitoryStatement, [
      search[0].user_id,
    ]);

    if (findHistory[0] === undefined) {
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
        data: findHistory,
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

const suggestionMeals = async (req, res) => {
  try {
    const token = req.headers.token;
    const deviceid = req.headers.deviceid;

    const searchStatement =
      'SELECT account.user_id, account.age, session.token, session.token_exp FROM `account` INNER JOIN session ON account.user_id = session.user_id WHERE session.device_id = ?';
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
    const currentDatetime = moment().format('YYYY-MM-DD HH:mm:ss');
    const currentDate = moment().format('YYYY-MM-DD 00:00:00');
    const searchNutritionStatement = `SELECT SUM(total_calories) AS sum_calories, SUM(total_carb) AS sum_carb, SUM(total_protein) AS sum_protein, SUM(total_fat) AS sum_fat FROM history WHERE user_id = ? AND history_date BETWEEN ? AND ?`;
    const searchNutrition = await db.query(searchNutritionStatement, [
      search[0].user_id,
      currentDate,
      currentDatetime,
    ]);

    const requirementAkg = helper.getAkg(search[0].age);
    const userNeedNutrition = {
      totalCalories:
        requirementAkg.calories - (searchNutrition[0].sum_calories ?? 0),
      totalCarb: requirementAkg.carb - (searchNutrition[0].sum_carb ?? 0),
      totalProtein:
        requirementAkg.protein - (searchNutrition[0].sum_protein ?? 0),
      totalFat: requirementAkg.fat - (searchNutrition[0].sum_fat ?? 0),
    };
    console.info('req akg : ');
    console.info(requirementAkg);
    console.info('db nutrisi :');
    console.info(searchNutrition[0]);
    console.info('user need : ');
    console.info(userNeedNutrition);

    const suggestionStatement =
      'SELECT `meal_id`, `meal_name`, `meal_image`, `calories`, `carb`, `protein`, `fat`, `tag` FROM `meals_data`  LIMIT 3';
    const suggestion = await db.query(suggestionStatement);
    if (suggestion === undefined) {
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
        data: suggestion,
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

module.exports = {
  dataAKG,
  miniHistory,
  suggestionMeals,
};