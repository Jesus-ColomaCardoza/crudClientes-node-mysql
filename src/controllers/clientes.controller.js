const { nextTick } = require('process');
const connection=require('../../dbConnection/connection');
const conn=connection();

const controller={}

controller.clientes=(req,res,next)=>{
    conn.query('SELECT * FROM clientes',(err,rows)=>{
        if (err) next(new Error(err))
        else res.render('clientes',{allClientes:rows});
    })
}

controller.agregarCliente=(req,res,next)=>{
    conn.query('INSERT INTO clientes SET ?',[req.body],(err,rows)=>{
        if(err) next(new Error(err))
        else res.redirect('/')
    });
}
controller.actualizarCliente=(req,res,next)=>{
    conn.query('UPDATE clientes SET ? WHERE id= ?',[req.body,req.params.clienteId],(err,rows)=>{
        if(err) next(new Error(err))
        else res.redirect('/')
    });
}
controller.eliminarCliente=(req,res,next)=>{
    conn.query('DELETE FROM clientes WHERE id= ?',[req.params.clienteId],(err,rows)=>{
        if(err) next(new Error(err))
        else res.send({ok:true})
    });
}
module.exports=controller

