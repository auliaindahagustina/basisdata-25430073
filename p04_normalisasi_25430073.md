# Normalisasi Basis Data - Pertemuan ke 4

**Nama:** Aulia Indah Agustina  
**NPM:** 25430073  
**Kelas:** C  
**Proyek:** Toko Daring Aulia Indah

## 1. Dokumen Sumber dan Bentuk UNF

### 1.1 Dokumen Sumber
Dokumen sumber yang digunakan dalam proses normalisasi ini mengacu pada dokumen kebutuhan data proyek Toko Daring Aulia Indah yang telah disusun pada Modul 2. Dokumen sumber yang menjadi acuan meliputi:

1. **Halaman Pesanan**, yang memuat informasi nomor pesanan, tanggal pesanan, data pelanggan, alamat pengiriman, barang yang dipesan, jumlah barang, harga saat transaksi, ongkos kirim, dan total pembayaran.
2. **Bukti Pembayaran**, yang memuat informasi nomor pesanan, tanggal pembayaran, metode pembayaran, jumlah pembayaran, dan status pembayaran.
3. **Resi Pengiriman**, yang memuat informasi nomor pesanan, jasa pengiriman, nomor resi, dan status pengiriman.

Informasi dari ketiga dokumen tersebut digunakan untuk mengidentifikasi atribut yang perlu disimpan, hubungan antardata, serta kemungkinan adanya data berulang sebelum dilakukan normalisasi.

### 1.2 Bentuk Unnormalized Form (UNF)

Pada bentuk Unnormalized Form (UNF), informasi pesanan masih digabungkan dalam satu catatan yang memuat data pelanggan, data pesanan, daftar barang yang dibeli, pembayaran, dan pengiriman. Karena satu pesanan dapat berisi lebih dari satu barang, informasi barang masih tersimpan dalam bentuk kelompok data yang berulang.

Contoh bentuk data UNF untuk proyek Toko Daring Aulia Indah ditunjukkan pada tabel berikut.

| no_pesanan | tanggal_pesanan | id_pelanggan | alamat_pengiriman | ongkos_kirim | daftar_barang | data_pembayaran | data_pengiriman |
|---|---|---|---|---:|---|---|---|
| PS001 | 2026-10-01 | PL001 | Jl. Melati No. 10 | 10000 | (BR001, 2, 50000), (BR002, 1, 30000) | (BY001, Transfer, 140000, Lunas) | (PG001, JNE, RESI001, Dikirim) |

Keterangan:
- `daftar_barang` memuat kode barang, jumlah barang, dan harga saat transaksi untuk setiap barang yang dipesan.
- `data_pembayaran` memuat ID pembayaran, metode pembayaran, jumlah pembayaran, dan status pembayaran.
- `data_pengiriman` memuat ID pengiriman, jasa pengiriman, nomor resi, dan status pengiriman.
- `ongkos_kirim` menunjukkan biaya pengiriman untuk pesanan tersebut.

Pada contoh ini, barang BR001 memiliki jumlah 2 dengan harga Rp50.000 per unit, sedangkan barang BR002 memiliki jumlah 1 dengan harga Rp30.000 per unit. Total harga barang adalah Rp130.000. Setelah ditambah ongkos kirim Rp10.000 dan tanpa diskon, total pembayaran menjadi Rp140.000.

Data tersebut merupakan ilustrasi untuk menjelaskan bentuk UNF, bukan data transaksi nyata. Pada tahap ini, daftar barang masih berisi beberapa kelompok nilai dalam satu kolom sehingga data belum memenuhi bentuk normal pertama (1NF).

## 2. Dependensi Fungsional
Dependensi fungsional digunakan untuk mengetahui hubungan ketergantungan antara atribut dalam suatu data. Penentuan dependensi fungsional pada proyek Toko Daring Aulia Indah mengacu pada identitas unik dan aturan bisnis yang telah ditetapkan dalam Modul 2. Analisis ini menjadi dasar untuk memisahkan data ke dalam tabel yang sesuai pada tahap normalisasi berikutnya.

