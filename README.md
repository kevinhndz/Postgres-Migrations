# 🏋️‍♂️ Proyecto de Base de Datos: Sistema de Gestión de Gimnasio

Este repositorio contiene la arquitectura, el esquema estructural y la población de datos para una base de datos relacional de un gimnasio, migrada y gestionada íntegramente a través de **Supabase (PostgreSQL)** utilizando un flujo de migraciones de control de versiones.

## 📌 Arquitectura y Tecnologías
* **Motor de Base de Datos:** PostgreSQL (alojado en la nube de Supabase).
* **Gestión de Versiones:** Supabase CLI y Git/GitHub.
* **Paradigma:** Infraestructura como Código (IaC) aplicada a bases de datos mediante migraciones secuenciales inmutables.

## 📂 ¿Cómo funcionan las migraciones en este proyecto?
En lugar de crear tablas o insertar datos manualmente a través de una interfaz gráfica, todos los cambios en la base de datos se han automatizado y versionado. 

Se utilizó la **Supabase CLI** en el entorno local para generar archivos SQL con marcas de tiempo (timestamps). El flujo de trabajo fue el siguiente:
1. `npx supabase migration new <nombre>`: Crea un nuevo archivo SQL en blanco preservando el orden cronológico estricto.
2. **Escritura SQL:** Se redactan las sentencias DDL (CREATE) o DML (INSERT) en el archivo local.
3. `npx supabase db push`: Conecta con la instancia de PostgreSQL en la nube, verifica el historial de migraciones internas y ejecuta los nuevos cambios a través de transacciones seguras.

Este método garantiza un historial inmutable, previene la pérdida de datos y permite que la base de datos sea 100% reproducible en cualquier otro entorno.

## 🗄️ Estructura de las Migraciones
El código fuente de la base de datos se encuentra en el directorio `/supabase/migrations/`. Se ha dividido estratégicamente en 9 fases para mantener un control granular:

* **`01_crear_tablas.sql`**: Contiene todo el esquema DDL, definiendo las entidades principales, tipos de datos, llaves primarias (PK) y llaves foráneas (FK).
* **`02_insertar_sucursales.sql`**: Población inicial de catálogos (Sucursales).
* **`03_insertar_membresias.sql`**: Inserción de los tipos de membresías y costos.
* **`04_insertar_entrenadores.sql`**: Registro del personal de entrenamiento.
* **`05_insertar_clientes.sql`**: Base de datos de clientes registrados.
* **`06_insertar_empleados.sql`**: Registro de personal administrativo y de servicio.
* **`07_insertar_productos.sql`**: Inventario de productos a la venta en el gimnasio.
* **`08_insertar_actividades.sql`**: Catálogo de clases y actividades físicas disponibles.
* **`09_insertar_tablas_puente.sql`**: Resolución de relaciones Muchos a Muchos (N:M), conectando clientes con actividades, inscripciones, etc.

## 👨‍🏫 Notas:
Para revisar el código lógico de la base de datos, puede navegar directamente a la carpeta `supabase/migrations/` en este repositorio, donde se encuentra el historial exacto de cada comando SQL ejecutado.

