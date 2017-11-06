#! /bin/sh

if [ ! -z $PASSWORD ];
then
  if [ $PASSWORD == "your_password" ];
  then 
    printf "\e[31mOkay, that's stupid. \"your_password\" as a password is obviously unsecure.\nDon't do this.\nI'm beggin you.\n\e[0m" 
  fi
  echo "Setting password to "$PASSWORD;
  sed -i '2s/.*/  "password":"'$PASSWORD'"/' config.json;
else
  printf "\e[33mWarning: No password set. Use \"unsecure\" password instead, but that's, hum.. unsecure ?\nYou should run container with \"-e PASSWORD=your_password\" option\e[0m";
fi

npm run start