# Exploracion-Espacial-Java-MySQL


# Exploración Espacial - Base de Datos y Conexión con Java

Este proyecto tiene como objetivo crear y gestionar una base de datos relacionada con la exploración espacial, utilizando MySQL para almacenar información sobre planetas, astrónomos, descubrimientos, misiones espaciales y la relación entre ellos. La base de datos está conectada a un programa en Java que interactúa con ella a través de procedimientos almacenados.

## Estructura de la Base de Datos

La base de datos **ExploracionEspacial** consta de las siguientes tablas:

1. **Planetas:** Información sobre planetas descubiertos (nombre, tipo, tamaño, distancia, temperatura, vida).
2. **Astronomos:** Detalles sobre los astrónomos que descubren los planetas (nombre, nacionalidad, especialidad).
3. **Descubrimientos:** Relación entre planetas y astrónomos, indicando el método de descubrimiento.
4. **MisionesEspaciales:** Información sobre misiones espaciales, su agencia, fecha de lanzamiento y estado.
5. **Misiones_Planetas:** Relación entre misiones espaciales y planetas explorados.

### Procedimientos Almacenados

Se han creado los siguientes procedimientos almacenados en MySQL para realizar operaciones sobre la base de datos:

- **InsertarPlaneta:** Inserta un nuevo planeta en la tabla `Planetas`.
- **ObtenerPlanetasPorAstronomo:** Recupera los planetas descubiertos por un astrónomo específico.
- **ObtenerMisionesPorPlaneta:** Recupera las misiones espaciales que han explorado un planeta determinado.

## Conexión de Java con MySQL

Se utilizó la librería JDBC de Java para conectar con la base de datos MySQL y ejecutar los procedimientos almacenados.

### Funciones Implementadas

- **insertarPlaneta:** Permite al usuario insertar un nuevo planeta en la base de datos, proporcionando detalles como nombre, tipo, tamaño, distancia, temperatura y si tiene vida.
- **obtenerPlanetasPorAstronomo:** Permite al usuario obtener los planetas descubiertos por un astrónomo en particular.
- **obtenerMisionesPorPlaneta:** Permite al usuario ver las misiones espaciales que han explorado un planeta específico.

### Interfaz de Usuario

El programa incluye un menú interactivo que permite al usuario realizar las siguientes acciones:

1. Insertar un nuevo planeta.
2. Obtener planetas descubiertos por un astrónomo.
3. Obtener misiones que han explorado un planeta.
4. Salir del programa.

## Instrucciones

1. **Requisitos previos:**
   - Tener MySQL instalado y en funcionamiento.
   - Tener Java y la librería JDBC configurados correctamente en tu entorno de desarrollo.
   - Crear la base de datos y las tablas ejecutando los scripts SQL proporcionados.

2. **Pasos para ejecutar el proyecto:**
   - Clonar el repositorio.
   - Configurar los parámetros de conexión en el archivo `Espacio.java` (usuario, contraseña y URL de la base de datos).
   - Ejecutar el programa Java para interactuar con la base de datos.

```bash
git clone https://github.com/tu-usuario/ExploracionEspacial.git
cd ExploracionEspacial
javac Espacio.java
java Espacio
