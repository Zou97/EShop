CREATE database IF NOT exists ESHOP;

USE ESHOP;

create table productos (
	id int(11) not null auto_increment,
    nombre varchar(45) default null,
    precio int(11) default null,
    descripcion varchar (200) default null,
    primary key(id)
);

describe productos;

insert into productos values
	(1, 'PlayStation 4', 400, 'Consola de juegos'),
    (2, 'PlayStation 3', 250, 'Consola de juegos'),
    (3, 'Nintendo Switch', 399, 'Consola de juegos portatil y sobremesa');
    
select * from productos;