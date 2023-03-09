
cp .env.example .env
sed -i 's/DB_HOST=127.0.0.1/DB_HOST=pgsql/g' .env
sed -i 's/DB_CONNECTION=mysql/DB_CONNECTION=pgsql/g' .env
sed -i 's/DB_PORT=3306/DB_PORT=5432/g' .env
sed -i 's/DB_USERNAME=root/DB_USERNAME=sail/g' .env
sed -i 's/DB_PASSWORD=/DB_PASSWORD=password/g' .env

#!/bin/bash
alias sail='bash vendor/bin/sail'
sail down
sail up -d
cls
# docker exec -it prjct-ia-chart-pgsql-1 psql -U postgres
# CREATE USER sail WITH PASSWORD 'password' CREATEROLE CREATEDB;
# CREATE DATABASE pgsql OWNER sail;
# \l  --lista os bancos
# \du+ -- lista os usuarios
# \q -- sai do conteiner
sail composer install
sail artisan key:generate
sail artisan config:cache

sail artisan migrate
#sail artisan db:seed
