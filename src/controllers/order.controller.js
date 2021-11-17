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

// ==> Pagamento do Pedido:
exports.findOrderPgto = async (req, res) => {
  const { id } = req.params;

    const options = {
      method: 'GET',
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
              const payment_total = data.payment_total || '';
              const payment_installments = data.payment_installments || '';
              const payment_method = data.payment_method || '';
              const payment_type = data.payment_type || '';
              const _id = data._id || '';

              // Conn Postgresql
             (async () => {
               const { rows } = await db.query(
              'INSERT INTO payments(payment_total, payment_installments, payment_method, payment_type, _id) values($1, $2, $3, $4, $5)', 
               [payment_total, payment_installments, payment_method, payment_type, _id])

                   res.json({
                   message: 'Pagamento Criado com Successo',
                   body: {
                    payments: {payment_total, payment_installments, payment_method, payment_type, _id}
                   },
                 });
                
             })().catch(err => setImmediate(() => {throw err}))
          } 
      }
  ); 
};

//  ==> Atualizar Pedido:
exports.updateOrderById = async (req, res) => {
  const { id } = req.params;

    const options = {
      method: 'GET',
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
              const status = data.status || '';
              const id = data.id || '';
              const shipping_method = data.shipping_method || '';
              const track_code = data.track_code || '';
              const track_url = data.track_url || '';
              const date_shipped = data.date_shipped || '';
              const nfe_key = data.nfe_key || '';
              const nfe_link = data.nfe_link || '';
              const nfe_number = data.nfe_number || '';
              const nfe_serie = data.nfe_serie || '';
              const nfe_date = data.nfe_date || '';

              // Conn Postgresql
             (async () => {
               const { rows } = await db.query(
              `UPDATE orders SET status = $1, id = $2, shipping_method = $3, track_code = $4, track_url = $5, date_shipped = $6, nfe_key = $7, nfe_link = $8, nfe_number = $9, nfe_serie = $10, nfe_date = $11 
              WHERE id = $2`, 

               [status, id, shipping_method, track_code, track_url, date_shipped, nfe_key, nfe_link, nfe_number, nfe_serie, nfe_date]);

                   res.json({
                   message: 'Pedido Atualizado com Successo',
                   body: {
                     order: {
                      status, 
                      id, shipping_method, track_code, track_url, date_shipped, nfe_key, nfe_link, nfe_number, nfe_serie, nfe_date}
                   },
                 });
                
             })().catch(err => setImmediate(() => {throw err}))
          } 
      }
  ); 
};

//  ==> Envio do Status Faturado:
exports.findOrderStatus = async (req, res) => {
    const id = parseInt(req.params.id);
    const response = await db.query(
    `SELECT 
      status,
      id,
      status,
      date_shipped,
      nfe_key,
      nfe_link,
      nfe_number,
      nfe_serie,
      nfe_date
    FROM ORDER WHERE id = $1`,
      [id],
    );
    res.status(200).send(response.rows);
};

//  ==> Envio do Status Despachado - Envio do Pedido:
exports.findOrderShipping = async (req, res) => {
  const id = parseInt(req.params.id);
    const response = await db.query(
    `SELECT 
      status,
      id,
      status,
      date_shipped,
      shipping_company,
      shipping_method,
      track_code,
      track_url
    FROM ORDER WHERE id = $1`,
      [id],
    );
    res.status(200).send(response.rows);
};

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

