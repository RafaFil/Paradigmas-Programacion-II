import { pluginSwitchComma } from './switch-plugin.js'
import { transformSync } from '@babel/core';
import { optimizerPlugin } from './optimizer-plugin.js'

const test1 = `
function f(x) {
  switch (x) {
    case 0: return 1;
    case 1, 2, 3: return x;
    default: return NaN;
  }
}
`;

const test2 = `
function f(x) {
  return x = 1 + 1;
}
`
const test3 = `

  function f(x) {
  
  const a = 1 + 2;
  const b = 1 * 3;
  const c = 0 * 5;
  const d = 67 + 0;
  const e = 43 - 0;
  const f = 20 / 1;


  }

`

function main() {
    const codeIn = test3;
    const {
      ast, code: codeOut,
    } = transformSync(codeIn, {
      plugins: [optimizerPlugin], 
    });
    console.log(`${codeIn}\n\n  >>>>  \n\n${codeOut}`);
  } // main
  
main();