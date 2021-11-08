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
//////////////////////////////////////////////////////

var express = require('express');
var router = express.Router();
var http = require('http');
var mongo = require('mongoskin');
var db = mongo.db("mongodb://localhost:27017/zak", {native_parser : true});


/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});


var site = 'http://www.vsechnyzakazky.cz/api/v1/zakazka/?format=json&limit=2';


function getData(cb) {

    http.get(site, function(res) {
        // explicitly treat incoming data as utf8 (avoids issues with multi-byte chars)
        res.setEncoding('utf8');

        // incrementally capture the incoming response body
        var body = '';
        res.on('data', function(d) {
            body += d;
        });

        // do whatever we want with the response once it's done
        res.on('end', function() {
            try {
                var parsed = JSON.parse(body);
            } catch (err) {
                console.error('Unable to parse response as JSON', err);
                return cb(err);
            }

            // pass the relevant data back to the callback
            cb(
                parsed.objects
               );
        });
    }).on('error', function(err) {
        // handle errors with the request itself
        console.error('Error with the request:', err.message);
        cb(err);
    });

}

function writeData (data, allGood){     

// couple of visual checks if all looking good before writing to db
console.log('writing');
console.log(typeof data);
console.log(data);

db.collection('zakazky').insert(data, function(error, record){
if (error) throw error;
console.log("data saved");

});
}

function allGood(){console.log('all done');}

getData(writeData);

// ---------------------
module.exports = router;