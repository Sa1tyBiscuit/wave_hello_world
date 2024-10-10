CURRENT_DIR := $(shell pwd)
PYTHON := python3

# Detect OS
ifeq ($(OS),Windows_NT)
    VENV := venv\Scripts
    ACTIVATE := .\venv\Scripts\activate
else
    VENV := venv/bin
    ACTIVATE := source venv/bin/activate
endif

## Setup virtual environment, create toml file and requirements.txt
## for deployment of apps
setup: 
	$(PYTHON) -m venv venv &&  mkdir src && touch src/app.py && touch app.toml
	. $(VENV)/activate && $(VENV)/pip install h2o-wave

## create the hello world app
create:
	. $(VENV)/activate && cd src && wave init 

## Run app
run: 
	. $(VENV)/activate && $(VENV)/wave run src.app

## zip up the files needed for deployment
zip:
	mv src/requirements.txt ./requirements.txt
	zip -r hello_world_app.zip src app.toml requirements.txt

# clean up the directory 
clean:
	rm -rf venv src app.toml requirements.txt hello_world_app.zip
