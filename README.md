# 🎫 Sistema Help Desk

Sistema web de gestión de tickets de soporte técnico con autenticación por roles, dashboard con estadísticas y gestión completa de tickets.

## 🛠️ Tecnologías Usadas

- **Backend:** Flask (Python)
- **Base de Datos:** MySQL
- **Frontend:** Bootstrap 5, jQuery
- **Autenticación:** Werkzeug Security
- **Templates:** Jinja2

## 🚀 Instalación Rápida

### Paso 1: Configurar Base de Datos
```bash
mysql -u root -p < db_init.sql
```

### Paso 2: Crear Entorno Virtual
python -m venv venv
# Windows:
venv\Scripts\activate
# Linux/Mac:
source venv/bin/activate

### Paso 3: Instalar Dependencias
pip install -r requirements.txt

### Paso 4: Configurar Variables (IMPORTANTE)
cp .env.example .env
Editar el archivo .env con tus configuraciones:

### Paso 5: Ejecutar la Aplicación
python app.py

### Paso 6: Acceder al Sistema
Abrir navegador: http://localhost:5000 o http://127.0.0.1:5000

🔧 Variables que Deben Configurarse

Archivo: .env

# 🔐 CLAVE SECRETA PARA FLASK (OBLIGATORIO)
# Generar con: python -c "import secrets; print(secrets.token_hex(32))"
SECRET_KEY=tu_clave_secreta_aqui

# 🗄️ CONFIGURACIÓN DE BASE DE DATOS MYSQL
DB_HOST=localhost
DB_PORT=3306
DB_USER=helpdesk_user
DB_PASSWORD=helpdesk_password
DB_NAME=helpdesk_db

# ¿Dónde conseguir cada valor?

-Variable - (SECRET_KEY) ¿Dónde se obtiene? - (Generar única para cada instalación) Valor por defecto - (-)
-Variable - (DB_HOST) ¿Dónde se obtiene? - (Localhost o IP del servidor MySQL) Valor por defecto - (localhost o 127.0.0.1:5000)
-Variable - (DB_PORT) ¿Dónde se obtiene? - (Puerto de MySQL (normalmente 3306)) Valor por defecto - (3306)
-Variable - (DB_USER) ¿Dónde se obtiene? - (Usuario creado en db_init.sql) Valor por defecto - (helpdesk_user)
-Variable - (DB_PASSWORD) ¿Dónde se obtiene? - (Contraseña del usuario MySQL) Valor por defecto - (helpdesk_password)
-Variable - (DB_NAME) ¿Dónde se obtiene? - (Nombre de la base de datos) Valor por defecto - (helpdesk_db)

Generar SECRET_KEY segura:
python -c "import secrets; print(secrets.token_hex(32))"

⚠️ IMPORTANTE:

-El archivo .env NO debe subirse a GitHub

-Agregar .env al archivo .gitignore

-En producción, usar valores seguros y únicos

👥 Credenciales de Prueba

-Rol - (ADMIN) Email - (admin@example.com) Contraseña - (adminpass)
-Rol - (AGENT) Email - (agent@example.com) Contraseña - (agentpass)
-Rol - (USER) Email - (user@example.com) Contraseña - (userpass)

📸 Capturas Clave
Ver carpeta docs/screenshots/ para capturas completas:

Login: docs/screenshots/login.png

Dashboard: docs/screenshots/dashboard.png
Dashboard ADMIN: docs/screenshots/dashboard02.png

Lista de Tickets: docs/screenshots/tickets_list.png

Detalle de Ticket: docs/screenshots/ticket_detail.png

Administración: docs/screenshots/users_list.png

📁 Estructura del Proyecto
helpdesk-agosto-2025/
│
├── app.py                      # Aplicación principal Flask
├── config.py                   # Configuración de la app
├── requirements.txt            # Dependencias Python
├── generate_hash.py            # Utilidad para generar hashes
├── db_init.sql                 # Script de inicialización BD
├── .env                        # Variables de entorno (NO SUBIR)
├── .gitignore                  # Archivos a ignorar en Git
├── README.md                   # Documentación básica
├── manual_tecnico.md
├── doc/ 
│   ├── er_diagram.png          # Diagrama Entidad-Relación
│   ├── manual_usuario.md       # Manual de usuario
│   ├── manual_tecnico.md       # Manual técnico
│   └── screenshots/            # Capturas
│       ├── login.png           # Página de login
│       ├── dashboard.png       # Dashboard principal
│       ├── dashboard02.png     # Dashboard principal de ADMIN
│       ├── tickets_list.png    # Lista de tickets
│       ├── ticket_detail.png   # Detalle de ticket
│       └── users_list.png      # Gestión de usuarios           
│
├── templates/                 # Plantillas HTML (Jinja2)
│   ├── base.html              # Plantilla base con navbar
│   ├── login.html             # Página de login
│   ├── dashboard.html         # Dashboard principal
│   ├── tickets_list.html      # Lista de tickets
│   ├── ticket_detail.html     # Detalle de ticket
│   ├── ticket_new.html        # Formulario nuevo ticket
│   └── users_list.html        # Gestión de usuarios
│
└── static/                     # Archivos estáticos
    ├── css/
    │   └── custom.css         # Estilos personalizados
    └── js/
        └── main.js            # JavaScript personalizado

❓ Problemas Comunes

No se conecta a MySQL:
-Verificar que MySQL esté ejecutándose

-Revisar credenciales en .env

-Ejecutar mysql -u root -p para probar conexión

Error "ModuleNotFoundError":
-Asegurar que el entorno virtual esté activado

-Ejecutar pip install -r requirements.txt

📞 Soporte
Para más información, consultar:

-Manual Técnico: docs/manual_tecnico.md

-Manual de Usuario: docs/manual_usuario.md
