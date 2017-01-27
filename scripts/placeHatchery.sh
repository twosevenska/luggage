#!/bin/bash

bold=$(tput bold)
underline=$(tput smul)
normal=$(tput sgr0)
bldred=${bold}$(tput setaf 1) #  red

BESPIN_SERVICES="Glass,Trident,Lobby,Petros,SwaggerUI,Focus,Blur,Cocktail,Zuul,Babel,Shinkansen"
EXTRA="Glass,Trident,Lobby,Petros,Zuul,Focus,Cocktail,Blur,Babel,SparkCustomerApi,InfluxdbAdapter1,ElasticsearchAdapter,SwaggerUI,StatusPage,Shinkansen,ShinkansenAdapter,BabelIndexer,SparkSystemApi,Vader,SparkOperatorUI"

clear

echo -e "${bldred}The Swarm prevails."
echo -e "----------------------------"
echo -e "!!!!!!! WARNING THIS SCRIPT MAY TAKE LONGER THAN YOU'D LIKE!${normal}"

cd /repos/env/deploy

while :
do
	echo -e "Do you wish to ${underline}update${normal} the core bespin stack and shared services? (y/N)"
	read yn
	case $yn in
		y)
			bespin -s $BESPIN_SERVICES pull
			shared-services pull
			break
			;;
		*)
			break
			;;
	esac
done

while :
do
	echo -e "Do you wish to ${underline}shutdown all${normal} of the bespin stack and associated services? (Y/n)"
	read yn
	case $yn in
		*)
			bespin kill
			shared-services kill
			break
			;;
		n)
			break
			;;
	esac
done

while :
do
	echo -e "Do you wish to ${underline}start the core${normal} of the bespin stack and associated services? (Y/n/extra)"
	read yn
	case $yn in
		*)
			shared-services up
			bespin -s $BESPIN_SERVICES up
			break
			;;
		n)
			break
			;;
		extra)
                        shared-services up
                        bespin -s $EXTRA up
                        break
                        ;;
	esac
done

clear
docker ps

