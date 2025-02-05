-- Tabel produk elektronik
CREATE TABLE produk_elektronik (
  nama_produk VARCHAR PRIMARY KEY,
  kode_produk INT
)

-- Tabel jumlah produk 
CREATE TABLE jumlah_produk (
  nama_produk VARCHAR PRIMARY KEY,
  quantity INT
)

-- Data produk elektronik
INSERT INTO produk_elektronik VALUES
  ('Laptop', 10123),
  ('Smartphone', 10124),
  ('TV', 10125),
  ('Kamera', 10126),
  ('Headphone', 10127);

-- Data jumlah produk yang tersedia
INSERT INTO jumlah_produk VALUES
  ('Laptop', 5),
  ('Kamera', 20),
  ('Monitor', 9),
  ('Smartphone', 55),
  ('Speaker', 7);

-- INNER JOIN
-- Inner join, mengambil irisan dari kedua tabel berdasarkan key 
SELECT
    *
FROM  
    produk_elektronik
INNER JOIN 
    jumlah_produk 
ON 
    produk_elektronik.nama_produk = jumlah_produk.nama_produk

SELECT
    produk_elektronik.nama_produk,
    produk_elektronik.kode_produk,
    jumlah_produk.quantity
FROM  
    produk_elektronik
INNER JOIN 
    jumlah_produk 
ON 
    produk_elektronik.nama_produk = jumlah_produk.nama_produk

SELECT
    p.nama_produk,
    p.kode_produk,
    j.quantity
FROM  
    produk_elektronik p
JOIN 
    jumlah_produk j
ON 
    p.nama_produk = j.nama_produk

-- LEFT JOIN
-- Left join, mengambil data tabel kiri yang dimana cocok dengan tabel kanannya
SELECT
    p.nama_produk,
    j.nama_produk,
    p.kode_produk,
    j.quantity
FROM  
    produk_elektronik p
LEFT JOIN 
    jumlah_produk j
ON 
    p.nama_produk = j.nama_produk

-- RIGHT JOIN
-- Right join, mengambil data tabel kanan yang dimana cocok dengan tabel kirinya
SELECT
    p.nama_produk,
    j.nama_produk,
    p.kode_produk,
    j.quantity
FROM  
    produk_elektronik p
RIGHT JOIN 
    jumlah_produk j
ON 
    p.nama_produk = j.nama_produk

-- FULL OUTER JOIN
-- FUll outer join, mengambil semua data dari kedua tabel 
SELECT
    *
FROM  
    produk_elektronik p
RIGHT JOIN 
    jumlah_produk j
ON 
    p.nama_produk = j.nama_produk

-- Coalesce 
-- Mengisi dengan data mana yang tidak null paling dulu
SELECT 
	COALESCE(s.nama_cust, w.nama_cust) nama_cust,
    s.no_hp,
    w.id_wifi 
FROM
	cust_seluler s
    FULL OUTER JOIN cust_wifi w on s.nama_cust = w.nama_cust 