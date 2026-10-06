# Dokumen Kebutuhan Data - Toko Daring Aulia Indah

## 1. Latar belakang dan aktivitas organisasi

Toko Daring Aulia Indah (TDA) merupakan toko daring yang menyediakan berbagai produk untuk pelanggan. Proses utama dalam toko meliputi pengelolaan katalog barang, keranjang belanja, pemesanan, pembayaran, dan pengiriman.

Pelanggan dapat melihat barang yang tersedia, memilih barang, memasukkannya ke keranjang, kemudian membuat pesanan. Setelah pesanan dibuat, pelanggan melakukan pembayaran dan pesanan diproses untuk dikirim ke alamat tujuan.

Data yang dikelola meliputi data pelanggan, barang, pesanan, detail pesanan, pembayaran, dan pengiriman.

## 2. Aktor dan proses bisnis (tabel PB-xx)

| Kode | Proses bisnis | Aktor | Pemicu |
|---|---|---|---|
| PB-01 | Mengelola dan melihat katalog barang | Admin/Pelanggan | Pelanggan ingin melihat barang yang tersedia |
| PB-02 | Membuat pesanan | Pelanggan | Pelanggan memilih barang dan ingin melakukan pembelian |
| PB-03 | Mencatat pembayaran | Pelanggan/Admin | Pesanan telah dibuat dan pelanggan melakukan pembayaran |
| PB-04 | Memproses dan mengirim pesanan | Admin | Pembayaran pesanan telah dikonfirmasi |

## 3. Dokumen sumber yang dianalisis

| Dokumen/Sumber | Data yang Dianalisis | Keterangan |
|---|---|---|
| Halaman pesanan | Nomor pesanan, data pelanggan, barang, jumlah barang, harga, ongkos kirim, alamat pengiriman | Digunakan untuk mengetahui data yang tercatat ketika pelanggan membuat pesanan. |
| Bukti pembayaran | Nomor pembayaran, nomor pesanan, tanggal pembayaran, metode pembayaran, jumlah pembayaran, status pembayaran | Digunakan untuk mengetahui dan memverifikasi data pembayaran pesanan. |
| Resi pengiriman | Nomor resi, nomor pesanan, jasa pengiriman, alamat tujuan, status pengiriman | Digunakan untuk mengetahui data pengiriman dan pelacakan pesanan. |

### 3.1 Contoh dokumen sumber fiktif: Bukti Pesanan

Nama dokumen: Bukti Pesanan Toko Daring  
Nomor dokumen: ORD-2026-001  
Tanggal: 6 Oktober 2026  

- Nomor pesanan: ORD-2026-001
- Nama pelanggan: Aulia
- Nomor HP: 081234567890
- Alamat pengiriman: Jl. Contoh No. 1
- Barang: Buku Tulis
- Jumlah: 2
- Harga satuan: Rp15.000
- Ongkos kirim: Rp10.000
- Total: Rp40.000
- Metode pembayaran: Transfer
- Status pembayaran: Lunas
- Jasa pengiriman: Kurir A
- Status pengiriman: Diproses

Analisis:

Dokumen sumber fiktif tersebut menunjukkan bahwa dalam satu pesanan perlu dicatat data pelanggan, barang yang dipesan, jumlah barang, harga saat transaksi, ongkos kirim, alamat pengiriman, pembayaran, dan pengiriman. Data tersebut digunakan sebagai dasar untuk menentukan elemen data dan entitas yang diperlukan dalam basis data Toko Daring Aulia Indah.

### 3.1 Contoh dokumen sumber fiktif: Bukti Pesanan

**Nama dokumen:** Bukti Pesanan Toko Daring  
**Nomor dokumen:** ORD-2026-001  
**Tanggal:** 6 Oktober 2026

| Informasi | Isi contoh |
|---|---|
| Nomor pesanan | ORD-2026-001 |
| Nama pelanggan | Aulia |
| Nomor HP | 081234567890 |
| Alamat pengiriman | Jl. Contoh No. 1 |
| Barang | Buku Tulis |
| Jumlah | 2 |
| Harga satuan | Rp15.000 |
| Total | Rp30.000 |
| Metode pembayaran | Transfer |
| Status pembayaran | Lunas |
| Jasa pengiriman | Kurir A |
| Status pengiriman | Diproses |

