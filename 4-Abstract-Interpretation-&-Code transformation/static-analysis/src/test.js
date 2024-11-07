import {numericLiteral,
    stringLiteral,
    booleanLiteral,
    binaryExpression,
    logicalExpression,
    unaryExpression} from '@babel/types'

import { evalType } from './eval-type.js'

const testCases = [
    {
        expression: numericLiteral(42),
        expectedResult: 'number' 
    },
    {
        expression: stringLiteral("ola"),
        expectedResult: 'string'
    },
    {
        expression: booleanLiteral(true),
        expectedResult: 'boolean'
    },
    {
        expression: binaryExpression(
            "+",
            numericLiteral(10), 
            numericLiteral(20)
        ),
        expectedResult: 'number'
    },
    {
        expression: binaryExpression(
            "+",
            numericLiteral(10), 
            stringLiteral("20")
        ),
        expectedResult: 'string'
    },
    {
        expression: binaryExpression(
            "*",
            numericLiteral(10), 
            stringLiteral("20")
        ),
        expectedResult: 'string'
    },
    {
        expression: logicalExpression(
            "&&",
            booleanLiteral(true),
            booleanLiteral(false)
        ),  
        expectedResult: 'boolean'
    },
    {
        expression: logicalExpression(
            "||",
            numericLiteral(10), 
            numericLiteral(20)
        ),  
        expectedResult: 'number'
    },
    {
        expression: logicalExpression(
            "&&",
            booleanLiteral(true),
            booleanLiteral(false)
        ),  
        expectedResult: 'boolean'
    },
    {
        expression: unaryExpression(
            "!", 
            booleanLiteral(true)
        ), 
        expectedResult: 'boolean'
    }
]

const executeTest = () => {

    let testCount = 1;
    for (const test of testCases) {
        console.log(`Running Test ${testCount}:`);
        const result = evalType(test.expression); 
        console.log(`Expression: ${JSON.stringify(test.expression)}`);
        console.log(`Expected Result: ${test.expectedResult}`);
        console.log(`Evaluated Result: ${result}`);
        
        if (result === test.expectedResult) {
            console.log("Test Passed!\n");
        } else {
            console.log("Test Failed!\n");
        }
        
        testCount++;
    }
}

executeTest()