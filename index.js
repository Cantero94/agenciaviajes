/* 
Esto es viejo
const express = require('express');
*/
/* Esto es actual */
import express from 'express';
import router from './routers/index.js';
import db from './config/db.js';
import bodyParser from 'body-parser';

const app = express();

db.authenticate()
    .then( ()=> console.log('Conectado a la base de datos') )
    .catch( err => console.log(err) );

const port = process.env.PORT || 4000;

app.set('view engine', 'pug');

app.use(express.urlencoded({ extended: true }));

app.use((req, res, next) => {
    const year = new Date().getFullYear();
    res.locals.year = year; // Esto agrega el año a res.locals
    res.locals.nombreP = 'Agencia de Viajes';
    next(); // Llamamos a next() para pasar al siguiente middleware o ruta
});

app.use(express.static('public'));

app.use('/', router);

app.listen(port, () => {console.log(`Servidor corriendo en el puerto: ${port}, http://localhost:${port}`)});


//"dev": "nodemon src/index.js"
// "start": "index.js"