**Analisis dokumen:**

Dokumen ini digunakan untuk mengidentifikasi data yang diperlukan dalam proses pemesanan, pembayaran, dan pengiriman. Dari dokumen tersebut dapat diidentifikasi data pelanggan, pesanan, detail pesanan, pembayaran, dan pengiriman.

Data nomor pesanan digunakan sebagai identitas pesanan. Data barang, jumlah, dan harga satuan digunakan untuk membentuk detail pesanan dan menghitung total. Informasi metode dan status pembayaran digunakan untuk mencatat pembayaran, sedangkan alamat, jasa pengiriman, dan status pengiriman digunakan untuk proses pengiriman.

## 4. Entitas kandidat dan elemen data

### 4.1 Pelanggan
- `id_pelanggan`
- `nama_pelanggan`
- `no_hp_pelanggan`
- `email_pelanggan`
- `alamat_pelanggan`

### 4.2 Barang
- `kode_barang`
- `nama_barang`
- `kategori_barang`
- `harga_barang`
- `stok_barang`
- `batas_minimum_stok`

### 4.3 Pesanan
- `no_pesanan`
- `tanggal_pesanan`
- `id_pelanggan`
- `status_pesanan`
- `alamat_pengiriman`
- `ongkos_kirim`
- `total_pembayaran`

### 4.4 Detail Pesanan
- `no_pesanan`
- `kode_barang`
- `qty`
- `harga_saat_transaksi`
- `subtotal`

### 4.5 Pembayaran
- `id_pembayaran`
- `no_pesanan`
- `tanggal_pembayaran`
- `metode_pembayaran`
- `jumlah_pembayaran`
- `status_pembayaran`

### 4.6 Pengiriman
- `id_pengiriman`
- `no_pesanan`
- `jasa_pengiriman`
- `nomor_resi`
- `status_pengiriman`

## 5. Aturan bisnis

| Kode | Aturan Bisnis |
|---|---|
| AB-01 | Setiap pelanggan memiliki `id_pelanggan` yang unik. |
| AB-02 | Setiap barang memiliki `kode_barang` yang unik. |
| AB-03 | Stok barang tidak boleh bernilai negatif. |
| AB-04 | Setiap pesanan memiliki `no_pesanan` yang unik. |
| AB-05 | Setiap pesanan harus memiliki minimal satu detail pesanan. |
| AB-06 | Harga barang pada saat transaksi disimpan pada Detail Pesanan dan tidak berubah ketika harga barang saat ini diperbarui. |
| AB-07 | Data pembayaran hanya dapat dicatat untuk pesanan yang sudah ada. |
| AB-08 | Pesanan dapat diproses dan dikirim setelah pembayaran pesanan dikonfirmasi. |
| AB-09 | Barang perlu mendapat perhatian untuk pengadaan kembali apabila stok berada di bawah batas minimum stok. |

## 6. Kebutuhan informasi

| Kode | Kebutuhan Informasi | Sumber Data |
|---|---|---|
| KI-01 | Menampilkan daftar barang yang tersedia beserta harga dan stoknya. | Barang |
| KI-02 | Menampilkan daftar pesanan berdasarkan periode tertentu. | Pesanan, Detail Pesanan |
| KI-03 | Mengetahui total penjualan berdasarkan periode tertentu. | Pesanan, Detail Pesanan, Pembayaran |
| KI-04 | Menampilkan daftar pesanan berdasarkan status pembayaran dan status pengiriman. | Pesanan, Pembayaran, Pengiriman |
| KI-05 | Menampilkan daftar barang yang stoknya berada di bawah batas minimum. | Barang |

## 7. Matriks CRUD

| Proses Bisnis | Pelanggan | Barang | Pesanan | Detail Pesanan | Pembayaran | Pengiriman |
|---|---|---|---|---|---|---|
| PB-01 Mengelola dan melihat katalog barang | R | C, R, U |  |  |  |  |
| PB-02 Membuat pesanan | R | R | C | C |  |  |
| PB-03 Mencatat pembayaran | R |  | R, U |  | C |  |
| PB-04 Memproses dan mengirim pesanan | R |  | R, U |  | R | C, U |
| PB-05 Mendaftarkan pelanggan | C |  |  |  |  |  |

