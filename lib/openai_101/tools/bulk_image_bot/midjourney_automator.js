const BaseAutomator = require('./base_automator');
const fs = require('fs');
const robot = require("robotjs");

class MidJourneyAutomator extends BaseAutomator {
  constructor(options) {
    super(options);
  }

  async sendPromptToDiscord(prompt) {
    const formattedPrompt = this.formatPrompt(prompt);
    this.sendKeystrokes(formattedPrompt);
  }

  formatPrompt(prompt) {
    return `/imagine prompt: ${prompt}`;
  }

  sendKeystrokes(string) {
    robot.typeString(string);
    robot.keyTap('enter');
  }

  async start() {
    console.log('Starting MidJourney Automation');
    console.log('Please open Discord and navigate to the MidJourney channel.');
    console.log('Automation will begin in 10 seconds.');
    await this.wait(10 * 1000);

    let index = 0;
    let prompt = await this.readNextPromptFromFile();
    while (prompt) {
      console.log(`Sending prompt "${prompt}"...`);
      await this.sendPromptToDiscord(prompt);
      await this.wait(this.interval * 1000);
      await this.removePromptFromFile(prompt);
      await this.appendToCompletedFile(this.completedFile, prompt);
      index++;
      if (index % this.maxImages === 0) {
        console.log(`Pausing for ${this.waitBetweenSessions} seconds.`);
        await this.wait(this.waitBetweenSessions * 1000);
      }
      prompt = await this.readNextPromptFromFile();
    }
    console.log('Automation complete.');
  }
}

module.exports = MidJourneyAutomator;
