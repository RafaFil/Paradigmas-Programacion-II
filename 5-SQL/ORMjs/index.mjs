import { Table } from './Table.mjs'
import pg from 'pg'
const { Pool, Client } = pg

const main = async () => {

    const pool = new Pool({
        user: 'postgres',
        password: 'admin',
        host: '127.0.0.1',
        port: 5432,
        database: 'dvdrental',
        })    

    const country = new Table(pool, 'country')

    const fields = await country.fieldNames()

    console.log(fields)

    const pk = await country.pk()

    console.log(pk)
    await listCountries()
    await listCountriesWhere()

    
    
}

async function listCountries() {

    const pool = new Pool({
        user: 'postgres',
        password: 'admin',
        host: '127.0.0.1',
        port: 5432,
        database: 'dvdrental',
        })    

    const country = new Table(pool, 'country');

    for await (const cont of country._select()) {
        console.log(JSON.stringify(cont))
    }
} 

async function listCountriesWhere() {

    const pool = new Pool({
        user: 'postgres',
        password: 'admin',
        host: '127.0.0.1',
        port: 5432,
        database: 'dvdrental',
        })    

    const country = new Table(pool, 'country');

    for await (const cont of country._select({
        'country_id': 1
    })) {
        console.log(JSON.stringify(cont))
    }
} 


main()