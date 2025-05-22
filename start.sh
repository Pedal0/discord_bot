#!/bin/sh
# Définit le port à utiliser (Render fournit $PORT, sinon 5678)
N8N_PORT=${PORT:-5678}
N8N_HOST=0.0.0.0

# Lancer n8n en arrière-plan avec le bon port
n8n start --tunnel --port $N8N_PORT --host $N8N_HOST &
# Lancer le bot Node.js
node index.js
