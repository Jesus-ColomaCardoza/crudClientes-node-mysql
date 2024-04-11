
const express=require('express');
const router=express.Router();
const controller=require('../controllers/clientes.controller');

//rutas get
router.get('/',controller.clientes)
router.get('/clientes',controller.clientes)

//rutas post
router.post('/agregar-cliente',controller.agregarCliente)
router.post('/actualizar-cliente/:clienteId',controller.actualizarCliente)

//rutas put
router.put('/actualizar-cliente/:clienteId',controller.actualizarCliente)

//rutas delete
router.delete('/eliminar-cliente/:clienteId',controller.eliminarCliente)


module.exports=router