### 2.1 Dependensi Fungsional Entitas Pelanggan
| No. | Dependensi Fungsional | Aturan Bisnis | Penjelasan |
|---|---|---|---|
| 1 | `id_pelanggan → nama_pelanggan, no_hp_pelanggan, email_pelanggan, alamat_pelanggan, poin_loyalitas` | AB-01 | ID pelanggan yang unik menentukan data pelanggan yang tersimpan. |

Dependensi tersebut menunjukkan bahwa setiap pelanggan memiliki identitas yang berbeda. Dengan mengetahui `id_pelanggan`, data pelanggan lainnya dapat ditemukan.

### 2.2 Dependensi Fungsional Entitas Barang
| No. | Dependensi Fungsional | Aturan Bisnis | Penjelasan |
|---|---|---|---|
| 1 | `kode_barang → nama_barang, kategori_barang, harga_barang, stok_barang, batas_minimum_stok` | AB-02, AB-03, AB-09 | Kode barang yang unik menentukan informasi barang yang tercatat. |

Dependensi tersebut menunjukkan bahwa setiap barang diidentifikasi menggunakan `kode_barang`. Informasi mengenai nama, kategori, harga, stok, dan batas minimum stok disimpan sebagai atribut yang menjelaskan barang tersebut.

### 2.3 Dependensi Fungsional Entitas Pesanan
| No. | Dependensi Fungsional | Aturan Bisnis | Penjelasan |
|---|---|---|---|
| 1 | `no_pesanan → tanggal_pesanan, id_pelanggan, status_pesanan, alamat_pengiriman, ongkos_kirim` | AB-04 | Nomor pesanan yang unik menentukan informasi utama pesanan. |

Dependensi fungsional tersebut menunjukkan bahwa setiap pesanan memiliki nomor yang berbeda. Dengan mengetahui nomor pesanan, informasi mengenai tanggal pemesanan, pelanggan, status pesanan, alamat tujuan, dan ongkos kirim dapat diketahui.

Atribut `total_pembayaran` tidak langsung dimasukkan ke dalam dependensi ini karena perlu diperiksa apakah nilainya merupakan data yang disimpan atau nilai yang dihitung dari atribut lain.

### 2.4 Dependensi Fungsional Entitas Detail Pesanan
| No. | Dependensi Fungsional | Aturan Bisnis | Penjelasan |
|---|---|---|---|
| 1 | `(no_pesanan, kode_barang) → qty, harga_saat_transaksi` | AB-05, AB-06 | Kombinasi nomor pesanan dan kode barang mengidentifikasi detail barang dalam suatu pesanan. |

Pada entitas Detail Pesanan, satu nomor pesanan dapat berisi beberapa barang. Oleh karena itu, `no_pesanan` saja tidak cukup untuk mengidentifikasi satu baris detail barang. Kombinasi `no_pesanan` dan `kode_barang` digunakan sebagai kunci gabungan untuk mengidentifikasi barang pada pesanan tersebut.

Atribut `subtotal` merupakan nilai turunan yang dapat dihitung menggunakan rumus:

`subtotal = qty × harga_saat_transaksi`

Harga saat transaksi harus tetap dicatat pada Detail Pesanan agar perubahan harga barang saat ini tidak mengubah nilai transaksi sebelumnya, sesuai aturan AB-06.

### 2.5 Dependensi Fungsional Entitas Pembayaran

| No. | Dependensi Fungsional | Aturan Bisnis | Penjelasan |
|---|---|---|---|
| 1 | `id_pembayaran → no_pesanan, tanggal_pembayaran, metode_pembayaran, jumlah_pembayaran, status_pembayaran` | AB-07 | ID pembayaran digunakan sebagai identitas pembayaran dan menentukan informasi pembayaran yang tercatat. |

