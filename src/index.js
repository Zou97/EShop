const express = require('express');
const app = express();
const morgan = require('morgan');
const path = require('path');


// Herramientas
app.set('port', process.env.PORT || 3000);
app.set('json spaces', 2);

// Servidor
const server = app.listen(app.get('port'), () => {
    console.log(`Server on port ${app.get('port')}`);
});

app.use(morgan('dev'));
app.use(express.urlencoded({extended: false}));
app.use(express.json());

//Rutas
app.use(require('./rutas/index'));
app.use('/api/productos',require('./rutas/productos'));

//Estaticos
app.use(express.static(path.join(__dirname, 'Temporal')));

//Socket
const SocketIO = require('socket.io');
const io = SocketIO(server);

io.on('connection', (socket) => {
    console.log('nueva conexion', socket.id);

    socket.on('mimensaje', (data) => {
        io.sockets.emit('mimensaje', data);
    });

    socket.on('chat:typing', (data) => {
        socket.broadcast.emit('chat:typing', data);
    });
});

