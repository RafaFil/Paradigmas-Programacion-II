// Pliegue de constantes
// 4 o mas simplificaciones algebraicas

export function optimizerPlugin({ types: t }) {
    return {
        visitor: {
            BinaryExpression: {
                exit(path) {
                    const { node } = path;
                    const {left,right} = node
                        if (t.isNumericLiteral(left) && t.isNumericLiteral(right)) { // Pliegue de constantes

                            const res = eval(`${left.value}${node.operator}${right.value}`)
                            path.replaceWith(t.numericLiteral(res))
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
                        else if (node.operator === '+') {
                            if (t.isNumericLiteral(left) && left.value === 0) {
                                path.replaceWith(right);
                            } else if (t.isNumericLiteral(right) && right.value === 0) {
                                path.replaceWith(left);
                            }
                        } else if (node.operator === '-') {
                            if (t.isNumericLiteral(right) && right.value === 0) {
                                path.replaceWith(left);
                            }
                        }
                        else if (node.operator === '/') {
                            if (t.isNumericLiteral(right) && right.value === 1) {
                                path.replaceWith(left);
                            }
                        }
                }
            }
        }
    }
}