Berdasarkan dependensi fungsional tersebut, `id_pembayaran` menjadi penentu bagi atribut lainnya dalam entitas Pembayaran. Setiap data pembayaran menyimpan informasi pesanan yang dibayar, tanggal pembayaran, metode pembayaran, jumlah pembayaran, dan status pembayaran. Aturan AB-07 memastikan bahwa pembayaran hanya dapat dicatat untuk pesanan yang sudah ada.

### 2.6 Dependensi Fungsional Entitas Pengiriman

| No. | Dependensi Fungsional | Aturan Bisnis | Penjelasan |
|---|---|---|---|
| 1 | `id_pengiriman → no_pesanan, jasa_pengiriman, nomor_resi, status_pengiriman` | AB-08 | ID pengiriman digunakan sebagai identitas data pengiriman dan menentukan informasi pengiriman yang tercatat. |

Berdasarkan dependensi fungsional tersebut, `id_pengiriman` menjadi penentu bagi atribut lainnya dalam entitas Pengiriman. Informasi yang disimpan meliputi nomor pesanan, jasa pengiriman, nomor resi, dan status pengiriman. Aturan AB-08 menjelaskan bahwa pesanan dapat diproses atau dikirim setelah pembayaran dikonfirmasi.

## 3. Normalisasi 1NF

### 3.1 Pengertian 1NF

Normalisasi bentuk pertama atau First Normal Form (1NF) dilakukan dengan memastikan setiap kolom memiliki nilai yang bersifat atomik, yaitu satu nilai untuk setiap sel, serta tidak terdapat kelompok data berulang dalam satu baris. Oleh karena itu, kelompok data barang, pembayaran, dan pengiriman yang sebelumnya digabungkan dalam satu kolom perlu diuraikan menjadi atribut masing-masing.

### 3.2 Penerapan 1NF pada Proyek

Pada bentuk UNF, atribut `daftar_barang`, `data_pembayaran`, dan `data_pengiriman` masih berisi beberapa informasi yang digabungkan dalam satu kolom. Agar memenuhi 1NF, setiap kelompok informasi diuraikan menjadi atribut yang terpisah. Untuk barang, setiap baris mewakili satu jenis barang dalam suatu pesanan.

Contoh bentuk data setelah diterapkan 1NF:

| no_pesanan | tanggal_pesanan | id_pelanggan | status_pesanan | alamat_pengiriman | ongkos_kirim | kode_barang | qty | harga_saat_transaksi | id_pembayaran | metode_pembayaran | jumlah_pembayaran | status_pembayaran | id_pengiriman | jasa_pengiriman | nomor_resi | status_pengiriman |
|---|---|---|---|---|---:|---|---:|---:|---|---|---:|---|---|---|---|---|
| PS001 | 2026-10-01 | PL001 | Diproses | Jl. Melati No. 10 | 10000 | BR001 | 2 | 50000 | BY001 | Transfer | 140000 | Lunas | PG001 | JNE | RESI001 | Dikirim |
| PS001 | 2026-10-01 | PL001 | Diproses | Jl. Melati No. 10 | 10000 | BR002 | 1 | 30000 | BY001 | Transfer | 140000 | Lunas | PG001 | JNE | RESI001 | Dikirim |

Data pada tabel tersebut merupakan ilustrasi. Informasi pesanan, pembayaran, dan pengiriman terlihat berulang karena satu pesanan memiliki dua jenis barang. Meskipun demikian, setiap sel sudah berisi satu nilai dan tidak lagi menyimpan daftar beberapa barang atau kelompok data dalam satu kolom.

Kunci gabungan `(no_pesanan, kode_barang)` digunakan untuk mengidentifikasi setiap baris detail barang, dengan asumsi satu jenis barang hanya dicatat satu kali dalam satu pesanan.

### 3.3 Hasil Normalisasi 1NF

Setelah diterapkan 1NF, seluruh atribut telah dipisahkan menjadi nilai-nilai atomik. Namun, sejumlah informasi masih berulang, seperti data pelanggan, informasi utama pesanan, pembayaran, dan pengiriman.

