-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 23 Mar 2021 pada 03.09
-- Versi server: 10.4.10-MariaDB
-- Versi PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bonshay`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `id_customer` int(10) NOT NULL,
  `nama_customer` varchar(50) NOT NULL,
  `username_customer` varchar(20) NOT NULL,
  `password_customer` varchar(20) NOT NULL,
  `tgllahir_customer` date NOT NULL,
  `alamat_customer` varchar(100) NOT NULL,
  `email_customer` varchar(30) NOT NULL,
  `nohp_customer` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`id_customer`, `nama_customer`, `username_customer`, `password_customer`, `tgllahir_customer`, `alamat_customer`, `email_customer`, `nohp_customer`) VALUES
(3, 'Mizan Holie', 'Mizan', 'ashdaksdhja000', '1999-09-26', 'Karanglewas', 'mizan@gmail.com', '0856789082789'),
(4, 'Husni Umaer', 'Husni', 'anascnaouio8991', '2001-01-01', 'Bojongsoang', 'hus@mail.com', '0827178181728'),
(5, 'Rozaq Mol', 'Rozaq', 'aasdsasdasdas11', '1999-01-01', 'Rancaengkek', 'Roz@mail.com', '0856789082789'),
(6, 'Fauzan Yuriz', 'Fauzan', '12e1huhudjjdaj', '1999-01-02', 'Lembang', 'uzan@mail.com', '0856789082789'),
(7, 'Yolo yoli', 'Yolo', 'qdnoqidjuw1hû11', '2000-01-01', 'Buah Batu', 'Yolo@mail.com', '0866277237288');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan`
--

