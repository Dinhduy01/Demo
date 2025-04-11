const mysql = require('mysql2/promise');
const dotenv = require("dotenv");

dotenv.config();

const dbConfig = {
  host: process.env.DB_SERVER,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_DATABASE,
};

console.log("Database Configuration:", dbConfig);

let connection;

const connectDB = async () => {
  if (connection) {
    return connection;
  }
  try {
    connection = await mysql.createConnection(dbConfig);
    console.log("Database connected successfully");
    return connection;
  } catch (error) {
    console.error("Database connection failed:", error);
    process.exit(1);
  }
};

module.exports = connectDB;