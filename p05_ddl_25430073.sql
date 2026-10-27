
USE toko_073;

-- Menghapus tabel lama sesuai urutan relasi foreign key.
-- PERINGATAN: menjalankan bagian ini akan menghapus tabel beserta datanya.
DROP TABLE IF EXISTS pengiriman;
DROP TABLE IF EXISTS pembayaran;
DROP TABLE IF EXISTS detail_pesanan;
DROP TABLE IF EXISTS pesanan;
DROP TABLE IF EXISTS barang;
DROP TABLE IF EXISTS pelanggan;


-- AB-01: Setiap pelanggan memiliki id_pelanggan yang unik.
CREATE TABLE pelanggan (
    id_pelanggan VARCHAR(20) NOT NULL,
    nama_pelanggan VARCHAR(100) NOT NULL,
    no_hp_pelanggan VARCHAR(20),
    email_pelanggan VARCHAR(100),
    alamat_pelanggan VARCHAR(255),
    poin_loyalitas INT UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY (id_pelanggan)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- AB-02: Setiap barang memiliki kode_barang yang unik.
-- AB-03: Stok barang tidak boleh bernilai negatif.
-- AB-09: Barang perlu mendapat perhatian jika stok di bawah batas minimum.
CREATE TABLE barang (
    kode_barang VARCHAR(20) NOT NULL,
    nama_barang VARCHAR(100) NOT NULL,
    kategori_barang VARCHAR(50),
    harga_barang BIGINT UNSIGNED NOT NULL,
    stok_barang INT UNSIGNED NOT NULL DEFAULT 0,
    batas_minimum_stok INT UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY (kode_barang),
    CONSTRAINT chk_batas_minimum_stok
        CHECK (batas_minimum_stok >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- AB-04: Setiap pesanan memiliki no_pesanan yang unik.
CREATE TABLE pesanan (
    no_pesanan VARCHAR(30) NOT NULL,
    id_pelanggan VARCHAR(20) NOT NULL,
    tanggal_pesanan DATETIME NOT NULL,
    status_pesanan VARCHAR(30) NOT NULL,
    alamat_pengiriman VARCHAR(255) NOT NULL,
    ongkos_kirim BIGINT UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY (no_pesanan),
    CONSTRAINT fk_pesanan_pelanggan
        FOREIGN KEY (id_pelanggan)
        REFERENCES pelanggan(id_pelanggan)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- AB-05: Setiap pesanan harus memiliki minimal satu detail pesanan.
-- AB-06: Harga barang saat transaksi disimpan dan tidak mengikuti
-- perubahan harga barang saat ini.
CREATE TABLE detail_pesanan (
    no_pesanan VARCHAR(30) NOT NULL,
    kode_barang VARCHAR(20) NOT NULL,
    qty INT UNSIGNED NOT NULL,
    harga_saat_transaksi BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (no_pesanan, kode_barang),
    CONSTRAINT fk_detail_pesanan
        FOREIGN KEY (no_pesanan)
        REFERENCES pesanan(no_pesanan),
    CONSTRAINT fk_detail_barang
        FOREIGN KEY (kode_barang)
        REFERENCES barang(kode_barang),
    CONSTRAINT chk_detail_qty
        CHECK (qty > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- AB-07: Pembayaran hanya dapat dicatat untuk pesanan yang sudah ada.
CREATE TABLE pembayaran (
    id_pembayaran VARCHAR(20) NOT NULL,
    no_pesanan VARCHAR(30) NOT NULL,
    tanggal_pembayaran DATETIME NOT NULL,
    metode_pembayaran VARCHAR(30) NOT NULL,
    jumlah_pembayaran BIGINT UNSIGNED NOT NULL,
    status_pembayaran VARCHAR(30) NOT NULL,
    PRIMARY KEY (id_pembayaran),
    CONSTRAINT fk_pembayaran_pesanan
        FOREIGN KEY (no_pesanan)
        REFERENCES pesanan(no_pesanan)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- AB-08: Pesanan dapat diproses dan dikirim setelah pembayaran dikonfirmasi.
CREATE TABLE pengiriman (
    id_pengiriman VARCHAR(20) NOT NULL,
    no_pesanan VARCHAR(30) NOT NULL,
    jasa_pengiriman VARCHAR(50) NOT NULL,
    nomor_resi VARCHAR(100),
    status_pengiriman VARCHAR(30) NOT NULL,
    PRIMARY KEY (id_pengiriman),
    CONSTRAINT fk_pengiriman_pesanan
        FOREIGN KEY (no_pesanan)
        REFERENCES pesanan(no_pesanan)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
