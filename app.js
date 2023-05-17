const express = require('express');
const cors = require('cors');
const fileUpload = require('express-fileupload');

const PORT = 5000;
const DOMAIN = '127.0.0.1';
const app = express();

const sessionRouter = require('./api/session/sessionRouter');
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

// app.use(
//   fileUpload({
//     createParentPath: true,
//   })
// );
// app.use(express.static('public'));
app.use(express.json());
app.use(cors());
app.use(checkDeviceid);

//routing
app.use('/api/session', sessionRouter);

app.listen(PORT, DOMAIN, () => {
  console.log(`Server berjalan pada ${DOMAIN} dengan port ${PORT}`);
});
