-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 16, 2018 at 03:49 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rentalmobil`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `admin` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `admin`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(50) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `telepon` char(15) NOT NULL,
  `password` varchar(200) NOT NULL,
  `no_ktp` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `nama_lengkap`, `username`, `alamat`, `telepon`, `password`, `no_ktp`) VALUES
(2, 'ulfah', 'ulfah', 'palengaan', '98765', '12345', '09876543');

-- --------------------------------------------------------

--
-- Table structure for table `galeri`
--

CREATE TABLE `galeri` (
  `id` int(50) DEFAULT NULL,
  `foto` blob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `harga`
--

CREATE TABLE `harga` (
  `id` int(50) NOT NULL,
  `mobil` varchar(100) NOT NULL,
  `kota` varchar(100) NOT NULL,
  `harga` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `harga`
--

INSERT INTO `harga` (`id`, `mobil`, `kota`, `harga`) VALUES
(3, '8', '2', '500.000'),
(4, '9', '3', '300.000'),
(5, '10', '2', '400.000'),
(8, '15', '2', '700.000'),
(9, '9', '5', '200.000'),
(10, '10', '2', '1000.000');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int(50) NOT NULL,
  `merek` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `merek`) VALUES
(1, 'Toyota'),
(2, 'Honda'),
(5, 'Suzuki');

-- --------------------------------------------------------

--
-- Table structure for table `kota`
--

CREATE TABLE `kota` (
  `id` int(50) NOT NULL,
  `kota_asal` varchar(50) NOT NULL,
  `kota_tujuan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kota`
--

INSERT INTO `kota` (`id`, `kota_asal`, `kota_tujuan`) VALUES
(2, 'pamekasan', 'surabaya'),
(3, 'Pamekasan', 'sumenep'),
(5, 'pamekasan', 'malang');

-- --------------------------------------------------------

--
-- Table structure for table `mobil`
--

CREATE TABLE `mobil` (
  `id` int(50) NOT NULL,
  `merek` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `tahun` varchar(50) NOT NULL,
  `warna` varchar(20) NOT NULL,
  `kursi` int(11) NOT NULL,
  `no_plat` varchar(50) NOT NULL,
  `gambar` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mobil`
--

INSERT INTO `mobil` (`id`, `merek`, `nama`, `tahun`, `warna`, `kursi`, `no_plat`, `gambar`) VALUES
(8, '2', 'Jazz', '2017', 'Putih', 4, 'M 3334 AG', 'jazz.jpg'),
(9, '1', 'Avanza', '2016', 'Hitam', 6, 'M 3286 GT', 'avanzahitam.jpg'),
(10, '5', 'Ertiga', '2014', 'Putih', 6, 'M 5555 GT', 'suzuki.jpg'),
(15, '1', 'Alphard', '2017', 'putih', 6, 'M 5555 AG', 'alpad.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `paket_tour`
--

CREATE TABLE `paket_tour` (
  `id` int(50) NOT NULL,
  `jenis_paket` enum('P1','P2','P3','P4') DEFAULT NULL,
  `harga_paket` int(50) DEFAULT NULL,
  `foto` blob,
  `id_wisata` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reservasi`
--

CREATE TABLE `reservasi` (
  `id` int(50) NOT NULL,
  `nobooking` varchar(100) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  `id_mobil` int(50) NOT NULL,
  `user_id` int(50) NOT NULL,
  `harga` varchar(100) NOT NULL,
  `asal` varchar(100) NOT NULL,
  `tujuan` varchar(100) NOT NULL,
  `id_paket_tour` int(50) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `pembayaran` enum('DP_50%','LUNAS') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reservasi`
--

INSERT INTO `reservasi` (`id`, `nobooking`, `tgl_pinjam`, `tgl_kembali`, `id_mobil`, `user_id`, `harga`, `asal`, `tujuan`, `id_paket_tour`, `status`, `pembayaran`) VALUES
(26, 'NKB7FU0T4O', '2017-07-20', '2017-07-21', 5, 2, '400.000', 'pamekasan', 'surabaya', NULL, 1, 'LUNAS'),
(27, '9QPR8I0JK6', '2017-07-19', '2017-07-20', 8, 2, '700.000', 'pamekasan', 'surabaya', NULL, 1, 'DP_50%');

-- --------------------------------------------------------

--
-- Table structure for table `wisata`
--

CREATE TABLE `wisata` (
  `Id` int(50) NOT NULL,
  `foto` blob,
  `Alamat` varchar(35) DEFAULT NULL,
  `Deskripsi` tinytext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `harga`
--
ALTER TABLE `harga`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kota`
--
ALTER TABLE `kota`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mobil`
--
ALTER TABLE `mobil`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paket_tour`
--
ALTER TABLE `paket_tour`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reservasi`
--
ALTER TABLE `reservasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wisata`
--
ALTER TABLE `wisata`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `harga`
--
ALTER TABLE `harga`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `kota`
--
ALTER TABLE `kota`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `mobil`
--
ALTER TABLE `mobil`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `paket_tour`
--
ALTER TABLE `paket_tour`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservasi`
--
ALTER TABLE `reservasi`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `wisata`
--
ALTER TABLE `wisata`
  MODIFY `Id` int(50) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
