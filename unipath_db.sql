-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Bulan Mei 2026 pada 08.27
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `unipath_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `announcements`
--

INSERT INTO `announcements` (`id`, `title`, `content`, `created_by`, `created_at`) VALUES
(1, 'Welcome to UNIPATH', 'Welcome to our university admission portal! Please complete your registration to start your journey with us.', 1, '2026-05-18 05:38:28'),
(2, 'Hi', 'HAHA', 1, '2026-05-18 06:18:24'),
(3, 'SELAMAT!', 'Kamu diterima!', 1, '2026-05-18 06:18:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `documents`
--

CREATE TABLE `documents` (
  `id` int(11) NOT NULL,
  `registration_id` int(11) NOT NULL,
  `document_type` varchar(50) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `documents`
--

INSERT INTO `documents` (`id`, `registration_id`, `document_type`, `file_path`, `uploaded_at`) VALUES
(1, 1, 'Document 1', '../uploads/1779083960_WhatsApp Image 2026-05-18 at 07.32.39.jpeg', '2026-05-18 05:59:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `registrations`
--

CREATE TABLE `registrations` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `registration_number` varchar(20) DEFAULT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `birth_place` varchar(50) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `address` text DEFAULT NULL,
  `high_school` varchar(100) DEFAULT NULL,
  `graduation_year` int(11) DEFAULT NULL,
  `desired_program` varchar(100) DEFAULT NULL,
  `status` enum('pending','documents_reviewed','accepted','rejected','reenrolled') DEFAULT 'pending',
  `documents_path` text DEFAULT NULL,
  `registration_fee` enum('pending','paid') DEFAULT 'pending',
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `reviewed_at` timestamp NULL DEFAULT NULL,
  `accepted_at` timestamp NULL DEFAULT NULL,
  `reenrolled_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `registrations`
--

INSERT INTO `registrations` (`id`, `user_id`, `registration_number`, `full_name`, `email`, `phone`, `birth_place`, `birth_date`, `address`, `high_school`, `graduation_year`, `desired_program`, `status`, `documents_path`, `registration_fee`, `submitted_at`, `reviewed_at`, `accepted_at`, `reenrolled_at`) VALUES
(1, 2, 'UNP202605189298', 'Najwa Ramadhan', 'snnajward@gmail.com', '087846476630', 'CRB', '2000-10-04', 'BAD', 'MANTIC', 2023, 'Computer Science', 'reenrolled', NULL, 'paid', '2026-05-18 05:59:20', '2026-05-18 06:18:04', '2026-05-18 06:17:23', '2026-05-18 06:18:04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `role` enum('user','admin') DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `phone`, `role`, `created_at`) VALUES
(1, 'Administrator', 'admin@unipath.com', '$2y$10$ue5qxvrzECHeYE4TrlBeUep/I9lhWMv7Ju7SD75rBs8oZwt.h18BS', '081234567890', 'admin', '2026-05-18 05:38:28'),
(2, 'Najwa Ramadhan', 'snnajward@gmail.com', '$2y$10$V4ltTjhhn/dCs0v/3l2oJOBReaomm148xSWNZM0K920bWdDobZVRy', '087846476630', 'user', '2026-05-18 05:44:45');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indeks untuk tabel `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `registration_id` (`registration_id`);

--
-- Indeks untuk tabel `registrations`
--
ALTER TABLE `registrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `registration_number` (`registration_number`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `registrations`
--
ALTER TABLE `registrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `announcements_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `documents_ibfk_1` FOREIGN KEY (`registration_id`) REFERENCES `registrations` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `registrations`
--
ALTER TABLE `registrations`
  ADD CONSTRAINT `registrations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
