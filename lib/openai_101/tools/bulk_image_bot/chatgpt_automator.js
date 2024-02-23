const BaseAutomator = require('./base_automator');

class ChatGPTAutomator extends BaseAutomator {
  constructor(options) {
    super(options);
  }

  async sendPromptToChat(prompt) {
    const formattedPrompt = `create image: ${prompt}`;
    await this.sendKeystrokes(formattedPrompt);
    console.log(`Sending prompt "${prompt}" to ChatGPT...`);
  }

  async start() {
    console.log('Starting ChatGPT Image Creation Automation');
    const prompts = await this.readPromptsFromFile();
    for (const prompt of prompts) {
      await this.sendPromptToChat(prompt);
      await this.waitInterval();
      await this.removeFromInputPromptFile(prompt);
      await this.appendToCompletedPromptFile(prompt);
    }
    console.log('Automation complete.');
  }
}

module.exports = ChatGPTAutomator;
