const router = require('express-promise-router')();
const orderController = require('../controllers/order.controller');

//  Seleciona pedido pelo Id: (GET): localhost:4000/api/order/:id
router.get('/order/:id', orderController.findOrderById);

//  Lista todos os pedido: (GET): localhost:4000/api/orders
router.get('/orders', orderController.listAllOrders);

//  Lista todos os pedido: (GET): localhost:4000/api/orders_db
router.get('/orders_db', orderController.listAllOrders_db);

// Atualiza pedido pelo Id: (PATCH / PUT): localhost:4000/api/order_db/:id
router.patch('/order_db/:id', orderController.updateOrderById_db);

//  Seleciona pedido pelo Id: (GET): localhost:4000/api/order_db/:id
router.get('/order_db/:id', orderController.findOrderById_db);

// Pagamento do Pedido: (GET): localhost:4000/api/order/pgto/:id
router.get('/order/pgto/:id', orderController.findOrderPgto);

// GET do Pedido Atualizado: (GET): localhost:4000/api/order/updated/:id
router.get('/order/updated/:id', orderController.updatedOrderById);

// Atualiza pedido pelo Id: (PATCH / PUT): localhost:4000/api/order/:id
router.patch('/order/:id', orderController.updateOrderById);

// Envio do Status Faturado do Pedido pelo Id: (GET): localhost:4000/api/order/status/:id
router.get('/order/status/:id', orderController.findOrderStatus);

// Envio do Status Despachado - Envio do Pedido: (GET): localhost:4000/api/order/shipping/:id
router.get('/order/shipping/:id', orderController.findOrderShipping);

//  ==> Rota responsável por criar um novo pedido: (POST): localhost:4000/api/order
// router.post('/order', orderController.createOrder);

//  ==> Atualiza pedido pelo Id: (PUT): localhost:4000/api/order/:id
// router.put('/order/:id', orderController.updateOrderById);

//  ==> Excluir pedido pelo Id: (DELETE): localhost:4000/api/order/:id
// router.delete('/order/:id', orderController.deleteOrderById);

module.exports = router;

