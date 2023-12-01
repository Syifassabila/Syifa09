-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Sep 2023 pada 09.11
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tabungan_siswa`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_setoran`
--

CREATE TABLE `data_setoran` (
  `id_setoran` int(20) NOT NULL,
  `Nisn` varchar(50) NOT NULL,
  `Tanggal` date NOT NULL,
  `Nominal` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `data_setoran`
--

INSERT INTO `data_setoran` (`id_setoran`, `Nisn`, `Tanggal`, `Nominal`) VALUES
(1, '08774', '2023-09-18', 'Rp 20.000'),
(2, '08773', '2023-09-18', 'Rp 20.000'),
(3, '08766', '2023-09-18', 'Rp 20.000'),
(4, '08736', '2023-09-18', 'Rp 20.000'),
(5, '08711', '2023-09-18', 'Rp 20.000'),
(6, '08261', '2023-09-18', 'Rp 20.000'),
(7, '07653', '2023-09-25', 'Rp 20.000'),
(11, '08773', '2023-09-26', 'Rp.20.000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_siswa`
--

CREATE TABLE `data_siswa` (
  `Nisn` varchar(50) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `Kelas` varchar(50) NOT NULL,
  `Alamat` varchar(50) NOT NULL,
  `No_hp` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `data_siswa`
--

INSERT INTO `data_siswa` (`Nisn`, `Nama`, `Kelas`, `Alamat`, `No_hp`) VALUES
('02655', 'Garen muzzaki', 'Oracle', 'Padalarang', '086670126887'),
('03545', 'Nayla putri', 'Pemasaran', 'Padalarang', '08446567317'),
('03645', 'Naufan anggara', 'ACP', 'Padalarang', '086713537182'),
('03711', 'Rajendra ', 'PPLG', 'Padalarang', '086353865733'),
('03714', 'Quinnara putri', 'TKJ', 'Padalarang', '086357371379'),
('05116', 'Dylan Alva', 'ACP', 'Padalarang', '085266178055'),
('05162', 'Adilla azkia', 'ACP', 'Padalarang', '082638884290'),
('06151', 'Hanindya dwiyanti', 'ATPH', 'Padalarang', '088654768351'),
('06351', 'Luthfi zainal', 'TKJ', 'Padalarang', '085166707861'),
('06543', 'Haikal zaki', 'PPLG', 'Padalarang', '087654567566'),
('06654', 'Fabiola indriani', 'Oracle', 'padalarang', '087662765456'),
('07313', 'Latif firmansyah', 'TKJ', 'Padalarang', '082199016712'),
('07361', 'Vania aurellia', 'Pemasaran', 'Padalarang', '089926581215'),
('07415', 'Arsyad alfatih', 'Oracle', 'Padalarang', '0858771633990'),
('07511', 'Rafhadan nadiel', 'Oracle', 'Padalarang', '086173611545'),
('07651', 'Fadli naufal', 'Oracle', 'ciburuy', '08658127715'),
('07652', 'Adiva syakila', 'Oracle', 'Ngamprah', '081299671012'),
('07653', 'Rangga aditya', 'PPLG', 'Padalarang', '087663776532'),
('08261', 'Fabian maulana', 'ATPH', 'Padalarang', '085233167022'),
('08711', 'Ayla nathania', 'Pemasaran', 'Ngamprah', '08768681971'),
('08736', 'Cintya azalia', 'ATPH', 'padalarang', '087653198'),
('08766', 'Clara catalina', 'TKJ', 'padalarang', '085677651244'),
('08773', 'Jasmine', 'TKJ', 'padalarang', '08214891993'),
('08774', 'Athalla nattalia', 'Pemasaran', 'Bandung', '083129791032');

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE `login` (
  `id` int(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `login`
--

INSERT INTO `login` (`id`, `username`, `password`, `nama`) VALUES
(1, 'admin', '223344', 'fafa');

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `vsetoran`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `vsetoran` (
`id_setoran` int(20)
,`Nama` varchar(50)
,`Tanggal` date
,`Nominal` varchar(50)
);

-- --------------------------------------------------------

--
-- Struktur untuk view `vsetoran`
--
DROP TABLE IF EXISTS `vsetoran`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vsetoran`  AS SELECT `data_setoran`.`id_setoran` AS `id_setoran`, `data_siswa`.`Nama` AS `Nama`, `data_setoran`.`Tanggal` AS `Tanggal`, `data_setoran`.`Nominal` AS `Nominal` FROM (`data_setoran` left join `data_siswa` on(`data_siswa`.`Nisn` = `data_setoran`.`Nisn`))  ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `data_setoran`
--
ALTER TABLE `data_setoran`
  ADD PRIMARY KEY (`id_setoran`);

--
-- Indeks untuk tabel `data_siswa`
--
ALTER TABLE `data_siswa`
  ADD PRIMARY KEY (`Nisn`);

--
-- Indeks untuk tabel `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `data_setoran`
--
ALTER TABLE `data_setoran`
  MODIFY `id_setoran` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