Pengulangan tersebut menunjukkan bahwa tabel masih dapat diperbaiki. Pada tahap 2NF, atribut yang bergantung hanya pada sebagian kunci gabungan akan dipisahkan. Selanjutnya, normalisasi 3NF digunakan untuk memeriksa ketergantungan transitif.

## 4. Normalisasi 2NF

### 4.1 Pengertian 2NF

Bentuk normal kedua atau Second Normal Form (2NF) merupakan tahap normalisasi setelah 1NF. Pada tahap ini, tabel harus memenuhi 1NF dan setiap atribut nonkunci harus bergantung pada seluruh bagian kunci utama, bukan hanya sebagian dari kunci gabungan.

Pada tabel 1NF, kunci gabungan `(no_pesanan, kode_barang)` digunakan untuk mengidentifikasi setiap baris detail barang. Namun, informasi utama pesanan bergantung pada `no_pesanan`, sedangkan jumlah dan harga barang saat transaksi bergantung pada gabungan `no_pesanan` dan `kode_barang`.

### 4.2 Penerapan 2NF pada Proyek

Untuk mengurangi ketergantungan parsial dan pengulangan data, informasi dipisahkan menjadi beberapa tabel berikut.

**1. Tabel Pesanan**

| Atribut | Keterangan |
|---|---|
| `no_pesanan` | Primary Key (PK) |
| `tanggal_pesanan` | Tanggal pesanan dibuat |
| `id_pelanggan` | Foreign Key (FK) |
| `status_pesanan` | Status pesanan |
| `alamat_pengiriman` | Alamat tujuan pengiriman |
| `ongkos_kirim` | Biaya pengiriman |

Tabel Pesanan menyimpan informasi utama pesanan yang bergantung pada `no_pesanan`.

**2. Tabel Detail Pesanan**

| Atribut | Keterangan |
|---|---|
| `no_pesanan` | Bagian dari PK dan FK ke Pesanan |
| `kode_barang` | Bagian dari PK dan FK ke Barang |
| `qty` | Jumlah barang yang dipesan |
| `harga_saat_transaksi` | Harga per unit ketika transaksi dilakukan |

Primary Key tabel Detail Pesanan adalah gabungan `(no_pesanan, kode_barang)`. Atribut `qty` dan `harga_saat_transaksi` bergantung pada kombinasi kedua atribut tersebut.

**3. Tabel Pembayaran**

| Atribut | Keterangan |
|---|---|
| `id_pembayaran` | Primary Key (PK) |
| `no_pesanan` | Foreign Key (FK) ke Pesanan |
| `tanggal_pembayaran` | Tanggal pembayaran |
| `metode_pembayaran` | Metode yang digunakan |
| `jumlah_pembayaran` | Jumlah uang yang dibayarkan |
| `status_pembayaran` | Status pembayaran |

Tabel Pembayaran menyimpan informasi pembayaran berdasarkan `id_pembayaran`, sehingga data pembayaran tidak perlu diulang untuk setiap barang dalam pesanan.

**4. Tabel Pengiriman**

| Atribut | Keterangan |
|---|---|
| `id_pengiriman` | Primary Key (PK) |
| `no_pesanan` | Foreign Key (FK) ke Pesanan |
| `jasa_pengiriman` | Jasa ekspedisi yang digunakan |
| `nomor_resi` | Nomor resi pengiriman |
| `status_pengiriman` | Status pengiriman |

Tabel Pengiriman menyimpan informasi pengiriman berdasarkan `id_pengiriman`, sehingga data pengiriman terpisah dari detail barang.

### 4.3 Hasil Normalisasi 2NF

Setelah dilakukan pemisahan, atribut detail barang tidak lagi bercampur dengan informasi utama pesanan. Data pembayaran dan pengiriman juga disimpan dalam tabel tersendiri agar struktur data lebih terorganisasi dan pengulangan informasi dapat dikurangi.

Pada tahap selanjutnya, normalisasi 3NF dilakukan untuk memisahkan atribut yang memiliki ketergantungan transitif, termasuk data pelanggan dan data utama barang. Dengan demikian, struktur tabel dapat disesuaikan dengan dependensi fungsional yang telah diidentifikasi.

