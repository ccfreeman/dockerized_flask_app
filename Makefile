.PHONY: namespace build install purge run test

SHELL := /bin/bash

NAMESPACE := dro-web

.PHONY: namespace
namespace:
	kubectl describe ns/$(NAMESPACE) || (kubectl create namespace $(NAMESPACE)

build:
	pipenv lock -r > requirements.txt
	docker build -t dro-web:latest .

run: purge
	pipenv lock -r > requirements.txt
	docker-compose up -d --build app

purge:
	docker-compose down --remove-orphans
	rm -rf requirements.txt

test: purge
	docker-compose up -d redis mongo
	pytest
