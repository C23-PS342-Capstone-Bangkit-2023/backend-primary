const Joi = require('joi').extend(require('@joi/date'));

const usersSchema = Joi.object({
  name: Joi.string().min(3).max(35).required().messages({
    'string.base': 'Nama harus berupa huruf',
    'string.min': 'Masukan nama minimal 5 huruf',
    'string.max': 'Masukan nama maximal 35 huruf',
    'string.empty': 'Masukan nama anda',
    'any.required': 'Masukan nama anda',
  }),
  username: Joi.string().min(5).max(35).required().messages({
    'string.base': 'username harus berupa huruf',
    'string.min': 'Masukan username minimal 5 huruf',
    'string.max': 'Masukan username maximal 35 huruf',
    'string.empty': 'Masukan username anda',
    'any.required': 'Masukan username anda',
  }),
  password: Joi.string().min(6).max(35).required().messages({
    'string.base': 'password harus berupa huruf',
    'string.min': 'Masukan password minimal 6 huruf',
    'string.max': 'Masukan password maximal 35 huruf',
    'string.empty': 'Masukan password anda',
    'any.required': 'Masukan password anda',
  }),
  age: Joi.number().min(1).max(150).required().messages({
    'number.min': 'Masukan umur minimal 1 angka',
    'number.max': 'Masukan umur maximal 150 angka',
    'any.required': 'Masukan umur anda',
  }),
  body_weight: Joi.number().min(1).max(500).required().messages({
    'number.min': 'Masukan berat badan minimal 1 angka',
    'number.max': 'Masukan berat badan maximal 500 angka',
    'any.required': 'Masukan berat badan anda',
  }),
  body_height: Joi.number().min(1).max(300).required().messages({
    'number.min': 'Masukan tinggi badan minimal 1 angka',
    'number.max': 'Masukan tinggi badan maximal 300 angka',
    'any.required': 'Masukan tinggi badan anda',
  }),
  gender: Joi.string().valid('Male', 'Female').required().messages({
    'any.required': 'Masukan jenis kelamin anda',
    'any.only': 'Masukan jenis kelamin sesuai ketentuan',
  }),
  is_pregnant: Joi.number().min(0).max(1).required().messages({
    'number.min': 'Masukan is pregnant minimal 0 angka',
    'number.max': 'Masukan is pregnant maximal 1 angka',
    'any.required': 'Masukan is pregnant anda',
  }),
});

module.exports = usersSchema;
