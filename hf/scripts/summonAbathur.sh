#!/bin/bash

# Sometimes hivemind can be naughty and if we lose connection to the VM it can
# actually keep on running. This script will hunt it down and kill it.

# !!!!!!!!!!!!!!!!!!!!! Not tested !!!!!!!!!!!!!!!!!!!!!!!!!!!!!

bold=$(tput bold)
underline=$(tput smul)
normal=$(tput sgr0)
bldred=${bold}$(tput setaf 1) #  red
bldgreen=${bold}$(tput setaf 2) #  green

EXTRA="Glass,Trident,Lobby,Petros,Zuul,Focus,Cocktail,Blur,Babel,SparkCustomerApi,InfluxdbAdapter1,ElasticsearchAdapter,SwaggerUI,StatusPage,Shinkansen,ShinkansenAdapter,BabelIndexer,SparkSystemApi,Vader,SparkOperatorUI"


clear

echo -e "${bldgree}Organism Abathur will not fail.${normal}"


echo -e "${bldgree}Establishing syslinks${normal}"

ln -s /repos/env ~/env
ln -s /repos/env/deploy ~/deploy
ln -s /repos/luggage ~/luggage
ln -s /repos/go/src/nflex ~/nflex
ln -s /repos/go/src/kgb ~/kgb

echo -e "${bldgree}Copying files over${normal}"

cp  ~/luggage/hf/settings/envStuff/mydev.yaml /repos/env/deploy/platforms/cmp/mydev.yaml
cp ~/luggage/hf/settings/home/* ~/

echo -e "${bldgree}Generating configuration for the latest containers${normal}"

cd /repos/env/deploy
./generate-config --platform mydev --version latest

echo -e "${bldgree}Generating configuration for the latest containers${normal}"

cd /repos/env/deploy
./spin env


echo -e "${bldgree}Pulling new containers. Go be productive somewhere else.${normal}"

./shared-services pull
./shared-services up

./init all -y

./bespin pull
./bespin -s $EXTRA up

# TODO:

# echo -e "${bldgree}Adding spanner user to babel${normal}"
# http://bespin.dev:8004/?url=/cmp/api/system/doc#!/Customers/post_customers_customer_id_index

# curl -u bespindemo:spanner -H "Content-type: application/json"  -XPOST http://bespin.dev:8000/cmp/api/system/customers/00000000-0000-0000-0000-000000000001/index -d '{"Babel-Api-Shared-Secret":"spanner",}'


# echo -e "${bldgree}Installing golang and glide${normal}"
# 