## 5. Normalisasi 3NF

### 5.1 Pengertian 3NF

Bentuk normal ketiga atau Third Normal Form (3NF) merupakan tahap normalisasi setelah 2NF. Pada tahap ini, tabel harus memenuhi 2NF dan tidak memiliki ketergantungan transitif pada atribut nonkunci terhadap primary key.

Ketergantungan transitif dapat terjadi ketika atribut nonkunci bergantung pada atribut nonkunci lainnya, bukan secara langsung pada primary key. Oleh karena itu, atribut yang memiliki ketergantungan tersebut perlu dipisahkan ke dalam tabel tersendiri.

### 5.2 Penerapan 3NF pada Proyek

Pada proyek Toko Daring Aulia Indah, data pelanggan dan data barang dipisahkan dari tabel pesanan dan detail pesanan. Hasil pemisahan tersebut menghasilkan enam tabel berikut.

**1. Tabel Pelanggan**

| Atribut | Keterangan |
|---|---|
| `id_pelanggan` | Primary Key (PK) |
| `nama_pelanggan` | Nama pelanggan |
| `no_hp_pelanggan` | Nomor telepon pelanggan |
| `email_pelanggan` | Alamat email pelanggan |
| `alamat_pelanggan` | Alamat pelanggan |
| `poin_loyalitas` | Saldo poin loyalitas pelanggan |

Tabel Pelanggan menyimpan informasi pelanggan berdasarkan `id_pelanggan`.

**2. Tabel Barang**

| Atribut | Keterangan |
|---|---|
| `kode_barang` | Primary Key (PK) |
| `nama_barang` | Nama barang |
| `kategori_barang` | Kategori barang |
| `harga_barang` | Harga barang saat ini |
| `stok_barang` | Jumlah stok barang |
| `batas_minimum_stok` | Batas minimum stok |

Tabel Barang menyimpan informasi setiap barang berdasarkan `kode_barang`.

**3. Tabel Pesanan**

| Atribut | Keterangan |
|---|---|
| `no_pesanan` | Primary Key (PK) |
| `tanggal_pesanan` | Tanggal pesanan dibuat |
| `id_pelanggan` | Foreign Key (FK) ke Pelanggan |
| `status_pesanan` | Status pesanan |
| `alamat_pengiriman` | Alamat tujuan pengiriman |
| `ongkos_kirim` | Biaya pengiriman |

Tabel Pesanan menyimpan informasi utama setiap pesanan. Atribut `id_pelanggan` menghubungkan pesanan dengan pelanggan yang membuatnya.

**4. Tabel Detail Pesanan**

| Atribut | Keterangan |
|---|---|
| `no_pesanan` | Bagian dari PK dan FK ke Pesanan |
| `kode_barang` | Bagian dari PK dan FK ke Barang |
| `qty` | Jumlah barang yang dipesan |
| `harga_saat_transaksi` | Harga per unit ketika transaksi dilakukan |

Primary Key tabel Detail Pesanan merupakan kunci gabungan `(no_pesanan, kode_barang)`. Tabel ini menghubungkan pesanan dengan barang yang dibeli, sekaligus menyimpan jumlah dan harga barang ketika transaksi berlangsung.

**5. Tabel Pembayaran**

| Atribut | Keterangan |
|---|---|
| `id_pembayaran` | Primary Key (PK) |
| `no_pesanan` | Foreign Key (FK) ke Pesanan |
| `tanggal_pembayaran` | Tanggal pembayaran |
| `metode_pembayaran` | Metode pembayaran |
| `jumlah_pembayaran` | Jumlah uang yang dibayarkan |
| `status_pembayaran` | Status pembayaran |

Tabel Pembayaran menyimpan informasi pembayaran berdasarkan `id_pembayaran` dan menghubungkannya dengan pesanan terkait melalui `no_pesanan`.

**6. Tabel Pengiriman**

