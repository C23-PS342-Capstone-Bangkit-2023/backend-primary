const Joi = require('joi').extend(require('@joi/date'));

const usersSchema = Joi.object({
  currentPassword: Joi.string().min(6).max(35).required().messages({
    'string.base': 'password harus berupa huruf',
    'string.min': 'Masukan password minimal 6 huruf',
    'string.max': 'Masukan password maximal 35 huruf',
    'string.empty': 'Masukan password anda',
    'any.required': 'Masukan password anda',
  }),
  newPassword: Joi.string().min(6).max(35).required().messages({
    'string.base': 'password harus berupa huruf',
    'string.min': 'Masukan password minimal 6 huruf',
    'string.max': 'Masukan password maximal 35 huruf',
    'string.empty': 'Masukan password anda',
    'any.required': 'Masukan password anda',
  }),
  confirmPassword: Joi.string().min(6).max(35).required().messages({
    'string.base': 'password harus berupa huruf',
    'string.min': 'Masukan password minimal 6 huruf',
    'string.max': 'Masukan password maximal 35 huruf',
    'string.empty': 'Masukan password anda',
    'any.required': 'Masukan password anda',
  }),
});

module.exports = usersSchema;
