const fs = require('fs');
const { promisify } = require('util');
const robot = require("robotjs");

const wait = promisify(setTimeout);

class BaseAutomator {
  constructor({ file, completedFile, interval = 5, maxImages = 20 }) {
    this.file = file;
    this.completedFile = completedFile;
    this.interval = interval;
    this.maxImages = maxImages;
  }

  async readPromptsFromFile() {
    try {
      const content = await fs.promises.readFile(this.file, 'utf-8');
      return content.split('\n').filter(Boolean).slice(0, this.maxImages);
    } catch (error) {
      console.error('Error reading prompts from file:', error);
      return [];
    }
  }

  async appendToCompletedFile(prompt) {
    try {
      await fs.promises.appendFile(this.completedFile, `${prompt}\n`);
    } catch (error) {
      console.error('Error appending prompt to completed file:', error);
    }
  }

  async removeFromInputFile(prompt) {
    try {
      let prompts = await this.readPromptsFromFile();
      prompts = prompts.filter(line => line !== prompt);
      await fs.promises.writeFile(this.file, prompts.join('\n'));
    } catch (error) {
      console.error('Error removing prompt from input file:', error);
    }
  }

  async waitInterval() {
    await wait(this.interval * 1000);
  }

  async sendKeystrokes(string) {
    robot.typeString(string);
    robot.keyTap('enter');
  }
}

module.exports = BaseAutomator;