| Atribut | Keterangan |
|---|---|
| `id_pengiriman` | Primary Key (PK) |
| `no_pesanan` | Foreign Key (FK) ke Pesanan |
| `jasa_pengiriman` | Jasa ekspedisi yang digunakan |
| `nomor_resi` | Nomor resi pengiriman |
| `status_pengiriman` | Status pengiriman |

Tabel Pengiriman menyimpan informasi pengiriman berdasarkan `id_pengiriman` dan menghubungkannya dengan pesanan terkait melalui `no_pesanan`.

### 5.3 Hasil Normalisasi 3NF

Setelah dilakukan pemisahan, informasi pelanggan dan barang tidak perlu disimpan berulang kali pada setiap pesanan. Tabel Detail Pesanan menghubungkan data pesanan dengan barang, sedangkan tabel Pembayaran dan Pengiriman menyimpan informasi transaksi yang berkaitan dengan pesanan.

Berdasarkan dependensi fungsional yang telah diidentifikasi, struktur enam tabel tersebut dirancang agar atribut nonkunci bergantung pada primary key masing-masing tabel dan tidak memiliki ketergantungan transitif yang belum ditangani.

Hasil ini menjadi dasar untuk mengevaluasi pemenuhan Boyce-Codd Normal Form (BCNF) pada tahap berikutnya.

## 6. Normalisasi BCNF

### 6.1 Pengertian BCNF

Boyce-Codd Normal Form (BCNF) merupakan bentuk normal yang memeriksa apakah setiap determinan dalam suatu dependensi fungsional merupakan superkey. Suatu tabel memenuhi BCNF apabila untuk setiap dependensi fungsional nontrivial \(X \rightarrow Y\), atribut \(X\) merupakan superkey dari tabel tersebut.

### 6.2 Evaluasi BCNF pada Proyek

Evaluasi BCNF dilakukan dengan memeriksa dependensi fungsional yang telah diidentifikasi pada proyek Toko Daring Aulia Indah.

| Tabel | Dependensi fungsional utama | Determinan |
|---|---|---|
| Pelanggan | `id_pelanggan →` data pelanggan | `id_pelanggan` |
| Barang | `kode_barang →` data barang | `kode_barang` |
| Pesanan | `no_pesanan →` data pesanan | `no_pesanan` |
| Detail Pesanan | `(no_pesanan, kode_barang) → qty, harga_saat_transaksi` | `(no_pesanan, kode_barang)` |
| Pembayaran | `id_pembayaran →` data pembayaran | `id_pembayaran` |
| Pengiriman | `id_pengiriman →` data pengiriman | `id_pengiriman` |

Berdasarkan dependensi fungsional yang dicantumkan, determinan pada setiap tabel merupakan primary key atau kunci gabungan yang mengidentifikasi baris tabel tersebut. Dengan demikian, dependensi yang telah diidentifikasi tidak menunjukkan pelanggaran BCNF.

Namun, kesimpulan ini berlaku berdasarkan dependensi fungsional yang sudah diketahui. Jika terdapat dependensi fungsional lain yang belum dicatat, evaluasi BCNF perlu diperiksa kembali.

### 6.3 Hasil Evaluasi BCNF

Berdasarkan evaluasi awal, keenam tabel dirancang agar setiap determinan pada dependensi fungsional yang telah diidentifikasi merupakan superkey. Oleh karena itu, rancangan tersebut dapat dinyatakan memenuhi BCNF berdasarkan dependensi fungsional yang digunakan dalam analisis ini.

## 7. Analisis Nilai Turunan (Derived Values)

Nilai turunan adalah nilai yang diperoleh melalui perhitungan dari atribut lain. Dalam proyek Toko Daring Aulia Indah, terdapat beberapa nilai yang dapat dihitung berdasarkan data transaksi.

### 7.1 Subtotal Barang

Subtotal barang merupakan hasil perkalian antara jumlah barang yang dibeli dan harga barang per unit pada saat transaksi.

Rumus:

