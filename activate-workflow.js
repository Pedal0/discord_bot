const axios = require('axios');

const N8N_URL = process.env.N8N_URL || 'http://localhost:5678';
const WORKFLOW_NAME = 'discord bot';

async function activateWorkflow() {
  try {
    // Récupère la liste des workflows
    const { data } = await axios.get(`${N8N_URL}/rest/workflows`);
    const workflow = data.data.find(wf => wf.name === WORKFLOW_NAME);
    if (!workflow) {
      console.error('Workflow not found');
      process.exit(1);
    }
    if (workflow.active) {
      console.log('Workflow already active');
      return;
    }
    // Active le workflow
    await axios.post(`${N8N_URL}/rest/workflows/${workflow.id}/activate`);
    console.log('Workflow activated!');
  } catch (err) {
    console.error('Error activating workflow:', err.message);
    process.exit(1);
  }
}

setTimeout(activateWorkflow, 10000); // Attend 10s que n8n soit prêt
