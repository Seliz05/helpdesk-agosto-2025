# Manual de Usuario - Sistema Help Desk

## 📋 Índice
1. [Introducción](#1-introducción)
2. [Acceso al Sistema](#2-acceso-al-sistema)
3. [Roles de Usuario](#3-roles-de-usuario)
4. [Cómo Iniciar Sesión](#4-cómo-iniciar-sesión)
5. [Cómo Crear un Ticket](#5-cómo-crear-un-ticket)
6. [Cómo Ver Tickets](#6-cómo-ver-tickets)
7. [Cómo Actualizar Tickets](#7-cómo-actualizar-tickets)
8. [Dashboard - Panel Principal](#8-dashboard---panel-principal)
9. [Funciones por Rol](#9-funciones-por-rol)
10. [Preguntas Frecuentes](#10-preguntas-frecuentes)

---

## 1. Introducción

### ¿Qué es el Sistema Help Desk?

El Sistema Help Desk es una aplicación web que te permite **gestionar tickets de soporte técnico** de manera organizada y eficiente.

### ¿Para qué sirve?

- ✅ Reportar problemas técnicos
- ✅ Solicitar ayuda o soporte
- ✅ Hacer seguimiento de tus solicitudes
- ✅ Comunicarte con el equipo de soporte
- ✅ Ver el estado de tus tickets en tiempo real

### Requisitos para usar el sistema

- ✅ Navegador web moderno (Chrome, Firefox, Safari, Edge)
- ✅ Conexión a internet
- ✅ Credenciales de acceso (email y contraseña)

---

## 2. Acceso al Sistema

### URLs del Sistema

```
http://127.0.0.1:5000

http://localhost:5000
```

**Nota:** La URL puede variar según la configuración de tu organización. Consulta con tu administrador.

### Primera vez en el sistema

Si es tu primera vez, necesitas que un **Administrador** te cree una cuenta con:
- Tu nombre completo
- Tu correo electrónico
- Tu rol (USER, AGENT o ADMIN)

Recibirás tus credenciales de acceso para poder iniciar sesión.

---

## 3. Roles de Usuario

El sistema tiene **3 tipos de usuarios**, cada uno con diferentes permisos:

### 👤 USER (Usuario Regular)

**¿Quién es?** Cualquier persona que necesita reportar problemas o solicitar ayuda.

**¿Qué puede hacer?**
- ✅ Crear tickets de soporte
- ✅ Ver sus propios tickets
- ✅ Comentar en sus tickets
- ✅ Ver estadísticas de sus tickets

**¿Qué NO puede hacer?**
- ❌ Ver tickets de otros usuarios
- ❌ Asignar tickets
- ❌ Cambiar el estado de tickets
- ❌ Gestionar usuarios

---

### 🛠️ AGENT (Agente de Soporte)

**¿Quién es?** Miembro del equipo de soporte técnico que resuelve los tickets.

**¿Qué puede hacer?**
- ✅ Todo lo que hace un USER
- ✅ Ver tickets asignados a él
- ✅ Ver tickets sin asignar (disponibles)
- ✅ Cambiar el estado de tickets (Abierto → En Progreso → Resuelto)
- ✅ Comentar en cualquier ticket que pueda ver

**¿Qué NO puede hacer?**
- ❌ Ver TODOS los tickets del sistema
- ❌ Asignar tickets a otros agentes
- ❌ Gestionar usuarios

---

### 👨‍💼 ADMIN (Administrador)

**¿Quién es?** Supervisor o jefe del equipo de soporte.

**¿Qué puede hacer?**
- ✅ Todo lo que hace un AGENT
- ✅ Ver TODOS los tickets del sistema
- ✅ Asignar tickets a cualquier agente
- ✅ Cambiar roles de usuarios
- ✅ Gestionar todos los usuarios del sistema
- ✅ Acceso completo a todas las funciones

---

## 4. Cómo Iniciar Sesión

### Paso 1: Acceder a la página de login

1. Abre tu navegador web
2. Ingresa la URL del sistema: `http://localhost:5000` o `http://127.0.0.1:5000`
3. Verás la pantalla de inicio de sesión

### Paso 2: Ingresar credenciales

```
┌─────────────────────────────────┐
│   HELP DESK LOGIN               │
├─────────────────────────────────┤
│                                 │
│  Email: [admin@example.com    ]│
│                                 │
│  Password: [●●●●●●●●●●        ]│
│                                 │
│  [ Iniciar Sesión ]             │
│                                 │
└─────────────────────────────────┘
```

**Campos:**
- **Email:** Tu correo electrónico registrado
- **Password:** Tu contraseña

### Paso 3: Hacer clic en "Login"

- Si los datos son correctos → Serás redirigido al **Dashboard**
- Si hay error → Verás mensaje: "Correo o contraseña incorrectos"

### Credenciales de Prueba

Para probar el sistema, puedes usar estas cuentas de ejemplo:

| Rol   | Email                | Contraseña  |
|-------|----------------------|-------------|
| ADMIN | admin@example.com    | adminpass   |
| AGENT | agent@example.com    | agentpass   |
| USER  | user@example.com     | userpass    |

### Cerrar Sesión

1. Haz clic en **"Logout"** en la barra de navegación superior derecha
2. Serás redirigido a la página de login
3. Tu sesión se cerrará de forma segura

---

## 5. Cómo Crear un Ticket

### ¿Cuándo crear un ticket?

- 🖥️ Tienes un problema técnico
- ❓ Necesitas ayuda con algo
- 🔧 Requieres que se configure algo
- 📝 Quieres reportar un error

### Paso 1: Acceder al formulario

Hay **2 formas** de crear un ticket:

**Opción A:** Desde el Dashboard
```
Dashboard → Click en botón "New Ticket" (verde)
```

**Opción B:** Desde la lista de tickets
```
Barra de navegación → "Tickets" → Click en "New Ticket"
```

### Paso 2: Llenar el formulario

```
┌─────────────────────────────────────────┐
│  NUEVO TICKET                           │
├─────────────────────────────────────────┤
│                                         │
│  Título: [Mi impresora no funciona    ]│
│                                         │
│  Descripción:                           │
│  ┌─────────────────────────────────┐   │
│  │ Cuando intento imprimir, aparece│   │
│  │ un mensaje de error y no sale   │   │
│  │ nada. Ya reinicié la impresora. │   │
│  └─────────────────────────────────┘   │
│                                         │
│  Prioridad: [MEDIUM ▼]                 │
│                                         │
│  [Crear]  [Cancelar]                   │
│                                         │
└─────────────────────────────────────────┘
```

**Campos del formulario:**

1. **Título** (obligatorio)
   - Resumen corto del problema
   - Máximo 200 caracteres
   - Ejemplo: "Impresora HP no imprime"

2. **Descripción** (obligatorio)
   - Explica el problema en detalle
   - Incluye pasos que ya intentaste
   - Ejemplo: "La impresora muestra error 0x00000709. Ya reinicié el equipo y verifiqué las conexiones."

3. **Prioridad** (obligatorio)
   - **LOW (Baja)**: No es urgente, puede esperar
   - **MEDIUM (Media)**: Importante pero no crítico
   - **HIGH (Alta)**: Urgente, afecta el trabajo

### Paso 3: Crear el ticket

1. Revisa que toda la información sea correcta
2. Haz clic en el botón **"Create"**
3. Verás un mensaje: "Ticket creado exitosamente"
4. Serás redirigido a la lista de tickets

### Estado inicial del ticket

- 📋 **Estado:** OPEN (Abierto)
- 👤 **Asignado a:** Nadie (hasta que un ADMIN lo asigne)
- 🎯 **Prioridad:** La que seleccionaste

---

## 6. Cómo Ver Tickets

### Ver la Lista de Tickets

**Acceso:**
```
Barra de navegación → Click en "Tickets"
```

**Lo que verás:**

```
┌───────────────────────────────────────────────────────────────┐
│  TICKETS                                    [New Ticket]       │
├────┬──────────────┬──────────┬──────────┬────────────┬────────┤
│ #  │ Título       │ Estado   │ Prioridad│ Creado por │ Fecha  │
├────┼──────────────┼──────────┼──────────┼────────────┼────────┤
│ 5  │ Impresora HP │ [OPEN]   │ [MEDIUM] │ Juan Pérez │ Hoy    │
│ 4  │ PC lento     │ [IN_PROG]│ [HIGH]   │ Ana López  │ Ayer   │
│ 3  │ Email no...  │ [RESOLV] │ [LOW]    │ Juan Pérez │ 2 días │
└────┴──────────────┴──────────┴──────────┴────────────┴────────┘
```

**Información mostrada:**

- **#:** Número del ticket
- **Título:** Resumen del problema
- **Estado:** OPEN, IN_PROGRESS o RESOLVED
- **Prioridad:** LOW, MEDIUM o HIGH
- **Creado por:** Quién reportó el problema
- **Asignado a:** Qué agente lo está resolviendo
- **Fecha:** Cuándo se creó

### Filtrado por Rol

**USER:** Solo ve sus propios tickets
**AGENT:** Ve tickets asignados a él + tickets sin asignar
**ADMIN:** Ve TODOS los tickets del sistema

### Ver Detalle de un Ticket

1. En la lista de tickets, haz clic en el **número (#)** del ticket
2. Se abrirá la página de detalle con toda la información

---

## 7. Cómo Actualizar Tickets

### Ver Detalle Completo

Cuando abres un ticket, verás:

```
┌─────────────────────────────────────────────────────────┐
│  TICKET #5 - Impresora HP no funciona      [← Volver]   │
├─────────────────────────────────────────────────────────┤
│                                                         │
│  Estado: [OPEN]                                         │
│  Prioridad: [MEDIUM]                                    │
│  Creado por: Juan Pérez                                 │
│  Asignado a: Sin asignar                                │
│                                                         │
│  Descripción:                                           │
│  Cuando intento imprimir, aparece un mensaje de error   │
│  y no sale nada. Ya reinicié la impresora.              │
│                                                         │
├─────────────────────────────────────────────────────────┤
│  COMENTARIOS                                            │
├─────────────────────────────────────────────────────────┤
│  📝 Juan Pérez - Hace 5 min                             │
│  "Ya revisé el cable y está bien conectado"             │
│                                                         │
│  📝 Agent Smith - Hace 2 min                            │
│  "Voy a revisar los drivers de la impresora"            │
│                                                         │
├─────────────────────────────────────────────────────────┤
│  Agregar Comentario:                                    │
│  ┌───────────────────────────────────────────────────┐ │
│  │ [Escribe aquí tu comentario...]                   │ │
│  └───────────────────────────────────────────────────┘ │
│  [Agregar Comentario]                                   │
└─────────────────────────────────────────────────────────┘
```

### Agregar Comentarios (Todos los roles)

**Cualquier usuario puede comentar en los tickets que puede ver.**

**Paso a paso:**

1. Ve al detalle del ticket
2. Desplázate hasta la sección "Agregar Comentario"
3. Escribe tu mensaje en el área de texto
4. Haz clic en **"Add Comment"**
5. Tu comentario aparecerá al final de la lista

**Ejemplos de comentarios útiles:**

- **USER:** "Ya probé reiniciar el equipo pero sigue igual"
- **AGENT:** "Necesito más información sobre el modelo de la impresora"
- **ADMIN:** "Este ticket debe resolverse hoy"

### Actualizar Estado y Asignación (Solo AGENT y ADMIN)

Si eres **AGENT** o **ADMIN**, verás un formulario adicional:

```
┌─────────────────────────────────────────────────────────┐
│  ACTUALIZAR TICKET                                      │
├─────────────────────────────────────────────────────────┤
│                                                         │
│  Estado: [IN_PROGRESS ▼]  Asignado: [Agent Smith ▼]   │
│                                                         │
│  [Actualizar]                                           │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

**Cambiar Estado:**

- **OPEN (Abierto):** Estado inicial, esperando atención
- **IN_PROGRESS (En Progreso):** Agente trabajando en ello
- **RESOLVED (Resuelto):** Problema solucionado

**Asignar Agente (Solo ADMIN):**

1. Selecciona el agente del menú desplegable
2. Haz clic en "Update"
3. El agente recibirá el ticket en su lista

---

## 8. Dashboard - Panel Principal

Después de iniciar sesión, llegas al **Dashboard**, tu panel principal.

### ¿Qué ves en el Dashboard?

```
┌─────────────────────────────────────────────────────────┐
│  Bienvenido, Juan Pérez!                                │
│  Tu rol: USER                                           │
├─────────────────────────────────────────────────────────┤
│                                                         │
│  ┌──────────────────┐  ┌────────────────────────────┐  │
│  │ ACCIONES RÁPIDAS │  │ ESTADÍSTICAS               │  │
│  ├──────────────────┤  ├────────────────────────────┤  │
│  │                  │  │ Tickets por Estado:        │  │
│  │ [Ver Tickets]    │  │                            │  │
│  │ [Nuevo Ticket]   │  │ OPEN         → 3           │  │
│  │                  │  │ IN_PROGRESS  → 2           │  │
│  │                  │  │ RESOLVED     → 5           │  │
│  │                  │  │ ──────────────────         │  │
│  │                  │  │ TOTAL        → 10          │  │
│  │                  │  │                            │  │
│  │                  │  │ Mis Tickets: 3             │  │
│  │                  │  │                            │  │
│  └──────────────────┘  └────────────────────────────┘  │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

### Elementos del Dashboard

1. **Saludo personalizado:** Te muestra tu nombre y rol
2. **Acciones rápidas:** Botones para acceder rápidamente a:
   - Ver todos tus tickets
   - Crear un nuevo ticket
3. **Estadísticas:** Resumen de tickets:
   - Tickets por estado (OPEN, IN_PROGRESS, RESOLVED)
   - Total de tickets
   - Tus tickets (cantidad según tu rol)

---

## 9. Funciones por Rol

### 👤 Qué ve un USER

#### Navegación disponible:
```
┌────────────────────────────────────────────┐
│  Help Desk  [Tickets] [Logout]             │
└────────────────────────────────────────────┘
```

#### Dashboard:
- ✅ Estadísticas de sus propios tickets
- ✅ Total de tickets que ha creado
- ✅ Botones de acceso rápido

#### Lista de Tickets:
- ✅ Solo ve los tickets que él creó
- ✅ Puede ver el estado actual de cada ticket
- ✅ Puede ver quién está asignado

#### Detalle de Ticket:
- ✅ Puede ver toda la información
- ✅ Puede leer todos los comentarios
- ✅ Puede agregar nuevos comentarios
- ❌ NO puede cambiar estado
- ❌ NO puede asignar a agentes

**Ejemplo de uso típico:**
```
1. Usuario reporta: "Mi PC está lenta"
2. Crea ticket con prioridad MEDIUM
3. Agrega comentarios con más detalles
4. Espera a que un agente lo resuelva
5. Puede ver el progreso en cualquier momento
```

---

### 🛠️ Qué ve un AGENT

#### Navegación disponible:
```
┌────────────────────────────────────────────┐
│  Help Desk  [Tickets] [Logout]             │
└────────────────────────────────────────────┘
```

#### Dashboard:
- ✅ Estadísticas de todos los tickets
- ✅ Cantidad de tickets asignados a él
- ✅ Tickets pendientes de asignar

#### Lista de Tickets:
- ✅ Ve tickets asignados a él
- ✅ Ve tickets sin asignar (disponibles)
- ❌ NO ve tickets de otros agentes

#### Detalle de Ticket:
- ✅ Todo lo que ve un USER, más:
- ✅ Puede cambiar el estado (OPEN → IN_PROGRESS → RESOLVED)
- ✅ Puede comentar en cualquier ticket que vea
- ❌ NO puede asignar tickets a otros agentes

**Panel de actualización (solo para AGENT):**
```
┌─────────────────────────────────────────┐
│ Estado: [IN_PROGRESS ▼]                 │
│ [Actualizar]                            │
└─────────────────────────────────────────┘
```

**Ejemplo de uso típico:**
```
1. Agent revisa lista de tickets sin asignar
2. Admin le asigna un ticket: "PC lenta"
3. Cambia estado a IN_PROGRESS
4. Comenta: "Revisando drivers y memoria RAM"
5. Resuelve el problema
6. Cambia estado a RESOLVED
7. Comenta: "Optimicé el sistema. Todo funciona bien."
```

---

### 👨‍💼 Qué ve un ADMIN

#### Navegación disponible:
```
┌────────────────────────────────────────────────────┐
│  Help Desk  [Tickets] [Users] [Logout]             │
└────────────────────────────────────────────────────┘
```
**Nota:** El ADMIN tiene un menú adicional: **"Users"**

#### Dashboard:
- ✅ Estadísticas de TODOS los tickets del sistema
- ✅ Vista completa de todo

#### Lista de Tickets:
- ✅ Ve TODOS los tickets del sistema
- ✅ De todos los usuarios
- ✅ Asignados a cualquier agente

#### Detalle de Ticket:
- ✅ Todo lo que ve un AGENT, más:
- ✅ Puede asignar tickets a cualquier agente
- ✅ Control total sobre el ticket

**Panel de actualización (para ADMIN):**
```
┌─────────────────────────────────────────────────────┐
│ Estado: [RESOLVED ▼]  Asignado a: [Agent Smith ▼]  │
│ [Actualizar]                                        │
└─────────────────────────────────────────────────────┘
```

#### Gestión de Usuarios (EXCLUSIVO ADMIN):

**Acceso:**
```
Barra de navegación → Click en "Users"
```

**Lista de usuarios:**
```
┌─────────────────────────────────────────────────────┐
│  USUARIOS                                           │
├────┬──────────────┬───────────────────┬──────┬──────┤
│ #  │ Nombre       │ Email             │ Rol  │ Edit │
├────┼──────────────┼───────────────────┼──────┼──────┤
│ 1  │ Admin User   │ admin@example.com │ ADMIN│ ✎    │
│ 2  │ Agent Smith  │ agent@example.com │ AGENT│ ✎    │
│ 3  │ Juan Pérez   │ user@example.com  │ USER │ ✎    │
└────┴──────────────┴───────────────────┴──────┴──────┘
```

**Cambiar rol de usuario:**
1. Selecciona el nuevo rol en el menú desplegable
2. Haz clic en "Save"
3. El cambio es inmediato

**Ejemplo de uso típico:**
```
1. Admin recibe un nuevo ticket sin asignar
2. Revisa la descripción y prioridad
3. Asigna el ticket al agente más disponible
4. Supervisa el progreso de todos los tickets
5. Si un usuario necesita permisos de AGENT:
   - Va a "Users"
   - Cambia su rol de USER a AGENT
   - Usuario ahora puede resolver tickets
```

---

## 10. Preguntas Frecuentes

### ❓ ¿Cómo sé si mi ticket fue asignado?

1. Ve a la lista de tickets
2. En la columna "Asignado a" verás el nombre del agente
3. O entra al detalle del ticket y verás "Asignado a: [Nombre]"

### ❓ ¿Puedo eliminar un ticket?

❌ No, los tickets no se pueden eliminar. Esto es para mantener un historial completo.

### ❓ ¿Puedo cambiar la prioridad de mi ticket después de crearlo?

❌ Como USER, no puedes cambiarla. Si necesitas aumentar la prioridad:
1. Agrega un comentario explicando por qué es urgente
2. Un ADMIN puede reasignar o priorizar

### ❓ ¿Cuánto tiempo tarda en resolverse un ticket?

Depende de la prioridad:
- **HIGH:** Atención inmediata
- **MEDIUM:** 1-2 días hábiles
- **LOW:** 3-5 días hábiles

### ❓ ¿Recibiré notificaciones?

En esta versión del sistema, no hay notificaciones automáticas. Debes revisar periódicamente tus tickets.

### ❓ ¿Qué hago si olvidé mi contraseña?

Contacta a un **ADMIN** para que te restablezca la contraseña.

### ❓ ¿Puedo adjuntar archivos al ticket?

❌ Esta función no está disponible actualmente. Describe el problema con el mayor detalle posible en texto.

### ❓ Como AGENT, ¿cómo sé qué tickets debo atender?

1. Ve a "Tickets"
2. Verás los tickets asignados a ti
3. También verás tickets sin asignar que puedes tomar
4. Prioriza por urgencia (HIGH primero)

### ❓ ¿Puedo reasignar un ticket a otro agente?

Solo si eres **ADMIN**. Los AGENT no pueden reasignar tickets.

### ❓ ¿Qué significa cada estado?

- **OPEN:** Ticket nuevo, esperando ser atendido
- **IN_PROGRESS:** Un agente está trabajando en él
- **RESOLVED:** Problema solucionado, ticket cerrado

### ❓ ¿Puedo reabrir un ticket RESOLVED?

Como USER no puedes. Si el problema persiste:
1. Agrega un comentario en el ticket resuelto
2. O crea un nuevo ticket

---

## 📊 Resumen Rápido

### Para crear un ticket:
```
1. Login → Dashboard → "New Ticket"
2. Llenar título, descripción, prioridad
3. Click en "Create"
```

### Para ver tus tickets:
```
1. Login → "Tickets" (barra superior)
2. Click en el # del ticket para ver detalles
```

### Para comentar:
```
1. Abrir ticket
2. Scroll hasta "Add Comment"
3. Escribir y click "Add Comment"
```

### Para actualizar estado (AGENT/ADMIN):
```
1. Abrir ticket
2. Cambiar estado en el formulario
3. Click "Update"
```

### Para asignar ticket (ADMIN):
```
1. Abrir ticket
2. Seleccionar agente en "Assigned to"
3. Click "Update"
```

---

## 📞 Soporte

Si tienes problemas técnicos con el sistema o necesitas ayuda adicional, contacta a tu administrador del sistema.

**Versión del Manual:** 1.0  
**Última actualización:** Diciembre 2025

---

**¡Gracias por usar nuestro Sistema Help Desk!**