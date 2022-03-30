-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Mar 2022 pada 04.37
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tubesdipl`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `akun`
--

CREATE TABLE `akun` (
  `Username` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `IDCustomer` varchar(4) NOT NULL,
  `Nama` varchar(20) NOT NULL,
  `Telphone` varchar(13) NOT NULL,
  `Username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `IDKategori` varchar(4) NOT NULL,
  `Nama` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `meja`
--

CREATE TABLE `meja` (
  `IDResto` varchar(4) NOT NULL,
  `NoMeja` int(2) NOT NULL,
  `Status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE `menu` (
  `IDMenu` varchar(4) NOT NULL,
  `IDResto` varchar(4) NOT NULL,
  `Nama` varchar(30) NOT NULL,
  `Harga` int(9) NOT NULL,
  `Deskripsi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `payment`
--

CREATE TABLE `payment` (
  `IDPayment` varchar(4) NOT NULL,
  `IDReservasi` varchar(4) NOT NULL,
  `TotalHarga` int(9) NOT NULL,
  `Status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan`
--

CREATE TABLE `pesanan` (
  `IDReservasi` varchar(4) NOT NULL,
  `DaftarMenu` varchar(50) NOT NULL,
  `TotalHarga` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `reservasi`
--

CREATE TABLE `reservasi` (
  `IDReservasi` varchar(4) NOT NULL,
  `IDCustomer` varchar(4) NOT NULL,
  `IDResto` varchar(4) NOT NULL,
  `NoMeja` int(2) NOT NULL,
  `Tanggal` date NOT NULL,
  `Waktu` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `restoran`
--

CREATE TABLE `restoran` (
  `IDResto` varchar(4) NOT NULL,
  `Nama` varchar(20) NOT NULL,
  `Alamat` varchar(50) NOT NULL,
  `IDKategori` varchar(20) NOT NULL,
  `Telphone` varchar(13) NOT NULL,
  `Jml Meja` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`Username`);

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`IDCustomer`),
  ADD KEY `Username` (`Username`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`IDKategori`);

--
-- Indeks untuk tabel `meja`
--
ALTER TABLE `meja`
  ADD PRIMARY KEY (`NoMeja`),
  ADD KEY `IDResto` (`IDResto`);

--
-- Indeks untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`IDMenu`),
  ADD KEY `IDResto` (`IDResto`);

--
-- Indeks untuk tabel `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`IDPayment`),
  ADD KEY `IDReservasi` (`IDReservasi`);

--
-- Indeks untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD KEY `IDReservasi` (`IDReservasi`);

--
-- Indeks untuk tabel `reservasi`
--
ALTER TABLE `reservasi`
  ADD PRIMARY KEY (`IDReservasi`),
  ADD KEY `IDCustomer` (`IDCustomer`),
  ADD KEY `IDResto` (`IDResto`),
  ADD KEY `NoMeja` (`NoMeja`);

--
-- Indeks untuk tabel `restoran`
--
ALTER TABLE `restoran`
  ADD PRIMARY KEY (`IDResto`),
  ADD KEY `IDKategori` (`IDKategori`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `akun` (`Username`);

--
-- Ketidakleluasaan untuk tabel `meja`
--
ALTER TABLE `meja`
  ADD CONSTRAINT `meja_ibfk_1` FOREIGN KEY (`IDResto`) REFERENCES `restoran` (`IDResto`);

--
-- Ketidakleluasaan untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`IDResto`) REFERENCES `restoran` (`IDResto`);

--
-- Ketidakleluasaan untuk tabel `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`IDReservasi`) REFERENCES `reservasi` (`IDReservasi`);

--
-- Ketidakleluasaan untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD CONSTRAINT `pesanan_ibfk_1` FOREIGN KEY (`IDReservasi`) REFERENCES `reservasi` (`IDReservasi`);

--
-- Ketidakleluasaan untuk tabel `reservasi`
--
ALTER TABLE `reservasi`
  ADD CONSTRAINT `reservasi_ibfk_1` FOREIGN KEY (`IDCustomer`) REFERENCES `customer` (`IDCustomer`),
  ADD CONSTRAINT `reservasi_ibfk_2` FOREIGN KEY (`IDResto`) REFERENCES `restoran` (`IDResto`),
  ADD CONSTRAINT `reservasi_ibfk_3` FOREIGN KEY (`NoMeja`) REFERENCES `meja` (`NoMeja`);

--
-- Ketidakleluasaan untuk tabel `restoran`
--
ALTER TABLE `restoran`
  ADD CONSTRAINT `restoran_ibfk_1` FOREIGN KEY (`IDKategori`) REFERENCES `kategori` (`IDKategori`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
