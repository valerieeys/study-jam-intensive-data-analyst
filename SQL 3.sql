-- Membuat tabel customer dan di import dari file eksternal
CREATE TABLE customer
(
    customer_id character varying(100),
    customer_name text,
    segment text
)

-- Membuat tabel product dan di import dari file eksternal
CREATE TABLE product
(
    product_id character varying(100),
    category text,
    subcategory text,
    product_name text
)

-- Membuat tabel region dan di import dari file eksternal
CREATE TABLE region
(
    country text,
    city text,
    state text,
    postal_code character varying(20),
    region text
)

-- Membuat tabel shipment dan di import dari file eksternal
CREATE TABLE shipment
(
    order_id character varying(100),
    order_date date,
    ship_date date,
    ship_mode text
)

-- Membuat tabel orders dan di import dari file eksternal
CREATE TABLE orders
(
    order_id character varying(100),
    customer_id character varying(100),
    postal_code character varying(20),
    sales real,
    quantity integer,
    discount double precision,
    profit real
)

-- operator matematika untuk perbandingan
-- >, <, >=, <=, ==, !=

-- Menampilkan baris transaksi yang merugikan (yang artinya profit < 0)
SELECT 
    *
FROM
    superstore
WHERE
    profit < 0

SELECT 
    *
FROM
    superstore
WHERE
    profit <= 0 -- kurang dari sama dengan, maka 0 akan masuk di tampilan

-- Ada permainan ekstrim, dan tinggi badan untuk menaiki permainan tersebut harus lebih dari 130
-- tinggi badan > 130
-- 1. Ada anak A dengan tinggi badan 155
-- 2. Ada anak B dengan tinggi badan 120

-- Filter transaksi yang dimana sales berada di angka berkisar 1000 - 2000
SELECT 
    *
FROM
    superstore
WHERE
    sales >= 1000 AND sales <= 2000

-- Nilai diantara 1000 - 2000 menggunakan klausa BETWEEN
SELECT
    *
FROM
    superstore
WHERE
    sales BETWEEN 1000 AND 2000

-- Query transaksi mulai awal bulan januari 2019
SELECT
    *
FROM
    superstore
WHERE
    order_date >= '2019-01-01'

-- Menampilkan transaksi yang terjadi di 2019
-- Q1 januari - maret
SELECT
    order_date
FROM
    superstore
WHERE
    order_date >= '2019-01-01' AND order_date <= '2019-03-31'

SELECT
    order_date
FROM
    superstore
WHERE
    order_date BETWEEN '2019-01-01' AND '2019-03-31'
-- Q2 april - juni
-- Q3 juli - september
-- Q4 oktober - desember

-- Menampilkan data transaksi selama tahun 2019

-- Extract
SELECT 
    *
FROM
    superstore
WHERE
    EXTRACT(YEAR FROM order_date) = 2019

-- Penggunaan BETWEEN dengan teks atau string
SELECT
    customer_name
FROM
    superstore
WHERE
    customer_name BETWEEN 'Ahmad' AND 'Budi'

-- Penggunaan SELECT DISTINCT untuk menampilkan row yang berbeda
SELECT DISTINCT 
    customer_name 
FROM 
    superstore 
WHERE 
    city = 'Los Angeles'

-- Menampilkan row yang berbeda
SELECT DISTINCT 
    customer_name 
FROM 
    superstore

SELECT DISTINCT 
    category 
FROM 
    superstore

SELECT DISTINCT 
    category, subcategory
FROM 
    superstore

-- Klausa ORDER BY untuk mengurutkan data
-- ASC -> ascending -> menaik
-- DESC -> descending -> menurun

-- Secara default ORDER BY akan mengurutkan kolom secara ascending
-- Menampilkan semua kolom dari tabel, diurutkan dari sales terbesar
SELECT
    *
FROM
    superstore
ORDER BY
    sales DESC

--Mengurutkan berdasarkan tanggal order terbaru, dan nama sesuai urutan abjad dari depan
SELECT
    *
FROM
    superstore
ORDER BY
    order_date DESC,
    customer_name ASC

SELECT
    *
FROM
    superstore
ORDER BY
    customer_name,
    order_date DESC

-- Limit digunakan untuk membatasi banyaknya baris yang muncul
-- n baris teratas
SELECT
    *
FROM
    superstore
LIMIT
    5

-- Menampilkan 50 baris transaksi terbaru
SELECT
    *
FROM
    superstore
ORDER BY
    order_date DESC
LIMIT
    50

-- Extract
SELECT 
    *
FROM
    superstore
WHERE
    EXTRACT(YEAR FROM order_date) = 2019

