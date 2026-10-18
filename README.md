RetailPro - Proyecto de Base de Datos y Análisis de Ventas.
Descripción
Este es un proyecto académico orientado al diseño, implementación y análisis de una base de datos comercial para una empresa de tecnología imaginaría llamada RetailPro.
El proyecto contempla la creación de un modelo relacional normalizado, la carga de datos para ser usado como ejemplo, la realización de consultas de negocio mediante SQL y la construcción de visualizaciones analíticas en Power BI.
El objetivo principal es aplicar conceptos de:
•	Modelado de bases de datos relacionales.
•	Integridad referencial.
•	Consultas SQL.
•	JOINs y análisis multidimensional.
•	ETL en Power BI.
•	Diseño de dashboards ejecutivos.
________________________________________
Estructura del Proyecto
Archivos SQL:
•	ventas_tech_db.sql: Creación de tablas, relaciones, carga de datos y validaciones.
•	m4_consultas_negocio.sql: Consultas de negocio orientadas al análisis comercial
•	m5_consultas_joins.sql: Consultas utilizando INNER JOIN, LEFT JOIN y consolidación de información.
Archivos Power BI
•	Pipeline_ETL_Labat_Marcos.pbix: Proceso ETL y transformación de datos.
•	Pipeline_ETL_M7_Labat_Marcos.pbix: Dashboard ejecutivo y análisis visual
________________________________________
Modelo de Datos
El modelo fue diseñado siguiendo principios de normalización para evitar redundancia y mejorar la calidad de los datos.
Tablas Dimensionales
•	categorias
•	clientes
•	productos
•	tipo_venta
•	territorios
•	vendedor
Tabla de Hechos
•	ventas
Se implementó un modelo del tipo Star Schema, donde la tabla ventas concentra las transacciones y el resto de las tablas aportan contexto analítico.
________________________________________
Herramientas Utilizadas
Base de Datos
•	SQL Server Management Studio (SSMS)
Visualización y ETL
•	Microsoft Power BI Desktop
•	Power Query
•	DAX
________________________________________
Principales Consultas Implementadas
Análisis Comercial
•	Facturación mensual.
•	Ticket promedio.
•	Cantidad de pedidos por período.
•	Ranking de productos más vendidos.
•	Clientes recurrentes.
•	Comparación de desempeño contra promedio general.
•	Método de venta menos rentable.
________________________________________
Hallazgos Obtenidos
1. Concentración de ingresos
Los productos de mayor valor unitario generan una parte significativa de la facturación total.
2. Clientes recurrentes
Se identificaron clientes que realizaron múltiples compras, evidenciando oportunidades de fidelización.
3. Ticket promedio elevado
El negocio opera con productos tecnológicos de valor medio-alto, donde cada transacción tiene un impacto significativo en los ingresos.
________________________________________
Cómo Ejecutar el Proyecto
Paso 1: Crear la base de datos
Crear una nueva base de datos en SQL Server.
CREATE DATABASE RetailPro;
GO

USE RetailPro;
GO
Paso 2: Ejecutar el script principal
Ejecutar:
ventas_tech_db.sql
Este script:
•	Crea las tablas.
•	Define claves primarias y foráneas.
•	Inserta datos de prueba.
•	Ejecuta validaciones.
Paso 3: Ejecutar consultas de negocio
m4_consultas_negocio.sql
Obtendrás métricas de facturación, clientes y productos.
Paso 4: Ejecutar consultas JOIN
m5_consultas_joins.sql
Obtendrás análisis relacionales entre clientes, productos, ventas y vendedores.
Paso 5: Abrir Power BI
Ambos archivos de Power Bl contienen el avance de la normalización de datos que se mostrarán en el dashboard final.
________________________________________
Objetivos de Aprendizaje
•	Diseñar bases de datos relacionales.
•	Implementar claves primarias y foráneas.
•	Utilizar consultas SQL para análisis de negocio.
•	Aplicar JOINs para integrar información de múltiples tablas.
•	Construir procesos ETL mediante Power Query.
•	Crear dashboards profesionales en Power BI.
________________________________________
Autor
Marcos Adrián Labat
Proyecto desarrollado como práctica académica de SQL, modelado de datos y Power BI.
