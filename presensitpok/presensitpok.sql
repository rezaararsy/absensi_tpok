-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 01, 2023 at 08:53 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `presensitpok`
--

-- --------------------------------------------------------

--
-- Table structure for table `departemen`
--

CREATE TABLE `departemen` (
  `kode_dept` char(4) NOT NULL,
  `nama_dept` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `departemen`
--

INSERT INTO `departemen` (`kode_dept`, `nama_dept`) VALUES
('CPL', 'Capil'),
('KEL', 'Kelurahan'),
('PIAK', 'Pengelolaan Informasi Administrasi Kependudukan'),
('PP', 'Pendaftaran Penduduk'),
('PS', 'Pencatatan Sipil');

-- --------------------------------------------------------

--
-- Table structure for table `jam_kerja`
--

CREATE TABLE `jam_kerja` (
  `kode_jam_kerja` char(4) NOT NULL,
  `nama_jam_kerja` varchar(15) NOT NULL,
  `awal_jam_masuk` time NOT NULL,
  `jam_masuk` time NOT NULL,
  `akhir_jam_masuk` time NOT NULL,
  `jam_pulang` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `jam_kerja`
--

INSERT INTO `jam_kerja` (`kode_jam_kerja`, `nama_jam_kerja`, `awal_jam_masuk`, `jam_masuk`, `akhir_jam_masuk`, `jam_pulang`) VALUES
('JK01', 'NON SHIFT', '05:00:00', '08:00:00', '09:00:00', '16:00:00'),
('JK02', 'NON SHIFT SABTU', '05:00:00', '07:00:00', '23:59:00', '12:00:00'),
('SH01', 'SHIFT 1', '06:00:00', '07:00:00', '08:00:00', '12:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `nik` char(5) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `jabatan` varchar(20) NOT NULL,
  `no_hp` varchar(13) NOT NULL,
  `foto` varchar(30) DEFAULT NULL,
  `kode_dept` char(3) NOT NULL,
  `kode_cabang` char(3) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`nik`, `nama_lengkap`, `jabatan`, `no_hp`, `foto`, `kode_dept`, `kode_cabang`, `password`, `remember_token`) VALUES
('12345', 'Karyawan 2', 'Head of IT', '089670444322', '12345.jpg', 'IT', 'TSM', '$2y$10$PzJrLtRr65wUG.3IzJ4Ks.fWJ7H..PwJmgMqaxRVFy87kx1KQzumq', NULL),
('12346', 'Karyawan 1', 'Manager HRD', '0', NULL, 'HRD', 'TSM', '$2y$10$QdMrj.oWK5jA0vutnR5jl.gL2cSAjoFjfGtf6MfsgF7mKhAHlBsAG', NULL),
('12347', 'Dinda', 'Accounting', '0', NULL, 'KEU', 'BDG', '$2y$10$u.Cpy.8nxTlHUJFMB2lHTeSyQpOw2Zx7MRu2fuT/nndxMigccZWFW', NULL),
('12349', 'Indira', 'Staff IT', '0899999', '12349.jpg', 'IT', 'BDG', '$2y$10$u.Cpy.8nxTlHUJFMB2lHTeSyQpOw2Zx7MRu2fuT/nndxMigccZWFW', NULL),
('9999', 'Elsa', 'Staff IT', '0898888', NULL, 'IT', 'BDG', '$2y$10$u.Cpy.8nxTlHUJFMB2lHTeSyQpOw2Zx7MRu2fuT/nndxMigccZWFW', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `konfigurasi_jamkerja`
--

CREATE TABLE `konfigurasi_jamkerja` (
  `nik` char(5) DEFAULT NULL,
  `hari` varchar(10) DEFAULT NULL,
  `kode_jam_kerja` char(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `konfigurasi_jamkerja`
--

INSERT INTO `konfigurasi_jamkerja` (`nik`, `hari`, `kode_jam_kerja`) VALUES
('9999', 'Senin', 'JK01'),
('9999', 'Selasa', 'JK01'),
('9999', 'Rabu', 'JK01'),
('9999', 'Kamis', 'JK01'),
('9999', 'Jumat', 'JK01'),
('9999', 'Sabtu', 'JK02'),
('12345', 'Senin', 'JK01'),
('12345', 'Selasa', 'JK01'),
('12345', 'Rabu', 'JK01'),
('12345', 'Kamis', 'JK01'),
('12345', 'Jumat', 'JK01'),
('12345', 'Sabtu', 'JK02'),
('12346', 'Senin', 'JK01'),
('12346', 'Selasa', 'JK01'),
('12346', 'Rabu', 'JK02'),
('12346', 'Kamis', 'JK01'),
('12346', 'Jumat', 'JK01'),
('12346', 'Sabtu', 'JK02');

-- --------------------------------------------------------

--
-- Table structure for table `konfigurasi_lokasi`
--

CREATE TABLE `konfigurasi_lokasi` (
  `id` int(11) NOT NULL,
  `lokasi_kantor` varchar(255) NOT NULL,
  `radius` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `konfigurasi_lokasi`
--

INSERT INTO `konfigurasi_lokasi` (`id`, `lokasi_kantor`, `radius`) VALUES
(1, '-8.0321902, 112.6419777', 40);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengajuan_izin`
--

CREATE TABLE `pengajuan_izin` (
  `id` int(11) NOT NULL,
  `nik` char(5) DEFAULT NULL,
  `tgl_izin` date DEFAULT NULL,
  `status` char(1) DEFAULT NULL COMMENT 'i : izin s : sakit',
  `keterangan` varchar(255) DEFAULT NULL,
  `status_approved` char(1) DEFAULT '0' COMMENT '0 : Pending 1: Disetuji 2: Ditolak'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `pengajuan_izin`
--

INSERT INTO `pengajuan_izin` (`id`, `nik`, `tgl_izin`, `status`, `keterangan`, `status_approved`) VALUES
(2, '12345', '2023-02-23', 'i', 'Jenguk Saudara yang Sakit', '2'),
(3, '12345', '2023-02-23', 's', 'Mag', '0'),
(4, '12345', '2023-02-23', 'i', 'Mau Ke Rumah Saudara', '0'),
(5, '12346', '2023-03-14', 'i', 'Harus Datang Ke Acara Pernikahan Saudara', '2'),
(6, '8888', '2023-03-21', 'i', 'Ada Acara Keluarga', '1');

-- --------------------------------------------------------

--
-- Table structure for table `presensi`
--

CREATE TABLE `presensi` (
  `id` int(11) NOT NULL,
  `nik` char(5) NOT NULL,
  `tgl_presensi` date NOT NULL,
  `jam_in` time NOT NULL,
  `jam_out` time DEFAULT NULL,
  `foto_in` varchar(255) NOT NULL,
  `foto_out` varchar(255) DEFAULT NULL,
  `lokasi_in` text NOT NULL,
  `lokasi_out` text DEFAULT NULL,
  `kode_jam_kerja` char(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `presensi`
--

INSERT INTO `presensi` (`id`, `nik`, `tgl_presensi`, `jam_in`, `jam_out`, `foto_in`, `foto_out`, `lokasi_in`, `lokasi_out`, `kode_jam_kerja`) VALUES
(34, '12345', '2023-06-21', '07:24:08', NULL, '12345-2023-06-21-in.png', NULL, '-7.2912792500000005,108.231705', NULL, 'JK01'),
(35, '12346', '2023-06-21', '07:24:59', NULL, '12346-2023-06-21-in.png', NULL, '-7.2912792500000005,108.231705', NULL, 'JK02'),
(36, '12346', '2023-06-24', '23:18:23', '23:18:40', '12346-2023-06-24-in.png', '12346-2023-06-24-out.png', '-7.2912792500000005,108.231705', '-7.2912792500000005,108.231705', 'JK02');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', NULL, '$2y$10$u.Cpy.8nxTlHUJFMB2lHTeSyQpOw2Zx7MRu2fuT/nndxMigccZWFW', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `departemen`
--
ALTER TABLE `departemen`
  ADD PRIMARY KEY (`kode_dept`) USING BTREE;

--
-- Indexes for table `jam_kerja`
--
ALTER TABLE `jam_kerja`
  ADD PRIMARY KEY (`kode_jam_kerja`) USING BTREE;

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`nik`) USING BTREE;

--
-- Indexes for table `konfigurasi_lokasi`
--
ALTER TABLE `konfigurasi_lokasi`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengajuan_izin`
--
ALTER TABLE `pengajuan_izin`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `presensi`
--
ALTER TABLE `presensi`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `users_email_unique` (`email`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `konfigurasi_lokasi`
--
ALTER TABLE `konfigurasi_lokasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pengajuan_izin`
--
ALTER TABLE `pengajuan_izin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `presensi`
--
ALTER TABLE `presensi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
