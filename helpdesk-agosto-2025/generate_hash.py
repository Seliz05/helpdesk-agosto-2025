# generate_hash.py
from werkzeug.security import generate_password_hash

# Generar hash para la contraseña "adminpass"
# password = "adminpass"
# password_hash = generate_password_hash(password)
# print("=" * 50)
# print(f"Contraseña: {password}")
# print(f"Hash generado: {password_hash}")
# print("=" * 50)
# print("\nInstrucciones:")
# print("1. Copia el hash generado arriba")
# print("2. Pégalo en el INSERT SQL del archivo de creación de la base de datos")
# print("3. Reemplaza 'PASSWORD_HASH_AQUI' con este hash")
# print("=" * 50)

# Generar hash para la contraseña "agentpass"
password = "agentpass"
password_hash = generate_password_hash(password)
print("=" * 50)
print(f"Contraseña: {password}")
print(f"Hash generado: {password_hash}")
print("=" * 50)
print("\nInstrucciones:")
print("1. Copia el hash generado arriba")
print("2. Pégalo en el INSERT SQL del archivo de creación de la base de datos")
print("3. Reemplaza 'PASSWORD_HASH_AQUI' con este hash")
print("=" * 50)

# Generar hash para la contraseña "userpass"
password = "userpass"
password_hash = generate_password_hash(password)
print("=" * 50)
print(f"Contraseña: {password}")
print(f"Hash generado: {password_hash}")
print("=" * 50)
print("\nInstrucciones:")
print("1. Copia el hash generado arriba")
print("2. Pégalo en el INSERT SQL del archivo de creación de la base de datos")
print("3. Reemplaza 'PASSWORD_HASH_AQUI' con este hash")
print("=" * 50)