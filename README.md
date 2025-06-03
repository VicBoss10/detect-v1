# Detect-v1

Proyecto de detección de objetos con backend y frontend desacoplados, gestionados como **submódulos** en este repositorio principal.

Para información mas detallada visite los README de los submódulos.

## Tecnologías Utilizadas

- Java 21
- Spring Boot
- Angular
- PostgreSQL 17
- Docker
- Swagger para documentación de API
- Keycloak para autenticación y control de acceso

---

## Estructura del Proyecto

- **backend/**: API y lógica de negocio (Spring Boot, expuesto en el puerto 8081)
- **frontend/**: Aplicación web Angular (servida en el puerto 80)
- **keycloak/**: Servicio de autenticación (puerto 8080)
- **java_db/** y **keycloak_db/**: Bases de datos PostgreSQL para la aplicación y Keycloak

---

## Instalación y Ejecución

### 1. Clonar el repositorio con submódulos

```sh
git clone --recurse-submodules https://github.com/VicBoss10/detect-v1.git
cd detect-v1
```

Si ya clonaste sin `--recurse-submodules`, inicializa los submódulos así:

```sh
git submodule update --init --recursive
```


### 2. Construir y ejecutar con Docker Compose

```sh
docker compose up --build
```

Esto levantará todos los servicios: backend, frontend, Keycloak y las bases de datos.

> Nota: En algunas ocasiones la imagen de java_app no se inicia porque depende de java_db (Aunque esta definido en el docker-compose.yaml).
 Si pasa esto iniciar la imagen manualmente.

```sh
docker compose start java_app
```
---

## Acceso a la Aplicación

- **Frontend Angular:** [http://localhost](http://localhost)
- **Backend API (Swagger):** [http://localhost:8081/swagger-ui.html](http://localhost:8081/swagger-ui.html)
    
    (Solo documentación ya que los endpoints están protegidos)
- **Keycloak (Admin Console):** [http://localhost:8080](http://localhost:8080)
- **Base de datos PostgreSQL (aplicación):** `localhost:5432`
- **Base de datos PostgreSQL (Keycloak):** `localhost:5432` (dentro del contenedor `keycloak_db`)

---

## Credenciales de Acceso

- **Frontend (usuario por defecto):**
  - Usuario: `admin`
  - Contraseña: `AdminDetect2025`

- **Keycloak (Admin Console):**
  - Usuario: `admin`
  - Contraseña: `admin`

> Nota: Estas credenciales son solo para fines educativos y de demostración.

---

## Inserción de Datos de Ejemplo

Después de levantar los servicios con Docker Compose, puedes cargar datos de ejemplo en la base de datos de la aplicación usando el archivo `ejemplos.sql`.  
Esto es útil si las tablas ya fueron creadas por JPA/Hibernate y solo necesitas poblarlas con datos de prueba.

### Pasos para insertar los datos de ejemplo

1. **Copia el archivo `ejemplos.sql` al contenedor de la base de datos:**

   ```sh
   docker cp ./ejemplos.sql java_db:/ejemplos.sql
   ```

2. **Ejecuta el script dentro del contenedor:**

   ```sh
   docker compose exec java_db psql -U postgres -d postgres -f /ejemplos.sql
   ```

   Si el comando anterior falla (por ejemplo, en Windows), puedes usar esta alternativa:

   ```sh
   docker compose exec -T java_db psql -U postgres -d postgres < ejemplos.sql
   ```

> **Nota:** Realiza estos pasos solo después de que los servicios estén arriba y las tablas hayan sido creadas por la aplicación.

---


