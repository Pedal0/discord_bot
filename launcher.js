const { spawn } = require('child_process');

// Lance n8n en arrière-plan
const n8n = spawn('n8n', ['start'], { stdio: 'inherit' });

// Lance le bot Discord
const bot = spawn('node', ['index.js'], { stdio: 'inherit' });

// Si l'un des deux process meurt, on arrête tout
n8n.on('exit', code => process.exit(code));
bot.on('exit', code => process.exit(code));
