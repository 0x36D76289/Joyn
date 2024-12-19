# Utilisation de la dernière image Node.js
FROM node:latest

# Définition du répertoire de travail
WORKDIR /app/backend

# Copie des fichiers package.json et package-lock.json
COPY package*.json ./

# Installation des dépendances
RUN npm install

# Copie du reste du code source
COPY . .

# Exposition du port (à adapter selon votre configuration)
EXPOSE 3001

# Commande de démarrage de l'application
CMD ["npm", "start"]