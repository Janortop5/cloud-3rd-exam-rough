<<<<<<< HEAD
# docker-laravel-app
Dockerfile to build laravel app and docker-compose file to define, create and manage services. <br>
link to the laravel app repo: https://github.com/f1amy/laravel-realworld-example-app

### Dockerfile
- Built on ubuntu image.
- Installs nginx and other dependencies.
- Copies source files for laravel app onto image.
- Installs laravel.
- Sets up nginx.
- Starts nginx.

### docker-compose.yml
- Laravel app service.
- MySQL db service for laravel app.
- Volumes for logs and persistent data.
- Network for services.

### laravel-realworld-example-app
- Source files for laravel app.

### laravel
- Nginx configurations for laravel app.

### .env.example
- Example env file.

### php.ini
- Php configurations.

### web.php
- Enable laravel landing page.

## Install
### Setup
In .env.example file
```
Specify DB_PASSWORD
You can also specify other environment variables
```
Copy .env.example to .env
```
run: cp .env.example .env
```
In docker-compose.yml
```
Variables 'DB_PASSWORD' and 'DB_DATABASE' will be picked up from .env file
```
### Deploy
Build image and deploy containers for services
```
docker compose up -d
```
Create table in database.<br>
Wait 30 seconds to a minute after running 'docker compose up -d,' then run:
```
docker compose exec laravel php artisan migrate --seed
```
Illustration:
![illustration](./illustration.png)
## Result
Landing Page:
![landing page](./result-landing-page.png)


Endpoints:
![endpoint](./result-endpoints.png)
=======
# dockerfile-test
>>>>>>> 93738dece03d8fe5fd808a0fd7a0dadf115dd195
