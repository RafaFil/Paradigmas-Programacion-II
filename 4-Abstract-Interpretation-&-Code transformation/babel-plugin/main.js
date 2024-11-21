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
  const g = 1 > 10;

  }

`

const test4 = `

  function f(x) {
  
    const y = x * 0;

  }

`

const test5 = `

  function f(x) {
    const a = 1 + 2;
    const b = 1 * 3;
    const c = 0 * 5;
    const e = 43 - 0;
    const f = 20 / 1;

    const asd = 10 > 20;

    const logical = true && false;

    const y = 150
    const multZero = y * 0;

    const unary = !false

    if (true) {
      const a = 5;
    }
    else {
      const a = 7;
    }

    while(10 < 0) {
      const p = 15;
    }

  }

`

const test6 = `

function f(x) {
  if (true) {
    const a = 5;
  }
  else {
    const a = 7;
  }
}
`

const test7 = `

function f(x) {
  while(10 < 0) {
  
  }
}
`


function main() {
    const codeIn = test5;
    const {
      ast, code: codeOut,
    } = transformSync(codeIn, {
      plugins: [optimizerPlugin], 
    });
    console.log(`${codeIn}\n\n  >>>>  \n\n${codeOut}`);
  } // main
  
main();