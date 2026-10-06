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
| `alamat_pelanggan` | Pelanggan | Alamat pelanggan | Jl. Contoh No. 1 | Data pribadi | Admin |
| `kode_barang` | Barang | Kode unik barang | BRG-001 | Unik | Admin |
| `nama_barang` | Barang | Nama barang | Buku Tulis | Tidak boleh kosong | Admin |
| `kategori_barang` | Barang | Kategori barang | Alat Tulis | Tidak boleh kosong | Admin |
| `harga_barang` | Barang | Harga jual barang saat ini | 15000 | Bilangan bulat ≥ 0 | Admin |
| `stok_barang` | Barang | Jumlah barang tersedia | 35 | Bilangan bulat ≥ 0 | Admin |
| `batas_minimum_stok` | Barang | Batas minimum jumlah stok | 10 | Bilangan bulat ≥ 0 | Admin |
| `no_pesanan` | Pesanan | Nomor unik pesanan | ORD-2026-001 | Unik | Admin |
| `tanggal_pesanan` | Pesanan | Tanggal dan waktu pesanan dibuat | 2026-10-06 10:00 | Wajib dicatat | Admin |
| `status_pesanan` | Pesanan | Status proses pesanan | Diproses | Mengikuti status yang ditetapkan sistem | Admin |
| `total_pembayaran` | Pesanan | Total nilai pembayaran pesanan | 30000 | Bilangan bulat ≥ 0 | Admin |
| `qty` | Detail Pesanan | Jumlah barang dalam pesanan | 2 | Bilangan bulat > 0 | Admin |
| `harga_saat_transaksi` | Detail Pesanan | Harga barang ketika dipesan | 15000 | Disimpan agar harga transaksi lama tetap tercatat | Admin |
| `subtotal` | Detail Pesanan | Nilai harga barang berdasarkan jumlah yang dipesan | 30000 | Nilai turunan dari qty × harga saat transaksi | Admin |
| `id_pembayaran` | Pembayaran | Identitas unik pembayaran | PAY-001 | Unik | Admin |
| `tanggal_pembayaran` | Pembayaran | Tanggal dan waktu pembayaran | 2026-10-06 10:15 | Wajib dicatat | Admin |
| `metode_pembayaran` | Pembayaran | Metode pembayaran yang digunakan | Transfer | Diisi sesuai metode yang tersedia | Admin |
| `jumlah_pembayaran` | Pembayaran | Jumlah uang yang dibayarkan | 30000 | Bilangan bulat ≥ 0 | Admin |
| `status_pembayaran` | Pembayaran | Status pembayaran | Lunas | Mengikuti status pembayaran | Admin |
| `id_pengiriman` | Pengiriman | Identitas unik pengiriman | KRM-001 | Unik | Admin |
| `alamat_tujuan` | Pengiriman | Alamat tujuan pengiriman | Jl. Contoh No. 1 | Data pribadi | Admin |
| `jasa_pengiriman` | Pengiriman | Jasa yang digunakan untuk mengirim pesanan | Kurir A | Tidak boleh kosong | Admin |
| `nomor_resi` | Pengiriman | Nomor resi pengiriman | RESI123456 | Dapat kosong sebelum barang dikirim | Admin |
| `status_pengiriman` | Pengiriman | Status proses pengiriman | Diproses | Mengikuti status pengiriman | Admin |

## 9. Kebutuhan non-fungsional data (volume, retensi, privasi)

### 9.1 Volume data

- Sistem harus dapat menyimpan data pesanan dan transaksi yang terus bertambah seiring aktivitas toko.
- Data pesanan harus dapat ditelusuri berdasarkan nomor pesanan.
- Perkiraan volume transaksi harian adalah 50 transaksi per hari.
- Batas maksimal item dalam satu transaksi adalah 4 item.

### 9.2 Retensi data

- Data pesanan dan pembayaran perlu dipertahankan untuk kebutuhan pencatatan dan pelaporan.
- Data transaksi lama tetap perlu dapat ditelusuri berdasarkan nomor pesanan.
- Harga barang pada saat transaksi perlu tetap tersimpan agar informasi transaksi lama tidak berubah ketika harga barang saat ini diperbarui.

### 9.3 Privasi dan hak akses

- Nomor HP, email, dan alamat pelanggan merupakan data pribadi.
- Data pribadi pelanggan hanya dapat diakses oleh admin yang memiliki hak akses.
- Data pembayaran hanya dapat diakses oleh pihak yang memiliki kewenangan untuk mengelola transaksi.

### 9.4 Parameter project

Perhitungan parameter P berdasarkan NIM:

P = (73 mod 9) + 1  
P = 1 + 1  
P = 2

Dengan nilai P = 2, diperoleh:

- Batas maksimal item per transaksi = P + 2 = 4 item.
- Persentase diskon atau denda harian (dalam ribu rupiah) = 2.
- Perkiraan volume transaksi harian = 40 + (5 × P) = 50 transaksi per hari.

### 9.4 Parameter project

Perhitungan parameter P berdasarkan NIM:

P = (73 mod 9) + 1
P = 1 + 1
P = 2

Dengan nilai P = 2, diperoleh:
- Batas maksimal item per transaksi = P + 2 = 4 item.
- Persentase diskon atau denda harian (dalam ribu rupiah) = 2.
- Perkiraan volume transaksi harian = 40 + (5 × P) = 50 transaksi per hari.

## 10. Isu kualitas data yang diantisipasi

Beberapa isu kualitas data yang mungkin terjadi pada Toko Daring Aulia Indah adalah sebagai berikut:

1. **Data pelanggan ganda**  
   Satu pelanggan dapat tercatat lebih dari satu kali sehingga menyebabkan data pelanggan menjadi tidak konsisten. Hal ini dapat dikurangi dengan memastikan `id_pelanggan` bersifat unik dan data pelanggan diperiksa sebelum ditambahkan.

2. **Ketidaksesuaian stok barang**  
   Stok yang tercatat di sistem dapat berbeda dengan stok sebenarnya akibat kesalahan pencatatan barang masuk atau barang yang terjual. Data stok perlu diperbarui berdasarkan transaksi yang terjadi dan tidak boleh bernilai negatif.

3. **Perubahan harga pada transaksi lama**  
   Harga barang dapat berubah setelah suatu pesanan dibuat. Jika hanya menggunakan harga barang saat ini, nilai transaksi lama dapat berubah. Oleh karena itu, `harga_saat_transaksi` perlu disimpan pada Detail Pesanan.

4. **Ketidaksesuaian data pembayaran**  
   Jumlah atau status pembayaran dapat tidak sesuai dengan pesanan. Data pembayaran perlu dikaitkan dengan `no_pesanan` dan status pembayaran harus diperbarui berdasarkan hasil konfirmasi pembayaran.

5. **Alamat pengiriman tidak lengkap atau salah**  
   Kesalahan alamat dapat menyebabkan proses pengiriman terganggu. Alamat tujuan perlu dicatat dengan lengkap dan diperiksa sebelum pesanan dikirim.

6. **Nomor resi tidak sesuai**  
   Nomor resi yang salah dapat menyulitkan pelanggan dalam melacak pesanan. Nomor resi harus dicatat sesuai dengan informasi dari jasa pengiriman.