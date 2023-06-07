const Joi = require('joi').extend(require('@joi/date'));

const usersSchema = Joi.object({
  meal_name: Joi.string().min(3).max(35).required(),
  kalori: Joi.number().min(1).max(35).required(),
  karbohidrat: Joi.number().min(6).max(35).required(),
  protein: Joi.number().min(1).max(150).required(),
  lemak: Joi.number().min(1).max(500).required(),
  tag: Joi.string().min(1).max(300).required(),
});

module.exports = usersSchema;
