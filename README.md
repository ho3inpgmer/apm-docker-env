
# Apache-PHP-Mysql docker environment


install a lightweight Apache-PHP-Mysql docker environment.

## Prerequisites
1. [Install Docker](https://www.docker.com/)
2. [Install Docker Compose](https://docs.docker.com/compose/)

## Configuration
Edit the `.env` file to update the default MySQL username, and password.

## Installation
Clone this repository or copy the files from this repository into a new folder:
```
git clone https://github.com/ho3inpgmer/apm-docker-env.git
```
Open a terminal, `cd` to the folder in which `docker compose.yml` is saved, and run:
```
docker compose up
```
Finish.

## Components
The docker image installs the following packages on your system:

|Component|Version|
| :-------------: | :-------------: |
|Linux|Ubuntu 22.04|
|Apache|Latest|
|PHP|8.0|
|MariaDB|[Stable version: 10.5](https://hub.docker.com/_/mariadb)|
|phpMyAdmin|[Latest from dockerhub](https://hub.docker.com/r/bitnami/phpmyadmin/)|
|Redis|[Latest from dockerhub](https://hub.docker.com/_/redis/)|


## Usage
### Starting a Container
Start the container with the `up` or `start` methods:
```
docker compose up
```
You can run with daemon mode, like so:
```
docker compose up -d
```
The container is now built and running. 

### Creating a Subdomain
By this command you create a subdomain with its subdirectory and apache config file.
All you have to do is replace `sub.example.com` with your own subdomain.
```
bash add-subdomain.sh sub.example.com
```
### Accessing the Database
After installation, you can use phpMyAdmin to access the database by visiting `http://127.0.0.1:8080` or `https://127.0.0.1:8443`. The default username is `root`, and the password is the same as the one you supplied in the `.env` file.

## Support & Feedback


**Pull requests are always welcome
