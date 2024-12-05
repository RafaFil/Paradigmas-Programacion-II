import pg from 'pg'
// import { MermaidGenerator } from './memraid_generator.mjs'
const { Pool, Client } = pg

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
 
const pool = new Pool({
  user: 'postgres',
  password: 'admin',
  host: '127.0.0.1',
  port: 5432,
  database: 'dvdrental',
})

const getColunas = async () =>{
  return await pool.query(`SELECT 
    c.column_name, 
    c.table_name, 
    c.data_type,
    ccu.table_name AS referenced_table,
    kcu.column_name AS primary_key_column -- Agrego el field de pk
    FROM 
        information_schema.columns AS c
    LEFT JOIN 
        information_schema.key_column_usage AS kcu
    ON 
        c.table_name = kcu.table_name
    AND 
        c.column_name = kcu.column_name
    AND 
        c.table_schema = kcu.table_schema
    LEFT JOIN 
        information_schema.table_constraints AS tc
    ON 
        kcu.constraint_name = tc.constraint_name
    AND 
        (tc.constraint_type = 'FOREIGN KEY' OR tc.constraint_type = 'PRIMARY KEY') -- Agrego restriccion de pk
    AND 
        tc.table_schema = c.table_schema
    LEFT JOIN 
        information_schema.constraint_column_usage AS ccu
    ON 
        tc.constraint_name = ccu.constraint_name
    WHERE 
        c.table_catalog = 'dvdrental'
    AND 
        c.table_schema = 'public'
    ORDER BY 
    c.table_name, c.column_name;`)
}
 


const tables = {} // key {colum: string, type: string}
const foreignTables = {}
const pks = {}

const rows = (await getColunas()).rows

for (const row of rows) {
  const { column_name, table_name, data_type, referenced_table, primary_key_column } = row

  if(tables[table_name]) {

    tables[table_name].push({
      column: column_name.replaceAll(" ",'_'),
      type: data_type.replaceAll(" ",'_')
    })
  }
  else {
    tables[table_name] = [{
      column: column_name.replaceAll(" ",'_'),
      type: data_type.replaceAll(" ",'_')
    }]
  }

  if(referenced_table !== null) {
    if(foreignTables[table_name]) {
      foreignTables[table_name].push(referenced_table.replaceAll(" ",'_'))
    }
    else {
      foreignTables[table_name] = [referenced_table.replaceAll(" ",'_')]
    }
  }

  if(primary_key_column !== null) {
    if(pks[table_name]) {
      pks[table_name].push(primary_key_column.replaceAll(" ",'_'))
    }
    else{
      pks[table_name] = [primary_key_column.replaceAll(" ", "_")]
    }
  }

}

console.log(tables,foreignTables,pks)

const a = MermaidGenerator(tables, foreignTables,pks)

console.log(a)