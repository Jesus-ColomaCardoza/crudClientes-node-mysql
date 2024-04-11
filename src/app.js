
const express=require('express');
const path =require('path');
const morgan= require('morgan');

const app=express();

/*settings, configuracion del servidor*/

app.set('port',process.env.PORT || 3000);
app.set('view engine','pug');
app.set('views',path.join(__dirname,"/views"))


/*middlewares*/
app.use(express.urlencoded({extended:true}));
app.use(morgan("dev"));


/*Routes*/
app.use(require('./routes/clientes.routes'));


/*Errors*/
app.use((err,req,res,next)=>{
    res.send({error:err.message});
});


/*public*/
app.use(express.static(path.join(__dirname,'../public')))


//arrancamos el servidor con el puerto que este en port
app.listen(app.get('port'),()=>{
    console.log(`server on port  ${app.get('port')}`);
}) 






