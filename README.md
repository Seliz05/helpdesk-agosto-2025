# 🎫 Sistema Help Desk - Flask + MySQL + Bootstrap

![Python](https://img.shields.io/badge/Python-3.8%2B-blue)
![Flask](https://img.shields.io/badge/Flask-2.3.3-green)
![Bootstrap](https://img.shields.io/badge/Bootstrap-5.3-purple)
![MySQL](https://img.shields.io/badge/MySQL-5.7%2B-orange)
![License](https://img.shields.io/badge/License-MIT-yellow)

Sistema completo de gestión de tickets de soporte técnico con autenticación por roles, dashboard estadístico e interfaz responsiva.

## ✨ Características Principales

### 🔐 Autenticación y Seguridad
- Login seguro con hash de contraseñas (Werkzeug)
- 3 roles de usuario: **ADMIN**, **AGENT**, **USER**
- Sesiones protegidas con Flask sessions
- Prevención de SQL injection con parámetros

### 🎫 Gestión de Tickets
- Crear, ver, actualizar y comentar tickets
- Estados: **OPEN**, **IN_PROGRESS**, **RESOLVED**
- Prioridades: **LOW**, **MEDIUM**, **HIGH**
- Asignación de tickets a agentes
- Sistema de comentarios completo

### 📊 Dashboard Inteligente
- **Estadísticas en tiempo real** (mejora adicional)
- Tickets por estado y prioridad
- Vista personalizada según rol del usuario
- Acciones rápidas desde panel principal

### 👥 Gestión de Usuarios
- Panel de administración (solo ADMIN)
- Cambio de roles dinámico
- Listado completo de usuarios

### 🎨 Interfaz de Usuario
- **Bootstrap 5** responsivo
- **jQuery** para interacciones
- Templates **Jinja2** reutilizables
- Mensajes flash para feedback

## 🚀 Instalación Rápida

### Prerrequisitos
- Python 3.8 o superior
- MySQL 5.7 o superior
- pip (gestor de paquetes Python)

### Paso 1: Clonar Repositorio
```bash
git clone https://github.com/tu-usuario/helpdesk-system.git
cd helpdesk-system
```

### Paso 2: Configurar Base de Datos\
# Conectar a MySQL como root
mysql -u root -p < db_init.sql

### Paso 3: Configurar Entorno
# Crear entorno virtual
python -m venv venv

# Activar entorno virtual
# Windows:
venv\Scripts\activate
# Linux/Mac:
source venv/bin/activate

### Paso 4: Instalar Dependencias
pip install -r requirements.txt

### Paso 5: Configurar Variables
# Copiar archivo de configuración
cp .env.example .env

# Editar .env con tus credenciales de MySQL
# (Usar cualquier editor de texto)

### Paso 6: Ejecutar la Aplicación
python app.py

### Paso 7: Acceder al Sistema
Abrir navegador en: http://localhost:5000 o http://127.0.0.1:5000

🔑 Credenciales de Prueba
    Rol	     Email	              Contraseña
🛡️ ADMIN    admin@example.com	    adminpass
🔧 AGENT	  agent@example.com	    agentpass
👤 USER	    user@example.com	    userpass

📁 Estructura del Proyecto
helpdesk-system/
├── app.py                 # 🌐 Aplicación principal Flask
├── config.py              # ⚙️ Configuración
├── generate_hash.py       # 🔑 Generador de contraseñas
├── db_init.sql            # 🗄️ Script de base de datos
├── requirements.txt       # 📦 Dependencias Python
├── .env.example           # 📝 Ejemplo de configuración
├── .gitignore            # 🚫 Archivos a ignorar
├── er_diagram.png        # 🗺️ Diagrama entidad-relación
├── README.md             # 📖 Este archivo
│
├── static/               # 🎨 Archivos estáticos
│   ├── css/
│   │   └── custom.css   # 🎨 Estilos personalizados
│   └── js/
│       └── main.js      # ⚡ JavaScript/jQuery
│
├── templates/           # 🖼️ Plantillas HTML
│   ├── base.html       # 📐 Layout principal
│   ├── login.html      # 🔐 Página de login
│   ├── dashboard.html  # 📊 Dashboard con estadísticas
│   ├── tickets_list.html # 📋 Lista de tickets
│   ├── ticket_new.html  # ➕ Nuevo ticket
│   ├── ticket_detail.html # 👀 Detalle de ticket
│   └── users_list.html  # 👥 Administrar usuarios
│
└── docs/               # 📚 Documentación completa
    ├── manual_usuario.md # 👶 Manual de usuario
    ├── manual_tecnico.md # 👨‍💻 Manual técnico
    └── screenshots/     # 📸 Capturas de pantalla

🔐 Variables de Entorno
Crear archivo .env en la raíz:

# Clave secreta para Flask (cambiar en producción)
SECRET_KEY=tu-clave-secreta-aqui

# Configuración de MySQL
DB_HOST=localhost
DB_PORT=3306
DB_USER=helpdesk_user
DB_PASSWORD=helpdesk_password
DB_NAME=helpdesk_db

🛠️ Tecnologías Utilizadas

Componente	              Tecnología	               Versión
Backend	                   Flask (Python)	            2.3.3
Base de Datos	             MySQL	                    5.7+
Frontend	                 Bootstrap 5	              5.3.3
JavaScript	               jQuery	                    3.7.1
Autenticación	             Werkzeug	                  2.3.7
Templates	                 Jinja2	                    3.1.2
Conexión DB	               PyMySQL	                  1.0.3

📊 Mejora Adicional: Dashboard con Estadísticas

Implementación
-Consultas SQL para agrupar tickets por estado y prioridad

-Visualización con badges color-coded

-Vistas personalizadas según rol del usuario

-Código en: app.py (líneas ~80-120) y dashboard.html

Beneficios

-Visibilidad inmediata del estado del sistema

-Toma de decisiones basada en datos

-Mejora la experiencia de usuario

-Cumple con requisito de mejora del proyecto

📡 Endpoints Principales

Ruta	                      Método	              Descripción	                        Rol
/login	                     GET/POST	              Iniciar sesión	                   -
/dashboard	                 GET	                  Dashboard con estadísticas	     Todos
/tickets	                   GET	                  Lista de tickets	               Filtrado por rol
/tickets/new	               GET/POST	              Crear ticket	                   Todos
/users	                     GET	                  Administrar usuarios	           Solo ADMIN

🐛 Solución de Problemas Comunes

Error: "Can't connect to MySQL server"

# Verificar que MySQL esté corriendo
sudo systemctl status mysql  # Linux
net start MySQL80            # Windows

Error: "ModuleNotFoundError"

# Asegurar que el entorno virtual esté activado
source venv/bin/activate  # Linux/Mac
venv\Scripts\activate     # Windows

# Reinstalar dependencias
pip install -r requirements.txt

Error: Caracteres extraños (Ã, Ã±)

-- Cambiar charset de la base de datos
ALTER DATABASE helpdesk_db 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

📚 Documentación Completa

La documentación detallada está en la carpeta docs/:

📖 Manual de Usuario - Cómo usar el sistema

🛠️ Manual Técnico - Instalación y arquitectura

📸 Capturas de Pantalla - Visualización del sistema

🚀 Despliegue en Producción

Recomendaciones:

1.Cambiar SECRET_KEY por una segura y única

2.Desactivar debug mode: debug=False en app.py

3.Usar servidor WSGI (Gunicorn, uWSGI)

4.Configurar Nginx/Apache como proxy inverso

5.Habilitar HTTPS con certificado SSL

6.Implementar backup automático de la base de datos

👥 Roles y Permisos

ADMIN (Administrador)
✅ Ver todos los tickets

✅ Asignar tickets a agentes

✅ Cambiar roles de usuarios

✅ Acceso completo al sistema

AGENT (Agente de Soporte)
✅ Ver tickets asignados + sin asignar

✅ Cambiar estado de tickets

✅ Comentar en tickets

❌ No puede administrar usuarios

USER (Usuario)
✅ Crear tickets

✅ Ver sus propios tickets

✅ Comentar en sus tickets

❌ No puede cambiar estados ni asignar

📄 Licencia

Este proyecto está bajo la licencia MIT. Ver archivo LICENSE para más detalles.

🤝 Contribuir

1.Fork el repositorio

2.Crear rama de feature (git checkout -b feature/AmazingFeature)

3.Commit cambios (git commit -m 'Add AmazingFeature')

4.Push a la rama (git push origin feature/AmazingFeature)

5.Abrir Pull Request

📞 Soporte
-Para reportar problemas o sugerir mejoras:

-Abrir un issue en GitHub

-Contactar al desarrollador principal

✨ Capturas de Pantalla

Vista	                                                 Descripción
https://docs/screenshots/login.png	                    Página de inicio de sesión
https://docs/screenshots/dashboard.png	                Dashboard con estadísticas
https://docs/screenshots/dashboard02.png                Dashboard con estadísticas con rol ADMIN
https://docs/screenshots/tickets_list.png	              Lista de tickets
https://docs/screenshots/ticket_detail.png	            Detalle y comentarios
https://docs/screenshots/users_list.png	                Panel de administración
