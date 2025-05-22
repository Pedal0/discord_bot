# Utilise l'image officielle n8n
FROM n8nio/n8n

# Copie tout le code dans le conteneur
COPY . /data/

# Rends le script exécutable
RUN chmod +x /data/start.sh

# Expose le port n8n
EXPOSE 5678

# Commande de démarrage : lance le script qui démarre n8n + le bot
CMD ["/data/start.sh"]
