#!/bin/bash
cd ~/data-shield
docker compose down
cd ~

mkdir data-shield
cd data-shield

rm -rf em-datashield

git clone https://em-tpt-bbandi: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@github.com/em-tirupati/em-datashield &&
cd ~/data-shield/em-datashield/em-ds-encryption &&
git checkout devops_Ngrok_deploy_august_2023

cp ~/data-shield/application.properties  ~/data-shield/em-datashield/em-ds-encryption/src/main/resources
cp ~/data-shield/WebConfig.java  ~/data-shield/em-datashield/em-ds-encryption/src/main/java/em/datashield

mvn clean package -DskipTests -Dcheckstyle.skip=true

docker stop shield-back-end
docker rm shield-back-end
docker rmi shield-spring-app
docker build -t shield-spring-app .

cd ~

cd data-shield
rm -rf em-datashield-fe

git clone https://em-tpt-bbandi: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@github.com/em-tirupati/em-datashield-fe  &&
cd ~/data-shield/em-datashield-fe &&
git checkout devops_Ngrok_deploy_august_2023

cp ~/data-shield/config.js ~/data-shield/em-datashield-fe/src/components/

docker stop shield-front-end
docker rm shield-front-end
docker rmi shield-react-app
docker build -t shield-react-app .

cd ~/data-shield

docker compose up -d
