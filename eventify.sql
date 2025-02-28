-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 28, 2025 at 07:55 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eventify`
--

-- --------------------------------------------------------

--
-- Table structure for table `calendriers`
--

CREATE TABLE `calendriers` (
  `id` bigint UNSIGNED NOT NULL,
  `projet_id` bigint UNSIGNED NOT NULL,
  `tache_id` bigint UNSIGNED NOT NULL,
  `dateEvenement` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `calendriers`
--

INSERT INTO `calendriers` (`id`, `projet_id`, `tache_id`, `dateEvenement`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2024-01-01', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` bigint UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `idEnvoyeur` bigint UNSIGNED NOT NULL,
  `idReceveur` bigint UNSIGNED NOT NULL,
  `horodatage` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `equipes`
--

CREATE TABLE `equipes` (
  `id` bigint UNSIGNED NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `equipes`
--

INSERT INTO `equipes` (`id`, `nom`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Equipe de dev', 'Equipe charge de developpement', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `equipe_user`
--

CREATE TABLE `equipe_user` (
  `id` bigint UNSIGNED NOT NULL,
  `equipe_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `equipe_user`
--

INSERT INTO `equipe_user` (`id`, `equipe_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_01_13_154659_create_roles_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2025_01_13_154706_create_projets_table', 1),
(7, '2025_01_13_154723_create_taches_table', 1),
(8, '2025_01_13_154734_create_permissions_table', 1),
(9, '2025_01_13_154748_create_equipes_table', 1),
(10, '2025_01_13_154803_create_chats_table', 1),
(11, '2025_01_13_154810_create_clients_table', 1),
(12, '2025_01_13_154827_create_tickets_table', 1),
(13, '2025_01_13_154911_create_calendriers_table', 1),
(14, '2025_01_14_083726_create_role_permission_table', 1),
(15, '2025_01_14_085740_create_user_tache_table', 1),
(16, '2025_01_14_090045_create_user_projet_table', 1),
(17, '2025_01_14_090647_create_projet_equipe_table', 1),
(18, '2025_01_14_122241_create_equipe_user_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `nom`, `description`, `created_at`, `updated_at`) VALUES
(1, 'creer_users', 'Peut creer users', NULL, NULL),
(2, 'update_users', 'Peut mettre a jour users', NULL, NULL),
(3, 'supprimer_users', 'Peut supprimer users', NULL, NULL),
(4, 'list_users', 'Peut list users', NULL, NULL),
(5, 'creer_projet', 'Peut creer projet', NULL, NULL),
(6, 'update_projet', 'Peut mettre a jour projet', NULL, NULL),
(7, 'supprimer_projet', 'Peut supprimer projet', NULL, NULL),
(8, 'list_projet', 'Peut list projet', NULL, NULL),
(9, 'creer_tache', 'Peut creer tache', NULL, NULL),
(10, 'update_tache', 'Peut mettre a jour tache', NULL, NULL),
(11, 'supprimer_tache', 'Peut supprimer tache', NULL, NULL),
(12, 'list_tache', 'Peut list tache', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'auth_token', '2ef26f0789e32f734e458ff5840feb9e2faf46d7d55bf9e8fa6b4f27b868288b', '[\"*\"]', '2025-01-20 11:32:46', NULL, '2025-01-20 11:32:45', '2025-01-20 11:32:46'),
(2, 'App\\Models\\User', 1, 'auth_token', 'db83a694859fd1e9591349f838a10695d57eb9a9b638bf3d402c9b3d48f74e46', '[\"*\"]', NULL, NULL, '2025-01-20 11:59:13', '2025-01-20 11:59:13'),
(3, 'App\\Models\\User', 1, 'auth_token', 'de32c402370e10dd04dd9f0172b6d69edf93af3ab0c0bcf38c8a1065539d115c', '[\"*\"]', NULL, NULL, '2025-01-20 13:24:03', '2025-01-20 13:24:03');

-- --------------------------------------------------------

--
-- Table structure for table `projets`
--

CREATE TABLE `projets` (
  `id` bigint UNSIGNED NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dateDebut` date NOT NULL,
  `dateFin` date NOT NULL,
  `budget` double(8,2) DEFAULT NULL,
  `priorite` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `statut` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commentaire` text COLLATE utf8mb4_unicode_ci,
  `piece_jointe` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projets`
--

INSERT INTO `projets` (`id`, `nom`, `description`, `dateDebut`, `dateFin`, `budget`, `priorite`, `statut`, `commentaire`, `piece_jointe`, `created_at`, `updated_at`) VALUES
(1, 'Gestion de projet', 'Creation application gestion de projet', '2024-01-01', '2024-12-31', 100000.00, 'haute', 'en cours', NULL, NULL, NULL, NULL),
(5, 'kkkkkkkkkk', 'kkkkkkkkkkkkkk', '2025-01-20', '2025-01-22', 4000.00, 'Moyenne', 'Terminé', 'lllllll', 'projets/pieces_jointes/ZPPygnVA4hC2VAfEGzZ9wV4WL8O4kmHdLKcLv5rB.png', '2025-01-20 13:55:25', '2025-01-20 13:55:25');

-- --------------------------------------------------------

--
-- Table structure for table `projet_equipe`
--

CREATE TABLE `projet_equipe` (
  `id` bigint UNSIGNED NOT NULL,
  `projet_id` bigint UNSIGNED NOT NULL,
  `equipe_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projet_equipe`
--

INSERT INTO `projet_equipe` (`id`, `projet_id`, `equipe_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `nom`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Administrateur', 'Administrateur du system', NULL, NULL),
(2, 'ChefDeProjet', 'Chef de project', NULL, NULL),
(3, 'MembreEquipe', 'Membre de l\'équipe', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_permission`
--

CREATE TABLE `role_permission` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  `permission_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_permission`
--

INSERT INTO `role_permission` (`id`, `role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 2, NULL, NULL),
(3, 1, 3, NULL, NULL),
(4, 1, 4, NULL, NULL),
(5, 1, 5, NULL, NULL),
(6, 1, 6, NULL, NULL),
(7, 1, 7, NULL, NULL),
(8, 1, 8, NULL, NULL),
(9, 1, 9, NULL, NULL),
(10, 1, 10, NULL, NULL),
(11, 1, 11, NULL, NULL),
(12, 1, 12, NULL, NULL),
(13, 2, 5, NULL, NULL),
(14, 2, 6, NULL, NULL),
(15, 2, 7, NULL, NULL),
(16, 2, 8, NULL, NULL),
(17, 2, 9, NULL, NULL),
(18, 2, 10, NULL, NULL),
(19, 2, 11, NULL, NULL),
(20, 2, 12, NULL, NULL),
(21, 3, 9, NULL, NULL),
(22, 3, 10, NULL, NULL),
(23, 3, 11, NULL, NULL),
(24, 3, 12, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `taches`
--

CREATE TABLE `taches` (
  `id` bigint UNSIGNED NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dateDebut` date NOT NULL,
  `dateFin` date NOT NULL,
  `priorite` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `statut` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `projet_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taches`
--

INSERT INTO `taches` (`id`, `nom`, `description`, `dateDebut`, `dateFin`, `priorite`, `statut`, `projet_id`, `created_at`, `updated_at`) VALUES
(1, 'Creation Models', 'creation de tous les models de l\'app', '2024-01-01', '2024-01-02', 'haute', 'en cours', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint UNSIGNED NOT NULL,
  `sujet` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `statut` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dateCreation` date NOT NULL,
  `assigneA` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  `statut` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `prenom`, `nom`, `email`, `role_id`, `statut`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Admin', 'admin@example.com', 1, NULL, NULL, '$2y$12$HfMYpseVUT1KvRfuFoCxhOQ7RC5Pd5UuwRiCAE7CZe3rE/YnrKJUa', NULL, NULL, NULL),
(2, 'Chef', 'Chef', 'chef@example.com', 2, NULL, NULL, '$2y$12$JVBdeSFrJd6/MtfRUx5Do.VcdmVPmpE/7O/tsmeArh7iCYkvY9nYO', NULL, NULL, NULL),
(3, 'Membre', 'Membre', 'membre@example.com', 3, NULL, NULL, '$2y$12$lNar973a7fBPfxKEzB3jMeTdtE9J6WlogTPdgWKdjB1B91v3BW9va', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_projet`
--

CREATE TABLE `user_projet` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `projet_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_projet`
--

INSERT INTO `user_projet` (`id`, `user_id`, `projet_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_tache`
--

CREATE TABLE `user_tache` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `tache_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_tache`
--

INSERT INTO `user_tache` (`id`, `user_id`, `tache_id`, `created_at`, `updated_at`) VALUES
(1, 3, 1, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `calendriers`
--
ALTER TABLE `calendriers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `calendriers_projet_id_foreign` (`projet_id`),
  ADD KEY `calendriers_tache_id_foreign` (`tache_id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chats_idenvoyeur_foreign` (`idEnvoyeur`),
  ADD KEY `chats_idreceveur_foreign` (`idReceveur`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `equipes`
--
ALTER TABLE `equipes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `equipe_user`
--
ALTER TABLE `equipe_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `equipe_user_equipe_id_user_id_unique` (`equipe_id`,`user_id`),
  ADD KEY `equipe_user_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `projets`
--
ALTER TABLE `projets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projet_equipe`
--
ALTER TABLE `projet_equipe`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `projet_equipe_projet_id_equipe_id_unique` (`projet_id`,`equipe_id`),
  ADD KEY `projet_equipe_equipe_id_foreign` (`equipe_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_permission`
--
ALTER TABLE `role_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role_permission_role_id_permission_id_unique` (`role_id`,`permission_id`),
  ADD KEY `role_permission_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `taches`
--
ALTER TABLE `taches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `taches_projet_id_foreign` (`projet_id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickets_assignea_foreign` (`assigneA`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_projet`
--
ALTER TABLE `user_projet`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_projet_user_id_projet_id_unique` (`user_id`,`projet_id`),
  ADD KEY `user_projet_projet_id_foreign` (`projet_id`);

--
-- Indexes for table `user_tache`
--
ALTER TABLE `user_tache`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_tache_user_id_tache_id_unique` (`user_id`,`tache_id`),
  ADD KEY `user_tache_tache_id_foreign` (`tache_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `calendriers`
--
ALTER TABLE `calendriers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `equipes`
--
ALTER TABLE `equipes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `equipe_user`
--
ALTER TABLE `equipe_user`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `projets`
--
ALTER TABLE `projets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `projet_equipe`
--
ALTER TABLE `projet_equipe`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `role_permission`
--
ALTER TABLE `role_permission`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `taches`
--
ALTER TABLE `taches`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_projet`
--
ALTER TABLE `user_projet`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_tache`
--
ALTER TABLE `user_tache`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `calendriers`
--
ALTER TABLE `calendriers`
  ADD CONSTRAINT `calendriers_projet_id_foreign` FOREIGN KEY (`projet_id`) REFERENCES `projets` (`id`),
  ADD CONSTRAINT `calendriers_tache_id_foreign` FOREIGN KEY (`tache_id`) REFERENCES `taches` (`id`);

--
-- Constraints for table `chats`
--
ALTER TABLE `chats`
  ADD CONSTRAINT `chats_idenvoyeur_foreign` FOREIGN KEY (`idEnvoyeur`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `chats_idreceveur_foreign` FOREIGN KEY (`idReceveur`) REFERENCES `users` (`id`);

--
-- Constraints for table `equipe_user`
--
ALTER TABLE `equipe_user`
  ADD CONSTRAINT `equipe_user_equipe_id_foreign` FOREIGN KEY (`equipe_id`) REFERENCES `equipes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `equipe_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `projet_equipe`
--
ALTER TABLE `projet_equipe`
  ADD CONSTRAINT `projet_equipe_equipe_id_foreign` FOREIGN KEY (`equipe_id`) REFERENCES `equipes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `projet_equipe_projet_id_foreign` FOREIGN KEY (`projet_id`) REFERENCES `projets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_permission`
--
ALTER TABLE `role_permission`
  ADD CONSTRAINT `role_permission_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_permission_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `taches`
--
ALTER TABLE `taches`
  ADD CONSTRAINT `taches_projet_id_foreign` FOREIGN KEY (`projet_id`) REFERENCES `projets` (`id`);

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_assignea_foreign` FOREIGN KEY (`assigneA`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_projet`
--
ALTER TABLE `user_projet`
  ADD CONSTRAINT `user_projet_projet_id_foreign` FOREIGN KEY (`projet_id`) REFERENCES `projets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_projet_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_tache`
--
ALTER TABLE `user_tache`
  ADD CONSTRAINT `user_tache_tache_id_foreign` FOREIGN KEY (`tache_id`) REFERENCES `taches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_tache_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
