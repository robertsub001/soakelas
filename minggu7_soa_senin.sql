-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2020 at 09:19 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `minggu7_soa_senin`
--
CREATE DATABASE IF NOT EXISTS `minggu7_soa_senin` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `minggu7_soa_senin`;

-- --------------------------------------------------------

--
-- Table structure for table `kelurahan`
--

DROP TABLE IF EXISTS `kelurahan`;
CREATE TABLE IF NOT EXISTS `kelurahan` (
  `id_kecamatan` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kelurahan` varchar(50) NOT NULL,
  `kode_pos` varchar(5) NOT NULL,
  `kecamatan` varchar(50) NOT NULL,
  PRIMARY KEY (`id_kecamatan`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelurahan`
--

INSERT INTO `kelurahan` (`id_kecamatan`, `nama_kelurahan`, `kode_pos`, `kecamatan`) VALUES
(1, 'Darmo', '60241', 'Wonokromo'),
(2, 'Jagir', '60244', 'Wonokromo'),
(3, 'Darmo', '60241', 'Wonokromo'),
(4, 'Jagir', '60244', 'Wonokromo'),
(5, 'Ngagel', '60246', 'Wonokromo'),
(6, 'Sawunggaling', '60242', 'Wonokromo'),
(7, 'Ngagel', '60246', 'Wonokromo'),
(8, 'Sawunggaling', '60242', 'Wonokromo'),
(9, 'Sidosermo', '60239', 'Wonocolo'),
(10, 'Siwalankerto', '60236', 'Wonocolo'),
(11, 'Wonokromo', '60243', 'Wonokromo'),
(12, 'Margorejo', '60238', 'Wonocolo'),
(13, 'Jemur Wonosari', '60237', 'Wonocolo'),
(14, 'Bendul Merisi', '60239', 'Wonocolo'),
(15, 'Babatan', '60227', 'Wiyung'),
(16, 'Balas Klumprik', '60222', 'Wiyung'),
(17, 'Jajartunggal', '60229', 'Wiyung'),
(18, 'Wiyung', '60228', 'Wiyung'),
(19, 'Jajartunggal', '60229', 'Wiyung'),
(20, 'Kendangsari', '60292', 'Tenggilis Mejoyo'),
(21, 'Kutisari', '60291', 'Tenggilis Mejoyo'),
(22, 'Panjang Jiwo', '60299', 'Tenggilis Mejoyo'),
(23, 'Prapen', '60299', 'Tenggilis Mejoyo'),
(24, 'Tenggilis Mejoyo', '60292', 'Tenggilis Mejoyo'),
(25, 'Dukuh Setro', '60139', 'Tambaksari'),
(26, 'Gading', '60134', 'Tambaksari'),
(27, 'Kapasmadya Baru', '60137', 'Tambaksari'),
(28, 'Pacar Keling', '60131', 'Tambaksari'),
(29, 'Pacar Kembang', '60132', 'Tambaksari'),
(30, 'Ploso', '60133', 'Tambaksari'),
(31, 'Rangkah', '60135', 'Tambaksari'),
(32, 'Tambaksari', '60136', 'Tambaksari'),
(33, 'Kapasan', '60141', 'Simokerto'),
(34, 'Sidodadi', '60145', 'Simokerto'),
(35, 'Simolawang', '60144', 'Simokerto'),
(36, 'Tambakrejo', '60142', 'Simokerto'),
(37, 'Bulak', '60124', 'Bulak'),
(38, 'Kedung Cowek', '60125', 'Bulak'),
(39, 'Kenjeran', '60123', 'Bulak'),
(40, 'Komplek Kenjeran', '60121', 'Bulak'),
(41, 'Sukoililo', '60122', 'Bulak'),
(42, 'Asemrowo', '60182', 'Asemrowo'),
(43, 'Genting', '60182', 'Asemrowo'),
(44, 'Greges', '60183', 'Asemrowo'),
(45, 'Kalianak', '60183', 'Asemrowo'),
(46, 'Tambak Langon', '60184', 'Asemrowo'),
(47, 'Kandangan', '60199', 'Benowo'),
(48, 'Klakah Rejo', '60198', 'Benowo'),
(49, 'Romokalisari (Babat Jerawat)', '60192', 'Benowo'),
(50, 'Sememi', '60198', 'Benowo'),
(51, 'Tambakoso Wilangon', '60191', 'Benowo'),
(52, 'Gubeng', '60281', 'Gubeng'),
(53, 'Kertajaya', '60282', 'Gubeng'),
(54, 'Mojo', '60285', 'Gubeng'),
(55, 'Pucang Sewu', '60283', 'Gubeng'),
(56, 'Genteng', '60275', 'Genteng'),
(57, 'Kapasari', '60273', 'Genteng'),
(58, 'Ketabang', '60272', 'Genteng'),
(59, 'Peneleh', '60274', 'Genteng'),
(60, 'Jambangan', '60232', 'Jambangan'),
(61, 'Karah', '60232', 'Jambangan'),
(62, 'Kebonsari', '60233', 'Jambangan'),
(63, 'Pagesangan', '60233', 'Jambangan'),
(64, 'Kebonsari', '60233', 'Jambangan');

-- --------------------------------------------------------

--
-- Table structure for table `laporan_lostfound`
--

DROP TABLE IF EXISTS `laporan_lostfound`;
CREATE TABLE IF NOT EXISTS `laporan_lostfound` (
  `id_laporan` int(11) NOT NULL AUTO_INCREMENT,
  `judul_laporan` varchar(50) NOT NULL,
  `jenis_laporan` varchar(1) NOT NULL,
  `deskripsi_laporan` varchar(255) NOT NULL,
  `jenis_barang` varchar(50) NOT NULL,
  `alamat_kehilangan` varchar(50) NOT NULL,
  `tanggal_laporan` date NOT NULL,
  `kode_pos_alamat` varchar(5) NOT NULL,
  `email_pelapor` varchar(50) NOT NULL,
  PRIMARY KEY (`id_laporan`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `laporan_lostfound`
--

INSERT INTO `laporan_lostfound` (`id_laporan`, `judul_laporan`, `jenis_laporan`, `deskripsi_laporan`, `jenis_barang`, `alamat_kehilangan`, `tanggal_laporan`, `kode_pos_alamat`, `email_pelapor`) VALUES
(1, 'Penemuan Handphone Xiaomi Redmi 3', 'F', 'Ditemukan handphone Xiaomi Redmi 3 berwarna merah dengan casing Hello Kitty', 'Handphone', 'Jl. Kapas Krampung 49', '2020-03-20', '60133', 'robb@xyz.com'),
(2, 'Kehilangan Sepeda Motor Supra Hitam', 'L', 'Saya kehilangan sepeda motor Supra berwarna hitam saat saya berbelanja di salah satu toko dekat lokasi', 'Kendaraan', 'Jl. Gayung Kebonsari', '2020-03-21', '60231', 'ivan@xyz.com'),
(3, 'Kehilangan Jam Tangan CASIO', 'F', 'Saya kehilangan Jam Tangan CASIO G-Shock Black GA-700-1ADR saat saya sedang jalan ke Galaxy Mall', 'Jam Tangan', 'Jl. Dr. Ir. H. Soekarno No.35-39', '2020-03-24', '60115', 'robb@xyz.com'),
(4, 'Kehilangan Tas D&G warna kuning', 'L', 'Saat saya sedang berbelanja di Tunjungan Plaza saya kehilangan Tas D&G berwarna kuning', 'Tas', 'Jl. Jenderal Basuki Rachmat No.8-12', '2020-03-24', '60261', 'ivan@xyz.com');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `email_user` varchar(50) NOT NULL,
  `password_user` varchar(20) NOT NULL,
  `nama_user` varchar(50) NOT NULL,
  `saldo_user` int(11) NOT NULL,
  `api_key` varchar(10) NOT NULL,
  `tipe_user` int(1) NOT NULL,
  PRIMARY KEY (`email_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
