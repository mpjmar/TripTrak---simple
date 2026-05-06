
<div align="center">
    <h1>🌍 TripTrakker — Planificador de Viajes</h1>
</div>

---

## 🧠 Descripción

TripTrakker es una aplicación web que permite a los usuarios planificar sus viajes de forma sencilla. El usuario puede crear viajes, añadir destinos y organizar actividades dentro de cada destino.

**Tecnologías aplicadas:**
- HTML5
- CSS3
- JavaScript
- Node.js
- MySQL


---

## 🎯 Funcionalidades principales

### ✈️ Gestión de viajes
- Crear un viaje
- Editar un viaje
- Eliminar un viaje
- Visualizar todos los viajes

### 🌍 Gestión de destinos
- Añadir destinos a un viaje
- Ver destinos asociados a un viaje
- Eliminar destinos

### 🗺️ Gestión de actividades
- Añadir actividades a un destino
- Ver actividades por destino
- Eliminar actividades

---


## 🗄️ Base de datos (MySQL)

**Tablas principales:**
- `viaje`: Información general de cada viaje (nombre, fecha inicio y fin).
- `destino`: Lugares visitados en cada viaje (localización, ciudad, país, fechas, imágenes, mapas, id del viaje).
- `punto_interes`: Actividades o lugares destacados dentro de cada destino (nombre, descripción, imagen, mapa, id del destino).
- `alojamiento`: Alojamientos reservados en cada destino (nombre, tipo, dirección, precio, fechas, contacto, imagen, mapa, id del destino).
- `nota`: Notas diarias asociadas a un viaje (nombre, fecha, día, plan, comentarios, id del viaje).

**Relaciones:**
- Un `viaje` puede tener varios `destino` y varias `nota`.
- Un `destino` pertenece a un `viaje` y puede tener varios `punto_interes` y varios `alojamiento`.
- Un `punto_interes` pertenece a un `destino`.
- Un `alojamiento` pertenece a un `destino`.
- Una `nota` pertenece a un `viaje`.

**Diagrama relacional simplificado:**

viaje
    ├── destino
    │      ├── punto_interes
    │      └── alojamiento
    └── nota

Las claves foráneas están configuradas con ON UPDATE/DELETE CASCADE para mantener la integridad referencial.

---

## ⚙️ Backend (Node.js)

El backend se encarga de:
- Conectar con la base de datos MySQL
- Gestionar las peticiones HTTP
- Realizar operaciones CRUD

### 🔌 Endpoints principales

**Viajes**
- `GET /viajes`
- `POST /viajes`
- `PUT /viajes/:id`
- `DELETE /viajes/:id`

**Destinos**
- `GET /destinos/:viaje_id`
- `POST /destinos`
- `DELETE /destinos/:id`

**Actividades**
- `GET /actividades/:destino_id`
- `POST /actividades`
- `DELETE /actividades/:id`

---

## 💻 Frontend

### 📄 Páginas del proyecto
- `index.html` → Página principal (listado de viajes)
- `pagina2.html` → Detalle de viaje (destinos y actividades)
- `sobre-nosotros.html` → Información del equipo

### 🧩 Tecnologías utilizadas

---

## 🔄 Uso de JavaScript

El proyecto cumple con los requisitos:
- Uso de `DOMContentLoaded`
- Uso de eventos `click`
- Uso de `fetch()` para peticiones HTTP
- Uso de `.then()` para promesas
- Uso de `.catch()` para errores
- Funciones propias estructuradas
- Control de errores

---

## 🎨 Diseño y UX

**Estructura común en todas las páginas:**
- Header
- Main
- Footer

**Elementos visuales:**
- Tarjetas (cards)
- Botones interactivos
- Animaciones CSS (hover, transiciones)

---

## 📁 Estructura del proyecto

```
proyecto-web/
├── backend/
│   └── server.js
├── data/
│   └── ejemplo_usuarios.sql
├── package.json
├── pnpm-lock.yaml
├── .gitignore
├── README.md
├── REPARTO.md
└── src/
    ├── assets/
    │   ├── fonts/
    │   └── images/
    │       └── favicon.svg
    ├── css/
    │   └── styles.css
    ├── js/
    │   └── javascript.js
    ├── index.html
    └── pages/
        ├── pagina2.html
        └── sobre-nosotros.html
```

---

## ⚠️ Requisitos obligatorios cumplidos

- ✔ Uso de favicon
- ✔ Uso de título en la web
- ✔ Menú de navegación funcional
- ✔ Mínimo 2 páginas + “Sobre nosotros”
- ✔ CRUD completo con MySQL
- ✔ Backend en Node.js
- ✔ Uso exclusivo de fetch()
- ✔ Uso de `.then()` (sin async/await)
- ✔ Animaciones CSS
- ✔ Control de errores
- ✔ Imágenes con atributo `alt`


---

## 🌟 Mejoras opcionales implementadas

*(Rellenar cuando las hagas)*
- Uso de API externa (ej: clima)
- Inclusión de mapa
- Formulario avanzado
- Multimedia (audio/vídeo)

---

## 🚀 Cómo ejecutar el proyecto

1. Instalar dependencias:
    ```sh
    pnpm install
    ```
2. Configurar la base de datos MySQL
3. Ejecutar el servidor:
    ```sh
    node backend/server.js
    ```
4. Abrir el archivo `index.html` en el navegador

---

## 👥 Autores
- Nombre Apellido
- Nombre Apellido

*Ciclo: Desarrollo de Aplicaciones Multiplataforma (DAM)*

---

## 📝 Notas adicionales
- El proyecto sigue la estructura indicada en clase
- El código JavaScript está documentado
- Se han aplicado buenas prácticas de organización
