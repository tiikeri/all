#!/bin/bash
touch decrypted-passwords.txt #make sure the file exists
  if [[ $1 == "check-passwords" ]] ; then
    echo "Enter the encryption password..."
    read -s epw #read the password so the user doesn't have to enter it again.
    openssl aes256 -pass pass:"$epw" -d -salt -in encrypted-passwords.txt -out decrypted-passwords.txt #decrypt the file for reading
    cat decrypted-passwords.txt #display the passwords
    openssl aes256 -pass pass:"$epw" -salt -in decrypted-passwords.txt -out decrypted-passwords.txt #encrypt the file again
    rm decrypted-passwords.txt #destroy the decrypted file
    exit 1
  fi
  echo "Enter the encryption password..."
  read -s epw #read the password so the user doesn't have to enter it again.
  openssl aes256 -pass pass:"$epw" -d -salt -in encrypted-passwords.txt -out decrypted-passwords.txt #decrypt the file for writing
  while [[ 0 == 0 ]] ; do
    echo -n "Username: "
    read uname
    echo -n "Password: "
    read -s pw
    echo -n "Account description: "
    read desc
    printf "$desc\n USER:$uname \nPW:$pw\n\n" >> decrypted-passwords.txt #put the info in the decrypted file
    echo -n "Enter another? [y/n] "
    read resp
    if [[ $resp == "y" ]] ; then
      foo=bar
    else
      break
    fi
  done
  openssl aes256 -pass pass:"$epw" -salt  -in decrypted-passwords.txt -out encrypted-passwords.txt #encrypt the file again
   rm decrypted-passwords.txt #destroy the decrypted file


