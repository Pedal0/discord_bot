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

# Copie le workflow et les credentials dans le dossier d'import automatique de n8n
RUN mkdir -p /app/import
COPY discord_bot.json /app/import/
COPY credentials.json /app/import/

EXPOSE 5678

# Variables d'environnement pour import automatique
ENV N8N_IMPORT_EXPORT_DIR=/app/import
ENV N8N_IMPORT_CREDS_OVERWRITE=true

# Commande de démarrage : lance le script Node.js qui démarre n8n + le bot
CMD ["node", "launcher.js"]
