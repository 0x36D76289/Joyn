# Joyn - Plateforme de Jeux Vidéo

Joyn est une plateforme web qui regroupe une multitude de jeux vidéo, similaire à Papergames ou Plato. Ce projet utilise **Node.js** (dernière version) avec **Express.js** pour le backend et **React** pour le frontend. **Docker** et **Docker Compose** sont utilisés pour faciliter le développement, le déploiement et la gestion de l'application.

## Structure du Projet

```bash
joyn/
├── backend/            # Code source du backend Node.js
│   ├── src/            # Logique métier, controllers, services
│   │   ├── api/        # Définition des routes API
│   │   ├── config/     # Fichiers de configuration
│   │   ├── models/     # Modèles de données (ex: utilisateurs, jeux)
│   │   ├── services/   # Services métiers (ex: authentification, gestion des jeux)
│   │   └── utils/      # Fonctions utilitaires
│   ├── tests/          # Tests unitaires et d'intégration
│   ├── app.js          # Point d'entrée de l'application backend
│   ├── Dockerfile      # Fichier de construction de l'image Docker du backend
│   ├── package.json    # Dépendances et scripts du backend
│   └── ...
├── frontend/           # Code source du frontend React
│   ├── public/         # Fichiers statiques (index.html, images, etc.)
│   ├── src/            # Code source de l'application React
│   │   ├── components/ # Composants React réutilisables
│   │   ├── contexts/   # Contextes pour gérer l'état global
│   │   ├── hooks/      # Hooks personnalisés
│   │   ├── pages/      # Composants représentant les pages de l'application
│   │   ├── services/   # Services pour interagir avec l'API backend
│   │   ├── App.js      # Composant principal de l'application
│   │   ├── index.js    # Point d'entrée de l'application frontend
│   │   └── ...
│   ├── .env            # Variables d'environnement du frontend
│   ├── Dockerfile      # Fichier de construction de l'image Docker du frontend
│   ├── package.json    # Dépendances et scripts du frontend
│   └── ...
├── docker-compose.yml  # Fichier de configuration Docker Compose
├── .env                # Variables d'environnement globales
├── .gitignore          # Fichiers et dossiers à ignorer par Git
├── Makefile            # Fichier pour automatiser les tâches courantes
└── README.md           # Ce fichier
```

## Prérequis

*   [Docker](https://docs.docker.com/get-docker/)
*   [Docker Compose](https://docs.docker.com/compose/install/)
*   [Node.js](https://nodejs.org/) (dernière version, pour le développement local si vous le souhaitez)
*   [npm](https://www.npmjs.com/) ou [Yarn](https://yarnpkg.com/) (pour le développement local si vous le souhaitez)

## Démarrage Rapide

1. **Cloner le dépôt :**

```bash
git clone <DEPOT_URL>
cd joyn
```

2. **Configurer les variables d'environnement :**

    *   Renommez le fichier `.env.example` en `.env` à la racine du projet.
    *   Ouvrez le fichier `.env` et configurez les variables nécessaires (base de données, clés API, etc.).

3. **Construire et démarrer les services avec Docker Compose :**

    make up

    Cette commande va construire les images Docker et démarrer les conteneurs pour le backend, le frontend et la base de données.
4. L'application sera accessible à l'adresse :
    * **Frontend:** `http://localhost:3000`
    * **Backend:** `http://localhost:3001`

## Commandes du Makefile

Le `Makefile` fournit des commandes pour simplifier la gestion du projet :

| Commande          | Description                                                                    |
| ----------------- | ------------------------------------------------------------------------------ |
| `make build`       | Construit les images Docker des services.                                      |
| `make up`          | Démarre les services en arrière-plan.                                         |
| `make down`        | Arrête et supprime les conteneurs, réseaux et volumes.                          |
| `make stop`        | Arrête les services.                                                          |
| `make restart`     | Redémarre les services.                                                       |
| `make clean`       | Supprime les images Docker et les volumes de données.                         |
| `make logs`        | Affiche les logs de tous les services.                                        |
| `make backend-build` | Construit l'image Docker du backend.                                         |
| `make frontend-build`| Construit l'image Docker du frontend.                                        |
| `make backend-logs`  | Affiche les logs du backend.                                                 |
| `make frontend-logs` | Affiche les logs du frontend.                                                 |
| `make help`        | Affiche l'aide du Makefile.                                                   |

**Exemple d'utilisation :**

# Construire les images et démarrer les services
`make build up`

# Arrêter les services et supprimer les conteneurs
`make down`

# Voir les logs du frontend
`make frontend-logs`

## Développement Local (Optionnel)

Si vous souhaitez développer localement sans utiliser Docker pour le backend ou le frontend, vous pouvez suivre les étapes suivantes :

### Backend

1. Naviguez vers le répertoire `backend` : cd backend
2. Installez les dépendances : npm install ou yarn install
3. Démarrez le serveur de développement : npm start ou yarn start

### Frontend

1. Naviguez vers le répertoire `frontend` : `cd frontend`
2. Installez les dépendances : `npm install` ou `yarn install`
3. Démarrez le serveur de développement : `npm start` ou `yarn start`

**Important :**

*   Assurez-vous que la base de données est en cours d'exécution (via Docker ou installée localement).
*   Les variables d'environnement dans les fichiers `.env` du backend et du frontend doivent être configurées correctement pour le développement local.

## Technologies Utilisées

*   **Backend :**
    *   Node.js (dernière version)
    *   Express.js (ou un autre framework de votre choix)
    *   [Sequelize](https://sequelize.org/) ou [Mongoose](https://mongoosejs.com/) (selon la base de données choisie)
    *   [Jest](https://jestjs.io/) ou [Mocha](https://mochajs.org/)/[Chai](https://www.chaijs.com/) (pour les tests)
*   **Frontend :**
    *   React
    *   [Create React App](https://create-react-app.dev/) (pour initialiser le projet)
    *   [React Router](https://reactrouter.com/) (pour la navigation)
    *   [Axios](https://axios-http.com/) ou `fetch` (pour les requêtes API)
*   **Base de données :**
    *   PostgreSQL (dans le `docker-compose.yml` par défaut, mais vous pouvez utiliser MongoDB ou autre)
*   **Conteneurisation :**
    *   Docker
    *   Docker Compose

## Contribution

Les contributions sont les bienvenues ! N'hésitez pas à ouvrir une issue ou à soumettre une pull request.

## Licence

Ce projet est sous licence \[Nom de la licence] - voir le fichier `LICENSE` pour plus de détails.