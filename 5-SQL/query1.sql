SELECT 
    c.column_name, 
    c.table_name, 
    c.data_type,
    ccu.table_name AS referenced_table
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
        tc.constraint_type = 'FOREIGN KEY'
    AND 
        tc.table_schema = c.table_schema
    AND
        tc.constraint_type = 'PRIMARY KEY' -- Agrego restriccion de pk
    LEFT JOIN 
        information_schema.constraint_column_usage AS ccu
    ON 
        tc.constraint_name = ccu.constraint_name
    WHERE 
        c.table_catalog = 'dvdrental'
    AND 
        c.table_schema = 'public'
    ORDER BY 
    c.table_name, c.column_name;