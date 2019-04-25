const { Router } = require('express');
const router = Router();

const mysqlConnection = require('../basededatos');

router.get('/db', (req, res) => {
    mysqlConnection.query('SELECT * FROM productos', (err, rows, fields) => {
        if (!err) {
            res.json(rows);
        } else {
            console.log(err);
        }
    });
});

router.get('/test', (req, res) => {
    const data = {
        "name": "Manuel",
        "website": "Manuelweb.com"
    };
    res.json(data);
});

module.exports = router;