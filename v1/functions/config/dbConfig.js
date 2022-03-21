const dotenv = require('dotenv');
dotenv.config();

if (process.env.NODE_ENV === 'production') {
  module.exports = {
    user: process.env.PROD_DB_USER,
    host: process.env.PROD_DB_HOST,
    database: process.env.PROD_DB_DB,
    password: process.env.PROD_DB_PASSWORD,
  };
} else {
  module.exports = {
    user: process.env.DEV_DB_USER,
    host: process.env.DEV_DB_HOST,
    database: process.env.DEV_DB_DB,
    password: process.env.DEV_DB_PASSWORD,
  };
}
