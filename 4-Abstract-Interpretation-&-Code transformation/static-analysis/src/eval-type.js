import readline from 'node:readline';
import { parse } from '@babel/core';
import { bExpCheck } from './bexp-check.js';
import { aExpCheck } from './aexp-check.js'

export function evalType(exp, symbols) {
    if (typeof exp === 'string') {
      exp = parse(`(${exp})`)?.program?.body?.[0]?.expression;
    }
    switch (exp.type) {
      case 'NumericLiteral': {
        return 'number';
      }
      case 'StringLiteral': {
        return 'string';
      } 
      case 'BooleanLiteral': {
        return 'boolean';
      }
      case 'BinaryExpression': {
        const leftType = evalType(exp.left, symbols);
        const rightType = evalType(exp.right, symbols);
        const { operator } = exp
        return aExpCheck(leftType, rightType, operator)
      }
      case 'LogicalExpression': {
        const leftType = evalType(exp.left, symbols);
        const rightType = evalType(exp.right, symbols);
        const { operator } = exp
        return bExpCheck(leftType, rightType, operator)
      }
      case 'UnaryExpression': {
        const argumentType = evalType(exp.argument)
        const { operator } = exp
        return bExpCheck(argumentType, '', operator)
      }

      default: throw new SyntaxError(`Nodes ${exp.type} not supported yet!`);
    }
  } // function evalType