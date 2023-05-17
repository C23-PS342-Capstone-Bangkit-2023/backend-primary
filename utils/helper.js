const moment = require('moment');
const sha256 = require('crypto-js/sha256');
const hmacSHA512 = require('crypto-js/hmac-sha512');
const Base64 = require('crypto-js/enc-base64');
const CryptoJS = require('crypto-js');
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

module.exports = {
  saveInput,
  generateToken,
  encryption,
  decryption,
  generateUserid,
  camelCaseConvert,
};
