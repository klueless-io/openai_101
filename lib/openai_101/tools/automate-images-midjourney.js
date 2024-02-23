const { Command } = require('commander');
const fs = require('fs');
const robot = require("robotjs");

const program = new Command();

program
  .option('-f, --file <filename>', 'The file to read prompts from', 'prompts.txt')
  .option('-o, --completed-file <filename>', 'The file to write completed prompts to', 'completed.txt')
  .option('-i, --interval <seconds>', 'The interval in seconds between prompts', 4)
  .option('-p, --prompts-per-session <prompts>', 'The number of prompts to process in a session', 7)
  .option('-w, --wait-between-sessions <seconds>', 'The number of seconds to wait between sessions', 180);

program.parse(process.argv);

function read_next_prompt_from_file(file) {
  const prompts = fs.readFileSync(file, 'utf-8').split('\n').filter(Boolean);
  return prompts.shift();
}

function remove_prompt_from_file(file, prompt) {
  const lockfile = `${file}.lock`;
  fs.writeFileSync(lockfile, '', { flag: 'wx' });
  const prompts = fs.readFileSync(file, 'utf-8').split('\n').filter(Boolean);
  const index = prompts.indexOf(prompt);
  prompts.splice(index, 1);
  fs.writeFileSync(file, prompts.join('\n'));
  fs.unlinkSync(lockfile);
}

function append_prompt_to_file(file, prompt) {
  const lockfile = `${file}.lock`;
  fs.writeFileSync(lockfile, '', { flag: 'wx' });
  fs.appendFileSync(file, `${prompt}\n`);
  fs.unlinkSync(lockfile);
}

function wait(ms) {
  const end = Date.now() + ms;
  while (Date.now() < end) {
    // Wait
  }
}

function send_prompt_to_discord(prompt) {
  const formattedPrompt = `/imagine prompt: ${prompt}`;
  robot.typeString(formattedPrompt);
  robot.keyTap('enter');
}

function start() {
  console.log('Starting MidJourney Automation');
  console.log('Please open Discord and navigate to the MidJourney channel.');
  console.log('Automation will begin in 10 seconds.');
  wait(10 * 1000);

  let index = 0;
  let prompt = read_next_prompt_from_file(program.opts().file);
  while (prompt) {
    console.log(`Sending prompt "${prompt}"...`);
    send_prompt_to_discord(prompt);
    wait(program.opts().interval * 1000);
    remove_prompt_from_file(program.opts().file, prompt);
    append_prompt_to_file(program.opts().completedFile, prompt);
    index++;
    if (index % program.opts().promptsPerSession === 0) {
      console.log(`Pausing for ${program.opts().waitBetweenSessions} seconds.`);
      wait(program.opts().waitBetweenSessions * 1000);
    }
    prompt = read_next_prompt_from_file(program.opts().file);
  }
  console.log('Automation complete.');
}

start();
