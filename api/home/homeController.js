const helper = require('../../utils/helper.js');
const db = require('../../utils/database.js');
const moment = require('moment');

const dataAKG = async (req, res) => {
  try {
    const token = req.headers.token;
    const deviceid = req.headers.deviceid;

    const searchStatement =
      'SELECT account.age, account.gender, account.is_pregnant, session.token, session.token_exp FROM `account` INNER JOIN session ON account.user_id = session.user_id WHERE session.device_id = ?';
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
    const userSex = search[0].gender;
    const userIsPregnant = search[0].is_pregnant;
    const requirementData = helper.getRequirement(
      userAge,
      userSex,
      userIsPregnant
    );
    const calories = requirementData.kalori;
    const protein = requirementData.protein;
    const carb = requirementData.karbohidrat;
    const fat = requirementData.lemak;
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
        water: 8,
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
    // ambil data suggestion tag
    const searchSuggestionTagStatement =
      'SELECT accumalte_tag FROM suggestion_tag WHERE user_id = ?';
    const searchSuggestionTag = await db.query(searchSuggestionTagStatement, [
      search[0].user_id,
    ]);
    // kirim data ke secondary primary
    const accumulateTag = JSON.parse(searchSuggestionTag[0].accumalte_tag);
    // console.info(Object.keys(accumulateTag)[0]);
    let payload = [];
    for (let index = 0; index < 4; index++) {
      payload.push(Object.keys(accumulateTag)[index]);
    }

    const opsi = {
      hostname: '127.0.0.1',
      port: 5000,
      path: '/sugestion',
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
    };
    // get data
    const dataML = JSON.parse(await helper.getClient(opsi, payload));
    const dataSearchMeals = Object.keys(dataML).map((single) => dataML[single]);
    if (dataSearchMeals.length <= 0) {
      const response = {
        rc: '00',
        message: 'Berhasil get datas',
        data: [],
      };
      return res.status(200).json(response);
    }

    const getMealStatement = `SELECT meal_id, meal_name, meal_image, calories, carb, protein, fat, tag FROM meals_data WHERE meal_id IN (${dataSearchMeals
      .map(() => '?')
      .join(', ')})`;
    const getMeal = await db.query(getMealStatement, dataSearchMeals);
    const response = {
      rc: '00',
      message: 'Berhasil get data',
      data: getMeal,
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
  dataAKG,
  miniHistory,
  suggestionMeals,
};
