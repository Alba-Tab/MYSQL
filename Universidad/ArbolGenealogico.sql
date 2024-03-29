CREATE DATABASE ARBOL_GENEALOGICO;
USE ARBOL_GENEALOGICO;
CREATE TABLE PERSONA(
ID INTEGER NOT NULL PRIMARY KEY ,
NOMBRE VARCHAR(60) NOT NULL,
SEXO CHAR NOT NULL,
IDPADRE INTEGER, 
IDMADRE INTEGER
);
# EN RECURSIVO NO ACTION PARA QUE NO CAMBIE ARRIBA
# ALTER TABLE PARA AÑADIR UN ATRIBUTO
ALTER TABLE PERSONA 
ADD FOREIGN KEY (IDPADRE) REFERENCES PERSONA(ID)
ON UPDATE NO ACTION 
ON DELETE NO ACTION;

ALTER TABLE PERSONA 
ADD FOREIGN KEY (IDMADRE) REFERENCES PERSONA(ID)
ON UPDATE NO ACTION 
ON DELETE NO ACTION;

INSERT INTO PERSONA VALUES (1,'JOAQUIN CHUMACERO','M',NULL,NULL);
INSERT INTO PERSONA VALUES (2,'FABIANA YUPANQUI','F',NULL,NULL);
INSERT INTO PERSONA VALUES (3,'CARLOS CHUMACERO YUPANQUI','M',1,2);
INSERT INTO PERSONA VALUES (4,'PRISCILA AGUILERA','F',NULL,NULL);
INSERT INTO PERSONA VALUES (5,'JOAQUIN CHUMACERO AGUILERA','M',3,4);
INSERT INTO PERSONA VALUES (6,'FABIOLA MENDEZ','F',NULL,NULL);
INSERT INTO PERSONA VALUES (7,'JOAQUIN JR. CHUMACERO MENDEZ','M',5,6);
INSERT INTO PERSONA VALUES (8,'FABIOLA CHUMACERO MENDEZ','F',5,6);
INSERT INTO PERSONA VALUES (9,'ANA CASTRO','F',NULL,NULL);
INSERT INTO PERSONA VALUES (10,'CARLOS CHUMACERO CASTRO','M',5,9);


#MOSTRAR OS HIJOS DE JOAQUIN CHUMACERO AGUILERA
SELECT * 
FROM PERSONA PADRE , PERSONA HIJO
WHERE PADRE.ID=HIJO.IDPADRE AND PADRE.ID =5;

SELECT *
FROM PERSONA
WHERE IDPADRE IN(SELECT ID
				FROM PERSONA
                WHERE NOMBRE='JOAQUIN CHUMACERO AGUILERA'
					);

#MOSTRAR EL PADRE DE JOAQUIN CHUMACERO AGUILERA
SELECT *
FROM PERSONA
WHERE ID IN (SELECT IDPADRE
			FROM PERSONA
            WHERE NOMBRE='JOAQUIN CHUMACERO AGUILERA');

SELECT PADRE.ID,PADRE.NOMBRE
FROM PERSONA PADRE, PERSONA HIJO
WHERE PADRE.ID=HIJO.IDPADRE AND HIJO.NOMBRE='JOAQUIN CHUMACERO AGUILERA';
SELECT *
FROM PERSONA;

#mostrar el abuelo paterno de joaquin chumacero aguilera
SELECT *
FROM PERSONA
WHERE ID IN
(SELECT IDPADRE
FROM PERSONA
WHERE ID IN (SELECT IDPADRE
			FROM PERSONA
            WHERE NOMBRE='JOAQUIN CHUMACERO AGUILERA'));
SELECT ABUELO.ID,ABUELO.NOMBRE
FROM PERSONA ABUELO,PERSONA PADRE, PERSONA HIJO
WHERE ABUELO.ID=PADRE.IDPADRE AND PADRE.ID=HIJO.IDPADRE AND HIJO.NOMBRE='JOAQUIN CHUMACERO AGUILERA';

# mOSTRAR LAS PERSONAS CON LAS CUALES TUVO HIJOS JOAQUIN CHUMACERO
SELECT * 
FROM PERSONA
WHERE ID IN (SELECT IDMADRE
			FROM PERSONA
            WHERE IDPADRE IN (SELECT ID
							  FROM PERSONA
                              WHERE NOMBRE='JOAQUIN CHUMACERO AGUILERA'));
			# DISCTINT ES PARA NO REPETIR LOS DATOS QUE SALEN
SELECT DISTINCT MADRE.NOMBRE
from PERSONA PADRE, PERSONA MADRE ,PERSONA HIJO
WHERE PADRE.ID=HIJO.IDPADRE AND HIJO.IDMADRE=MADRE.ID AND
PADRE.NOMBRE='JOAQUIN CHUMACERO AGUILERA';

SELECT *
FROM PERSONA;