-- Timestamp
SELECT 
	order_date,
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date),
    EXTRACT(day FROM order_date),
    now(),
    now() - order_date,
    extract(days from now() - order_date)
FROM
	superstore

-- Fungsi Agregat digunakan untuk menghitung nilai
-- SUM, AVG, COUNT, MAX, MIN

-- COUNT
-- Menghitung banyak konsumen yang bertransaksi di tahun 2020
SELECT 
    count(DISTINCT customer_name) as jumlah_customer 
FROM 
    superstore
where 
    EXTRACT(YEAR FROM order_date) = 2020

-- MIN
-- Menghitung transaksi terkecil
SELECT 
    min(sales) as min_transaksi
FROM 
    superstore

-- MAX
-- Menghitung transaksi terbesar
SELECT 
    max(sales) as max_transaksi
FROM 
    superstore

-- SUM
-- Menghitung total transaksi penjualan
SELECT 
    sum(sales) as total_transaksi
FROM 
    superstore

-- Menghitung total quantity yang terjuan dan total profit
SELECT 
    sum(quantity) as total_quantity,
    sum(profit) as total_profit
FROM 
    superstore

-- AVG
-- Menghitung rata-rata transaksi penjualan
SELECT 
    avg(sales) as rata_rata_transaksi
FROM 
    superstore

-- GROUP BY
-- Mengelompokkan data berdasarkan kolom tertentu
-- Menampilkan total quantity dan total profit berdasarkan category
SELECT 
    category,
    sum(quantity) as total_quantity,
    sum(profit) as total_profit
FROM 
    superstore
GROUP BY
    category

-- Menampilkan total penjualan berdasarkan negara bagian
SELECT 
    city,
    sum(sales) as total_transaksi
FROM 
    superstore
GROUP BY
    city

-- Cari kota mana dengan penjualan terbesar
SELECT 
    city,
    sum(sales) as total_transaksi
FROM 
    superstore
GROUP BY
    city
ORDER BY
    total_transaksi DESC

SELECT 
    city, 
    category, 
    round(sum(sales)::NUMERIC,2) as total_sales 
FROM 
    superstore 
GROUP by 
    city, 
    category

SELECT 
    city, 
    category, 
    cast(sum(sales) as int) as total_sales 
FROM 
    superstore 
GROUP by 
    city, 
    category

-- Menampilkan konsumen yang paling kaya, dan dihitung berdasarkan banyak transaksi
SELECT 
    customer_name, 
    count(DISTINCT order_id) as jumlah_transaksi 
FROM 
    superstore
GROUP by 
    1 
ORDER BY 
    2 DESC
LIMIT 
    1

-- Membuktikan bahwa semua konsumen mempunyai 1 id
SELECT 
    customer_name, 
    count(DISTINCT customer_id) as banyak_cust_id 
FROM 
    superstore
GROUP by 
    customer_name 
ORDER BY 
    banyak_cust_id DESC

-- Menampilkan data orang kaya yang dimana total sales lebih dari 100000
-- Hitung total sales untuk setiap orang


CREATE TABLE Mahasiswa (
    id_mahasiswa INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(100) NOT NULL,
    nim VARCHAR(15) UNIQUE NOT NULL,
    jurusan VARCHAR(50),
    angkatan YEAR
);

CREATE TABLE Dosen (
    id_dosen INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(100) NOT NULL,
    nip VARCHAR(20) UNIQUE NOT NULL,
    fakultas VARCHAR(50),
    bidang_keahlian VARCHAR(100)
);

-- Insert data dummy ke dalam tabel Mahasiswa
INSERT INTO Mahasiswa (nama, nim, jurusan, angkatan) VALUES
('Budi Santoso', '220001', 'Informatika', 2022),
('Siti Aminah', '220002', 'Sistem Informasi', 2022),
('Rizky Maulana', '220003', 'Teknik Elektro', 2021),
('Dewi Lestari', '220004', 'Teknik Sipil', 2020),
('Ahmad Fauzan', '220005', 'Manajemen', 2023);

-- Insert data dummy ke dalam tabel Dosen
INSERT INTO Dosen (nama, nip, fakultas, bidang_keahlian) VALUES
('Dr. Bambang Suryadi', '19781011202201', 'Teknik', 'Kecerdasan Buatan'),
('Prof. Sri Lestari', '19651204198802', 'Ekonomi', 'Manajemen Keuangan'),
('Dr. Andi Wijaya', '19820515201003', 'Teknik', 'Jaringan Komputer'),
('Dr. Rina Kartika', '19790218200504', 'Hukum', 'Hukum Perdata'),
('Prof. Agung Prasetyo', '19691225199005', 'Kedokteran', 'Farmakologi');
