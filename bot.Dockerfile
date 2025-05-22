# Utilise l'image officielle n8n
FROM n8nio/n8n

# Copie le script de démarrage dans un dossier système
COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

# Copie le reste du code dans /data
COPY . /data/

# Rends le script exécutable
RUN chmod +x /usr/local/bin/start.sh

# Expose le port n8n
EXPOSE 5678

# Commande de démarrage : lance le script qui démarre n8n + le bot
CMD ["/usr/local/bin/start.sh"]
