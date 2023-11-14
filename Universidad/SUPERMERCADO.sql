CREATE DATABASE SUPERMERCADO;
USE SUPERMERCADO;
CREATE TABLE CATEGORIA	
(
	ID smallint not null primary key,
    NOMBRE varchar(30) not null
);
create TABLE PRODUCTO
(
	CODIGO INTEGER NOT NULL primary KEY,
	NOMBRE varchar(40) NOT NULL,
    PRECIO float NOT NULL,
    IDCategoria smallint not null,
    foreign key (IDCategoria) references CATEGORIA (ID)
		#para no violar la integridad referencia si cambiamos la llave primaria se cambia la foranea
        on update cascade
        on delete cascade
        #mismo caso con on delete ellimina en cascada en ambas tablas
);
create table NOTAVENTA
(
	NRO INTEGER NOT NULL PRIMARY KEY,
    FECHA DATE NOT NULL,
    MONTO FLOAT NOT NULL,
    CICLIENTE INTEGER NOT NULL,
    foreign key (CICLIENTE) references CLIENTE(CI) 
		ON UPDATE CASCADE
        ON DELETE CASCADE
);
create table CLIENTE
(
	CI INTEGER NOT NULL PRIMARY KEY,
    NOMBRE VARCHAR(60) NOT NULL,
    SEXO CHAR NOT NULL,
    TELEFONO INTEGER
);
create table VENDE
(
    NRO_NOTAVENTA INTEGER NOT NULL,
    COD_PRODUCTO INTEGER NOT NULL,
	CANTIDAD INTEGER NOT NULL,
    PRECIO FLOAT NOT NULL,
    primary key(NRO_NOTAVENTA,COD_PRODUCTO),
    foreign key (NRO_NOTAVENTA) REFERENCES NOTAVENTA(NRO)
		on update cascade
        on delete cascade,
    foreign key (COD_PRODUCTO) REFERENCES PRODUCTO(CODIGO)
		on update cascade
        on delete cascade 
);
# Mostrar todos los Productos
select *
from producto;
#insertaar categorias varios valores;
insert into categoria values (1,'Gaseosa');
insert into categoria values (2,'Carne');
insert into categoria values (3,'Energizante');
insert into categoria values (4,'Abarrotes');


insert into producto values (1001,'CocaCola 2L',10,1);
insert into producto values(1002,'CocaCola 3L',15,1);
insert into producto values(1006,'Fanta 2L',10,1);
insert into producto values(1003,'Arroz 1K',7,4);
insert into producto values(1004,'Carne de res',40,2);
insert into producto values(1005,'Red Bull 1L',50,3);
#actualizamos categoria con id = 5 cuando id es 1
Update categoria
set id=5
where id=1;

Delete from Categoria
where ID=5;

#mostrar todos los productos de categoria gaseosa
select codigo,producto.nombre,precio
from producto,categoria									
where idcategoria=ID and categoria.nombre = 'Gaseosa' and precio=10;
#completar clase viernes



#completar clase viernes

insert into CLIENTE (CI,NOMBRE,SEXO,TELEFONO)  values 
(111,'JOAQUIN CHUMACERO','M',123456),
(222,'SATURNINO MAMANI','M',234567),
(333,'FABIOLA MENDEZ','F',345678);
#-------------------------------clase miercoles 08 noviembre-----------------------------------------
insert into vende  values (100,	1001,	2,	100);
insert into vende  values (100,	1006,	5,	5);
insert into vende  values (101,	1003,	2,	7);
insert into vende  values (101,	1006,	3,	10);
insert into vende  values (101,	1001,	2,	10);
insert into vende values (102,1006,2,5);
insert into vende values(103,1001,3,10);
insert into vende values(103,1005,2,10);

insert into NotaVenta (Nro,Fecha,Monto,CiCliente) values
(100,'2023-10-1',45,111),
(101,'2023-10-1',64,222);

insert into NotaVenta values(102,	'2023-1-22',	10,	333);
insert into NotaVenta values(103,	'2023-1-15',	50,	111);

#mostras las notas de ventas de 
select NRo,fecha,monto,cliente.nombre
from cliente,notaventa
where cicliente=ci and nombre='joaquin chumacero';
# 1_que tablas participan 2_relacionar las tablas(CI=CIcliente)
# 3_criterio de busqueda 4_que quiero mostrar

select NRo,fecha,monto
from notaventa
where cicliente in( select ci
						from cliente
                        where nombre='JOAQUIN CHUMACERO'
                        ) ;
#MOSTRAR LA CANTIDAD DE NOTAS DE VENTAS REALIZADAS POR JOAQUIN CHUMACERO
select count(*)
from notaventa
where cicliente in( select ci
						from cliente
                        where nombre='JOAQUIN CHUMACERO'
                        ) ;

select sum(monto)
from notaventa
where cicliente in( select ci
						from cliente
                        where nombre='JOAQUIN CHUMACERO'
                        ) ;

#Mostrar la cantidad de notas de venta
select count(*)
from notaventa;

#mostrar monto total vendido
select sum(monto)
from notaventa;

#mostrar el monto mas alto vendido
select max(monto)
from notaventa;

#mostrar el monto mas bbajo vendido
select min(monto)
from notaventa;


select *
from producto;
select *
from Categoria;
select *
from CLIENTE;
select *
from NOTAVENTA;
select *
from VENDE;