`subtotal = qty × harga_saat_transaksi`

Contoh:
- Barang BR001: 2 × Rp50.000 = Rp100.000
- Barang BR002: 1 × Rp30.000 = Rp30.000

Total subtotal barang adalah Rp130.000.

**Keputusan:** Subtotal tidak harus disimpan sebagai atribut tersendiri karena dapat dihitung dari `qty` dan `harga_saat_transaksi` pada tabel Detail Pesanan. Perhitungan ini juga mempertahankan harga transaksi meskipun harga barang saat ini berubah.

### 7.2 Total Pembayaran

Total pembayaran merupakan jumlah yang harus dibayarkan pelanggan setelah memperhitungkan subtotal barang, ongkos kirim, dan diskon jika terdapat diskon.

Rumus umum:

`total_pembayaran = total_subtotal + ongkos_kirim − diskon`

Contoh:
- Total subtotal barang: Rp130.000
- Ongkos kirim: Rp10.000
- Diskon: Rp0

Total pembayaran adalah Rp140.000.

**Keputusan:** Total pembayaran dapat dihitung ketika dibutuhkan dari data detail pesanan, ongkos kirim, dan diskon. Jika sistem memerlukan pencatatan jumlah yang ditetapkan pada saat transaksi, nilainya dapat disimpan sebagai catatan transaksi sesuai kebutuhan sistem. Nilai yang dicatat harus tetap konsisten dengan rincian transaksi.

### 7.3 Poin Loyalitas

Poin loyalitas merupakan poin yang diperoleh pelanggan berdasarkan ketentuan program loyalitas toko. Saldo poin dapat berubah karena penambahan poin dari transaksi atau penggunaan poin oleh pelanggan.

**Keputusan:** Atribut `poin_loyalitas` pada tabel Pelanggan dapat digunakan untuk menyimpan saldo poin terkini. Jika sistem perlu mencatat riwayat penambahan dan penggunaan poin, riwayat tersebut sebaiknya dicatat secara terpisah agar perubahan saldo dapat ditelusuri. Perhitungan poin mengikuti aturan program loyalitas yang ditetapkan oleh toko.

### 7.4 Kesimpulan Analisis Nilai Turunan

Subtotal dan total pembayaran dapat diperoleh melalui perhitungan berdasarkan data transaksi. Sementara itu, saldo poin loyalitas merupakan nilai yang dapat diperbarui berdasarkan aktivitas pelanggan. Keputusan menyimpan atau menghitung nilai-nilai tersebut perlu disesuaikan dengan kebutuhan sistem serta konsistensi data transaksi.

## 8. Evaluasi Entity Relationship Diagram (ERD)

Entity Relationship Diagram (ERD) digunakan untuk menggambarkan hubungan antarentitas dalam sistem Toko Daring Aulia Indah. Berdasarkan hasil normalisasi, terdapat enam entitas utama, yaitu Pelanggan, Barang, Pesanan, Detail Pesanan, Pembayaran, dan Pengiriman.

### 8.1 Entitas dan Kunci

Setiap entitas memiliki primary key (PK) sebagai identitas unik. Foreign key (FK) digunakan untuk menghubungkan entitas yang saling berhubungan.

| Entitas | Primary Key (PK) | Foreign Key (FK) |
|---|---|---|
| Pelanggan | `id_pelanggan` | — |
| Barang | `kode_barang` | — |
| Pesanan | `no_pesanan` | `id_pelanggan` |
| Detail Pesanan | `(no_pesanan, kode_barang)` | `no_pesanan`, `kode_barang` |
| Pembayaran | `id_pembayaran` | `no_pesanan` |
| Pengiriman | `id_pengiriman` | `no_pesanan` |

### 8.2 Hubungan Antarentitas

Hubungan antarentitas pada rancangan ERD adalah sebagai berikut.

