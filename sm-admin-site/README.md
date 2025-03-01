# Unitea-admin Angular

## Run locally

npm i --yes
ng serve -o

## Run docker images

docker run \
-e "APP_BASE_URL=http://localhost:8080/api" \
-it --rm -p 80:80 shopizerecomm/shopizer-admin