CREATE TABLE `pesanan` (
  `id_pesanan` int(10) NOT NULL,
  `id_transaksi` int(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  `harga_pesanan` varchar(12) NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  `tgl_pesanan` date NOT NULL,
  `jumlah` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pesanan`
--

INSERT INTO `pesanan` (`id_pesanan`, `id_transaksi`, `status`, `harga_pesanan`, `keterangan`, `tgl_pesanan`, `jumlah`) VALUES
(1, 1, 'Menunggu', '100000', 'Belum di transfer', '2021-02-01', 2),
(2, 2, 'Gagal', '70000', 'ga di transfer', '2021-02-16', 1),
(3, 3, 'Berhasil', '85000', '-', '2021-02-05', 3),
(4, 4, 'Berhasil', '150000', '-', '2021-02-03', 4),
(5, 5, 'Gagal', '123000', 'ga di transfer', '2021-02-28', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `seller`
--

CREATE TABLE `seller` (
  `id_seller` int(10) NOT NULL,
  `nama_seller` varchar(50) NOT NULL,
  `username_seller` varchar(20) NOT NULL,
  `password_seller` varchar(20) NOT NULL,
  `tgllahir_seller` date NOT NULL,
  `alamat_seller` varchar(100) NOT NULL,
  `email_seller` varchar(30) NOT NULL,
  `nohp_seller` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `seller`
--

INSERT INTO `seller` (`id_seller`, `nama_seller`, `username_seller`, `password_seller`, `tgllahir_seller`, `alamat_seller`, `email_seller`, `nohp_seller`) VALUES
(3, 'Zayn Malik', 'zaynmalik', 'khai', '1993-01-12', 'Pennyslavia', 'zayn@gmail.com', '081234567230'),
(4, 'Harry Styles', 'harrystyles', 'sapelu', '1994-02-01', 'New York', 'harry@gmail.com', '081234836640'),
(7, 'Niall Horan', 'niallhoran', 'bayi', '1993-09-13', 'Ireland', 'niall@gmail.com', '081266558590'),
(8, 'Louis Tomlinson', 'louistomlinson', 'freddie', '1991-12-24', 'Hertfordshire', 'louis@gmail.com', '081266339900'),
(9, 'Liam Payne', 'liampayne', 'bear', '1993-08-29', 'London', 'liam@gmail.com', '081276539130');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tanaman`
--

CREATE TABLE `tanaman` (
  `id_tanaman` int(10) NOT NULL,
  `id_seller` int(10) NOT NULL,
  `nama_tanaman` varchar(50) NOT NULL,
  `harga_tanaman` int(12) NOT NULL,
  `deskripsi` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tanaman`
--

INSERT INTO `tanaman` (`id_tanaman`, `id_seller`, `nama_tanaman`, `harga_tanaman`, `deskripsi`) VALUES
(1, 3, 'Kuping Gajah', 10000, 'Kuping gajah atau yang memiliki nama latin Anthurium merupakan tanaman hias yang termasuk dalam keluarga Araceae. Pada umumnya daun kuping gajah memiliki warna hijau tua dan memiliki tulang daun berwarna putih kehijauan. Panjang tumbuhan kuping gajah bisa mencapai 20-40 cm dan lebar 15-38 cm'),
(2, 4, 'Tanduk Rusa', 100000, 'Tanduk Rusa atau (Platycerium coronarium) termasuk kedalam jenis paku-pakuan. Tanduk rusa adalah jenis tanaman epifit, tanaman yang menempel pada benda atau pohon lain tanpa merugikan tumbuhan yang menjadi inangnya. Tanduk rusa menyukai tempat yang tidak memperoleh sinar matahari secara langsung.\r\nu'),
(3, 7, 'Lidah Mertua', 40000, 'Sansevieria atau lidah mertua adalah marga tanaman hias yang cukup populer sebagai penghias bagian dalam rumah karena tanaman ini dapat tumbuh dalam kondisi yang sedikit air dan cahaya matahari. Sansevieria memiliki daun keras, sukulen, tegak, dengan ujung meruncing'),
(4, 8, 'Suplir', 60000, 'Suplir adalah tumbuhan paku populer untuk penghias ruangan atau taman yang termasuk dalam marga Adiantum, yang tergolong dalam anaksuku Vittarioideae, suku Pteridaceae. Nama \"suplir\" merupakan adaptasi dari chevelure, nama yang diperkenalkan orang Belanda sewaktu masa penjajahan'),
(5, 9, 'Sri Rejeki (Aglaonema)', 90000, 'Aglaonema adalah tanaman hias populer dari suku talas-talasan atau Araceae. Genus Aglaonema memiliki sekitar 30 spesies. Habitat asli tanaman ini adalah di bawah hutan hujan tropis, tumbuh baik pada areal dengan intensitas penyinaran rendah dan kelembaban tinggi.');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(10) NOT NULL,
  `id_customer` int(10) NOT NULL,
  `id_tanaman` int(10) NOT NULL,
  `totalharga` int(12) NOT NULL,
  `tgl_transaksi` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_customer`, `id_tanaman`, `totalharga`, `tgl_transaksi`) VALUES
(1, 3, 1, 100000, '2021-02-01'),
(2, 4, 2, 70000, '2021-02-16'),
(3, 5, 3, 85000, '2021-02-05'),
(4, 5, 4, 150000, '2021-02-03'),
(5, 7, 2, 123000, '2021-02-28');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indeks untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id_pesanan`),
  ADD KEY `id_transaksi` (`id_transaksi`);

--
-- Indeks untuk tabel `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`id_seller`);

--
-- Indeks untuk tabel `tanaman`
--
ALTER TABLE `tanaman`
  ADD PRIMARY KEY (`id_tanaman`),
  ADD KEY `id_seller` (`id_seller`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_tanaman` (`id_tanaman`),
  ADD KEY `id_customer` (`id_customer`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `customer`
--
ALTER TABLE `customer`
  MODIFY `id_customer` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id_pesanan` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `seller`
--
ALTER TABLE `seller`
  MODIFY `id_seller` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `tanaman`
--
ALTER TABLE `tanaman`
  MODIFY `id_tanaman` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD CONSTRAINT `pesanan_ibfk_1` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`);

--
-- Ketidakleluasaan untuk tabel `tanaman`
--
ALTER TABLE `tanaman`
  ADD CONSTRAINT `tanaman_ibfk_1` FOREIGN KEY (`id_seller`) REFERENCES `seller` (`id_seller`);

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_tanaman`) REFERENCES `tanaman` (`id_tanaman`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
