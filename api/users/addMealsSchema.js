const Joi = require('joi').extend(require('@joi/date'));

const detailsSchema = {
  meal_id: Joi.string().min(4).max(20).required().messages({
    'string.base': 'id meals harus berupa huruf',
    'string.min': 'Masukan id meals minimal 4 huruf',
    'string.max': 'Masukan id meals maximal 20 huruf',
    'string.empty': 'Masukan id meals anda',
    'any.required': 'Masukan id meals anda',
  }),
  serve: Joi.number().max(100).required().messages({
    'number.base': 'masukan phone number dengan angka',
    'number.max': 'Masukan phone number maximal 100 angka',
    'any.required': 'Masukan phone number anda',
  }),
};

const addMealsSchema = Joi.object({
  title: Joi.string().min(6).max(35).required().messages({
    'string.base': 'title harus berupa huruf',
    'string.min': 'Masukan title minimal 6 huruf',
    'string.max': 'Masukan title maximal 35 huruf',
    'string.empty': 'Masukan title anda',
    'any.required': 'Masukan title anda',
  }),
  history_date: Joi.date()
    .utc()
    .format('DD-MM-YYYY HH:mm:ss')
    .required()
    .messages({
      'date.format': 'Masukan history date sesuai format',
      'any.required': 'Masukan history date anda',
    }),
  details: Joi.array()
    .min(1)
    .items(Joi.object(detailsSchema))
    .required()
    .messages({
      'any.required': 'Masukan details anda',
    }),
});

module.exports = addMealsSchema;
