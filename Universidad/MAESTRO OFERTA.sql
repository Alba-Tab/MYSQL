CREATE DATABASE MAESTRODEOFERTA;
USE MAESTRODEOFERTA;

CREATE TABLE MATERIA
(
	SIGLA varchar(6) NOT NULL PRIMARY KEY,
    NOMBRE VARCHAR(60) NOT NULL
);

CREATE TABLE DOCENTE 
(
	CODIGO INTEGER NOT NULL PRIMARY KEY,
	NOMBRE VARCHAR(60) NOT NULL
);


CREATE TABLE PERIODO
(
	ID  INTEGER NOT NULL PRIMARY KEY,
    NUMERO  INT NOT NULL,
    AÑO  SMALLINT NOT NULL
);

CREATE TABLE GRUPO
(
	ID INTEGER NOT NULL PRIMARY KEY,
    NOMBRE VARCHAR(2) NOT NULL,
    
    SIGLAMAT varchar(6) NOT NULL,
    foreign key (SIGLAMAT) references MATERIA(SIGLA)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
    
     IDDOCENTE INTEGER NOT NULL,
    foreign key (IDDOCENTE) references DOCENTE(CODIGO)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
    
    IDPERIODO INTEGER NOT NULL,
    foreign key (IDPERIODO) references PERIODO(ID)
	ON UPDATE CASCADE
	ON DELETE CASCADE
);

CREATE TABLE HORARIO
(
	IDGRUPO INTEGER NOT NULL,
	ID tinyint NOT NULL,
    DIA VARCHAR(3) NOT NULL,
    HORAI time NOT NULL,
    HORAF time NOT NULL,
	PRIMARY KEY (IDGRUPO, ID),
	foreign key (IDGRUPO) references GRUPO(ID)
	ON UPDATE CASCADE
	ON DELETE CASCADE
);

CREATE TABLE ALUMNO
(
	REGISTRO INTEGER NOT NULL PRIMARY KEY,
    NOMBRE VARCHAR(60) NOT NULL
);

CREATE TABLE BOLETAINSCRIPCION
(
	NRO INTEGER NOT NULL PRIMARY KEY,
    FECHA DATE NOT NULL,
    HORA time NOT NULL,
    
	REGISTROALUMNO INTEGER NOT NULL,
    foreign key (REGISTROALUMNO) references ALUMNO(REGISTRO)
	ON UPDATE CASCADE
	ON DELETE CASCADE
);

CREATE TABLE INSCRIBE
(
	NROBOLETA INTEGER NOT NULL,
	IDGRUPO INTEGER NOT NULL,
	PRIMARY KEY(NROBOLETA,IDGRUPO),     
	foreign key (IDGRUPO) references GRUPO(ID)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
	foreign key (NROBOLETA) references BOLETAINSCRIPCION(NRO)
	ON UPDATE CASCADE
	ON DELETE CASCADE
);
/*INSERTAR PERIODO*/

insert into PERIODO values(1,1,2023);
insert into PERIODO values(2,2,2023);
insert into PERIODO values(3,1,2024);
insert into PERIODO values(4,2,2024);

/*Inserción de datos docentes*/
insert into DOCENTE values(100,'Vargas Castillo Ciro Edgar');
insert into DOCENTE values(101,'Martinez Cardona Sarah Mirna');
insert into DOCENTE values(102,'Veizaga Gonzales Josue Obed');
insert into DOCENTE values(103,'Lopez Winnipeg Mario Milton');
insert into DOCENTE values(104,'Lazo Arteaga Carlos Roberto');
insert into DOCENTE values(105,'Calderon Flores Modesto Frankl');

insert into DOCENTE values(106,'Acosta Cabezas Bartolo Javier');
insert into DOCENTE values(107,'Valdelomar Orrellana Tomas');
insert into DOCENTE values(108,'Claure Medrano Oropeza ELiz');
insert into DOCENTE values(109,'Guzman de Molina Isabel Miriam');

insert into DOCENTE values(110,'Flores Flores Marcos Oscar');
insert into DOCENTE values(111,'Cabello Merida Juan Ruben');

insert into DOCENTE values(112,'Gianela Peredo Eduardo');
insert into DOCENTE values(113,'Gutierrea Bruno Katime Martin');
insert into DOCENTE values(114,'Velazco Guaman Angel');
insert into DOCENTE values(115,'Mollo Mamani Alberto');
insert into DOCENTE values(116,'Peinado Pereira Miguel Jesus');
insert into DOCENTE values(117,'Zeballos Pereira Daniel Luis');
select * from DOCENTE;



