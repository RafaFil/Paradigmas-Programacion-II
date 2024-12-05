import pg from 'pg'
const { Pool, Client } = pg

export class Table {

    pgClient;
    tableName;

    constructor(pgClient, tableName) {
        this.pgClient = pgClient;
        this.tableName = tableName;
    }

    async fieldNames() {

    const query =  await this.pgClient.query(`
        select column_name from information_schema.columns where table_name = '${this.tableName}'
        `)


    return query.rows.map(r => r.column_name)

    }

    async pk() {

        const query = await this.pgClient.query(
            `SELECT 
            kcu.column_name AS primary_key_column
            FROM 
                information_schema.table_constraints AS tc
            JOIN 
                information_schema.key_column_usage AS kcu
            ON 
                tc.constraint_name = kcu.constraint_name
            AND 
                tc.table_schema = kcu.table_schema
            WHERE 
                tc.constraint_type = 'PRIMARY KEY'
            AND
				tc.table_name = '${this.tableName}'
            AND 
                tc.table_schema = 'public'
            ORDER BY 
                tc.table_name, kcu.ordinal_position;`
        )

        return query.rows.map(i => i.primary_key_column)


    }

    async* _select(where) {

        let whereClause;
        if (where) {
            whereClause = Object.keys(where).map(clause => {
                return `${clause} = ${where[clause]}`
            }).join("AND")
        }

        const query = await this.pgClient.query(
            `select * from ${this.tableName} ${
                where ? 'where ' + whereClause : ''
            };`
        )
        yield query.rows;
    }


}