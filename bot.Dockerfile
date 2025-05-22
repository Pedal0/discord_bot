# Utilise l'image officielle n8n
FROM n8nio/n8n

# Copie tout le code dans /data
COPY . /data/

WORKDIR /data

EXPOSE 5678

# Commande de démarrage : lance le script Node.js qui démarre n8n + le bot
CMD ["node", "launcher.js"]