1. **Pelanggan — Pesanan:** Satu pelanggan dapat membuat banyak pesanan, sedangkan setiap pesanan mengacu pada satu pelanggan.
2. **Pesanan — Detail Pesanan:** Satu pesanan dapat memiliki banyak baris detail pesanan, sedangkan setiap baris detail pesanan mengacu pada satu pesanan.
3. **Barang — Detail Pesanan:** Satu barang dapat muncul dalam banyak baris detail pesanan, sedangkan setiap baris detail pesanan mengacu pada satu barang.
4. **Pesanan — Pembayaran:** Pembayaran dihubungkan dengan pesanan melalui `no_pesanan`. Jumlah pembayaran untuk satu pesanan mengikuti aturan transaksi yang diterapkan oleh sistem.
5. **Pesanan — Pengiriman:** Pengiriman dihubungkan dengan pesanan melalui `no_pesanan`. Jumlah pengiriman untuk satu pesanan mengikuti aturan pengiriman yang diterapkan oleh sistem.

### 8.3 Evaluasi Hasil ERD

Rancangan ERD perlu menunjukkan keenam entitas beserta primary key, foreign key, atribut, dan hubungan antarentitasnya. Tabel Detail Pesanan berfungsi sebagai penghubung antara Pesanan dan Barang sehingga satu pesanan dapat berisi beberapa jenis barang.

Pemisahan entitas tersebut membantu mengurangi pengulangan data dan membuat hubungan antarentitas lebih jelas. Sebelum laporan diselesaikan, ERD perlu diperiksa kembali agar nama atribut, kunci, dan hubungan yang digambarkan sesuai dengan hasil normalisasi.

Catatan: Kardinalitas hubungan Pembayaran dan Pengiriman perlu mengikuti aturan bisnis yang digunakan dalam proyek. Jika aturan tersebut belum ditentukan, kardinalitasnya tidak boleh diasumsikan secara pasti.

## 9. Kesimpulan

Berdasarkan proses normalisasi yang telah dilakukan pada proyek Toko Daring Aulia Indah, dapat disimpulkan bahwa normalisasi membantu menyusun data agar lebih terorganisasi dan mengurangi pengulangan informasi.

Pada tahap UNF, informasi pelanggan, pesanan, barang, pembayaran, dan pengiriman masih digabungkan dalam satu catatan. Selanjutnya, pada tahap 1NF, kelompok data yang berulang diuraikan menjadi nilai-nilai atomik. Pada tahap 2NF, data dipisahkan berdasarkan ketergantungan atribut terhadap kunci utama. Kemudian, pada tahap 3NF, data pelanggan dan barang dipisahkan ke dalam tabel masing-masing untuk mengurangi ketergantungan transitif.

Hasil rancangan menghasilkan enam tabel utama, yaitu Pelanggan, Barang, Pesanan, Detail Pesanan, Pembayaran, dan Pengiriman. Setiap tabel memiliki primary key, sedangkan foreign key digunakan untuk menghubungkan tabel-tabel yang saling berkaitan.

Analisis BCNF dilakukan berdasarkan dependensi fungsional yang telah diidentifikasi. Selain itu, nilai turunan seperti subtotal dan total pembayaran dianalisis agar dapat dihitung dari data transaksi secara konsisten.

Dengan rancangan tersebut, struktur basis data diharapkan menjadi lebih terorganisasi, mudah dikelola, dan sesuai dengan kebutuhan sistem Toko Daring Aulia Indah. Kesesuaian akhir tetap perlu diperiksa berdasarkan aturan bisnis dan dependensi fungsional yang berlaku pada sistem.

## 10. Pernyataan Penggunaan AI

Dalam pengerjaan praktikum Modul 4, saya menggunakan ChatGPT untuk membantu memahami konsep normalisasi basis data, dependensi fungsional, pemeriksaan BCNF, serta analisis nilai turunan. Bantuan juga digunakan untuk meninjau susunan dan memperjelas penulisan beberapa bagian laporan.

Saya tetap bertanggung jawab untuk memeriksa kembali isi laporan, menyesuaikannya dengan kebutuhan proyek dan hasil pekerjaan, serta memahami konsep yang digunakan.