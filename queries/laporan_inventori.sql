-- ==========================================================
-- Query Laporan Pergerakan Stok Inventori - Kelompok 2
-- Sesuai dengan migrations/V001_init_inventori.sql (MySQL)
-- ==========================================================

-- 1. Rekap stok barang saat ini dan estimasi nilai aset per kategori
SELECT
    k.id_kategori,
    k.nama_kategori,
    COUNT(b.id_barang) AS jumlah_item_barang,
    COALESCE(SUM(b.stok), 0) AS total_stok_unit,
    COALESCE(SUM(b.stok * b.harga), 0.00) AS total_nilai_stok
FROM kategori k
LEFT JOIN barang b ON b.id_kategori = k.id_kategori
GROUP BY k.id_kategori, k.nama_kategori
ORDER BY k.id_kategori;

-- 2. Riwayat transaksi (MASUK, KELUAR, PENYESUAIAN) beserta detail barang & petugas
SELECT
    t.no_transaksi,
    t.tanggal_transaksi,
    t.jenis,
    p.nama_lengkap AS nama_petugas,
    p.role,
    b.kode_barang,
    b.nama_barang,
    dt.jumlah,
    b.satuan,
    dt.harga_saat_transaksi,
    (dt.jumlah * dt.harga_saat_transaksi) AS subtotal_nilai,
    t.catatan
FROM detail_transaksi dt
JOIN transaksi t ON dt.id_transaksi = t.id_transaksi
JOIN barang b ON dt.id_barang = b.id_barang
JOIN pengguna p ON t.id_user = p.id_user
ORDER BY t.tanggal_transaksi DESC, t.id_transaksi DESC, dt.id_detail ASC;

-- 3. Daftar barang dengan stok menipis atau di bawah batas stok_minimum
SELECT
    b.kode_barang,
    b.nama_barang,
    k.nama_kategori,
    b.stok AS stok_saat_ini,
    b.stok_minimum,
    b.satuan,
    (b.stok_minimum - b.stok) AS kekurangan_untuk_aman
FROM barang b
JOIN kategori k ON b.id_kategori = k.id_kategori
WHERE b.stok <= b.stok_minimum
ORDER BY kekurangan_untuk_aman DESC, b.nama_barang ASC;