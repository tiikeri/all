#!/bin/bash
touch decrypted-passwords.txt
  if [[ $1 == "check-passwords" ]] ; then
    echo "Enter the encryption password..."
    read -s epw
    openssl aes256 -pass pass:"$epw" -d -salt -in encrypted-passwords.txt -out decrypted-passwords.txt
    cat decrypted-passwords.txt
    openssl aes256 -pass pass:"$epw" -salt -in decrypted-passwords.txt -out decrypted-passwords.txt
    rm decrypted-passwords.txt
    exit 1
  fi
  echo "Enter the encryption password..."
  read -s epw
  openssl aes256 -pass pass:"$epw" -d -salt -in encrypted-passwords.txt -out decrypted-passwords.txt
  while [[ 0 == 0 ]] ; do
    echo -n "Username: "
    read uname
    echo -n "Password: "
    read -s pw
    echo -n "Account description: "
    read desc
    printf "$desc\n USER:$uname \nPW:$pw\n\n" >> decrypted-passwords.txt
    echo -n "Enter another? [y/n] "
    read resp
    if [[ $resp == "y" ]] ; then
      foo=bar
    else
      break
    fi
  done
  openssl aes256 -pass pass:"$epw" -salt  -in decrypted-passwords.txt -out encrypted-passwords.txt
   rm decrypted-passwords.txt