Keterangan:
- **C (Create)** = membuat atau menambahkan data.
- **R (Read)** = membaca atau melihat data.
- **U (Update)** = mengubah atau memperbarui data.
- **D (Delete)** = menghapus data.

## 8. Kamus data awal (dengan penanggung jawab)

| Nama elemen data | Entitas | Deskripsi | Contoh | Aturan/Keterangan | Penanggung jawab |
|---|---|---|---|---|---|
| `id_pelanggan` | Pelanggan | Identitas unik pelanggan | PLG-001 | Unik | Admin |
| `nama_pelanggan` | Pelanggan | Nama pelanggan | Aulia | Tidak boleh kosong | Admin |
| `no_hp_pelanggan` | Pelanggan | Nomor HP pelanggan | 081234567890 | Data pribadi | Admin |
| `email_pelanggan` | Pelanggan | Alamat email pelanggan | aulia@email.com | Format email valid | Admin |
| `alamat_pelanggan` | Pelanggan | Alamat pelanggan yang tersimpan pada data akun | Jl. Contoh No. 1 | Data pribadi | Admin |
| `kode_barang` | Barang | Kode unik barang | BRG-001 | Unik | Admin |
| `nama_barang` | Barang | Nama barang | Buku Tulis | Tidak boleh kosong | Admin |
| `kategori_barang` | Barang | Kategori barang | Alat Tulis | Tidak boleh kosong | Admin |
| `harga_barang` | Barang | Harga jual barang saat ini | 15000 | Bilangan bulat ≥ 0 | Admin |
| `stok_barang` | Barang | Jumlah barang tersedia | 35 | Bilangan bulat ≥ 0 | Admin |
| `batas_minimum_stok` | Barang | Batas minimum jumlah stok | 10 | Bilangan bulat ≥ 0 | Admin |
| `no_pesanan` | Pesanan | Nomor unik pesanan | ORD-2026-001 | Unik | Admin |
| `tanggal_pesanan` | Pesanan | Tanggal dan waktu pesanan dibuat | 2026-10-06 10:00 | Wajib dicatat | Admin |
| `id_pelanggan` | Pesanan | Identitas pelanggan yang membuat pesanan | PLG-001 | Mengacu pada data Pelanggan | Admin |
| `status_pesanan` | Pesanan | Status proses pesanan | Diproses | Mengikuti status yang ditetapkan sistem | Admin |
| `alamat_pengiriman` | Pesanan | Alamat tujuan yang digunakan untuk pesanan | Jl. Contoh No. 1 | Disimpan pada pesanan | Admin |
| `ongkos_kirim` | Pesanan | Biaya pengiriman yang dikenakan pada pesanan | 10000 | Bilangan bulat ≥ 0 | Admin |
| `total_pembayaran` | Pesanan | Total nilai pembayaran pesanan | 40000 | Bilangan bulat ≥ 0 | Admin |
| `no_pesanan` | Detail Pesanan | Nomor pesanan yang memiliki detail barang | ORD-2026-001 | Mengacu pada data Pesanan | Admin |
| `kode_barang` | Detail Pesanan | Kode barang yang dipesan | BRG-001 | Mengacu pada data Barang | Admin |
| `qty` | Detail Pesanan | Jumlah barang dalam pesanan | 2 | Bilangan bulat > 0 | Admin |
| `harga_saat_transaksi` | Detail Pesanan | Harga barang ketika dipesan | 15000 | Disimpan agar harga transaksi lama tetap tercatat | Admin |
| `subtotal` | Detail Pesanan | Nilai harga barang berdasarkan jumlah yang dipesan | 30000 | Nilai turunan dari qty × harga saat transaksi | Admin |
| `id_pembayaran` | Pembayaran | Identitas unik pembayaran | PAY-001 | Unik | Admin |
| `no_pesanan` | Pembayaran | Nomor pesanan yang dibayarkan | ORD-2026-001 | Mengacu pada data Pesanan | Admin |
| `tanggal_pembayaran` | Pembayaran | Tanggal dan waktu pembayaran | 2026-10-06 10:15 | Wajib dicatat | Admin |
| `metode_pembayaran` | Pembayaran | Metode pembayaran yang digunakan | Transfer | Diisi sesuai metode yang tersedia | Admin |
| `jumlah_pembayaran` | Pembayaran | Jumlah uang yang dibayarkan | 40000 | Bilangan bulat ≥ 0 | Admin |
| `status_pembayaran` | Pembayaran | Status pembayaran | Lunas | Mengikuti status pembayaran | Admin |
| `id_pengiriman` | Pengiriman | Identitas unik pengiriman | KRM-001 | Unik | Admin |
| `no_pesanan` | Pengiriman | Nomor pesanan yang dikirim | ORD-2026-001 | Mengacu pada data Pesanan | Admin |
| `jasa_pengiriman` | Pengiriman | Jasa yang digunakan untuk mengirim pesanan | Kurir A | Tidak boleh kosong | Admin |
| `nomor_resi` | Pengiriman | Nomor resi pengiriman | RESI123456 | Dapat kosong sebelum barang dikirim | Admin |
| `status_pengiriman` | Pengiriman | Status proses pengiriman | Diproses | Mengikuti status pengiriman | Admin |
| `poin_loyalitas` | Pelanggan | Jumlah poin loyalitas yang dimiliki pelanggan | 25 | Bilangan bulat ≥ 0 | Admin |

