const db = require("../config/database");
const request = require('request');
// const { Pool } = require("pg");
// const pool = new Pool();
// const axios = require("axios").default;

//  Seleciona Pedido pelo Id: 
  exports.findOrderById = async (req, res) => {
    const { id } = req.params;
    /* const { id, title } = req.body; */

  //   if (!req.params.id) { 
  //     res.status(500); 
  //     res.send({"Error": "No ID"}); 
  //  } 

    const options = {
      method: 'GET',
      // url: `https://api.plugg.to/orders/${id}`,
      // url: "https://jsonplaceholder.typicode.com/posts/" + req.params.id, 
      url: `https://jsonplaceholder.typicode.com/posts/${id}`,
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
              
              // Conn Postgresql
             (async () => {
               const { rows } = await db.query('INSERT INTO titles(id, title) values($1, $2)', 
               [id, title])

                   res.json({
                   message: 'Pedido Criado com Successo',
                   body: {
                     order: { id, title }
                   },
                 });
                
             })().catch(err => setImmediate(() => {throw err}))
          } 
      }
  ); 
};
///------------------------------------------------------

//  Lista todos os orders EndPoint:
exports.listAllOrders = async (req, res) => {
  const options = {
  method: 'GET',
  // url: 'https://jsonplaceholder.typicode.com/posts/',
  url: 'http://jsonplaceholder.typicode.com/users',
  headers: {
    Accept: 'application/json',
    Authorization: 'Bearer {ACCESS_TOKEN}',
    'Content-Type': 'application/json'
  }
};
request(options, (error, response, body) => {
  if (error) throw new Error(error);

  // console.log(req.body);
  // res.json(body);
  res.status(200).send(body);
  
  // res.json({
  //   message: '',
  //   body: {
  //     order: { body }
  //   },
  // });

});
};

//  Lista todos os orders BD:
exports.listAllOrders_bd = async (req, res) => {
  const response = await db.query(
    'SELECT * FROM titles ORDER BY id ASC',
    //'SELECT * FROM titles ORDER BY title DESC',
  );
  res.status(200).send(response.rows);
};

//  Seleciona order pelo Id BD:
      exports.findOrderById_bd = async (req, res) => {
        const id = parseInt(req.params.id);
        const response = await db.query(
          'SELECT * FROM titles WHERE id = $1',
          [id],
        );
        res.status(200).send(response.rows);
      };

// cria um novo Pedido:
      // exports.createOrder = async (req, res) => {
      //   const { id_produto, quantidade } = req.body;
      //   const { rows } = await db.query(
      //     'INSERT INTO orders (id_produto, quantidade) VALUES ($1, $2)',
      //     [id_produto, quantidade],
      //   );

      //   res.status(201).send({
      //     message: 'Pedido Adicionado com Successo',
      //     body: {
      //       order: { id_produto, quantidade }
      //     },
      //   });
      // };
 
//  Seleciona Pedido pelo Id:
      // exports.findOrderById = async (req, res) => {
      //   const id_order = parseInt(req.params.id);
      //   const response = await db.query(
      //     'SELECT * FROM orders WHERE id_order = $1',
      //     [id_order],
      //   );
      //   res.status(200).send(response.rows);
      // };

//  Lista todos os Pedidos:
      // exports.listAllOrders = async (req, res) => {
      //   const response = await db.query(
      //     'SELECT * FROM pedidos ORDER BY sku ASC',
      //      //'SELECT * FROM pedidos ORDER BY nome DESC',
      //   );
      //   res.status(200).send(response.rows);
      // };

//  Atualiza um Pedido pelo Id: --Rota apenas para testes
      //   exports.updateOrderById = async (req, res) => {
      //     const id_order = parseInt(req.params.id);
      //     const { id_produto, quantidade } = req.body;
  
      //     const response = await db.query(
      //       'UPDATE orders SET id_produto = $1, quantidade = $2 WHERE id_produto = $3',
      //       [id_produto, quantidade, id_order]
      //     );
      //     res.status(200).send({ 
      //     message: 'Pedido Atualizado com Successo', 
      //     body: {
      //       order: { id_order, id_produto, quantidade }
      //     },
      //   });
      // };
  
// Excluí um Pedido pelo Id:
      // exports.deleteOrderById = async (req, res) => {
      //   const id_order = parseInt(req.params.id);
      //   await db.query('DELETE FROM orders WHERE id_order = $1', 
      //   [id_order]
      //     );
      //   res.status(200).send({ message: 'Pedido Excluído com Successo', id_order });
      // };

