-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 12, 2022 at 04:04 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `imk`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

DROP TABLE IF EXISTS `barang`;
CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  `harga_beli` varchar(100) NOT NULL,
  `harga_jual` varchar(100) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `id_kategori`, `stok`, `harga_beli`, `harga_jual`, `date_added`) VALUES
(6, 'keyboard razer', 8, 21, '200000', '230000', '2022-04-23 08:21:09'),
(7, 'pakaian anak size M', 3, 26, '120000', '140000', '2022-04-23 08:21:27'),
(8, 'Vans Old School Mono Black White Pria', 2, 21, '400000', '450000', '2022-04-13 05:19:55'),
(9, 'Rexus Headset Gaming Vonix F26', 8, 20, '90000', '120000', '2018-01-11 10:32:27'),
(10, 'Ripcurl detroit chrono', 4, 37, '130000', '150000', '2018-01-15 01:13:54'),
(11, 'tic tac', 12, 40, '600', '1000', '2017-12-18 03:23:33'),
(12, 'Xiaomi Mi4c red White  2/16 GB', 5, 39, '1100000', '1400000', '2018-01-15 01:34:36'),
(13, 'Sennheiser HD 202', 13, 18, '400000', '440000', '2022-04-13 03:24:13'),
(15, 'Baju Batik', 3, 50, '150000', '160000', '2022-04-13 05:29:25');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

DROP TABLE IF EXISTS `kategori`;
CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(2, 'Sepatu'),
(3, 'Pakaian'),
(4, 'Jam Tangan'),
(5, 'Handphone'),
(6, 'Elektronik'),
(7, 'Kesehatan'),
(8, 'Gaming'),
(11, 'Tas'),
(12, 'Makanan'),
(13, 'Audio'),
(15, 'Minuman');

-- --------------------------------------------------------

--
-- Table structure for table `sub_transaksi`
--

DROP TABLE IF EXISTS `sub_transaksi`;
CREATE TABLE `sub_transaksi` (
  `id_subtransaksi` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `jumlah_beli` int(11) NOT NULL,
  `total_harga` varchar(20) NOT NULL,
  `no_invoice` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_transaksi`
--

INSERT INTO `sub_transaksi` (`id_subtransaksi`, `id_barang`, `id_transaksi`, `jumlah_beli`, `total_harga`, `no_invoice`) VALUES
(17, 8, 14, 1, '450000', '15/AF/2/18/02/18/21'),
(18, 6, 14, 2, '460000', '15/AF/2/18/02/18/21'),
(19, 6, 15, 2, '460000', '15/AF/4/18/07/57/25'),
(20, 8, 15, 1, '450000', '15/AF/4/18/07/57/25'),
(21, 8, 16, 2, '900000', '30/AF/2/22/05/55/15'),
(22, 7, 17, 3, '420000', '02/AF/2/22/05/51/29'),
(23, 6, 18, 3, '690000', '07/AF/2/22/03/09/59'),
(24, 13, 19, 2, '880000', '13/AF/3/22/05/24/22'),
(25, 8, 20, 1, '450000', '13/AF/2/22/07/21/07'),
(26, 7, 21, 1, '140000', '21/AF/2/22/05/51/00');

-- --------------------------------------------------------

--
-- Table structure for table `tempo`
--

DROP TABLE IF EXISTS `tempo`;
CREATE TABLE `tempo` (
  `id_subtransaksi` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `jumlah_beli` int(11) NOT NULL,
  `total_harga` varchar(20) NOT NULL,
  `trx` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

DROP TABLE IF EXISTS `transaksi`;
CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `tgl_transaksi` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `kode_kasir` int(11) NOT NULL,
  `total_bayar` varchar(20) NOT NULL,
  `no_invoice` varchar(20) NOT NULL,
  `nama_pembeli` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `tgl_transaksi`, `kode_kasir`, `total_bayar`, `no_invoice`, `nama_pembeli`) VALUES
(14, '2018-01-15 01:18:21', 2, '910000', '15/AF/2/18/02/18/21', 'athoul muwafiq'),
(15, '2018-01-15 06:57:25', 4, '910000', '15/AF/4/18/07/57/25', 'afiq'),
(16, '2022-03-30 15:55:15', 2, '900000', '30/AF/2/22/05/55/15', 'hasan'),
(17, '2022-04-02 03:51:29', 2, '420000', '02/AF/2/22/05/51/29', 'farras'),
(18, '2022-04-07 13:09:59', 2, '690000', '07/AF/2/22/03/09/59', 'arief'),
(19, '2022-04-13 03:24:22', 3, '880000', '13/AF/3/22/05/24/22', 'mas'),
(20, '2022-04-13 05:21:07', 2, '450000', '13/AF/2/22/07/21/07', 'alex'),
(21, '2022-04-21 03:51:00', 2, '140000', '21/AF/2/22/05/51/00', 'abah');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `status` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `status`, `date_created`) VALUES
(1, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 1, '2017-12-12 00:44:45'),
(2, 'kasir1', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 2, '2017-12-17 09:52:27'),
(3, 'kasir2', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 2, '2017-12-21 10:07:51'),
(4, 'kasir3', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 2, '2018-01-13 15:53:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `sub_transaksi`
--
ALTER TABLE `sub_transaksi`
  ADD PRIMARY KEY (`id_subtransaksi`);

--
-- Indexes for table `tempo`
--
ALTER TABLE `tempo`
  ADD PRIMARY KEY (`id_subtransaksi`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `sub_transaksi`
--
ALTER TABLE `sub_transaksi`
  MODIFY `id_subtransaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tempo`
--
ALTER TABLE `tempo`
  MODIFY `id_subtransaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
