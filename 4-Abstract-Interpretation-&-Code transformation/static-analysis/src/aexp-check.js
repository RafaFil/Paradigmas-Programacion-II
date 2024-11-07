const validOperands = ['+','-','*','/','%']
const alwaysEvalNumber = ['-','*','/','%']

export function aExpCheck(leftType, rightType, operand) {
    if(!validOperands.includes(operand)) {
        throw new SyntaxError(`Nodes ${exp.type} not supported yet!`);
    }
    else {
        if((leftType === rightType) || alwaysEvalNumber.includes(operand)) {
            return 'number'
        }
        else {
            if (leftType === 'string' || rightType === 'string') {
                return 'string'
            }
            else {
                return 'number'
            }

        }
        
    }
}