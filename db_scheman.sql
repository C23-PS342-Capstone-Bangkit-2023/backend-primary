CREATE TABLE account(
  user_id VARCHAR(25) NOT NULL,
  name VARCHAR(35) NOT NULL,
  username VARCHAR(25) NOT NULL, --  bisa diganti email kalau emg pakai email ---
  password TEXT NOT NULL,
  age INT NOT NULL,
  body_height INT NOT NULL,
  body_weight INT NOT NULL,
  gender ENUM('male', 'female'),
  is_pregnant INT NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(user_id)
);


CREATE TABLE session(
  user_id VARCHAR(25) NOT NULL,
  token TEXT NOT NULL,
  token_exp DATETIME DEFAULT CURRENT_TIMESTAMP,
  device_id VARCHAR(100) NOT NULL
);