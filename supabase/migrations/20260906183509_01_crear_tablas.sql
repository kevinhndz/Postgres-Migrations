-- 1. Migracion #1 - Enfocada unicamente para crear las tablas.


-- 1. Sucursales
CREATE TABLE IF NOT EXISTS Sucursales (
    id_sucursal SERIAL PRIMARY KEY,
    Nombre VARCHAR(100),
    Direccion VARCHAR(255),
    Correo VARCHAR(100)
);

-- 2. Membresias
CREATE TABLE IF NOT EXISTS Membresias (
    id_membresia SERIAL PRIMARY KEY,
    Tipo_membresia VARCHAR(50),
    PagoMensual DECIMAL(10, 2),
    Contrato VARCHAR(20)
);

-- 3. Entrenadores
CREATE TABLE IF NOT EXISTS Entrenadores (
    id_entrenador SERIAL PRIMARY KEY,
    Nombre VARCHAR(100),
    Telefono VARCHAR(20),
    Direccion VARCHAR(255),
    id_sucursal INT,
    id_membresia INT,
    FOREIGN KEY (id_sucursal) REFERENCES Sucursales(id_sucursal),
    FOREIGN KEY (id_membresia) REFERENCES Membresias(id_membresia)
);

-- 4. Clientes
CREATE TABLE IF NOT EXISTS Clientes (
    id_cliente SERIAL PRIMARY KEY,
    Nombre VARCHAR(100),
    Telefono VARCHAR(20),
    Correo VARCHAR(100),
    Direccion VARCHAR(255),
    id_sucursal INT,
    id_entrenador INT,
    id_membresia INT,
    FOREIGN KEY (id_sucursal) REFERENCES Sucursales(id_sucursal),
    FOREIGN KEY (id_entrenador) REFERENCES Entrenadores(id_entrenador),
    FOREIGN KEY (id_membresia) REFERENCES Membresias(id_membresia)
);

-- 5. Empleados
CREATE TABLE IF NOT EXISTS Empleados (
    id_empleado SERIAL PRIMARY KEY,
    Nombre VARCHAR(100),
    Telefono VARCHAR(20),
    numero_empleado VARCHAR(50),
    Direccion VARCHAR(255),
    Salario DECIMAL(10, 2),
    id_sucursal INT,
    id_membresia INT,
    FOREIGN KEY (id_sucursal) REFERENCES Sucursales(id_sucursal),
    FOREIGN KEY (id_membresia) REFERENCES Membresias(id_membresia)
);

-- 6. Productos
CREATE TABLE IF NOT EXISTS Productos (
    id_producto SERIAL PRIMARY KEY,
    Nombre VARCHAR(100),
    Stock INT,
    Precio DECIMAL(10, 2)
);

-- 7. Actividades
CREATE TABLE IF NOT EXISTS Actividades (
    id_actividad SERIAL PRIMARY KEY,
    TipoActividad VARCHAR(100)
);

-- 8. Horarios_Actividades
CREATE TABLE IF NOT EXISTS Horarios_Actividades (
    id_schedule SERIAL PRIMARY KEY,
    Horario VARCHAR(50)
);

-- Tablas de Relacion N:M
CREATE TABLE IF NOT EXISTS Cliente_Actividad (
    id_cliente INT, 
    id_actividad INT, 
    PRIMARY KEY(id_cliente, id_actividad), 
    FOREIGN KEY(id_cliente) REFERENCES Clientes(id_cliente), 
    FOREIGN KEY(id_actividad) REFERENCES Actividades(id_actividad)
);

CREATE TABLE IF NOT EXISTS Empleado_Actividad (
    id_empleado INT, 
    id_actividad INT, 
    PRIMARY KEY(id_empleado, id_actividad), 
    FOREIGN KEY(id_empleado) REFERENCES Empleados(id_empleado), 
    FOREIGN KEY(id_actividad) REFERENCES Actividades(id_actividad)
);

CREATE TABLE IF NOT EXISTS Entrenador_Actividad (
    id_entrenador INT, 
    id_actividad INT, 
    PRIMARY KEY(id_entrenador, id_actividad), 
    FOREIGN KEY(id_entrenador) REFERENCES Entrenadores(id_entrenador), 
    FOREIGN KEY(id_actividad) REFERENCES Actividades(id_actividad)
);

CREATE TABLE IF NOT EXISTS Actividad_Horario (
    id_actividad INT, 
    id_schedule INT, 
    PRIMARY KEY(id_actividad, id_schedule), 
    FOREIGN KEY(id_actividad) REFERENCES Actividades(id_actividad), 
    FOREIGN KEY(id_schedule) REFERENCES Horarios_Actividades(id_schedule)
);