# Utilise l'image officielle n8n
FROM n8nio/n8n

# Définir le répertoire de travail dans le conteneur
WORKDIR /usr/src/app

# Copier package.json et package-lock.json (si existant)
# Cela permet de profiter du cache Docker si seulement le code change mais pas les dépendances
COPY package*.json ./

# Installer les dépendances de production
RUN npm install --omit=dev

# Copier le reste du code de l'application
COPY . .

# Rends le script exécutable
RUN chmod +x /data/start.sh

# Expose le port n8n
EXPOSE 5678

# La commande pour lancer votre bot
CMD ["/data/start.sh"]
