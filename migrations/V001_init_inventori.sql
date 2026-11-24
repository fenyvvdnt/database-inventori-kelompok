-- ==========================================================
-- V001: Inisialisasi Schema 5 Tabel Utama Database Inventori
-- Dibuat oleh: Anggota 2 (Schema Builder)
-- ==========================================================

-- 1. Tabel Kategori (Tabel Induk)
CREATE TABLE kategori (
    id_kategori INT AUTO_INCREMENT PRIMARY KEY,
    nama_kategori VARCHAR(100) NOT NULL UNIQUE,
    keterangan VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- 2. Tabel Pengguna (Tabel Induk)
CREATE TABLE pengguna (
    id_user INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    nama_lengkap VARCHAR(100) NOT NULL,
    role ENUM('ADMIN', 'PETUGAS', 'MANAJER') NOT NULL,
    aktif BOOLEAN NOT NULL DEFAULT TRUE
) ENGINE=InnoDB;

-- 3. Tabel Barang (Relasi FK ke kategori)
CREATE TABLE barang (
    id_barang INT AUTO_INCREMENT PRIMARY KEY,
    kode_barang VARCHAR(30) NOT NULL UNIQUE,
    nama_barang VARCHAR(150) NOT NULL,
    id_kategori INT NOT NULL,
    satuan VARCHAR(20) NOT NULL,
    harga DECIMAL(12,2) NOT NULL,
    stok INT NOT NULL DEFAULT 0 CHECK (stok >= 0),
    stok_minimum INT NOT NULL DEFAULT 5,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_barang_kategori FOREIGN KEY (id_kategori) REFERENCES kategori(id_kategori)
) ENGINE=InnoDB;

-- 4. Tabel Transaksi (Relasi FK ke pengguna)
CREATE TABLE transaksi (
    id_transaksi INT AUTO_INCREMENT PRIMARY KEY,
    no_transaksi VARCHAR(40) NOT NULL UNIQUE,
    tanggal_transaksi DATETIME NOT NULL,
    jenis ENUM('MASUK', 'KELUAR', 'PENYESUAIAN') NOT NULL,
    id_user INT NOT NULL,
    catatan VARCHAR(255),
    CONSTRAINT fk_transaksi_pengguna FOREIGN KEY (id_user) REFERENCES pengguna(id_user)
) ENGINE=InnoDB;

-- 5. Tabel Detail Transaksi (Relasi FK ke transaksi & barang)
CREATE TABLE detail_transaksi (
    id_detail INT AUTO_INCREMENT PRIMARY KEY,
    id_transaksi INT NOT NULL,
    id_barang INT NOT NULL,
    jumlah INT NOT NULL CHECK (jumlah > 0),
    harga_saat_transaksi DECIMAL(12,2) NOT NULL,
    CONSTRAINT fk_detail_transaksi FOREIGN KEY (id_transaksi) REFERENCES transaksi(id_transaksi),
    CONSTRAINT fk_detail_barang FOREIGN KEY (id_barang) REFERENCES barang(id_barang)
) ENGINE=InnoDB;