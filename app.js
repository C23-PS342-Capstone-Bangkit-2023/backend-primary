const express = require('express');
const cors = require('cors');

const PORT = process.env['PRIMARYPORT'] || 8000;
const DOMAIN = '127.0.0.1';

const app = express();

const sessionRouter = require('./api/session/sessionRouter');
const homeRouter = require('./api/home/homeRouter');
const userRouter = require('./api/users/usersRouter');
const mealRouter = require('./api/meals/mealsRouter');
//middleware
const checkDeviceid = (req, res, next) => {
  if (!req.headers.deviceid) {
    const resErr = {
      rc: '05',
      message: 'Masukan device id anda',
    };
    return res.status(400).json(resErr);
  }
  next();
};

app.use(express.json());
app.use(cors());
app.use(checkDeviceid);

//routing
app.use('/api/session', sessionRouter);
app.use('/api/', homeRouter);
app.use('/api/user', userRouter);
app.use('/api/meal', mealRouter);

app.listen(PORT, DOMAIN, () => {
  console.log(`Server berjalan pada ${DOMAIN} dengan port ${PORT}`);
});
