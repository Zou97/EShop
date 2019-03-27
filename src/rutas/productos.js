const { Router } = require('express');
const router = Router();
const _ = require('underscore');

const productos = require('../prueba.json');


router.get('/', (req, res) => {
    res.json(productos);
});

router.post('/', (req, res) => {
    const {Nombre, Precio} = req.body;
    if(Nombre && Precio) {
        const id = productos.length + 1;
        const nuevoproducto = {...req.body, id};
        productos.push(nuevoproducto);
        res.json(productos);
    } else {
        res.status(666).json({error: 'Tienes un Error'});
    }
});

router.put('/:id', (req, res) => {
    const {id} = req.params;
    const {Nombre, Precio} = req.body;
    if (Nombre && Precio) {
        _.each(productos, (producto, i) => {
            if(producto.id == id) {
                producto.Nombre = Nombre;
                producto.Precio = Precio;
            }
        });
        res.json(productos);
    } else {
        res.status(666).json({error: 'Tienes un Error'});
    }
});

router.delete('/:id', (req, res) => {
    const { id } = req.params;
    _.each(productos, (producto, i) => {
        if (producto.id == id){
            productos.splice(i, 1);
        }
    }); 
    res.send(productos);
});

module.exports = router;