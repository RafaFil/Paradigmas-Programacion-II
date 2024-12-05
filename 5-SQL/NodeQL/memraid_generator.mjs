export const MermaidGenerator = (tables, foreignKeys, pks) => {
    let mermaidCode = 'erDiagram\n';
    for (const table in tables) {
        const columns = tables[table];
        mermaidCode += `    ${table} {\n`;
        columns.forEach(column => {
            const pk = pks[table] ? pks[table].includes(column.column) : false
            mermaidCode += `${column.column} ${column.type} ${pk ? 'PK': ''}\n` ;
        });
        mermaidCode += '    }\n';
    }
    for (const table in foreignKeys) {
        const foreignRelations = foreignKeys[table];
        foreignRelations.forEach(fk => {
            mermaidCode += `    ${table} }|..|{ ${fk} : "${fk}"\n`;
        });
    }

    return mermaidCode;
}
