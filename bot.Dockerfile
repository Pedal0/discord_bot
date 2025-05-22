# Choisir une image Node.js de base (Alpine est légère)
FROM node:22-alpine

# Définir le répertoire de travail dans le conteneur
WORKDIR /usr/src/app

# Copier package.json et package-lock.json (si existant)
# Cela permet de profiter du cache Docker si seulement le code change mais pas les dépendances
COPY package*.json ./

# Installer les dépendances de production
RUN npm install --omit=dev

# Copier le reste du code de l'application
COPY . .

# La commande pour lancer votre bot
CMD [ "node", "index.js" ]
