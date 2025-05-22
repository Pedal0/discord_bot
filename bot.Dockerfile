# Utilise l'image officielle Node.js légère
FROM node:22-alpine

# Installe n8n globalement
RUN npm install -g n8n

WORKDIR /app

# Installe les dépendances du projet
COPY package*.json ./
RUN npm install --omit=dev

# Copie tout le code
COPY . .

EXPOSE 5678

# Commande de démarrage : lance le script Node.js qui démarre n8n + le bot
CMD ["node", "launcher.js"]
