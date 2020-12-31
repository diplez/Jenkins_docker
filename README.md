# Imagen contenedor Jenkins

Contenedor docker con imagen Jenkins Jenkins:latest, configurado para trabajar con docker HOST.

## Comenzando 🚀

Estas instrucciones permitirán obtener una copia del proyecto en funcionamiento en tu máquina local para propósitos de desarrollo, pruebas, etc.

### Pre-requisitos 📋
Que cosas necesitas para instalar el software y como instalarlas.

```
- Crear archivo .env a nivel de docker-compose -- Variable JENKINGS_ENV=TEXTO
- Docker  20.10.0 o superior.
- Docker compose 1.27.4 o superior
- Usuario docker autenticado.
```

### Ejecución 🔧
Para la ejecución de la imagen, colocarse dentro de proyecto raiz y ejecutar los siguiente en consola.

```
docker-compose up -d
```
Esperar a que finalice ejecución (Puede tardar unos minutos).
Para ver proceso de instalación puede ingresar el siguiente comando. (opcional)
```
docker attach Jenkins --Para salir presionar ctrl+p y ctrl+q de forma seguida.
docker logs Jenkins  --Podra visualizar como los el proceso de instalación.
```
Una vez finalizada la ejecución y creación del contenedor, se procede a la instalación de Jenkins por medio del navegador. Para identificar puerto de salida de jenkins escribir en consola:
```
docker ps -f name=Jenkins
```
En la columna PORTS de consola, se observará los puertos de salida disponibles.
**Ejemplo**

| PORTS  | NAMES |
| ------------- | ------------- |
| 0.0.0.0:8080->8080/tcp, 0.0.0.0:50000->50000/tcp | Jenkins  |

Identificado el puerto procedemos a un navegador abrir la ruta:
http://IP:8080.

Al abrir URL jenkins solicitará clave de acceso inicial, la cual se podrá obtener escribiendo en la consola el siguiente comando.
```
docker exec Jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```
Una ves dada la clave, se procede de forma visual a configurar jenkins por primera vez.

## Conectar GitHub con Webhooks ⚙️

* [Documentación](https://docs.google.com/document/d/1t32Ap1GpADjqdE5jw2Hv11YXDvJyAo52EQdwd_EeD78/edit?usp=sharing) - Conectar con webhooks.

## Construido con 🛠️

Herramientas utilizadas para construcción de contenedor.

* [Jenkins](https://github.com/jenkinsci/docker) - Imagen usada como base.
* [Docker Compose V3](https://docs.docker.com/compose/compose-file/compose-file-v3/) - Docker documentación


