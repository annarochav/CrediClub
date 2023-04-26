--Crear tablas donde existirán los datos ya limpios desde python
CREATE TABLE entidades (
id_entidad INT NOT NULL,
entidad VARCHAR NOT NULL,
PRIMARY KEY (id_entidad),
UNIQUE (id_entidad));

CREATE TABLE deudores (
id_deudor INT NOT NULL,
estatus VARCHAR NOT NULL,
PRIMARY KEY (id_deudor ),
UNIQUE (id_deudor));

CREATE TABLE credi_club (
ID_Cliente INT NOT NULL, 
ID_Grupo	INT NOT NULL, 
Ciclo	INT NOT NULL, 
F_Inicio	DATE not null,
Monto	FLOAT not null,
Cuota	FLOAT not null,
Plazo	INT NOT NULL, 
Sucursal	INT NOT NULL, 
Nacionalidad	VARCHAR NOT NULL, 
F_Nacimiento	DATE not null,
Sexo	VARCHAR NOT NULL, 
Entidad_Nacimiento	INT NOT NULL, 
Entidad_Residencia	INT NOT NULL, 
CodigoPostal	INT NOT NULL, 
IngresoMensual	FLOAT not null,
Liquido	INT NOT NULL, 
Edad_4_23_2023	INT NOT NULL, 
FOREIGN KEY (Entidad_Nacimiento) REFERENCES entidades(id_entidad),
FOREIGN KEY (Entidad_Residencia) REFERENCES entidades(id_entidad),
FOREIGN KEY (Liquido) REFERENCES deudores (id_deudor));

---Query para agregar columnas condicionales y hacer joins para conocer estados y estatus

SELECT c.id_cliente, c.id_grupo, c.ciclo, c.f_inicio, c.monto, c.cuota, 
       c.plazo, c.sucursal, c.nacionalidad, c.f_nacimiento, c.sexo, c.entidad_nacimiento, 
       c.entidad_residencia, c.codigopostal, c.ingresomensual, c.liquido, c.edad_4_23_2023, 
       e.entidad, d.estatus,
       CASE 
         WHEN c.edad_4_23_2023 >= 20 AND c.edad_4_23_2023 < 30 THEN '20-30'
         WHEN c.edad_4_23_2023 >= 30 AND c.edad_4_23_2023 < 40 THEN '30-40'
         WHEN c.edad_4_23_2023 >= 40 AND c.edad_4_23_2023 < 50 THEN '40-50'
         WHEN c.edad_4_23_2023 >= 50 AND c.edad_4_23_2023 < 60 THEN '50-60'
         WHEN c.edad_4_23_2023 >= 60 AND c.edad_4_23_2023 < 70 THEN '60-70'
         WHEN c.edad_4_23_2023 >= 70 AND c.edad_4_23_2023 < 80 THEN '70-80'
         WHEN c.edad_4_23_2023 >= 80 AND c.edad_4_23_2023 < 90 THEN '80-90'
         WHEN c.edad_4_23_2023 >= 90 AND c.edad_4_23_2023 < 100 THEN '90-100'
         ELSE '18-19'
       END AS rango_edad,
       
       CASE 
         WHEN c.ingresomensual >= 10000 AND c.ingresomensual < 20000 THEN '10-20k'
         WHEN c.ingresomensual >= 20000 AND c.ingresomensual < 30000 THEN '20-30k'
         WHEN c.ingresomensual >= 30000 AND c.ingresomensual < 40000 THEN '30-40k'
         WHEN c.ingresomensual >= 40000 AND c.ingresomensual < 50000 THEN '40-50k'
         WHEN c.ingresomensual >= 50000 AND c.ingresomensual < 60000 THEN '50-60k'
         WHEN c.ingresomensual >= 60000 AND c.ingresomensual < 70000 THEN '60-70k'
         WHEN c.ingresomensual >= 70000 AND c.ingresomensual < 80000 THEN '70-80k'
         WHEN c.ingresomensual >= 80000 AND c.ingresomensual < 90000 THEN '80-90k'
         WHEN c.ingresomensual >= 90000 AND c.ingresomensual < 100000 THEN '90-100k'
         WHEN c.ingresomensual >= 100000 AND c.ingresomensual < 5000000 THEN '100-500k'
         WHEN c.ingresomensual >= 500000 AND c.ingresomensual < 1000000 THEN '500-1M'
         WHEN c.ingresomensual >= 1000000 THEN '+1M'
         ELSE '1-10k'
       END AS rango_ingreso,
       
       CASE 
         WHEN c.monto >= 10000 AND c.monto < 20000 THEN '10-20k'
         WHEN c.monto >= 20000 AND c.monto < 30000 THEN '20-30k'
         WHEN c.monto >= 30000 AND c.monto < 40000 THEN '30-40k'
         WHEN c.monto >= 40000 AND c.monto < 50000 THEN '40-50k'
         WHEN c.monto >= 50000 AND c.monto < 60000 THEN '50-60k'
         WHEN c.monto >= 60000 AND c.monto < 70000 THEN '60-70k'
         WHEN c.monto >= 70000 AND c.monto < 80000 THEN '70-80k'
         WHEN c.monto >= 80000 AND c.monto < 90000 THEN '80-90k'
         WHEN c.monto >= 90000 AND c.monto < 100000 THEN '90-100k'
         ELSE '3-10k'
       END AS rango_monto,
       
       TO_CHAR(c.f_inicio, 'Month') AS mes_inicio
FROM credi_club AS c
INNER JOIN entidades AS e ON c.entidad_residencia = e.id_entidad
INNER JOIN deudores AS d ON c.liquido = d.id_deudor;
















































