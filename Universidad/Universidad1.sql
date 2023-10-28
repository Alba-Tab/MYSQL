CREATE DATABASE UNIVERSIDAD;
USE UNIVERSIDAD;
CREATE TABLE ALUMNO
(
	Registro integer not null primary key,
    Nombre varchar (60) not null,
    Sexo char not null,
    EstadoCivil char not null,
    Telefono integer,
    Direccion varchar(50)
);
# Mostrar todos los alumnos
select *
from alumno;

insert into alumno values (111,'Joaquin Chumacero','m','s',7102030,'Urb. los claveles #300');
insert into alumno values (222,'Saturnino Mamani','m','c',7202130,null);
insert into alumno values (333,'Fabiola Méndez','m','s',7242222,'Av. Landivar #500');
insert into alumno values (444,'Carlos Camacho','m','s',null,'Calla Ichilo #500');
insert into alumno values (555,'Patricia Aguilera','f','c',7102030,'Calle Ichilo #504');

delete from alumno where registro = 111;

# Mostrar el registro y nombre del alumno
select registro, nombre
from alumno;

#Mostrar todos los alumnnos varones
select *
from alumno
where sexo = 'm';


#Mostrar todos los alumnnos varones y solteros
select *
from alumno
where sexo = 'm' and estadocivil = 's';

#Mostrar todos los alumnnos que no tienen telefono
select *
from alumno
where telefono is null;

#Mostrar todos los alumnnos que tienen telefono
select *
from alumno
where telefono is not null;

#Mostrar todos los alumnnos que inician con 'J'
select *
from alumno
where nombre like 'j%';

#Mostrar la cantidad de alumnos
select count(*)
from alumno;

#Mostrar la cantidad de alumnos varones
select count(*)
from alumno
where sexo = 'm';

#Mostrar los nombres en forma ascendente
select *
from alumno
order by nombre desc;

#Mostrar los nombres en forma descendente masculinos
select *
from alumno
where sexo = 'm'
order by nombre asc;