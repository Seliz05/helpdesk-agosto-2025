# Manual Técnico - Sistema Help Desk

## 📋 Índice
1. [Descripción General](#1-descripción-general)
2. [Arquitectura del Sistema](#2-arquitectura-del-sistema)
3. [Base de Datos](#3-base-de-datos)
4. [Instalación y Configuración](#4-instalación-y-configuración)
5. [Endpoints y Rutas](#5-endpoints-y-rutas)
6. [Estructura del Proyecto](#6-estructura-del-proyecto)
7. [Backend - Python/Flask](#7-backend---pythonflask)
8. [Frontend - HTML/CSS/JS](#8-frontend---htmlcssjs)
9. [Roles y Permisos](#9-roles-y-permisos)
10. [Seguridad](#10-seguridad)
11. [Mantenimiento](#11-mantenimiento)
12. [Solución de Problemas](#12-solución-de-problemas)
13. [Repositorio del Proyecto](#13-repositorio-del-proyecto)

---

## 1. Descripción General

Sistema web de gestión de tickets de soporte técnico (Help Desk) desarrollado con:
- **Backend**: Flask (Python 3.8+)
- **Base de Datos**: MySQL 5.7+
- **Frontend**: Bootstrap 5, jQuery, Jinja2

### Funcionalidades Principales
- ✅ Autenticación de usuarios con hash de contraseñas
- ✅ Creación y gestión de tickets de soporte
- ✅ Sistema de comentarios en tickets
- ✅ Asignación de tickets a agentes
- ✅ Dashboard con estadísticas en tiempo real
- ✅ Gestión de usuarios (solo ADMIN)
- ✅ Tres niveles de roles: USER, AGENT, ADMIN

---

## 2. Arquitectura del Sistema

### 2.1 Arquitectura General

```
┌──────────────────────────────────────────────────────────┐
│                      CLIENTE (Browser)                    │
│  ┌────────────┐  ┌────────────┐  ┌────────────┐         │
│  │   HTML5    │  │    CSS3    │  │ JavaScript │         │
│  │  Jinja2    │  │ Bootstrap5 │  │   jQuery   │         │
│  └────────────┘  └────────────┘  └────────────┘         │
└───────────────────────┬──────────────────────────────────┘
                        │ HTTP/HTTPS
                        ▼
┌──────────────────────────────────────────────────────────┐
│                  SERVIDOR WEB (Flask)                     │
│  ┌────────────────────────────────────────────────────┐  │
│  │           Aplicación Flask (app.py)                │  │
│  │  ┌──────────┐  ┌──────────┐  ┌──────────┐        │  │
│  │  │  Routes  │  │  Auth    │  │ Sessions │        │  │
│  │  └──────────┘  └──────────┘  └──────────┘        │  │
│  └────────────────────────────────────────────────────┘  │
│  Puerto: 5000                                             │
└───────────────────────┬──────────────────────────────────┘
                        │ PyMySQL
                        ▼
┌──────────────────────────────────────────────────────────┐
│              BASE DE DATOS (MySQL)                        │
│  ┌────────────────────────────────────────────────────┐  │
│  │  Tablas:                                           │  │
│  │  • users (usuarios del sistema)                    │  │
│  │  • tickets (tickets de soporte)                    │  │
│  │  • ticket_comments (comentarios)                   │  │
│  └────────────────────────────────────────────────────┘  │
│  Puerto: 3306                                             │
└──────────────────────────────────────────────────────────┘
```

### 2.2 Front-End

**Tecnologías:**
- **HTML5**: Estructura semántica
- **CSS3**: Estilos personalizados (`custom.css`)
- **Bootstrap 5.3.3**: Framework CSS responsivo
- **JavaScript/jQuery 3.7.1**: Interactividad
- **Jinja2**: Motor de plantillas (lado servidor)

**Componentes:**
- Templates HTML modulares
- Sistema de herencia de plantillas
- Mensajes flash para notificaciones
- Formularios con validación HTML5

### 2.3 Back-End

**Tecnologías:**
- **Python 3.8+**: Lenguaje de programación
- **Flask 2.3.3**: Framework web micro
- **Werkzeug 2.3.7**: Utilidades WSGI (hash passwords)
- **python-dotenv 1.0.0**: Variables de entorno

**Componentes:**
- Enrutamiento RESTful
- Autenticación basada en sesiones
- Decoradores de seguridad
- Gestión de permisos por roles

### 2.4 Base de Datos

**Tecnología:**
- **MySQL 5.7+**: Sistema de gestión de base de datos
- **PyMySQL 1.0.3**: Conector Python-MySQL

**Características:**
- 3 tablas relacionales
- Relaciones con Foreign Keys
- Charset UTF-8 (utf8mb4)
- Timestamps automáticos

**Mejoras aplicadas**
-- Estadísticas por estado:
SELECT status, COUNT(*) as count 
FROM tickets 
GROUP BY status;

---

## 3. Base de Datos

### 3.1 Diagrama Entidad-Relación (ER)

**Archivo**: `er_diagram.png` (ubicado en la raíz del proyecto)

```
┌─────────────────────────────────────┐
│              USERS                  │
├─────────────────────────────────────┤
│ PK │ id              INT            │
│    │ name            VARCHAR(100)   │
│ UK │ email           VARCHAR(150)   │
│    │ password_hash   VARCHAR(255)   │
│    │ role            ENUM(...)      │
│    │ created_at      DATETIME       │
└────┬────────────────────────────────┘
     │ 1
     │
     │ creates    ┌─────────────────────────────────────┐
     ├───────────►│           TICKETS                   │
     │ *          ├─────────────────────────────────────┤
     │            │ PK │ id              INT            │
     │            │    │ title           VARCHAR(200)   │
     │            │    │ description     TEXT           │
     │            │    │ status          ENUM(...)      │
     │            │    │ priority        ENUM(...)      │
     │            │    │ created_at      DATETIME       │
     │            │    │ updated_at      DATETIME       │
     │            │ FK │ created_by      INT            │
     │            │ FK │ assigned_to     INT            │
     │            └────┬────────────────────────────────┘
     │                 │ 1
     │ is_assigned     │
     └─────────────────┘
     │ *
     │
     │ comments   ┌─────────────────────────────────────┐
     │            │       TICKET_COMMENTS               │
     │            ├─────────────────────────────────────┤
     │            │ PK │ id              INT            │
     │            │ FK │ ticket_id       INT            │
     │            │ FK │ user_id         INT            │
     │            │    │ comment         TEXT           │
     │            │    │ created_at      DATETIME       │
     │            └─────────────────────────────────────┘
     └────────────┘ *
```

**Relaciones:**
- Un **USER** puede crear muchos **TICKETS** (1:N)
- Un **USER** (AGENT) puede tener asignados muchos **TICKETS** (1:N)
- Un **TICKET** puede tener muchos **COMMENTS** (1:N)
- Un **USER** puede escribir muchos **COMMENTS** (1:N)

### 3.2 Descripción de Tablas

#### Tabla: `users`
Almacena la información de todos los usuarios del sistema.

| Campo          | Tipo               | Restricciones      | Descripción                    |
|----------------|--------------------|--------------------|--------------------------------|
| id             | INT                | PK, AUTO_INCREMENT | Identificador único            |
| name           | VARCHAR(100)       | NOT NULL           | Nombre completo del usuario    |
| email          | VARCHAR(150)       | UNIQUE, NOT NULL   | Correo electrónico (login)     |
| password_hash  | VARCHAR(255)       | NOT NULL           | Hash de contraseña (bcrypt)    |
| role           | ENUM               | NOT NULL           | ADMIN, AGENT o USER            |
| created_at     | DATETIME           | DEFAULT NOW()      | Fecha de registro              |

#### Tabla: `tickets`
Almacena todos los tickets de soporte creados.

| Campo          | Tipo               | Restricciones      | Descripción                    |
|----------------|--------------------|--------------------|--------------------------------|
| id             | INT                | PK, AUTO_INCREMENT | Identificador único            |
| title          | VARCHAR(200)       | NOT NULL           | Título del ticket              |
| description    | TEXT               | NOT NULL           | Descripción detallada          |
| status         | ENUM               | NOT NULL           | OPEN, IN_PROGRESS, RESOLVED    |
| priority       | ENUM               | NOT NULL           | LOW, MEDIUM, HIGH              |
| created_at     | DATETIME           | DEFAULT NOW()      | Fecha de creación              |
| updated_at     | DATETIME           | ON UPDATE NOW()    | Última modificación            |
| created_by     | INT                | FK → users(id)     | Usuario creador                |
| assigned_to    | INT                | FK → users(id)     | Agente asignado (nullable)     |

#### Tabla: `ticket_comments`
Almacena los comentarios de los tickets.

| Campo          | Tipo               | Restricciones      | Descripción                    |
|----------------|--------------------|--------------------|--------------------------------|
| id             | INT                | PK, AUTO_INCREMENT | Identificador único            |
| ticket_id      | INT                | FK → tickets(id)   | Ticket relacionado             |
| user_id        | INT                | FK → users(id)     | Usuario que comenta            |
| comment        | TEXT               | NOT NULL           | Contenido del comentario       |
| created_at     | DATETIME           | DEFAULT NOW()      | Fecha del comentario           |

### 3.3 Consultas SQL Importantes

**Obtener tickets con información de usuarios:**
```sql
SELECT t.*, 
       u.name AS created_by_name, 
       a.name AS assigned_to_name
FROM tickets t
JOIN users u ON t.created_by = u.id
LEFT JOIN users a ON t.assigned_to = a.id
ORDER BY t.created_at DESC;
```

**Estadísticas por estado:**
```sql
SELECT status, COUNT(*) as count 
FROM tickets 
GROUP BY status;
```

**Comentarios de un ticket:**
```sql
SELECT c.*, u.name AS user_name
FROM ticket_comments c
JOIN users u ON c.user_id = u.id
WHERE c.ticket_id = ?
ORDER BY c.created_at ASC;
```

---

## 4. Instalación y Configuración

### 4.1 Requisitos Previos

- Python 3.8 o superior
- MySQL 5.7 o superior
- pip (gestor de paquetes)
- Git (opcional)

### 4.2 Paso 1: Crear Base de Datos

**Opción A - Desde consola MySQL:**
```bash
# Conectar a MySQL como root
mysql -u root -p
```

**Opción B - Usar el script incluido:**
```bash
# Ejecutar script completo
mysql -u root -p < db_init.sql
```

**Contenido del script `db_init.sql`:**
```sql
-- Crear base de datos con charset UTF-8
CREATE DATABASE helpdesk_db 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

USE helpdesk_db;

-- Crear tablas (ver estructura completa en el archivo)
CREATE TABLE users (...);
CREATE TABLE tickets (...);
CREATE TABLE ticket_comments (...);

-- Insertar usuarios de prueba
INSERT INTO users (name, email, password_hash, role)
VALUES 
  ('Admin', 'admin@example.com', 'HASH_AQUI', 'ADMIN'),
  ('Agent', 'agent@example.com', 'HASH_AQUI', 'AGENT'),
  ('User', 'user@example.com', 'HASH_AQUI', 'USER');

-- Crear usuario de base de datos
CREATE USER 'helpdesk_user'@'localhost' 
IDENTIFIED BY 'helpdesk_password';

-- Otorgar privilegios
GRANT ALL PRIVILEGES ON helpdesk_db.* 
TO 'helpdesk_user'@'localhost';

FLUSH PRIVILEGES;
```

### 4.3 Paso 2: Configurar Archivo .env

Crear archivo `.env` en la raíz del proyecto:

```env
# Configuración de Flask
SECRET_KEY=Sasfloku3

# Configuración de Base de Datos
DB_HOST=127.0.0.1
DB_PORT=3306
DB_USER=helpdesk_user
DB_PASSWORD=helpdesk_password
DB_NAME=helpdesk_db
```

**⚠️ IMPORTANTE:** 
- Este archivo NO debe subirse a GitHub
- Agregar `.env` al archivo `.gitignore`
- En producción, usar valores seguros

### 4.4 Paso 3: Crear Entorno Virtual (Recomendado)

```bash
# Crear entorno virtual
python -m venv venv

# Activar entorno virtual

# En Windows:
venv\Scripts\activate

# En Linux/Mac:
source venv/bin/activate
```

### 4.5 Paso 4: Instalar Dependencias

```bash
pip install -r requirements.txt
```

**Contenido de `requirements.txt`:**
```
Flask==2.3.3
pymysql==1.0.3
python-dotenv==1.0.0
Werkzeug==2.3.7
```

### 4.6 Paso 5: Ejecutar Aplicación

```bash
python app.py
```

**Salida esperada:**
```
 * Running on http://127.0.0.1:5000
 * Debug mode: on
```

### 4.7 Paso 6: Acceder al Sistema

Abrir navegador en: **http://localhost:5000** o **http://127.0.0.1:5000**

**Credenciales de prueba:**

| Rol   | Email                | Password    |
|-------|----------------------|-------------|
| ADMIN | admin@example.com    | adminpass   |
| AGENT | agent@example.com    | agentpass   |
| USER  | user@example.com     | userpass    |

### 4.8 Verificar Instalación

**Checklist:**
- [ ] MySQL corriendo (`mysql --version`)
- [ ] Base de datos creada (`SHOW DATABASES;`)
- [ ] Tablas creadas (`SHOW TABLES;`)
- [ ] Usuarios insertados (`SELECT * FROM users;`)
- [ ] Entorno virtual activado
- [ ] Dependencias instaladas (`pip list`)
- [ ] Archivo `.env` configurado
- [ ] Aplicación ejecutándose sin errores
- [ ] Login funciona correctamente

---

## 5. Endpoints y Rutas

### 5.1 Tabla de Endpoints Principales

| Método | Ruta                        | Descripción                      | Autenticación | Roles Permitidos |
|--------|-----------------------------|----------------------------------|---------------|------------------|
| GET    | `/`                         | Redirección inicial              | No            | Todos            |
| GET    | `/login`                    | Formulario de login              | No            | Todos            |
| POST   | `/login`                    | Procesar login                   | No            | Todos            |
| GET    | `/logout`                   | Cerrar sesión                    | Sí            | Todos            |
| GET    | `/dashboard`                | Dashboard con estadísticas       | Sí            | Todos            |
| GET    | `/tickets`                  | Listar tickets                   | Sí            | Todos            |
| GET    | `/tickets/new`              | Formulario crear ticket          | Sí            | Todos            |
| POST   | `/tickets/new`              | Crear nuevo ticket               | Sí            | Todos            |
| GET    | `/tickets/<id>`             | Ver detalle de ticket            | Sí            | Todos*           |
| POST   | `/tickets/<id>/update`      | Actualizar ticket                | Sí            | ADMIN, AGENT     |
| POST   | `/tickets/<id>/comments`    | Agregar comentario               | Sí            | Todos            |
| GET    | `/users`                    | Listar usuarios                  | Sí            | ADMIN            |
| POST   | `/users/<id>/role`          | Cambiar rol de usuario           | Sí            | ADMIN            |

**Nota (*):** Los USER solo ven sus propios tickets, AGENT ve tickets asignados o sin asignar, ADMIN ve todos.

### 5.2 Detalles de Endpoints Importantes

#### POST `/login`
**Descripción:** Autentica usuario y crea sesión.

**Parámetros (Form Data):**
```
email: string (required)
password: string (required)
```

**Respuesta exitosa:**
```
Redirect: /dashboard
Flash message: "Bienvenido, {nombre}!"
Session: user_id, user_name, user_role
```

**Respuesta error:**
```
Redirect: /login
Flash message: "Correo o contraseña incorrectos."
```

#### GET `/dashboard`
**Descripción:** Muestra dashboard con estadísticas de tickets.

**Mejoras aplicadas**
{
    'total_tickets': int,
    'my_tickets': int,
    'status_stats': [
        {'status': 'OPEN', 'count': int},
        {'status': 'IN_PROGRESS', 'count': int},
        {'status': 'RESOLVED', 'count': int}
    ],
    'priority_stats': [
        {'priority': 'LOW', 'count': int},
        {'priority': 'MEDIUM', 'count': int},
        {'priority': 'HIGH', 'count': int}
    ]
}

**Requiere:** Login

**Datos retornados:**
```python
{
    'total_tickets': int,
    'my_tickets': int,
    'status_stats': [
        {'status': 'OPEN', 'count': int},
        {'status': 'IN_PROGRESS', 'count': int},
        {'status': 'RESOLVED', 'count': int}
    ],
    'priority_stats': [
        {'priority': 'LOW', 'count': int},
        {'priority': 'MEDIUM', 'count': int},
        {'priority': 'HIGH', 'count': int}
    ]
}
```

#### POST `/tickets/new`
**Descripción:** Crea un nuevo ticket de soporte.

**Parámetros (Form Data):**
```
title: string (required, max 200 chars)
description: text (required)
priority: enum (LOW, MEDIUM, HIGH)
```

**Respuesta exitosa:**
```
Redirect: /tickets
Flash message: "Ticket creado exitosamente."
```

#### POST `/tickets/<id>/update`
**Descripción:** Actualiza estado y asignación de ticket.

**Requiere:** Rol ADMIN o AGENT

**Parámetros (Form Data):**
```
status: enum (OPEN, IN_PROGRESS, RESOLVED)
assigned_to: int (user_id or empty)
```

**Respuesta exitosa:**
```
Redirect: /tickets/<id>
Flash message: "Ticket actualizado."
```

---

## 6. Estructura del Proyecto

```
helpdesk-agosto-2025/
│
├── doc/ 
│   ├── screenshots/            # Capturas
│   │   ├── login.png           # Página de login
│   │   ├── dashboard.png       # Dashboard principal
│   │   ├── dashboard02.png     # Dashboard principal de ADMIN
│   │   ├── tickets_list.png    # Lista de tickets
│   │   ├── ticket_detail.png   # Detalle de ticket
│   │   └── users_list.png      # Gestión de usuarios
│   │
│   ├── er_diagram.png          # Diagrama Entidad-Relación   
│   ├── manual_tecnico.md       # Manual técnico
│   └── manual_usuario.md       # Manual de usuario
│   
│
├── static/                     # Archivos estáticos
│   ├── css/
│   │   └── custom.css         # Estilos personalizados
│   └── js/
│       └── main.js            # JavaScript personalizado
│  
├── templates/                 # Plantillas HTML (Jinja2)
│   ├── base.html              # Plantilla base con navbar
│   ├── dashboard.html         # Dashboard principal
│   ├── login.html             # Página de login
│   ├── ticket_detail.html     # Detalle de ticket
│   ├── ticket_new.html        # Formulario nuevo ticket
│   ├── tickets_list.html      # Lista de tickets
│   └── users_list.html        # Gestión de usuarios
│
├── .env                        # Variables de entorno (NO SUBIR)
├── .gitignore                  # Archivos a ignorar en Git
├── app.py                      # Aplicación principal Flask
├── config.py                   # Configuración de la app
├── db_init.sql                 # Script de inicialización BD
├── generate_hash.py            # Utilidad para generar hashes
├── requirements.txt            # Dependencias Python
└── README.md                   # Documentación básica
```

### Descripción de Archivos Principales

**app.py** (522 líneas)
- Punto de entrada de la aplicación
- Define todas las rutas y lógica de negocio
- Gestiona autenticación y permisos
- Interactúa con la base de datos

**config.py** (12 líneas)
- Carga variables de entorno desde `.env`
- Centraliza configuración de la app
- Facilita cambios entre desarrollo/producción

**templates/base.html** (48 líneas)
- Plantilla maestra para todas las páginas
- Incluye navbar, mensajes flash, scripts
- Sistema de herencia de Jinja2

**static/css/custom.css** (29 líneas)
- Estilos personalizados del sistema
- Complementa Bootstrap 5
- Colores de badges, sombras, hover effects

---

## 7. Backend - Python/Flask

### 7.1 Configuración (config.py)

```python
import os
from dotenv import load_dotenv

load_dotenv()  # Carga variables desde .env

class Config:
    SECRET_KEY = os.getenv("SECRET_KEY", "default_key")
    DB_HOST = os.getenv("DB_HOST", "127.0.0.1")
    DB_PORT = int(os.getenv("DB_PORT", 3306))
    DB_USER = os.getenv("DB_USER", "root")
    DB_PASSWORD = os.getenv("DB_PASSWORD", "")
    DB_NAME = os.getenv("DB_NAME", "helpdesk_db")
```

### 7.2 Conexión a Base de Datos

```python
def get_db_connection():
    """Crea y retorna conexión a MySQL"""
    return pymysql.connect(
        host=app.config["DB_HOST"],
        port=app.config["DB_PORT"],
        user=app.config["DB_USER"],
        password=app.config["DB_PASSWORD"],
        database=app.config["DB_NAME"],
        cursorclass=pymysql.cursors.DictCursor  # Retorna diccionarios
    )
```

### 7.3 Decoradores de Seguridad

**@login_required**: Verifica que usuario esté autenticado
```python
def login_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if "user_id" not in session:
            flash("Debes iniciar sesión...", "warning")
            return redirect(url_for("login"))
        return f(*args, **kwargs)
    return decorated_function

# Uso:
@app.route("/tickets")
@login_required  # ← Protege esta ruta
def tickets_list():
    pass
```

**@role_required**: Verifica rol específico
```python
def role_required(*roles):
    def decorator(f):
        @wraps(f)
        def decorated_function(*args, **kwargs):
            if session["user_role"] not in roles:
                flash("No tienes permiso...", "danger")
                return redirect(url_for("dashboard"))
            return f(*args, **kwargs)
        return decorated_function
    return decorator

# Uso:
@app.route("/users")
@login_required
@role_required("ADMIN")  # ← Solo ADMIN puede acceder
def users_list():
    pass
```

### 7.4 Flujo de Autenticación

**Login:**
```python
@app.route("/login", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        email = request.form.get("email")
        password = request.form.get("password")
        
        # Buscar usuario en BD
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM users WHERE email = %s", (email,))
        user = cursor.fetchone()
        conn.close()
        
        # Verificar contraseña hasheada
        if user and check_password_hash(user["password_hash"], password):
            # Crear sesión
            session["user_id"] = user["id"]
            session["user_name"] = user["name"]
            session["user_role"] = user["role"]
            
            flash(f"Bienvenido, {user['name']}!", "success")
            return redirect(url_for("dashboard"))
        else:
            flash("Correo o contraseña incorrectos.", "danger")
    
    return render_template("login.html")
```

---

## 8. Frontend - HTML/CSS/JS

### 8.1 Sistema de Templates Jinja2

**Herencia de plantillas:**
```jinja2
{# base.html - Plantilla maestra #}
<!DOCTYPE html>
<html>
<head>...</head>
<body>
    <nav>...</nav>
    {% block content %}{% endblock %}  {# Contenido dinámico #}
    <script>...</script>
</body>
</html>

{# dashboard.html - Extiende base #}
{% extends "base.html" %}
{% block content %}
    <h1>Dashboard</h1>
    {# Contenido específico del dashboard #}
{% endblock %}
```

**Variables de sesión en templates:**
```jinja2
{{ session.user_name }}      {# Nombre del usuario #}
{{ session.user_role }}      {# Rol del usuario #}
{{ session.get("user_id") }} {# ID (método seguro) #}
```

**Condicionales:**
```jinja2
{% if session.get("user_role") == "ADMIN" %}
    <a href="{{ url_for('users_list') }}">Gestionar Usuarios</a>
{% endif %}
```

**Bucles:**
```jinja2
{% for ticket in tickets %}
    <tr>
        <td>{{ ticket.id }}</td>
        <td>{{ ticket.title }}</td>
    </tr>
{% else %}
    <tr><td colspan="2">No hay tickets</td></tr>
{% endfor %}
```

### 8.2 Bootstrap 5 - Componentes Usados

- **Navbar**: Navegación principal
- **Cards**: Contenedores de información
- **Tables**: Lista de tickets y usuarios
- **Forms**: Todos los formularios
- **Badges**: Estados y prioridades
- **Alerts**: Mensajes flash
- **Buttons**: Acciones

---

## 9. Roles y Permisos

### 9.1 Matriz de Permisos

| Funcionalidad              | USER | AGENT | ADMIN |
|----------------------------|------|-------|-------|
| Ver dashboard              | ✅   | ✅    | ✅    |
| Crear ticket               | ✅   | ✅    | ✅    |
| Ver propios tickets        | ✅   | ❌    | ❌    |
| Ver tickets asignados      | ❌   | ✅    | ❌    |
| Ver todos los tickets      | ❌   | ❌    | ✅    |
| Comentar en propios tickets| ✅   | ❌    | ❌    |
| Comentar en cualquier ticket| ❌  | ✅    | ✅    |
| Cambiar estado de ticket   | ❌   | ✅    | ✅    |
| Asignar ticket a agente    | ❌   | ❌    | ✅    |
| Ver lista de usuarios      | ❌   | ❌    | ✅    |
| Cambiar rol de usuario     | ❌   | ❌    | ✅    |

---

## 10. Seguridad

### 10.1 Medidas Implementadas

✅ **Hash de contraseñas** (Werkzeug)
✅ **Sesiones firmadas** (Flask sessions)
✅ **Consultas parametrizadas** (previene SQL injection)
✅ **Control de acceso por roles**
✅ **Validación de entrada**
✅ **Escape automático en templates** (XSS prevention)

### 10.2 Recomendaciones para Producción

⚠️ Cambiar `SECRET_KEY` a valor aleatorio seguro
⚠️ Usar HTTPS
⚠️ Implementar CSRF tokens
⚠️ Rate limiting en login
⚠️ Logs de auditoría
⚠️ Backups automáticos

---

## 11. Mantenimiento

### 11.1 Backup de Base de Datos

```bash
# Exportar
mysqldump -u helpdesk_user -p helpdesk_db > backup_$(date +%Y%m%d).sql

# Importar
mysql -u helpdesk_user -p helpdesk_db < backup_20241213.sql
```

### 11.2 Actualizar Dependencias

```bash
pip list --outdated
pip install --upgrade Flask
```

---

## 12. Solución de Problemas

### Error: No conecta a MySQL
```bash
# Verificar que MySQL esté corriendo
systemctl status mysql  # Linux
net start MySQL80       # Windows
```

### Error: Module not found
```bash
# Verificar entorno virtual activado
which python  # Debe mostrar ruta del venv
pip install -r requirements.txt
```

### Error: Caracteres extraños (ÃÃ)
```sql
-- Cambiar charset de BD
ALTER DATABASE helpdesk_db 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;
```

---

## 13. Repositorio del Proyecto

### 13.1 URL del Repositorio en GitHub

```
https://github.com/Seliz05/-helpdesk-agosto-2025
```

**Nota:** Reemplazar `[TU_USUARIO]` con tu nombre de usuario de GitHub.

### 13.2 Comandos Git Básicos

```bash
# Inicializar repositorio
git init

# Agregar archivos
git add .

# Commit inicial
git commit -m "Initial commit: Help Desk System"

# Conectar con GitHub
git remote add origin https://github.com/[TU_USUARIO]/helpdesk-system.git

# Subir código
git push -u origin main
```

### 13.3 Archivo .gitignore (Importante)

Crear archivo `.gitignore` en la raíz:

```
# Entorno virtual
venv/
env/

# Variables de entorno (NUNCA SUBIR)
.env

# Python
__pycache__/
*.pyc
*.pyo
*.pyd

# Base de datos local
*.db
*.sqlite3

# IDEs
.vscode/
.idea/
*.swp

# Logs
*.log

# Sistema operativo
.DS_Store
Thumbs.db
```
## 🔧 Mejora Adicional Implementada: Dashboard Inteligente con Estadísticas

### Objetivo
Proporcionar una visión general rápida del estado del sistema de tickets mediante métricas visuales.

### Características Implementadas
1. **Estadísticas por Estado**
   - Conteo de tickets en cada estado (OPEN, IN_PROGRESS, RESOLVED)
   - Visualización con badges color-coded

2. **Estadísticas por Prioridad**
   - Distribución de tickets por nivel de urgencia
   - Ayuda en la asignación de recursos

3. **Métricas Personalizadas por Rol**
   - ADMIN: Ve tickets asignados + sin asignar
   - AGENT: Ve solo tickets asignados a él
   - USER: Ve solo sus tickets creados

4. **Visualización Clara**
   - Tablas organizadas con Bootstrap
   - Badges con colores semánticos
   - Información contextual según rol

### Implementación Técnica

#### Código en `app.py` (función dashboard()):
```python
# Consultas para estadísticas
cursor.execute("SELECT status, COUNT(*) as count FROM tickets GROUP BY status")
status_stats = cursor.fetchall()

cursor.execute("SELECT COUNT(*) as total FROM tickets")
total_tickets = cursor.fetchone()['total']

cursor.execute("SELECT priority, COUNT(*) as count FROM tickets GROUP BY priority")
priority_stats = cursor.fetchall()

# Estadísticas personalizadas por rol
if session["user_role"] in ["ADMIN", "AGENT"]:
    if session["user_role"] == "ADMIN":
        cursor.execute("""
            SELECT COUNT(*) as my_tickets 
            FROM tickets 
            WHERE assigned_to = %s OR assigned_to IS NULL
        """, (session["user_id"],))
    else:
        cursor.execute("""
            SELECT COUNT(*) as my_tickets 
            FROM tickets 
            WHERE assigned_to = %s
        """, (session["user_id"],))
else:
    cursor.execute("""
        SELECT COUNT(*) as my_tickets 
        FROM tickets 
        WHERE created_by = %s
    """, (session["user_id"],))

Código en dashboard.html:
#<!-- Estadísticas por estado -->
<h6>Tickets by Status</h6>
<table class="table table-sm table-bordered">
    <tbody>
        {% for stat in stats.status_stats %}
        <tr>
            <td>
                <span class="badge 
                    {% if stat.status == 'OPEN' %}bg-warning
                    {% elif stat.status == 'IN_PROGRESS' %}bg-info
                    {% else %}bg-success{% endif %}">
                    {{ stat.status }}
                </span>
            </td>
            <td class="text-center fw-bold">{{ stat.count }}</td>
        </tr>
        {% endfor %}
    </tbody>
</table>

**Beneficios de la Mejora**

1.Visibilidad inmediata del estado del sistema

2.Toma de decisiones basada en datos reales

3.Eficiencia operativa al identificar cuellos de botella

4.Experiencia de usuario mejorada con información relevante

5.Cumple con requisito del proyecto de implementar una mejora adicional

Impacto en el Usuario
-ADMIN: Monitoreo global del sistema

-AGENT: Gestión de carga de trabajo

-USER: Seguimiento de sus solicitudes

Esta mejora representa un valor agregado significativo al sistema básico, transformando una simple lista de tickets en un centro de control operativo.

```

## 📸 **2. EN LAS CAPTURAS DE PANTALLA (`screenshots/`)**

### **Debes tomar 2 capturas ESPECÍFICAS para la mejora:**

#### **Screenshot #2: `dashboard02.png`**
**Esta captura DEBE mostrar claramente:**
- ✅ **"Ticket Statistics"** visible en la pantalla
- ✅ **Tabla "Tickets by Status"** con números
- ✅ **Badges de colores** (amarillo, azul, verde)
- ✅ **"Total"** y **"My Tickets"** con números
- ✅ **Mensaje de bienvenida** con nombre de usuario

**Ejemplo de lo que debe verse:**

┌─────────────────────────────────────────┐
│ Welcome, Admin! │
│ Your role: ADMIN │
├─────────────────────────────────────────┤
│ │
│ Quick Actions: │
│ [View Tickets] [New Ticket] │
│ │
│ Ticket Statistics │
│ │
│ Tickets by Status │
│ ┌─────────────────────────┐ │
│ │ OPEN 🟡 1 │ │
│ │ IN_PROGRESS 🔵 1 │ │
│ │ RESOLVED 🟢 1 │ │
│ │ TOTAL 3 │ │
│ └─────────────────────────┘ │
│ │
│ My Tickets: 1 │
│ │
└─────────────────────────────────────────┘
```

### 13.4 README.md para GitHub

Ejemplo básico de `README.md`:

```markdown
# Help Desk System

Sistema de gestión de tickets de soporte técnico.

## Tecnologías
- Python 3.8+ / Flask
- MySQL
- Bootstrap 5

## Instalación

1. Clonar repositorio
2. Crear base de datos: `mysql < db_init.sql`
3. Configurar `.env`
4. Instalar dependencias: `pip install -r requirements.txt`
5. Ejecutar: `python app.py`

## Credenciales de prueba
- Admin: admin@example.com / adminpass
- Agent: agent@example.com / agentpass
- User: user@example.com / userpass

## Licencia
MIT
```

---

## 📝 Resumen de Checklist de Instalación

```
✅ Paso 1: Crear base de datos
   └─ mysql -u root -p < db_init.sql

✅ Paso 2: Configurar archivo .env
   └─ Copiar valores de conexión DB

✅ Paso 3: Crear entorno virtual
   └─ python -m venv venv
   └─ source venv/bin/activate (Linux/Mac)
   └─ venv\Scripts\activate (Windows)

✅ Paso 4: Instalar dependencias
   └─ pip install -r requirements.txt

✅ Paso 5: Ejecutar aplicación
   └─ python app.py

✅ Paso 6: Acceder a http://localhost:5000 o http://127.0.0.1:5000 
```

---

## 📞 Información del Proyecto

**Versión:** 1.0  
**Última actualización:** Diciembre 2025  
**Repositorio:** https://github.com/Seliz05/-helpdesk-agosto-2025 
**Documentación completa:** Ver `manual_tecnico.md`  
**Diagrama ER:** Ver `er_diagram.png`

---

**¡Fin del Manual Técnico!**