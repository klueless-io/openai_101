const { Command } = require('commander');
const fs = require('fs');
const robot = require("robotjs");

const program = new Command();

program
  .option('-f, --file <filename>', 'The file to read prompts from', 'prompts.txt')
  .option('-o, --completed-file <filename>', 'The file to write completed prompts to', 'completed.txt')
  .option('-i, --interval <seconds>', 'The interval in seconds between prompts', 80)
  .option('-m, --max-images <number>', 'The maximum number of images to process', 20);

program.parse(process.argv);

function read_prompts_from_file(file, maxImages) {
  const prompts = fs.readFileSync(file, 'utf-8').split('\n').filter(Boolean);
  return prompts.slice(0, maxImages);
}

function remove_prompt_from_file(file, prompt) {
  const prompts = fs.readFileSync(file, 'utf-8').split('\n').filter(Boolean);
  const index = prompts.indexOf(prompt);
  if (index !== -1) {
    prompts.splice(index, 1);
    fs.writeFileSync(file, prompts.join('\n'));
  }
}

function append_prompt_to_file(file, prompt) {
  fs.appendFileSync(file, `${prompt}\n`);
}

function wait(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

async function send_prompt_to_chat(prompt) {
  const formattedPrompt = `create image: ${prompt}`;
  robot.typeString(formattedPrompt);
  robot.keyTap('enter');
}

async function start() {
  console.log('Starting Image Creation Automation');
  console.log('Please open the ChatGPT interface where you intend to use this script.');
  console.log('Automation will begin in 10 seconds.');
  await wait(10000);

  const prompts = read_prompts_from_file(program.opts().file, parseInt(program.opts().maxImages));
  for (let prompt of prompts) {
    console.log(`Sending prompt "${prompt}"...`);
    await send_prompt_to_chat(prompt);
    await wait(program.opts().interval * 1000);
    remove_prompt_from_file(program.opts().file, prompt);
    append_prompt_to_file(program.opts().completedFile, prompt);
  }
  console.log('Automation complete.');
}

start();
