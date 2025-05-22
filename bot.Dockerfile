# Utilise l'image officielle n8n
FROM n8nio/n8n

# Copie tout le code dans /data (y compris start.sh)
COPY . /data/

EXPOSE 5678

# Commande de démarrage : lance le script via sh (pas besoin de chmod)
CMD ["sh", "/data/start.sh"]
