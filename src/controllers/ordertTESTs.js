//const db = require("../config/database");
const express = require('express');
const request = require('request');


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
///////////////////////////////////////////////os códigos abaixo funciona, GET na API e post no banco//////////////////////////////////////

const db = require("../config/database");
const request = require('request');
// const axios = require("axios").default;

////////////////////////////////////////////////////////////////////////////////////////////////////////////
exports.findOrderById = () => { 
  // if (!req.params.id) { 
  //    res.status(500); 
  //    res.send({"Error": "No ID"}); 
  // } 
  request.get(
      // here I am using JSONPlaceholder API (Fake Online REST API for prototyping)
      { url: "https://jsonplaceholder.typicode.com/posts/" + req.params.id }, 
      (error, response, body) => { 
          if (!error && response.statusCode == 200) { 
              // get data from body ... e.g. title
              const data = JSON.parse(body);
              const title = data.title || '';
              const id = data.id || '';

              // store in Postgresql
              (async () => {

                const { rows } = await db.query('INSERT INTO titles(id, title) values($1, $2)', 
                [id, title])

                    res.json({
                    message: 'Pedido Criado com Successo',
                    body: {
                      order: { id, title }
                    },
                  });
                            
              })().catch(err =>
                setImmediate(() => {throw new err(err)})
              )
          }; 
      }
  ); 
}; 

//------------------------------------------------------------------------------------------------
  //  Seleciona Pedido pelo Id: 
  exports.findOrderById = async (req, res) => {
    const { id } = req.params;
    /* const { id, title } = req.body; */

/*     if (!req.params.id) { 
      res.status(500); 
      res.send({"Error": "No ID"}); 
   }  */

    const options = {
      method: 'GET',
      /* url: "https://jsonplaceholder.typicode.com/posts/" + req.params.id,  */
      url: `https://jsonplaceholder.typicode.com/posts/${id}`,
      /* url: 'https://jsonplaceholder.typicode.com/posts/', */
      headers: {
        Accept: 'application/json',
        Authorization: 'Bearer {ACCESS_TOKEN}',
        'Content-Type': 'application/json'
      }
    };

      request(options, (error, response, body) => { 

          if (!error && response.statusCode == 200) { 
              //obter dados do corpo ... por exemplo título+ID
              const data = JSON.parse(body);
              const title = data.title || '';
              const id = data.id || '';

              // store in Postgresql -- devem usar o pg pool
              (async () => {

                const { rows } = await db.query('INSERT INTO titles(id, title) values($1, $2)', 
                [id, title])

                    res.json({
                    message: 'Pedido Criado com Successo',
                    body: {
                      order: { id, title }
                    },
                  });
                            
              })().catch(err =>
                setImmediate(() => {throw new err(err)})
              )
          } 
      }
  ); 
};
/////////----------------------------TESTS COM OUTROS APIs----------------------------------------

const request = require('request');
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
exports.listAllOrders = async () => {
  const options = {
  method: 'GET',
  url: 'http://jsonplaceholder.typicode.com/users',
  headers: {
    Accept: 'application/json',
    Authorization: 'Bearer {ACCESS_TOKEN}',
    'Content-Type': 'application/json'
  }
};
request(options, (error, response, body) => {
  if (error) throw new Error(error);

  console.log(body);
  
});
};
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