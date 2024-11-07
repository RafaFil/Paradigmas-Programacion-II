const validOperands = ['==','!=', '<','>','<=','>=','!','&&','||']

export function bExpCheck(leftType, rightType, operand) {
    console.log(leftType, rightType, operand)
    if (!validOperands.includes(operand)) {
        throw new SyntaxError(`Nodes ${exp.type} not supported yet!`);
    }

    if(['==','!=', '<','>','<=','>=','!'].includes(operand)) {
        return 'boolean'
    }
    else {
        if(leftType === rightType) {
            return leftType
        }
        else {
            throw new TypeError(`Cannot resolve ${leftType} ${operand} ${rightType}`);
        }
     }
    
}