/*insertar datos de materia*/
insert into MATERIA values('INF119','Estructuras Discretas');
insert into MATERIA values('INF110','Introducción a la Informática');
insert into MATERIA values('FIS100','Física I');
insert into MATERIA values('MAT101','Cálculo I');
insert into MATERIA values('LIN100','Ingles Técnico I');
insert into MATERIA values('ADM100','Administración');
insert into MATERIA values('MAT103','Algebra Lineal');
insert into MATERIA values('MAT102','Calculo II');
insert into MATERIA values('LIN101','Ingles Tecnico II');
insert into MATERIA values('INF120','Programación I');
insert into MATERIA values('FIS102','Física II');
USE MAESTRODEOFERTA;
/*Insertad datos de grupo*/
insert into GRUPO values(1,'SE','INF119',100,2);
insert into GRUPO values(2,'SF','INF119',101,2);
insert into GRUPO values(3,'SI','INF110',102,2);
insert into GRUPO values(4,'Z6','INF110',103,2);

insert into GRUPO values(5,'Z5','FIS100',104,2);
insert into GRUPO values(6,'Z4','FIS100',105,2);

insert into GRUPO values(7,'Z5','MAT101',106,2);
insert into GRUPO values(8,'Z4','MAT101',107,2);

insert into GRUPO values(9,'Z6','LIN100',108,2);
insert into GRUPO values(10,'NX','LIN100',109,2);


insert into GRUPO values(11,'SA','ADM100',110,2);
insert into GRUPO values(12,'SC','ADM100',111,2);

insert into GRUPO values(13,'SF','MAT103',112,2);
insert into GRUPO values(14,'SE','MAT103',113,2);

insert into GRUPO values(15,'SH','MAT102',114,2);
insert into GRUPO values(16,'SB','MAT102',104,2);

insert into GRUPO values(17,'SB','LIN101',108,2);
insert into GRUPO values(18,'SE','LIN101',109,2);


insert into GRUPO values(19,'SI','INF120',115,2);
insert into GRUPO values(20,'SH','INF120',116,2);

insert into GRUPO values(21,'SA','FIS102',117,2);
insert into GRUPO values(22,'NX','FIS102',105,2);

/* insertar horarios*/
insert into HORARIO values(1,1,'MAR','18:15','20:30');
insert into HORARIO values(1,2,'JUE','18:15','20:30');
SELECT * FROM HORARIO;
insert into HORARIO values(2,1,'LUN','7:00','08:30');
insert into HORARIO values(2,2,'MIE','7:00','08:30');
insert into HORARIO values(2,3,'VIE','7:00','08:30');

insert into HORARIO values(3,1,'MAR','09:15','11:30');
insert into HORARIO values(3,2,'JUE','09:15','11:30');

insert into HORARIO values(4,1,'MAR','09:15','11:30');
insert into HORARIO values(4,2,'JUE','09:15','11:30');

insert into HORARIO values(5,1,'MAR','18:15','20:30');
insert into HORARIO values(5,2,'MIE','16:45','18:15');
insert into HORARIO values(5,3,'JUE','18:15','20:30');

insert into HORARIO values(6,1,'LUN','16:45','18:15');
insert into HORARIO values(6,2,'MIE','16:45','18:15');
insert into HORARIO values(6,3,'VIE','16:45','18:15');
insert into HORARIO values(6,4,'SAB','08:30','10:00');

insert into HORARIO values(7,1,'LUN','19:45','21:15');
insert into HORARIO values(7,2,'MIE','19:45','21:15');
insert into HORARIO values(7,3,'VIE','19:45','21:15');

insert into HORARIO values(8,1,'MAR','13:45','16:00');
insert into HORARIO values(8,2,'JUE','13:45','16:00');

insert into HORARIO values(9,1,'LUN','10:00','11:30');
insert into HORARIO values(9,2,'MIE','10:00','11:30');
insert into HORARIO values(9,3,'VIE','10:00','11:30');

insert into HORARIO values(10,1,'MAR','16:00','18:15');
insert into HORARIO values(10,2,'JUE','16:00','18:15');

insert into HORARIO values(11,1,'LUN','18:15','19:45');
insert into HORARIO values(11,2,'MIE','18:15','19:45');
insert into HORARIO values(11,3,'VIE','18:15','19:45');

insert into HORARIO values(12,1,'LUN','7:00','08:30');
insert into HORARIO values(12,2,'MIE','7:00','08:30');
insert into HORARIO values(12,3,'VIE','7:00','08:30');

insert into HORARIO values(13,1,'LUN','7:00','09:15');
insert into HORARIO values(13,2,'MIE','7:00','09:15');

insert into HORARIO values(14,1,'LUN','10:00','11:30');
insert into HORARIO values(14,2,'MIE','10:00','11:30');
insert into HORARIO values(14,3,'VIE','10:00','11:30');

