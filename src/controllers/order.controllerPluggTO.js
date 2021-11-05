//const db = require("../config/database");
//const fetch = require('node-fetch');
//const { default: axios } = require('axios');
const axios = require("axios").default;

// Get All Orders
exports.listAllOrders = async (req, res) => {
try {
  const { data } = await axios.get('http://jsonplaceholder.typicode.com/users');
  return res.send({ data });
  //return res.send({ req.body });
 } catch (error) {
  res.send({ error: error.message});
}
};
///////////
///////////
// Get One Order For ID
exports.findOrderById = async (req, res) => {
  const { id } = req.params;
  try {
    const { data } = await axios.get(`http://jsonplaceholder.typicode.com/users/${id}`);
    return res.send({ data });
    //return res.send(data.name);

  } catch (error) {
    res.send({ error: error.message});
  }
  };

  // Create Order PluggTO on DataBase
exports.createOrder = async (req, res) => {
  const { id_produto, quantidade } = req.body;
  const { rows } = await db.query(
    'INSERT INTO orders (id_produto, quantidade) VALUES ($1, $2)',
    [id_produto, quantidade],
  );

  res.status(201).send({
    message: 'Pedido Criado com Successo',
    body: {
      order: { id_produto, quantidade }
      
    },
  });
};

////Get All Orders

////Get One Order For ID

////Status Update Order

////----Order receipt confirmation----////


//Como faço para obter dados de uma API externa e armazená-los em meu banco de dados local? (javascript)
//https://stackoverflow.com/questions/50993390/how-do-i-fetch-data-from-an-external-api-and-store-it-in-my-local-database-jav

const express = require('express');
const request = require('request');
const pg = require('pg');

const app = express(); 
const connectionString = 'postgres://username:password@localhost/pg_demo_db' // your connection string 

app.get('/getdata/:id', function(req, res) { 
    if (!req.params.id) { 
       res.status(500); 
       res.send({"Error": "No ID"}); 
    } 
    request.get(
        // here I am using JSONPlaceholder API (Fake Online REST API for prototyping)
        { url: "https://jsonplaceholder.typicode.com/posts/" + req.params.id }, 
        function(error, response, body) { 
            if (!error && response.statusCode == 200) { 
                // get data from body ... e.g. title
                const data = JSON.parse(body);
                const title = data.title || '';

                // store in Postgresql -- devem usar o pg pool
                pg.connect(connectionString, (err, client, done) => {
                    done();
                    // Handle connection errors
                    if(err) {
                        console.log(err);
                        return res.status(500).json({success: false, data: err});
                    }
                    // SQL Query > Insert Data
                    client.query('INSERT INTO titles(id, title) values($1, $2)', [req.params.id, title]);

                    res.json({title: title}); 
                })
            } 
        }
    ); 
}); 