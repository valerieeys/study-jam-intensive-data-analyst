-- Membuat database
CREATE DATABASE kampus

-- Menghapus database
DROP DATABASE kampus

-- Membuat tabel harus menyertakan nama kolom dan tipe datanya
CREATE TABLE mahasiswa (
    npm varchar(20),
    nama_mahasiswa varchar(250),
    jurusan varchar(100),
    ipk double precision
)

-- Hapus tabel
DROP TABLE mahasiswa

-- Memasukkan nilai ke dalam tabel
-- Cara 1 : sesuai urutan kolom
INSERT INTO mahasiswa 
VALUES 
    ('20100001', 'Budi', 'Teknik Informatika', 3.5)

-- Cara 2 : sesuai nama kolom
INSERT INTO mahasiswa 
    (npm, nama_mahasiswa, jurusan, ipk)
VALUES 
    ('20100002', 'Andi', 'Sistem Informasi', 3.8)

-- Cara 3 : tidak harus mengisi semua kolom kecuali kolom yang dibutuhkan
INSERT INTO mahasiswa 
    (npm, nama_mahasiswa, jurusan)
VALUES 
    ('20100003', 'Candra', 'Teknik Informatika')

-- Menghapus data pada tabel
DELETE FROM mahasiswa 
WHERE 
    npm = '20100001'

-- Update tabel
UPDATE mahasiswa 
SET 
    ipk = 3.9 
WHERE 
    npm = '20100002'

UPDATE mahasiswa
SET
    ipk = 3.9,
    jurusan = 'Teknik Komputer'
WHERE
    npm = '20100002'

-- Mengganti tipe data kolom yang sudah ada
ALTER TABLE mahasiswa
ALTER COLUMN 
    ipk TYPE real

-- Menambah kolom baru
ALTER TABLE mahasiswa
ADD COLUMN
    tanggal_lahir date,
    no_hp varchar(20),
    alamat text

-- Hapus kolom
ALTER TABLE mahasiswa
DROP COLUMN
    no_hp

-- Hapus semua isi tabel
TRUNCATE TABLE mahasiswa

-- Hapus semua isi tabel tetapi tidak menghapus tabel nya
DELETE FROM mahasiswa

-- Menampilkan semua isi tabel
SELECT * FROM mahasiswa