insert into HORARIO values(15,1,'MAR','09:15','11:30');
insert into HORARIO values(15,2,'JUE','09:15','11:30');

insert into HORARIO values(16,1,'MAR','20:30','22:45');
insert into HORARIO values(16,2,'JUE','20:30','22:45');

insert into HORARIO values(17,1,'LUN','08:30','10:00');
insert into HORARIO values(17,2,'MIE','08:30','10:00');
insert into HORARIO values(17,3,'VIE','08:30','10:00');

insert into HORARIO values(18,1,'LUN','7:00','08:30');
insert into HORARIO values(18,2,'MIE','7:00','08:30');
insert into HORARIO values(18,3,'VIE','7:00','08:30');

insert into HORARIO values(19,1,'LUN','7:00','08:30');
insert into HORARIO values(19,2,'MIE','7:00','08:30');
insert into HORARIO values(19,3,'VIE','7:00','08:30');

insert into HORARIO values(20,1,'LUN','16:45','18:15');
insert into HORARIO values(20,2,'MIE','16:45','18:15');
insert into HORARIO values(20,3,'VIE','16:45','18:15');

insert into HORARIO values(21,1,'MAR','13:45','16:00');
insert into HORARIO values(21,2,'JUE','13:45','16:00');
insert into HORARIO values(21,3,'VIE','13:15','16:45');

insert into HORARIO values(22,1,'MAR','7:00','09:15');
insert into HORARIO values(22,2,'JUE','7:00','09:15');
insert into HORARIO values(22,3,'VIE','10:00','11:30');


-- MOSTRAR LOS RUPOS QUE DICTA EL DOCENTE TOMAS ALBERTO SALAZAR PEREZ EN EL PERIODO 2 2023
SELECT  NOMBRE,SIGLAMAT
FROM GRUPO
WHERE IDDOCENTE IN( SELECT ID
					FROM DOCENTE
                    WHERE NOMBRE ='TOMAS ALBERTO SALAZAR PEREZ')
AND IDPERIODO IN (SELECT ID
					FROM PERIODO
                    WHERE NUMERO=2 AND AÑO =2023);
-- mostrar todos los docentes qhe dictan dos grupos
select docente.codigo,DOCENTE.NOMBRE,COUNT(*)
FROM DOCENTE,GRUPO,PERIODO
WHERE
CODIGO=IDDOCENTE AND IDPERIODO=PERIODO.ID AND NUMERO=2 AND AÑO=2023
GROUP BY DOCENTE.CODIGO,DOCENTE.NOMBRE
having COUNT(*)=2;

-- MOSTRAR POR CADA GRUPO CUANTOS HORARIOS ASIGNADOS
SELECT GRUPO.NOMBRE, COUNT(*)
FROM GRUPO,HORARIO
WHERE GRUPO.ID=IDGRUPO
GROUP BY GRUPO.NOMBRE,ID;

-- MOSTRAR LOS GRUPOS QUE SON DE LA MATERIA INTRODUCCION A LA INFORMATICA
SELECT *
FROM GRUPO
WHERE SIGLAMAT='INF110';

SELECT *
FROM GRUPO
WHERE SIGLAMAT IN (SELECT SIGLA
					FROM MATERIA
                    WHERE NOMBRE='INTRODUCCION A LA INFORMATICA');

-- MOSTRAR TODOS LOS GRUPOS DE LA GESTION 2-2023 QUE INICIAN SUS CLASES A LAS 9:15
SELECT *
FROM GRUPO, PERIODO, HORARIO
WHERE IDPERIODO=PERIODO.ID AND IDGRUPO=GRUPO.ID AND
NUMERO=2 AND AÑO=2023 AND HORARIO.HORAI='09:15';

-- MOSRAR LA CANTIDAD DE GRUPOS EXISTENTES POR CADA MATERIA EN LA GESTION 2-2023

SELECT distinct MATERIA.NOMBRE , COUNT(*) AS GRUPO 
FROM GRUPO, MATERIA,PERIODO
WHERE SIGLAMAT=SIGLA AND NUMERO=2 AND AÑO=2023 
GROUP BY SIGLA;
-- agregar alumnos--------------------------------------
insert ALUMNO (REGISTRO,NOMBRE) VALUES
(1111,'JOAQUIN CHUMACEERO'),
(2222,'ELBA ZURITA'),
(3333,'ALAN BRITO'),
(5555,'LUFFY D MONCKEY'),
 (4444,'HOMERO JAY SIMPSON');
 insert ALUMNO (REGISTRO,NOMBRE) VALUES
(6666,'MILTON ROJAS'),
(7777,'CIELO ESTRELLA'),
(8888,'ROSITA PEREZ'),
(9999,'JOSE JAVIER MILLEI');
 INSERT BOLETAINSCRIPCION (NRO,FECHA,HORA,REGISTROALUMNO) VALUES
 (105,'2023-5-24','09:00',6666),
 (106,'2023-5-25','11:30',7777),
