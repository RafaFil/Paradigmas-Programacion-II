SELECT 
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
                tc.table_name, kcu.ordinal_position;