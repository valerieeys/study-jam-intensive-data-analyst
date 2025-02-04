-- Membuat tabel superstore dan di import dari file eksternal
CREATE TABLE superstore
(
    order_id character varying(100),
    customer_id character varying(100),
    postal_code character varying(50),
    product_id character varying(100),
    sales real,
    quantity integer,
    discount double precision,
    profit real,
    category text,
    subcategory text,
    product_name text,
    order_date date,
    ship_date date,
    ship_mode text,
    customer_name text,
    segment text,
    country text,
    city text,
    state text,
    region text
)

-- Menampilkan beberapa kolom tertentu
SELECT 
    customer_id,
    customer_name
FROM 
    superstore

-- Memfilter data dengan kondisi WHERE (filter satu nilai)
SELECT 
    customer_id,
    customer_name
FROM 
    superstore
WHERE 
    customer_name = 'Kunst Miller'

-- Memfilter data dengan kondisi WHERE (filter lebih dari satu nilai)
SELECT 
    customer_id,
    customer_name
FROM 
    superstore
WHERE 
    customer_name != 'Kunst Miller' 

-- Operator AND
SELECT 
    customer_id,
    customer_name,
    state
FROM 
    superstore
WHERE 
    customer_name = 'Kunst Miller' AND state = 'California'

-- Operator OR
SELECT 
    customer_id,
    customer_name,
    state
FROM 
    superstore
WHERE 
    customer_name = 'Kunst Miller' OR state = 'New York'

-- Operator OR (filter lebih dari satu nilai)
SELECT 
    customer_id,
    customer_name,
    state
FROM 
    superstore
WHERE 
    customer_name = 'Kunst Miller' OR state != 'New York'

-- Operator OR (3 kondisi)
SELECT 
    customer_id,
    customer_name,
    state
FROM 
    superstore
WHERE
    state = 'New York' OR state = 'California' or state = 'Texas'

-- Operator IN
SELECT 
    customer_id,
    customer_name,
    city
FROM 
    superstore
WHERE 
    city IN ('Los Angeles', 'Seattle', 'Orem')

-- Operator NOT IN
SELECT 
    customer_id,
    customer_name,
    city
FROM 
    superstore
WHERE 
    city NOT IN ('Los Angeles', 'Seattle', 'Orem')

-- Operator LIKE
SELECT 
    customer_id,
    customer_name,
    city
FROM 
    superstore
WHERE 
    city LIKE 'Los Angeles'

-- Operator LIKE (penempatan huruf di akhir)
SELECT 
    customer_id,
    customer_name,
    city
FROM 
    superstore
WHERE 
    customer_name LIKE '%r'

-- Operator LIKE (penempatan huruf di awal)
SELECT 
    customer_id,
    customer_name,
    city
FROM 
    superstore
WHERE 
    customer_name LIKE 'A%'

-- Operator LIKE (penempatan huruf di tengah dari depan)
SELECT 
    customer_id,
    customer_name,
    city
FROM 
    superstore
WHERE 
    customer_name LIKE '__r%'

-- Operator LIKE (penempatan huruf di tengah dari belakang)
SELECT 
    customer_id,
    customer_name,
    city
FROM 
    superstore
WHERE 
    customer_name LIKE '%r__'

-- Operator NOT LIKE
SELECT 
    customer_id,    
    customer_name,
    city
FROM 
    superstore
WHERE 
    city NOT LIKE 'Los Angeles'

-- Operator IS NULL (menampilkan data kosong)
SELECT 
    customer_id,    
    customer_name,
    postal_code,
    state
FROM 
    superstore
WHERE 
    postal_code IS NULL

SELECT 
    customer_id,    
    customer_name,
    postal_code,
    state
FROM 
    superstore
WHERE 
    postal_code = ''

-- Operator IS NOT NULL (menampilkan data tidak kosong)
SELECT 
    customer_id,    
    customer_name,
    postal_code,
    state
FROM 
    superstore
WHERE 
    postal_code IS NOT NULL