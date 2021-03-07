const express = require('express')
const {Server} = require('socket.io')
const app = express()


const port = 6553
let server = app.listen(port, () => {
    console.log('Servidor Iniciado en el puerto', port);
})
