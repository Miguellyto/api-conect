//const db = require("../config/database");
const express = require('express');
const request = require('request');
//const pg = require('pg');
const { Pool } = require('pg');
const pool = new Pool();

const app = express(); 
const connectionString = 'postgres://postgres:root@localhost:5432/ecommerce' // your connection string 

//DATABASE_URL=postgres://postgres:root@localhost:5432/ecommerce
//-- /getdata/4
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
                // get data from body ... e.g. title //obter dados do corpo ... por exemplo título
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
                    client.query('INSERT INTO titles (id, title) values ($1, $2)', [req.params.id, title]);

                    res.json({title: title}); 
                })
            } 
        }
    ); 
}); 