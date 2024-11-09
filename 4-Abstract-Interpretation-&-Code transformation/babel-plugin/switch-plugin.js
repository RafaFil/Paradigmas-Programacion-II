// Check <https://babeljs.io/docs/babel-types>.
export function pluginSwitchComma({ types: t }) {
  return {
    visitor: {
      SwitchStatement(path) {
        path.node.cases = [...(function* () {
          for (const c of path.node.cases) {
            if (c.test?.type === 'SequenceExpression') {
              for (const caseTest of c.test.expressions.slice(0, -1)) {
                yield t.switchCase(caseTest, []);
              }
              yield t.switchCase(c.test.expressions.at(-1), c.consequent);
            } else {
              yield c;
            }
          }
        })()];
      }
    } // visitor
  };
}; // function pluginSwitchComma

