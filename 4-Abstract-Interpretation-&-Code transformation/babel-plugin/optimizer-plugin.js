// Pliegue de constantes
// 4 o mas simplificaciones algebraicas

import generator from "@babel/generator";

const generate = generator.default;

export function optimizerPlugin({ types: t }) {
    return {
        visitor: {
            BinaryExpression: {
                exit(path) {
                    const { node } = path;
                    const {left,right} = node
                    if (left.type.includes('Literal') && right.type.includes('Literal')) { //Pliegue constantes
                        const output = generate(node).code
                        const res = eval(output)
                        path.replaceWith(t.valueToNode(res))
                    }
                    else if(node.operator === '*') { // algebraicas
                        if(t.isNumericLiteral(left) && left.value === 1){
                            path.replaceWith(t.numericLiteral(right.value))
                        }else if (t.isNumericLiteral(right) && right.value === 1){
                            path.replaceWith(t.numericLiteral(left.value))
                        }
                        if(t.isNumericLiteral(left) && left.value === 0){
                            path.replaceWith(t.numericLiteral(0))
                        }else if (t.isNumericLiteral(right) && right.value === 0){
                            path.replaceWith(t.numericLiteral(0))
                        }
                    }
                    // else if (node.operator === '+') {
                    //     if (t.isNumericLiteral(left) && left.value === 0) {
                    //         path.replaceWith(right);
                    //     } else if (t.isNumericLiteral(right) && right.value === 0) {
                    //         path.replaceWith(left);
                    //     }
                    // } 
                    else if (node.operator === '-') {
                        if (t.isNumericLiteral(right) && right.value === 0) {
                            path.replaceWith(left);
                        }
                    }
                    else if (node.operator === '/') {
                        if (t.isNumericLiteral(right) && right.value === 1) {
                            path.replaceWith(left);
                        }
                    }
                    else if((t.isNumericLiteral(left) && isNaN(left.value)) || (t.isNumericLiteral(right) && isNaN(right.value))) {
                        path.replaceWith(t.numericLiteral(NaN));
                    }
                }
            },
            LogicalExpression: {
                exit(path) {
                    const { node } = path;
                    const {left,right} = node;
                    if (left.type.includes('Literal') && right.type.includes('Literal')) { //Pliegue constantes
                        const output = generate(node).code
                        const res = eval(output)
                        path.replaceWith(t.booleanLiteral(res))
                    }
                }
            },
            UnaryExpression: {
                exit(path) {
                    const { node } = path;
                    const { argument, operator } = node;
                    if (operator === "!") {
                        path.replaceWith(t.booleanLiteral(!argument.value));
                    }
                }
            },
            IfStatement : {
                exit(path) {
                    const { node } = path;
                    const { test, consequent, alternate } = node;
                    const output = generate(test).code
                    const res = eval(output)
                    console.log(node)
                    console.log(res)
                    if(res) {
                        path.replaceWith(t.blockStatement(consequent.body))
                    }
                    else {
                        if(alternate) {
                            path.replaceWith(t.blockStatement(alternate.body))
                        }
                        else {
                            path.replaceWith(t.blockStatement([]))
                        }
                    }
                }
            },
            WhileStatement : {
                exit (path) {
                    const { node } = path;
                    const { test } = node
                    const output = generate(test).code
                    const res = eval(output)
                    if(!res) {
                        path.replaceWith(t.blockStatement([]))
                    }
                }
            }
        }
    }
}

