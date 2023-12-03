create database formacion3;
use formacion3;
create table Tema(
	ID int not null,
	Descrp varchar(50) not null,
	primary key (ID)	
);
insert into tema values(201,'Procedimientos And Funciones');
insert into tema values(202,'Cambas (Lienzo)');
insert into tema values(203,'Herencia Proc. And Func.');
insert into tema values(204,'Java Movil and 2D');
insert into tema values(205,'Poblacion de BD');
insert into tema values(206,'Consultas en BD');
insert into Tema values(207,'Doc. and Consultas en BD');
select * from tema;

create table Empleado(
	CI int not null,
    Nombre varchar(50) not null,
    sexo char not null,
    primary key (CI)    
);

	insert into Empleado values(111,'Joaquin Chumacero','m');
	insert into Empleado values(222,'Juan Topo','m');
	insert into Empleado values(333,'Ned Flanders','m');
	insert into Empleado values(432,'Rafa Gorgori','m');
	insert into Empleado values(315,'Esmiders Ticona','m');
	/*Alumnos De Java Basico Doc. Joaquin Chumacero*/
	insert into Empleado values(444,'Bob Patiño','m');
	insert into Empleado values(555,'Maria Prisma','f');
	insert into Empleado values(666,'March Bubie','f');
	insert into Empleado values(777,'Mongomery Berns','m');
	/*Alumnos De SQL Basico*/
	insert into Empleado values(888,'Homero J. Simpsons','m');
	insert into Empleado values(123,'Milhouse Miami','m');
	insert into Empleado values(124,'Lisa Montenegro','f');
	insert into Empleado values(125,'Bar Yucra','m');
	/*Otros alumnos*/
	insert into Empleado values(562,'Saturnino Mamani','m');
	insert into Empleado values(523,'Carla Fernandez','f');
	
	Select * from empleado;

create table Curso(
	Cod int not null,
	titulo varchar(25) not null,
	NroHrs int not null,
	CodPreq int,
	IDtema int not null,
	primary key (cod),	
	foreign key (IDtema) references Tema (ID)
);
select * from curso;

insert into Curso values(981,'Delphi Basico',25,null,201);
insert into Curso values(982,'Delphi Avanzado',25,981,202);
insert into Curso values(983,'Java Basico',30,null,203);
insert into Curso values(984,'Java Avanzado',35,983,204);
insert into Curso values(985,'SQL Basico',30,984,205);
insert into Curso values(986,'SQL Avanzado',35,985,206);
insert into Curso values(987,'Disparadores',25,986,207);

select * from curso;

create table Edicion(
	ID int not null,
	FechaI datetime not null,
	FechaF datetime not null,
	CIdoc int not null,
	CODcurso int not null,
	primary key (ID),
	foreign key (CIdoc) references empleado(CI),
	foreign key (CodCurso) references Curso(COD)
);

insert into Edicion values(751,'2011/03/01','2011/03/31',111,983);
insert into Edicion values(752,'2011/04/15','2011/5/16',222,985);
insert into Edicion values(753,'2011/03/01','2011/03/31',333,981);
insert into Edicion values(758,'2011/03/01','2011/03/31',124,983);-- 
	
insert into Edicion values(754,'2011/04/01','2011/04/30',432,982);
insert into Edicion values(755,'2011/03/01','2011/03/31',315,984);
insert into Edicion values(756,'2011/05/01','2011/05/31',432,986);
insert into Edicion values(757,'2011/03/01','2011/03/31',315,987);

select * from edicion;

create table Nota(
	IDedicion int not null,
	CIalum int not null,
	NotaF int not null,
	primary key (IDedicion,CIalum),
	foreign key (IDedicion) references Edicion(ID),
	foreign key (CIalum) references Empleado(CI)
);

insert into Nota values(751,444,51);
insert into Nota values(751,555,38);
insert into Nota values(751,666,95);
insert into Nota values(751,777,75);

insert into Nota values(752,888,55);
insert into Nota values(752,123,27);
insert into Nota values(752,124,78);
insert into Nota values(752,125,83);

insert into Nota values(753,888,45);
insert into Nota values(753,123,90);
insert into Nota values(753,124,55);
insert into Nota values(753,666,75);

insert into Nota values(754,444,70);
insert into Nota values(754,555,100);

Select * from nota;
-- Mostar todos los cursos ,  Enseñados por Ned Flanders, donde el tema es Procedimientos And Funciones
select * 
from curso
where idtema in (
	select id
    from tema
    where descrp='Procedimientos And Funciones')
and cod in (
	select codcurso 
    from edicion
    where cidoc in (
		select ci
        from empleado
        where nombre='Ned Flanders'));

-- Mostrar la cantidad de empleados varones aprobados por Curso.
select cod, titulo, count(*) as CantidadAprobados
from curso,edicion,empleado,nota
where cod=codcurso and id=idedicion and cialum=ci 
and sexo='m' and  notaf>50
group by cod;

-- Mostrar los empleados varones que han enseñado mas de dos ediciones
select ci,nombre
from empleado,edicion
where ci=cidoc and sexo='m' 
group by ci
having count(*)>2;
-- /MOSTRAR EL ESTUDIANTE QUE TIENE LA NOTA MAXIMA/
select nombre ,notaf
from nota, empleado
where cialum=ci and notaf=100; 
-- /MOSTRAR LOS ESTUDIANTES QUE HAYAN LLEVADO MAS DE UNA EDICION/
select nombre,count(*)
from empleado, nota
where cialum=ci 
group by ci
having count(*)>1;
-- /MOSTRAR LOS ALUMNOS QUE LLEVARON UN CURSO CUYO PRE-REQUIQUISITO ES DELPHIBASICO/
select *
from empleado
where ci in (
	select cialum 
    from nota
    where idedicion in(
		select id 
        from edicion
        where codcurso in (
			select C.cod
            from curso C, curso P
            where c.codpreq=p.cod and p.titulo='Delphi Basico')));
-- /MOSTRAR LOS EMPLEADOS QUE HAN TOMADO MAS DE UN CURSO/
select nombre,count(*)
from empleado, nota, edicion
where cialum=ci and idedicion=id 
group by ci
having count(*)>1;
-- /*POR CADA EMPLEADO QUE FUE DOCENTE MOSTRAR LA CANTIDAD DE ALUMNAS MUJERES QUE SE INSCRIBIERON TOMARON EL CURSO*/
select doc.nombre, count(*)
from empleado doc,empleado alum, edicion,nota
where  cidoc=doc.ci and id=idedicion and cialum=alum.ci and alum.sexo='f'
group by doc.nombre ;
-- /MOSTRAR LOS ALUMNOS APROBADOS EN EL CURSO JAVA BASICO/
select cod, titulo,count(*)
from curso,edicion,nota
where cod=codcurso and id=idedicion 
and titulo='JAVA BASICO' and notaf>50;
-- /MOSTRAR EL CURSO PREREQUISITO PARA LLEVAR SQL AVANZADO/
select pre.titulo
from curso mat,curso pre
where mat.codpreq=pre.cod and mat.titulo='SQL Avanzado';
-- /MOSTRAR LA CANTIDAD DE EDICION QUE SE HA DICTADO POR CADA CURSO/
select titulo,count(*)
from edicion,curso
where codcurso=cod
group by cod;