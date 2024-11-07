import readline from 'node:readline';
import { parse } from '@babel/core';
import { evalType } from './eval-type.js'

async function main() {
  const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
    terminal: true,
  });
  rl.on('line', (line) => {
    if (line.trim().length > 0) {
      console.log(`typeof ${line} >>>> ${evalType(line)}`);
    } else {
      process.exit();
    }
  });
} // main

main();