(107,'2023-5-20','12:00',8888),
(108,'2023-5-24','16:30',9999);
INSERT INSCRIBE (NROBOLETA,IDGRUPO) VALUES
(105,17),(105,20),(105,22),
(106,2),(106,3),(106,5),(106,8),(106,10),
(107,2),(107,5),(107,7),(107,9),
(108,16),(108,20),(108,21);
SELECT * FROM BOLETAINSCRIPCION;
-- MOSTRAR EL GRUPO Y LA MATERIA QUE ESTA LLEVANDO ELBA ZURITA DE MATERIAS OFERTADAS EL SEMESTRE 2 2023
SELECT ALUMNO.NOMBRE, GRUPO.NOMBRE , GRUPO.SIGLAMAT
FROM MATERIA, GRUPO, ALUMNO, INSCRIBE, PERIODO, BOLETAINSCRIPCION
WHERE REGISTRO=REGISTROALUMNO AND NRO=NROBOLETA AND IDGRUPO=GRUPO.ID AND IDPERIODO=PERIODO.ID AND SIGLAMAT=SIGLA AND NUMERO=2 AND AÑO=2023
AND ALUMNO.NOMBRE='ELBA ZURITA';
-- MOSTRAR LA CANTIDAD DE MATERIAS INSCRITAS POR CADA ALUMNO DE MATERIAS OFERTADAS EN EL SEMESTRE 2 2023
SELECT ALUMNO.NOMBRE,COUNT(*) AS CANTIDAD_MATERIAS
FROM ALUMNO, INSCRIBE, BOLETAINSCRIPCION, GRUPO,PERIODO
WHERE REGISTRO=REGISTROALUMNO AND NROBOLETA=NRO AND IDGRUPO=GRUPO.ID AND IDPERIODO=PERIODO.ID
AND NUMERO=2 AND AÑO=2023 
group by ALUMNO.REGISTRO;
-- INSCRITO MAS DE 5 MATERIAS
SELECT ALUMNO.NOMBRE,COUNT(*) AS CANTIDAD_MATERIAS
FROM ALUMNO, INSCRIBE, BOLETAINSCRIPCION, GRUPO,PERIODO
WHERE REGISTRO=REGISTROALUMNO AND NROBOLETA=NRO AND IDGRUPO=GRUPO.ID AND IDPERIODO=PERIODO.ID
AND NUMERO=2 AND AÑO=2023 
group by ALUMNO.REGISTRO
having COUNT(*)>5;
-- MOSTRAR LOS GRUPOS A LOS CUALES NADIE SE INSCRIBIO
FROM GRUPO
WHERE ID NOT IN(SELECT IDGRUPO
				FROM INSCRIBE
                )
-- MOSTRAR TODOS LOS ALUMNOS QUE HAN INSCRITO LA MATERIA CALCULO 1 EN EL SEMESTRE 2 -2023
SELECT NOMBRE
FROM ALUMNO
WHERE REGISTRO IN (SELECT REGISTROALUMNO
					FROM BOLETAINSCRIPCION
                    WHERE NRO IN (
						SELECT NROBOLETA
                        FROM INSCRIBE
                        WHERE IDGRUPO IN (
							SELECT ID
                            FROM GRUPO
                            WHERE SIGLAMAT IN )))
                            
-- MOSTRAR MATERIAS OFERTADAS DOS VECES

/* ---------------------- METODOS -----------------------------------*/
SELECT DOCENTE.NOMBRE
FROM DOCENTE, GRUPO, PERIODO
WHERE DOCENTE.CODIGO = GRUPO.IDDOCENTE AND PERIODO.ID = GRUPO.IDPERIODO 
AND IDPERIODO = 3;


SELECT DOCENTE.NOMBRE
FROM DOCENTE, GRUPO, MATERIA
WHERE DOCENTE.CODIGO = GRUPO.IDDOCENTE AND MATERIA.SIGLA = GRUPO.SIGLAMAT
AND MATERIA.NOMBRE = 'BASE DE DATOS I';


# MOSTRRAR LA HORA DE INICIO DEL DIA LUNES DE LA MATERIA FISICA I, GRUPO Z6
SELECT MATERIA.SIGLA, HORAI
FROM MATERIA ,GRUPO,HORARIO
WHERE MATERIA.SIGLA=GRUPO.SIGLAMAT AND GRUPO.ID=HORARIO.IDGRUPO 
AND MATERIA.NOMBRE ='FISICA I' AND GRUPO.NOMBRE='Z6' AND HORARIO.DIA='LUN';