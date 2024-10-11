## Instructions to intialize a hello world wave app and deploy it 

# Makefile 
- setup := creates virtual environment, app.toml and requirements.txt file needed for deploying
  of the app to app store 

- zip := zip up files needed for deployment to app store 
- clean := clean up the files in the directory to a clean state


# HOW TO USE

make setup

Edit app.toml

[App]
Name = "ai.h2o.wave.myapp_<username>"
Version = "0.0.1"
Title = "Hello, World <username>!"
Description = "Show a card to the user explaining this is my first app."

[Runtime]
Module = "src.app"

make create 

select hello world app

make run

TADA! you have a running hello world wave app now! :)


# HOW TO DEPLOY

make zip 

head to internal app store and upload your zip file
