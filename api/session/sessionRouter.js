const express = require('express');
const router = express.Router();
const { registration, login, logout } = require('./sessionController');

router.post('/registration', registration);
router.post('/login', login);

router.use((req, res, next) => {
  console.info(!req.headers.token);
  if (!req.headers.token) {
    const resErr = {
      rc: '05',
      message: 'Masukan token anda',
    };
    return res.status(400).json(resErr);
  }
  next();
});

router.post('/logout', logout);

module.exports = router;
