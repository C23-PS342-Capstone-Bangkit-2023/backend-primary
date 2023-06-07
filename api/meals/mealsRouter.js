const express = require('express');
const router = express.Router();
const {
  addMeals,
  getMeals,
  getMealSingle,
  updateMeal,
  deleteMeal,
} = require('./mealsController');

router.use((req, res, next) => {
  if (!req.headers.token) {
    const resErr = {
      rc: '05',
      message: 'Masukan token anda',
    };
    return res.status(400).json(resErr);
  }
  next();
});

router.get('/', getMeals);
router.get('/single/:id', getMealSingle);
router.post('/add', addMeals);
router.put('/update/:id', updateMeal);
router.delete('/delete/:id', deleteMeal);

module.exports = router;