### 9.1 Volume Data

- Sistem harus dapat menyimpan data pelanggan, barang, pesanan, pembayaran, dan pengiriman yang bertambah sesuai aktivitas toko.
- Data transaksi harus dapat ditelusuri berdasarkan nomor pesanan.

### 9.2 Retensi Data

- Data pesanan dan pembayaran perlu dipertahankan agar transaksi yang telah dilakukan tetap dapat ditelusuri.
- Harga barang pada saat transaksi harus tetap tersimpan sehingga informasi transaksi lama tidak berubah ketika harga barang saat ini diperbarui.

### 9.3 Privasi dan Hak Akses

- Nomor HP, email, dan alamat pelanggan merupakan data pribadi.
- Data pribadi pelanggan hanya boleh diakses oleh admin yang memiliki hak akses.
- Data pembayaran hanya boleh diakses oleh pihak yang memiliki kewenangan untuk mengelola transaksi.

### 9.4 Parameter project

Perhitungan parameter P berdasarkan NIM:

P = (73 mod 9) + 1
P = 1 + 1
P = 2

Dengan nilai P = 2, diperoleh:
- Batas maksimal item per transaksi = P + 2 = 4 item.
- Persentase diskon atau denda harian (dalam ribu rupiah) = 2.
- Perkiraan volume transaksi harian = 40 + (5 × P) = 50 transaksi per hari.

### 10. Isu kualitas data yang diantisipasi

1. **Data pelanggan ganda**  
   Data pelanggan dapat tercatat lebih dari satu kali apabila identitas pelanggan tidak diperiksa dengan baik saat pendaftaran.

2. **Ketidaksesuaian stok barang**  
   Jumlah stok yang tercatat dapat berbeda dengan stok sebenarnya apabila setiap transaksi masuk dan keluar tidak dicatat dengan benar.

3. **Perubahan harga pada transaksi lama**  
   Harga barang saat ini dapat berubah sehingga harga pada transaksi lama harus tetap menggunakan harga saat transaksi dilakukan.

4. **Ketidaksesuaian data pembayaran**  
   Data pembayaran dapat tidak sesuai dengan pesanan apabila jumlah, metode, atau status pembayaran tidak dicatat dengan benar.

5. **Alamat pengiriman tidak lengkap atau salah**  
   Alamat pengiriman yang tidak lengkap atau salah dapat menyebabkan pesanan sulit atau gagal dikirim.

6. **Nomor resi tidak sesuai**  
   Nomor resi yang salah atau tidak sesuai dengan pesanan dapat menyebabkan proses pelacakan pengiriman menjadi tidak akurat.

   ## 11. Latihan 1 - Poin Loyalitas

