# 🎵 Sistema de Gestión e Interacción Musical

Este proyecto consiste en el desarrollo de una **Base de Datos para la gestión, interacción de contenido musical**.

## 📚 Contexto Académico

Este sistema fue desarrollado en el marco de la **materia Base de Datos 2 (Año 2025)** de la **Tecnicatura Universitaria en Programación - UTN FRGP**.

### 👥 Integrantes del equipo

- Dieser, Germán  
- Fredes, Jacob Samuel  
- Frías, Tamara Ruth  
- Hiebl, Darian

---

## 🧩 Descripción del Sistema

La aplicación permite a los usuarios:

- Registrarse e iniciar sesión
- Buscar y reproducir música
- Crear y administrar playlists
- Comentar en canciones y seguir artistas u otros usuarios

Por su parte, los artistas y representantes de discográficas pueden:

- Subir canciones, álbumes y gestionar su contenido
- Actualizar sus perfiles artísticos

La base de datos respalda la lógica del sistema, gestionando entidades como:

- Usuarios
- Canciones
- Intérpretes / Artistas
- Álbumes
- Géneros musicales
- Discográficas
- Tipos de contenido

---

## ⚙️ Componentes Técnicos

### 🔄 Triggers

- trg_finMembresia
- trg_registrarReproduccion
- trg_limitarPuntuacion

### ⚙️ Procedimientos almacenados

- sp_eliminarPlaylist
- sp_agregarCancionAPlaylist

### 👁️‍🗨️ Vistas

- vista_topNCanciones
- vista_usuariosActivos
- vista_comentariosRecientes

### 🛠️ Función

- fn_duracionTotalPlaylist

---

## 📝 Recomendaciones para el funcionamiento de la Base de Datos SQL y la aplicación en ASP.NET

- La aplicación está diseñada desde la clase de acceso a datos para conectarse a: BD2_TPI_G04, la misma debe ser creada, insertar su datos y crear las diferentes funcionalidades para el correcto funcionamiento de al app ASP.
- Cuenta con el usuario administrador: admin123 pass: 1234, el cual contará con totas las facultades de la aplicación. Además de varios usuarios con cuentas activas o no (por las dudas revisar fechas de vto).


## Grupo 04.
