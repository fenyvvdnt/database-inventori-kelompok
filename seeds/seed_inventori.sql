-- ==========================================================
-- Seed Data Awal (Dummy): Sistem Inventori - Kelompok 2
-- Sesuai dengan migrations/V001_init_inventori.sql (MySQL)
-- ==========================================================

-- 1. Seed tabel kategori (id_kategori: 1, 2, 3)
INSERT INTO kategori (nama_kategori, keterangan) VALUES
    ('Elektronik', 'Peralatan elektronik dan perangkat pendukung kantor'),
    ('ATK', 'Alat tulis kantor dan perlengkapan administrasi'),
    ('Konsumsi', 'Air minum, kopi, teh, dan kebutuhan pantry');

-- 2. Seed tabel pengguna (id_user: 1, 2, 3)
INSERT INTO pengguna (username, nama_lengkap, role, aktif) VALUES
    ('feny.admin', 'Feny Widianti', 'ADMIN', TRUE),
    ('tesa.petugas', 'Tesa Sulistia', 'PETUGAS', TRUE),
    ('azra.manajer', 'Azra Deliana Pratiwi', 'MANAJER', TRUE);

-- 3. Seed tabel barang (id_barang: 1..5)
-- Variasi stok: ada yang aman, menipis (stok <= stok_minimum), dan kritis
INSERT INTO barang (kode_barang, nama_barang, id_kategori, satuan, harga, stok, stok_minimum) VALUES
    ('BRG-001', 'Keyboard Mechanical Wireless', 1, 'unit', 450000.00, 15, 5),
    ('BRG-002', 'Mouse Wireless Ergonomis', 1, 'unit', 175000.00, 3, 5),
    ('BRG-003', 'Kertas HVS A4 75gsm (Rim)', 2, 'rim', 52000.00, 25, 10),
    ('BRG-004', 'Spidol Whiteboard Hitam (Box)', 2, 'box', 65000.00, 2, 4),
    ('BRG-005', 'Galon Air Mineral 19L', 3, 'galon', 20000.00, 8, 5);

-- 4. Seed tabel transaksi (id_transaksi: 1, 2, 3)
INSERT INTO transaksi (no_transaksi, tanggal_transaksi, jenis, id_user, catatan) VALUES
    ('TRX-20261124-001', '2026-11-24 08:30:00', 'MASUK', 1, 'Penerimaan stok awal gudang'),
    ('TRX-20261124-002', '2026-11-24 10:15:00', 'KELUAR', 2, 'Pengambilan barang operasional divisi'),
    ('TRX-20261124-003', '2026-11-24 13:45:00', 'PENYESUAIAN', 2, 'Penyesuaian stok hasil pengecekan fisik');

-- 5. Seed tabel detail_transaksi
INSERT INTO detail_transaksi (id_transaksi, id_barang, jumlah, harga_saat_transaksi) VALUES
    (1, 1, 15, 450000.00),
    (1, 3, 25, 52000.00),
    (2, 2, 2, 175000.00),
    (2, 4, 2, 65000.00),
    (3, 5, 4, 20000.00);