CREATE TABLE account(
  user_id VARCHAR(25) NOT NULL,
  name VARCHAR(35) NOT NULL,
  username VARCHAR(25) NOT NULL,
  password TEXT NOT NULL,
  age INT UNSIGNED,
  body_height INT UNSIGNED,
  body_weight INT UNSIGNED,
  gender ENUM('male', 'female'),
  is_pregnant INT,
  created_at BIGINT(25) NOT NULL,
  PRIMARY KEY(user_id)
);

CREATE TABLE session(
  user_id VARCHAR(25) NOT NULL UNIQUE,
  token TEXT NOT NULL,
  token_exp DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  device_id VARCHAR(100) NOT NULL,
  PRIMARY KEY(device_id),
  FOREIGN KEY(user_id) REFERENCES account(user_id) ON UPDATE CASCADE ON DELETE NO ACTION
);

CREATE TABLE meals_data(
  meal_id VARCHAR(20) NOT NULL UNIQUE,
  meal_name VARCHAR(20) NOT NULL,
  meal_image text NOT NULL,
  calories DOUBLE(8,4) NOT NULL,
  carb DOUBLE(8,4) NOT NULL,
  protein DOUBLE(8,4) NOT NULL,
  fat DOUBLE(8,4) NOT NULL,
  tag TEXT NOT NULL,

  PRIMARY KEY(meal_id)
);

-- makanan disajikan dalam 100gr --

CREATE TABLE history(
  history_id VARCHAR(20) NOT NULL UNIQUE,
  user_id VARCHAR(25) NOT NULL,
  title VARCHAR(30) NOT NULL,
  history_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  total_calories DOUBLE(8,4) NOT NULL,
  total_carb DOUBLE(8,4) NOT NULL,
  total_protein DOUBLE(8,4) NOT NULL,
  total_fat DOUBLE(8,4) NOT NULL,

  PRIMARY KEY(history_id),
  FOREIGN KEY(user_id) REFERENCES account(user_id) ON UPDATE CASCADE ON DELETE NO ACTION
);

CREATE TABLE history_detail(
  history_id VARCHAR(20) NOT NULL,
  meal_id VARCHAR(20) NOT NULL,
  serve DOUBLE(8,4) NOT NULL, -- serve akan dikali dengan per 100gr--
  calories DOUBLE(8,4) NOT NULL,
  carb DOUBLE(8,4) NOT NULL,
  protein DOUBLE(8,4) NOT NULL,
  fat DOUBLE(8,4) NOT NULL,

  FOREIGN KEY(history_id) REFERENCES history(history_id) ON UPDATE CASCADE ON DELETE NO ACTION,
  FOREIGN KEY(meal_id) REFERENCES meals_data(meal_id) ON UPDATE CASCADE ON DELETE NO ACTION
);

CREATE TABLE suggestion_tag(
  user_id VARCHAR(25) NOT NULL UNIQUE,
  accumalte_tag JSON,

  FOREIGN KEY(user_id) REFERENCES account(user_id) ON UPDATE CASCADE ON DELETE NO ACTION
);