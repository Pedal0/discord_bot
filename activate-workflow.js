const axios = require('axios');

const N8N_URL = process.env.N8N_URL || 'http://localhost:5678';
const WORKFLOW_NAME = 'discord bot';

async function tryActivateWorkflow(retries = 10) {
  for (let i = 0; i < retries; i++) {
    try {
      const { data } = await axios.get(`${N8N_URL}/rest/workflows`);
      const workflow = data.data.find(wf => wf.name === WORKFLOW_NAME);
      if (!workflow) {
        console.log(`[${i+1}/${retries}] Workflow not found, retrying in 5s...`);
        await new Promise(res => setTimeout(res, 5000));
        continue;
      }
      if (workflow.active) {
        console.log('Workflow already active');
        return;
      }
      await axios.post(`${N8N_URL}/rest/workflows/${workflow.id}/activate`);
      console.log('Workflow activated!');
      return;
    } catch (err) {
      console.log(`[${i+1}/${retries}] Error: ${err.message}, retrying in 5s...`);
      await new Promise(res => setTimeout(res, 5000));
    }
  }
  console.error('Failed to activate workflow after several attempts.');
  process.exit(1);
}

setTimeout(tryActivateWorkflow, 10000); // Attend 10s que n8n soit prêt
