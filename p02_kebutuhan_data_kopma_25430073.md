# Dokumen Kebutuhan Data Kopma

**Nama:** Aulia Indah Agustina  
**NIM:** 25430073  
**Kelas:** C  

## 1. Tujuan

# Dokumen Kebutuhan Data - Koperasi Mahasiswa Sejahtera

## 1. Latar belakang dan aktivitas organisasi
- Koperasi Mahasiswa Sejahtera (Kopma) menjual alat tulis, makanan ringan, dan minuman di lingkungan kampus. Pembeli dapat berupa anggota atau umum. Mahasiswa dapat mendaftar sebagai anggota dengan NIM, nama, program studi, dan nomor HP, kemudian memperoleh nomor anggota. Anggota aktif memperoleh diskon 5% untuk setiap nota. Kasir mencatat penjualan dan mencetak nota. Petugas gudang memeriksa stok dan membuat pesanan pembelian ke pemasok apabila stok suatu barang berada di bawah batas minimum. Ketika barang datang, stok bertambah sesuai faktur pemasok. Setiap awal bulan, ketua koperasi menerima laporan omzet, barang terlaris, barang dengan stok menipis, dan anggota paling aktif.

## 2. Aktor dan Proses Bisnis

## 2. Aktor dan proses bisnis (tabel PB-xx)

| Kode | Proses bisnis | Aktor | Pemicu |
|---|---|---|---|
| PB-01 | Mendaftarkan anggota | Kasir (atas permintaan mahasiswa) | Mahasiswa ingin menjadi anggota |
| PB-02 | Mencatat penjualan | Kasir | Pembeli membayar di kasir |
| PB-03 | Memesan barang ke pemasok | Petugas gudang | Stok di bawah batas minimum |
| PB-04 | Menerima barang dari pemasok | Petugas gudang | Barang datang bersama faktur |
| PB-05 | Menyusun laporan bulanan | Ketua koperasi | Awal bulan |

## 3. Dokumen sumber yang dianalisis

| Dokumen sumber | Informasi yang dianalisis |
|---|---|
| Formulir pendaftaran anggota | Nomor anggota, NIM, nama, program studi, dan nomor HP |
| Nota penjualan | Nomor nota, tanggal-jam, kasir, anggota, barang, jumlah, harga saat transaksi, dan pembayaran |
| Faktur pemasok | Data pemasok, barang, jumlah barang, harga beli, dan tanggal penerimaan |

## 4. Entitas kandidat dan elemen data

### 4.1 Anggota
- Nomor anggota
- NIM
- Nama
- Program studi
- Nomor HP
- Status aktif
- Poin loyalitas

### 4.2 Barang
- Kode barang
- Nama barang
- Kategori
- Harga jual
- Stok
- Batas minimum stok

### 4.3 Penjualan
- Nomor nota
- Tanggal-jam
- Kasir
- Anggota (opsional)
- Bayar

### 4.4 Detail penjualan
- Nomor nota
- Barang
- Qty
- Harga saat transaksi

### 4.5 Petugas
- Kode petugas
- Nama
- Peran (kasir/gudang/ketua)

### 4.6 Pemasok
- Kode pemasok
- Nama
- Telepon
- Alamat

### 4.7 Pembelian
- Nomor faktur
- Tanggal
- Pemasok
- Barang
- Qty
- Harga beli

## 5. Aturan bisnis (tabel AB-xx)

| Kode | Aturan bisnis |
|---|---|
| AB-01 | Setiap nota memiliki nomor unik dan minimal satu baris detail. |
| AB-02 | Penjualan dapat dilakukan tanpa anggota; jika pembeli adalah anggota, status anggota harus aktif untuk mendapatkan diskon 5%. |
| AB-03 | Stok tidak boleh negatif; transaksi penjualan ditolak jika jumlah yang dijual melebihi stok tersedia. |
| AB-04 | Harga jual saat transaksi disimpan pada setiap baris detail dan tidak berubah meskipun harga barang saat ini kemudian naik. |
| AB-05 | NIM anggota harus unik; pencarian anggota dapat dilakukan berdasarkan nomor anggota atau NIM. |
| AB-06 | Pesanan pembelian dibuat ketika stok barang berada di bawah batas minimum. |
| AB-07 | Setiap kelipatan Rp10.000 yang dibelanjakan anggota menghasilkan 1 poin loyalitas. |
| AB-08 | Setiap 50 poin loyalitas dapat ditukarkan dengan diskon Rp5.000. |