### 11.1 Elemen data tambahan

Untuk mendukung fitur poin loyalitas, diperlukan elemen data tambahan pada entitas Pelanggan:

- `poin_loyalitas`

Elemen `poin_loyalitas` digunakan untuk menyimpan jumlah poin yang dimiliki oleh pelanggan.

### 11.2 Aturan bisnis tambahan

| Kode | Aturan Bisnis |
|---|---|
| AB-10 | Setiap kelipatan Rp10.000 yang dibelanjakan oleh pelanggan menghasilkan 1 poin loyalitas. |
| AB-11 | Setiap 50 poin loyalitas dapat ditukarkan dengan potongan harga sebesar Rp5.000. |

### 11.3 Kebutuhan informasi tambahan

| Kode | Kebutuhan Informasi | Sumber Data |
|---|---|---|
| KI-06 | Menampilkan jumlah poin loyalitas yang dimiliki setiap pelanggan. | Pelanggan, Pesanan |
| KI-07 | Menampilkan pelanggan yang memiliki minimal 50 poin dan dapat menukarkan poinnya dengan potongan harga. | Pelanggan |

### 11.4 Perubahan pada Matriks CRUD

Karena poin loyalitas berkaitan dengan data pelanggan dan transaksi, proses pembuatan pesanan dapat memperbarui jumlah poin pelanggan.

| Proses Bisnis | Pelanggan | Barang | Pesanan | Detail Pesanan | Pembayaran | Pengiriman |
|---|---|---|---|---|---|---|
| PB-01 Mengelola dan melihat katalog barang | R | C, R, U |  |  |  |  |
| PB-02 Membuat pesanan | R, U | R | C | C |  |  |
| PB-03 Mencatat pembayaran | R |  | R, U |  | C |  |
| PB-04 Memproses dan mengirim pesanan | R |  | R, U |  | R | C, U |
| PB-05 Mendaftarkan pelanggan | C |  |  |  |  |  |

### 11.5 Perubahan kamus data

Tambahkan elemen berikut pada entitas Pelanggan:

| Nama elemen data | Entitas | Deskripsi | Contoh | Aturan/Keterangan | Penanggung jawab |
|---|---|---|---|---|---|
| `poin_loyalitas` | Pelanggan | Jumlah poin loyalitas yang dimiliki pelanggan | 25 | Bilangan bulat ≥ 0 | Admin |

## 12. Latihan 2 - Memperbaiki Kebutuhan yang Masih Umum

Beberapa kebutuhan yang masih terlalu umum diperbaiki menjadi kebutuhan yang lebih spesifik, terukur, dan dapat diuji.

### 12.1 Data pelanggan harus aman

**Kebutuhan awal:**  
> Data pelanggan harus aman.

**Perbaikan:**  
Data pribadi pelanggan seperti nomor HP, email, dan alamat hanya dapat diakses oleh admin yang memiliki hak akses.

**Kriteria pengujian:**  
Pengguna tanpa hak akses admin tidak dapat melihat data pribadi pelanggan.

### 12.2 Sistem harus cepat mencari barang

**Kebutuhan awal:**  
> Sistem harus cepat mencari barang.

**Perbaikan:**  
Sistem harus dapat menampilkan hasil pencarian barang berdasarkan kode atau nama barang dalam waktu maksimal 3 detik.

**Kriteria pengujian:**  
Ketika pengguna melakukan pencarian berdasarkan kode atau nama barang, hasil pencarian harus ditampilkan dalam waktu maksimal 3 detik.

### 12.3 Laporan stok harus akurat

**Kebutuhan awal:**  
> Laporan stok harus akurat.

**Perbaikan:**  
Jumlah stok yang ditampilkan dalam sistem harus sesuai dengan hasil pencatatan transaksi barang masuk dan barang keluar serta tidak boleh bernilai negatif.

**Kriteria pengujian:**  
Jumlah stok pada sistem dapat ditelusuri berdasarkan transaksi barang dan sistem menolak transaksi yang menyebabkan stok menjadi negatif.