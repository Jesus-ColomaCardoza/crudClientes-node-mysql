const mysql=require('mysql');
const {DB_HOST,DB_USER,DB_PASSWORD,DB_PORT,DB_NAME}=require('../src/config.js')

module.exports =()=>mysql.createConnection(
    {
        host:DB_HOST,
        user:DB_USER,
        password:DB_PASSWORD,
        port:DB_PORT,
        database:DB_NAME
    },
    'single'
)

// in the main

