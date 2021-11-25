const { Pool } = require('pg');
const dotenv = require('dotenv');

dotenv.config();

// Conexão com a Base de Dados:
const pool = new Pool({
    connectionString: process.env.DATABASE_URL,
    max: 10, //Nº maximo de clientes que a Pool tera conectado.
    idleTimeoutMillis: 30000, //Tempo em segundos para expirar a conexão do cliente.
    connectionTimeoutMillis: 10000,//Tempo em segundos que um cliente fica conectado a Pool.
    });

pool.on('connect', () => {
  console.log('Base Conectada!');
});

exports.execute = (query, params=[]) => {
    return new Promise((resolve, reject) => {
        pool.query(query, params, (error, result, fields) => {
            if (error) {
                reject(error);
            } else {
                resolve(result)
            }
        });
    })
}

module.exports = {
  query: (text, params) => pool.query(text, params),
};