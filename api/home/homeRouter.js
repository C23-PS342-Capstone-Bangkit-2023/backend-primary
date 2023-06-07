const express = require('express');
const router = express.Router();
const { dataAKG, miniHistory, suggestionMeals } = require('./homeController');

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

router.get('/dashboard/akg', dataAKG);
router.get('/history/mini', miniHistory);
router.get('/suggestion/mini', suggestionMeals);

module.exports = router;
