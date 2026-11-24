# Database Sistem Inventori — Kelompok 2

Repository kolaborasi tugas mata kuliah **Collaborative Computing** (Program Studi Sistem Informasi, Kelas A) untuk merancang, mengimplementasikan, dan menguji database sistem inventori secara terstruktur menggunakan alur kerja Git dan Pull Request.

---

## Anggota Tim & Pembagian Peran

| No | Nama Lengkap | NPM | Peran dalam Tim | Tanggung Jawab Utama |
| :-: | :--- | :---: | :--- | :--- |
| 1 | **Feny Widianti** | 11523029 | Database Admin / Maintainer | Mengelola repository Git, proteksi branch `main`, review & approve Pull Request, serta eksekusi migration final. |
| 2 | **Tesa Sulistia** | 11523026 | Schema & Migration Builder | Merancang ERD 5 entitas utama dan menulis skrip SQL pembuatan struktur tabel serta constraint. |
| 3 | **Azra Deliana Pratiwi** | 11523050 | Data, Query & Quality Tester | Menyusun data uji awal (`seeds`), query laporan stok (`queries`), pengujian integritas/transaksi database, dan dokumentasi `README.md`. |

---

## Struktur Folder Repository

```text
database-inventori-kelompok/
├── docs/
│   └── ...                        # Berita acara kesepakatan tim, ERD, dan dokumentasi proyek
├── migrations/
│   └── V001_init_inventori.sql    # Skrip DDL pembuatan tabel, Primary Key, Foreign Key, & constraint
├── seeds/
│   └── seed_inventori.sql         # Skrip DML data uji awal (kategori, pengguna, barang, transaksi, detail_transaksi)
├── queries/
│   └── laporan_inventori.sql      # Kumpulan query laporan stok, transaksi masuk/keluar, dan stok menipis
└── README.md                      # Panduan instalasi, struktur proyek, dan cara penggunaan