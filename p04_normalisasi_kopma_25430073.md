# Latihan Modul 4 D.1 — Dari UNF ke 1NF

## 1. Relasi dalam Bentuk UNF

NOTA_UNF (no_nota_penjualan, tgl_penjualan, kode_petugas, nama_petugas, no_anggota, nama_anggota, {kode_barang, nama_barang, qty_detail_penjualan, harga_satuan_detail_penjualan, subtotal_detail_penjualan}, jumlah_penjualan, diskon_penjualan, total_penjualan)

Keterangan: Relasi NOTA_UNF memiliki grup berulang barang yang ditandai dengan tanda kurung kurawal `{ }`. Satu nota dapat memuat beberapa barang.

## 2. Mengubah UNF menjadi 1NF

Grup berulang barang dihilangkan dengan membuat satu baris untuk setiap barang dalam setiap nota. Kunci primer yang digunakan merupakan kunci komposit, yaitu gabungan `no_nota_penjualan` dan `kode_barang`.

NOTA_1NF (no_nota_penjualan, kode_barang, tgl_penjualan, kode_petugas, nama_petugas, no_anggota, nama_anggota, nama_barang, qty_detail_penjualan, harga_satuan_detail_penjualan, subtotal_detail_penjualan, jumlah_penjualan, diskon_penjualan, total_penjualan)

**Kunci Primer (PK):** `(no_nota_penjualan, kode_barang)`

## 3. D.2 — Menuliskan Dependensi Fungsional

Dependensi fungsional menjelaskan hubungan antara atribut penentu dan atribut yang nilainya ditentukan. Berdasarkan aturan bisnis pada kasus Kopma di buku praktikum, dependensi fungsionalnya adalah sebagai berikut.

- **FD1:** `no_nota_penjualan → tgl_penjualan, kode_petugas, no_anggota`
- **FD2:** `kode_petugas → nama_petugas`
- **FD3:** `no_anggota → nama_anggota`
- **FD4:** `kode_barang → nama_barang`
- **FD5:** `(no_nota_penjualan, kode_barang) → qty_detail_penjualan, harga_satuan_detail_penjualan`
- **FD6:** `(qty_detail_penjualan, harga_satuan_detail_penjualan) → subtotal_detail_penjualan` (atribut turunan)

## 4. D.3 — Menuju 2NF dan 3NF

### A. Bentuk Normal Kedua (2NF)

Untuk mencapai 2NF, atribut yang hanya bergantung pada sebagian kunci primer komposit dipisahkan ke dalam relasi tersendiri. Hasil pemisahannya adalah sebagai berikut.

**PENJUALAN** (`no_nota_penjualan`, tgl_penjualan, kode_petugas*, no_anggota*, bayar_penjualan)

**DETAIL_PENJUALAN** (`no_nota_penjualan*`, `kode_barang*`, qty_detail_penjualan, harga_satuan_detail_penjualan)

**BARANG** (`kode_barang`, nama_barang, kategori_barang, harga_jual_barang, stok_barang, stok_min_barang)

### B. Bentuk Normal Ketiga (3NF)

Untuk mencapai 3NF, atribut yang memiliki ketergantungan transitif dipisahkan ke dalam relasi tersendiri. Data petugas dan anggota dipisahkan dari relasi PENJUALAN.

**PETUGAS** (`kode_petugas`, nama_petugas, peran_petugas)

**ANGGOTA** (`no_anggota`, nim_anggota, nama_anggota, prodi_anggota, no_hp_anggota, status_anggota, tgl_daftar_anggota)

### C. Nilai Turunan

Atribut `subtotal_detail_penjualan`, `jumlah_penjualan`, dan `total_penjualan` merupakan nilai turunan yang dapat dihitung dari data detail penjualan dan status anggota. Berdasarkan keputusan dalam buku praktikum, nilai-nilai tersebut tidak disimpan dalam tabel operasional agar tidak menimbulkan ketidakkonsistenan data.

## D.4 — Mencocokkan dengan Skema Kanonik

### A. Perbandingan dengan Skema Kanonik

Skema kanonik Kopma menggunakan kunci pengganti (*surrogate key*) berupa atribut `id_*` sebagai kunci primer. Beberapa atribut alami, seperti `kode_petugas`, `no_anggota`, `nim_anggota`, `kode_barang`, dan `no_nota_penjualan`, digunakan sebagai kunci unik sesuai Tabel 4.2.

| Tabel | Kunci Primer (PK) | Kunci Unik | Kunci Tamu (FK) |
|---|---|---|---|
| PETUGAS | `id_petugas` | `kode_petugas` | — |
| ANGGOTA | `id_anggota` | `no_anggota`, `nim_anggota` | — |
| BARANG | `id_barang` | `kode_barang` | — |
| PEMASOK | `id_pemasok` | — | — |
| PENJUALAN | `id_penjualan` | `no_nota_penjualan` | `id_petugas`, `id_anggota` (boleh NULL) |
| DETAIL_PENJUALAN | (`id_penjualan`, `id_barang`) | — | `id_penjualan`, `id_barang` |
| PEMBELIAN | `id_pembelian` | — | `id_pemasok` |
| DETAIL_PEMBELIAN | (`id_pembelian`, `id_barang`) | — | `id_pembelian`, `id_barang` |

Skema kanonik tersebut menjadi acuan untuk memeriksa kesesuaian kunci primer, kunci unik, dan kunci tamu pada setiap tabel.

### B. Pemeriksaan BCNF

BCNF (*Boyce-Codd Normal Form*) diperiksa dengan memastikan bahwa setiap penentu dalam dependensi fungsional merupakan kunci kandidat.

Berdasarkan Tabel 4.2, kunci primer dan kunci unik yang tercantum dapat digunakan sebagai dasar pemeriksaan awal. Namun, informasi kunci saja belum cukup untuk memastikan bahwa seluruh tabel memenuhi BCNF. Pemeriksaan akhir perlu mempertimbangkan semua dependensi fungsional yang berlaku pada setiap tabel berdasarkan aturan bisnis kasus Kopma.