## 6. Kebutuhan informasi (tabel KI-xx)

| Kode | Kebutuhan informasi |
|---|---|
| KI-01 | Omzet dan jumlah nota per hari/bulan. |
| KI-02 | Lima barang terlaris per bulan berdasarkan jumlah terjual. |
| KI-03 | Daftar barang yang stoknya di bawah batas minimum. |
| KI-04 | Sepuluh anggota dengan total belanja terbesar per bulan. |
| KI-05 | Jumlah poin loyalitas setiap anggota. |
| KI-06 | Daftar anggota yang memiliki minimal 50 poin loyalitas dan dapat menukarkan poin dengan diskon Rp5.000. |

## 7. Matriks CRUD

| Proses Bisnis | Anggota | Barang | Penjualan | Detail Penjualan | Petugas | Pemasok | Pembelian |
|---|---|---|---|---|---|---|---|
| PB-01 Mendaftarkan anggota | C |  |  |  |  |  |  |
| PB-02 Mencatat penjualan | R, U | R, U | C | C |  |  |  |
| PB-03 Memesan barang ke pemasok |  | R |  |  |  | R | C |
| PB-04 Menerima barang dari pemasok |  | U |  |  |  | R | U |
| PB-05 Menyusun laporan bulanan | R | R | R | R | R | R |  |

## 8. Kamus data awal (dengan penanggung jawab)

| Elemen data | Makna | Contoh | Aturan | Penanggung jawab |
|---|---|---|---|---|
| no_anggota | Nomor anggota koperasi | A-0457 | Unik, format A-4 digit | Ketua |
| nim_anggota | NIM anggota | 2301010123 | Unik, 10 digit | Ketua |
| no_hp_anggota | Nomor HP anggota | 0812xxxx | Data pribadi, akses terbatas | Ketua |
| no_nota_penjualan | Nomor nota penjualan | PJ-2609-0142 | Unik per nota | Kasir |
| harga_satuan_detail_penjualan | Harga jual saat transaksi | 4000 | Bilangan bulat ≥ 0 (rupiah) | Kasir |
| stok_barang | Jumlah barang tersedia | 35 | Bilangan bulat ≥ 0 (AB-03) | Petugas gudang |
| poin_loyalitas | Jumlah poin loyalitas anggota | 25 | Bilangan bulat ≥ 0 | Ketua |

## 9. Kebutuhan non-fungsional data (volume, retensi, privasi)

- Volume transaksi sekitar ±150 nota per hari.
- Data transaksi disimpan dan dipertahankan minimal selama 5 tahun.
- Nomor HP anggota merupakan data pribadi dan hanya dapat dilihat oleh ketua koperasi.

## 10. Isu kualitas data yang diantisipasi

- Stok barang pada pencatatan dapat menjadi negatif.
- Nomor anggota atau NIM dapat tercatat lebih dari satu kali.
- Harga pada transaksi lama dapat berubah jika tidak disimpan saat transaksi.
- Data nomor HP anggota perlu dibatasi aksesnya karena merupakan data pribadi.
- Perhitungan poin loyalitas harus sesuai dengan total belanja anggota agar jumlah poin tidak salah.

## E.2 Perbaikan kebutuhan yang masih terlalu umum

| Kebutuhan awal | Perbaikan kebutuhan |
|---|---|
| Data anggota harus aman. | Data anggota yang bersifat pribadi, seperti nomor HP, hanya dapat diakses oleh pengguna yang memiliki hak akses sesuai perannya. |
| Sistem harus cepat mencari barang. | Sistem harus dapat menampilkan hasil pencarian barang berdasarkan kode atau nama barang dalam waktu maksimal 3 detik. |
| Laporan stok harus akurat. | Laporan stok harus menampilkan jumlah stok yang sesuai dengan catatan transaksi masuk dan keluar serta tidak boleh menghasilkan jumlah stok negatif. |