# Variables
BACKEND_DIR := backend
FRONTEND_DIR := frontend
COMPOSE_FILE := docker-compose.yml
ENV_FILE := .env

# Couleurs pour l'affichage
GREEN  := \033[0;32m
YELLOW := \033[0;33m
RESET  := \033[0m

.PHONY: help build up down stop restart clean logs backend-build frontend-build backend-logs frontend-logs

# Aide
help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  ${GREEN}build${RESET}        Construire les images Docker des services."
	@echo "  ${GREEN}up${RESET}           Démarrer les services en arrière-plan."
	@echo "  ${GREEN}down${RESET}         Arrêter et supprimer les conteneurs, réseaux et volumes."
	@echo "  ${GREEN}stop${RESET}         Arrêter les services."
	@echo "  ${GREEN}restart${RESET}      Redémarrer les services."
	@echo "  ${GREEN}clean${RESET}        Supprimer les images Docker et les volumes de données."
	@echo "  ${GREEN}logs${RESET}         Afficher les logs de tous les services."
	@echo "  ${GREEN}backend-build${RESET}  Construire l'image Docker du backend."
	@echo "  ${GREEN}frontend-build${RESET} Construire l'image Docker du frontend."
	@echo "  ${GREEN}backend-logs${RESET}   Afficher les logs du backend."
	@echo "  ${GREEN}frontend-logs${RESET}  Afficher les logs du frontend."

# Construire les images Docker
build:
	@echo "${YELLOW}Construction des images...${RESET}"
	@docker-compose -f $(COMPOSE_FILE) --env-file $(ENV_FILE) build

# Démarrer les services en arrière-plan
up:
	@echo "${YELLOW}Démarrage des services...${RESET}"
	@docker-compose -f $(COMPOSE_FILE) --env-file $(ENV_FILE) up -d

# Arrêter et supprimer les conteneurs, réseaux et volumes
down:
	@echo "${YELLOW}Arrêt et suppression des services...${RESET}"
	@docker-compose -f $(COMPOSE_FILE) --env-file $(ENV_FILE) down -v

# Arrêter les services
stop:
	@echo "${YELLOW}Arrêt des services...${RESET}"
	@docker-compose -f $(COMPOSE_FILE) --env-file $(ENV_FILE) stop

# Redémarrer les services
restart: stop up

# Supprimer les images Docker et les volumes de données
clean: down
	@echo "${YELLOW}Suppression des images...${RESET}"
	@docker rmi $$(docker images -q)
	@echo "${YELLOW}Suppression des volumes non utilisés...${RESET}"
	@docker volume prune -f

# Afficher les logs de tous les services
logs:
	@echo "${YELLOW}Affichage des logs...${RESET}"
	@docker-compose -f $(COMPOSE_FILE) --env-file $(ENV_FILE) logs -f

# Construire l'image Docker du backend
backend-build:
	@echo "${YELLOW}Construction de l'image du backend...${RESET}"
	@docker-compose -f $(COMPOSE_FILE) --env-file $(ENV_FILE) build backend

# Construire l'image Docker du frontend
frontend-build:
	@echo "${YELLOW}Construction de l'image du frontend...${RESET}"
	@docker-compose -f $(COMPOSE_FILE) --env-file $(ENV_FILE) build frontend

# Afficher les logs du backend
backend-logs:
	@echo "${YELLOW}Affichage des logs du backend...${RESET}"
	@docker-compose -f $(COMPOSE_FILE) --env-file $(ENV_FILE) logs -f backend

# Afficher les logs du frontend
frontend-logs:
	@echo "${YELLOW}Affichage des logs du frontend...${RESET}"
	@docker-compose -f $(COMPOSE_FILE) --env-file $(ENV_FILE) logs -f frontend