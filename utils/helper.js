const moment = require('moment');
const http = require('node:http');
const sha256 = require('crypto-js/sha256');
const hmacSHA512 = require('crypto-js/hmac-sha512');
const Base64 = require('crypto-js/enc-base64');
const CryptoJS = require('crypto-js');
const staticData = require('../static/requirement_akg');
const privateKey = 'kucingtralalala';

function randomString(length) {
  let result = '';
  const characters =
    'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  const charactersLength = characters.length;
  let counter = 0;
  while (counter < length) {
    result += characters.charAt(Math.floor(Math.random() * charactersLength));
    counter += 1;
  }
  return result;
}

const saveInput = (dataInput, dataDatabase) => {
  for (let index = 0; index < Object.keys(dataDatabase).length; index++) {
    let keyObject = Object.keys(dataDatabase)[index];
    if (
      dataInput[keyObject] === undefined ||
      dataInput[keyObject] === null ||
      dataInput[keyObject] === ''
    ) {
      dataInput[keyObject] = dataDatabase[keyObject];
    }
  }
  return dataInput;
};

const generateToken = () => {
  const message = randomString(10);
  const currentUnixDatetime = moment().unix();
  const randomNumber = Math.floor(Math.random() * 1001) + 1;
  const hashDigest = sha256(currentUnixDatetime + message + randomNumber);
  const hmacDigest = Base64.stringify(hmacSHA512(hashDigest, privateKey));
  return hmacDigest;
};

const encryption = (message) => {
  const encrypt = CryptoJS.AES.encrypt(message, privateKey).toString();
  return encrypt;
};

const decryption = (message) => {
  const decrypt = CryptoJS.AES.decrypt(message, privateKey).toString(
    CryptoJS.enc.Utf8
  );
  return decrypt;
};

const generateUserid = () => {
  const dateNow = moment();
  const userid =
    'U-' +
    dateNow.format('DD') +
    (Math.floor(Math.random() * 10) + 1) +
    dateNow.format('MM') +
    (Math.floor(Math.random() * 10) + 1) +
    dateNow.format('YYYY');

  return userid;
};

const camelCaseConvert = (message) => {
  const value = message.replace(/\w+/g, function (w) {
    return w[0].toUpperCase() + w.slice(1).toLowerCase();
  });
  return value;
};

const getRequirement = (ageInput, sex, isPregnant) => {
  let index = requirementData
    .filter((x) => x.umur <= ageInput)
    .filter((y) => y.kelamin === sex)
    .filter((z) => z.isPregnant === isPregnant);
  return index[index.length - 1];
};

const getAkg = (ageInput, sex, isPregnant) => {
  const requirementData = getRequirement(ageInput, sex, isPregnant);

  const calories = requirementData.kalori;
  const protein = requirementData.protein;
  const carb = requirementData.karbohidrat;
  const fat = requirementData.lemak;
  const akg = Math.round(((protein + fat + carb) / calories) * 100);

  const output = {
    calories,
    protein,
    carb,
    fat,
    akg,
  };
  return output;
};

const generateAccumulateTag = (inputTag, oldTag) => {
  let container = oldTag;
  let newTag = inputTag
    .map((single) => {
      let tmp = single.tag;
      let tmp2 = tmp.split(',');
      return tmp2;
    })
    .flat(1);

  for (var i = 0; i < newTag.length; i++) {
    var element = newTag[i];
    container[element] = (container[element] || 0) + 1;
  }

  return Object.fromEntries(
    Object.entries(container).sort(([, a], [, b]) => b - a)
  );
};

const addMealsAndId = (TagObject) => {
  try {
    const newData = TagObject.map((single) => {
      let container = {};
      let tagArr = single.tag.split(',').filter((tmp) => tmp !== '');
      container.meal_id = single.id;
      container.meal_name = single.makanan;
      container.meal_image =
        'https://storage.googleapis.com/c23-capstone-bucket/assets/bakso.png';
      container.calories = single.kalori;
      container.protein = single.protein;
      container.carb = single.karbohidrat;
      container.fat = single.lemak;

      const tmpTag = [...new Set(tagArr)];
      container.tag = tmpTag.map((single) => single.trim()).toString();
      return container;
    });
    return newData;
  } catch (error) {
    console.info(error);
  }
};

const getClient = (options, payload) => {
  return new Promise((resolve, reject) => {
    const postData = JSON.stringify({
      data: payload,
    });
    const req = http.request(options, (res) => {
      let responseData = '';

      res.on('data', (chunk) => {
        responseData += chunk;
      });

      res.on('end', () => {
        resolve(responseData);
      });
    });

    req.on('error', (error) => {
      reject(error);
    });

    req.write(postData);
    req.end();
  });
};

module.exports = {
  saveInput,
  generateToken,
  encryption,
  decryption,
  generateUserid,
  camelCaseConvert,
  getRequirement,
  getAkg,
  generateAccumulateTag,
  addMealsAndId,
  getClient,
};
