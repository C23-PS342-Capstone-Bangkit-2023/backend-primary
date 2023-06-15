const mysql = require('mysql2/promise');

const databaseConfig = {
  connectionLimit: 10,
  host: process.env['DBHOST'] || '127.0.0.1',
  user: process.env['DBUSER'] || 'root',
  password: process.env['DBPASSWORD'] || '',
  database: process.env['DBNAME'] || 'cp_2023',
};

async function query(sql, params) {
  try {
    const connection = await mysql.createConnection(databaseConfig);
    const [results] = await connection.execute(sql, params);
    await connection.end();
    return results;
  } catch (error) {
    console.info(error);
  }
}

async function getDb() {
  try {
    const connection = await mysql.createConnection(databaseConfig);
    return connection;
  } catch (error) {
    console.info(error);
  }
}

module.exports = { query, getDb };
