const db = require("../config/database");
const request = require('request');
// const pg = require('pg');
////////////////////////////////////////////////////////////////////////////////////////////////////////////

  //  Seleciona Pedido pelo Id: 
  exports.findDataById = async (req, res) => {
    /* const { id } = req.params; */
    const { id } = req.body;

/*     if (!req.params.id) { 
      res.status(500); 
      res.send({"Error": "No ID"}); 
   }  */

    // const id_order = parseInt(req.params.id);
    // const response = await db.query('SELECT * FROM orders WHERE id_order = $1',[id_order]);
    // res.status(200).send(response.rows);

    const options = {
      method: 'GET',
      /* url: "https://jsonplaceholder.typicode.com/posts/" + req.params.id,  */
      /* url: `https://jsonplaceholder.typicode.com/posts/${id}`, */
      url: 'https://jsonplaceholder.typicode.com/posts/',
      // headers: {
      //   Accept: 'application/json',
      //   Authorization: 'Bearer {ACCESS_TOKEN}',
      //   'Content-Type': 'application/json'
      // }
    };

/*     request.get(
      // here I am using JSONPlaceholder API (Fake Online REST API for prototyping)
      { url: "https://jsonplaceholder.typicode.com/posts/" + req.params.id },  */

      request(options, (error, response, body) => { 

          if (!error && response.statusCode == 200) { 
              // get data from body ... e.g. title //obter dados do corpo ... por exemplo título
              const data = JSON.parse(body);
              const title = data.title || '';

              // store in Postgresql -- devem usar o pg pool
              ( async (err, done) => {
                  done();
                  // Handle connection errors
                  if(err) {
                      console.log(err);
                      return res.status(500).json({success: false, data: err});
                  }
                  // SQL Query > Insert Data
                  const { rows } = await db.query(
                  'INSERT INTO titles (id, title) values ($1, $2)', 
                 /*  [req.params.id, title], */
                  [id, title],
                  );

                  /* res.json({title: title}); */ 
                  res.status(201).send({
                    message: 'Pedido Criado com Successo',
                    body: {
                      order: { id, title }
                      
                    },
                  });

              });
          } 
      }
  ); 
  };
////////////////////////////////////////////////////////////////////////////////////////////////////////////

////cria um novo Pedido:
exports.createOrder = async (req, res) => {
  const { id_produto, quantidade } = req.body;
  const { rows } = await db.query(
    'INSERT INTO orders (id_produto, quantidade) VALUES ($1, $2)',
    [id_produto, quantidade],
  );

  res.status(201).send({
    message: 'Pedido Adicionado com Successo',
    body: {
      order: { id_produto, quantidade }
      
    },
  });
};

//  Lista todos os order:
exports.listAllOrders = async (req, res) => {
    const response = await db.query(
      'SELECT * FROM orders ORDER BY id_order ASC',
      //'SELECT * FROM order ORDER BY nome DESC',
    );
    res.status(200).send(response.rows);
  };
  
  //  Seleciona Pedido pelo Id:
  exports.findOrderById = async (req, res) => {
    const id_order = parseInt(req.params.id);
    const response = await db.query(
      'SELECT * FROM orders WHERE id_order = $1',
      [id_order],
    );
    res.status(200).send(response.rows);
  };
  
  //  Atualiza um Pedido pelo Id: --Rota apenas para testes
  exports.updateOrderById = async (req, res) => {
    const id_order = parseInt(req.params.id);
    const { id_produto, quantidade } = req.body;
  
    const response = await db.query(
      'UPDATE orders SET id_produto = $1, quantidade = $2 WHERE id_produto = $3',
      [id_produto, quantidade, id_order]
    );
  
    res.status(200).send({ 
    message: 'Pedido Atualizado com Successo', 
    body: {
      order: { id_order, id_produto, quantidade }
    },
  });
};
  
  ////Excluí um Pedido pelo Id:
  exports.deleteOrderById = async (req, res) => {
    const id_order = parseInt(req.params.id);
    await db.query('DELETE FROM orders WHERE id_order = $1', 
    [id_order]
      );
  
    res.status(200).send({ message: 'Pedido Excluído com Successo', id_order });
  };