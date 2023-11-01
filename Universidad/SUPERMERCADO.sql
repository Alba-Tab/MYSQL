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

select *
from producto;
select *
from Categoria;