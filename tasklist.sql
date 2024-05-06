-- Adminer 4.8.1 MySQL 5.5.5-10.8.3-MariaDB-1:10.8.3+maria~jammy dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(14,	'0001_01_01_000000_create_users_table',	1),
(15,	'0001_01_01_000001_create_cache_table',	1),
(16,	'0001_01_01_000002_create_jobs_table',	1),
(17,	'2024_05_03_172154_create_tasks_table',	1);

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('Y9zqzK1B7747CvEKTWAUmsnBKXONQmfl70TZ9REj',	NULL,	'127.0.0.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36',	'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQVNBeHkwMm5nejM0Q2R1WVQ4TTByNU45WVMzRWtVVVgwb1VFRGVXVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC8/cGFnZT0xIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',	1714967269);

DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `tasks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `tasks` (`id`, `title`, `description`, `long_description`, `completed`, `created_at`, `updated_at`) VALUES
(1,	'Eum impedit debitis ut velit veniam rerum dolor.',	'Mollitia nihil et ut id deserunt dolorem laboriosam. Veritatis mollitia nisi soluta sint culpa officiis. Tempora nobis aut culpa voluptatibus eum. Quas voluptatem magni aliquid est consequatur.',	'Et ut ut corporis dicta. Est et vitae ab ratione nobis. Repellendus ipsam corporis ducimus nihil officia quia. Deleniti voluptatibus quidem repellat velit deserunt odio. Id ex nihil minus rerum voluptatibus voluptate accusamus consequuntur. Dolorum est repellat aut explicabo quis. Non recusandae voluptates dicta optio optio et.',	0,	'2024-05-06 11:47:35',	'2024-05-06 11:47:35'),
(2,	'Soluta fugiat officia commodi.',	'Et inventore at inventore ab. Vel voluptatem quo laborum odio eveniet ad quisquam. Tenetur reprehenderit voluptatem dignissimos ut tempora sint. Repellat blanditiis molestias quasi ut ipsa.',	'Asperiores illo quia sint facilis. Odio nulla provident at et. Molestiae tempore et impedit aut voluptatum molestiae. Tempore natus perspiciatis saepe consectetur in saepe accusantium. Sunt neque est repellendus officia illum. Atque et ut eum cupiditate qui cumque.',	1,	'2024-05-06 11:47:35',	'2024-05-06 11:47:35'),
(3,	'Natus aut a laborum et veniam.',	'Odio iusto consequatur sunt eos vel voluptatem id. Quasi vero in qui facere unde. Sint molestiae dolorem quia ipsam saepe asperiores. Exercitationem vitae ab minus numquam.',	'Autem qui quaerat sapiente est explicabo et autem. Qui cumque nihil quo dignissimos et ipsam. Adipisci pariatur quia placeat omnis et voluptas. Voluptas sit qui et ut quidem. Quaerat ut sequi ipsam. Rerum dolorem vitae fugit natus. Aperiam alias voluptatem ex. Ad enim aperiam debitis aut provident sit adipisci. Suscipit laboriosam dolorem ut sit. Quo tenetur error assumenda dolore quo.',	0,	'2024-05-06 11:47:35',	'2024-05-06 11:47:35'),
(4,	'Ut est culpa amet corporis cupiditate ex aspernatur molestias.',	'Dicta aliquam quod numquam. Nobis et nostrum harum unde numquam vel. In tempora voluptas ab aut enim quia voluptate.',	'Ut quae est quasi non harum excepturi delectus. Sed facilis veniam omnis assumenda. Sed nam et error sunt. Reprehenderit quod aspernatur sed voluptatibus eveniet. Quod dicta sequi odit. Quidem assumenda aut vero optio.',	1,	'2024-05-06 11:47:35',	'2024-05-06 11:47:35'),
(5,	'Dignissimos consequatur rerum voluptatem et iste.',	'Qui odio ut laudantium mollitia adipisci dolorem eligendi. Tempora id accusamus enim porro. Sunt necessitatibus vitae deleniti. Harum autem ipsa explicabo aspernatur sint est soluta et.',	'Aut quo dolorem aut nesciunt dicta quam est. Accusantium aut alias voluptas numquam deserunt voluptatem deleniti. Molestias sed aspernatur totam. Aliquid accusantium hic amet in quis. Quis rerum ducimus sint ab eum fuga. Numquam nostrum veniam sed harum vitae.',	1,	'2024-05-06 11:47:35',	'2024-05-06 11:47:35'),
(6,	'Consequatur et maiores ut itaque.',	'Qui error officia pariatur autem quia odio quae. Dolore consequatur aut voluptatem dolor sit nihil. Quo id ipsam sunt expedita. Modi aspernatur facilis impedit voluptatem et.',	'Ut veritatis dolor velit expedita. Esse reiciendis voluptates molestiae ipsum labore ad amet. Cumque id et velit nulla distinctio asperiores. Labore ab ea et. Praesentium sed quasi cum similique distinctio cupiditate. Rerum ipsum ex deleniti dignissimos. Aut quia accusamus facilis dolorum eum natus. Magni labore ipsum laboriosam. Qui suscipit blanditiis tempore quisquam veritatis dolorem qui.',	0,	'2024-05-06 11:47:35',	'2024-05-06 11:47:35'),
(7,	'Eos id similique molestiae.',	'Asperiores eum voluptates provident quia consequuntur porro quibusdam. Ad hic porro laborum. Illum culpa harum quod at eius. Ab voluptas neque perferendis vel in deleniti voluptatem nihil.',	'Totam sint quis sapiente alias quo amet. Labore neque dicta facere consectetur incidunt ea ipsa. Aliquid asperiores sint voluptatem eum autem consequatur. Perspiciatis natus aut asperiores sint. Reiciendis quis aliquid dolorem blanditiis voluptatem quo fugit. Temporibus sint accusantium quae facere quia. Ipsa aut incidunt dolore voluptates. Sed sed ab velit. Voluptatem deleniti consequatur repellat eum.',	1,	'2024-05-06 11:47:35',	'2024-05-06 11:47:35'),
(8,	'Et quis molestiae voluptatem voluptatem.',	'Dolor quia odio quidem placeat commodi est. Eius alias exercitationem deserunt. Et rerum assumenda quo distinctio necessitatibus. Dicta voluptatum et unde dolore nulla delectus velit. Vel fugit nesciunt delectus quo.',	'Voluptate sequi consequatur quae quae non neque consequatur. Cumque cumque quia omnis et totam harum. Possimus sed aut fugiat earum qui. Autem voluptatem perspiciatis neque mollitia et. Sint odit est ut.',	0,	'2024-05-06 11:47:35',	'2024-05-06 11:47:35'),
(9,	'Ea incidunt dolorum est dolorem et mollitia.',	'Nihil eligendi eligendi error perspiciatis. Et tenetur quia et aut laboriosam. Nihil consequuntur consectetur et. Enim magnam dolorem non quasi natus ut.',	'Culpa nihil nulla quidem inventore. Maiores rerum ab soluta unde recusandae tempore inventore. Maiores deserunt doloremque pariatur quas. Aut odio doloribus est sunt laudantium ratione error. Fuga perspiciatis et ratione ipsa rerum labore aliquam.',	1,	'2024-05-06 11:47:35',	'2024-05-06 11:47:35'),
(10,	'Et facilis animi autem iste laudantium.',	'Ratione ut totam aperiam modi ullam in. Dolorem est fugit impedit et dolorum repellat. Provident quasi est ipsa minus ut. Quibusdam aut et modi dicta. Id ducimus in maiores sequi necessitatibus.',	'Molestiae voluptatibus et non qui incidunt. Dolore molestias aut ad corrupti quisquam corrupti. Aperiam et vel facilis ut aut architecto recusandae. Repellendus architecto dolorem quaerat assumenda nihil et. Ut quaerat minus sed autem. Placeat ea repudiandae excepturi eum modi dolorem. Quam et dolorem expedita nesciunt eligendi quos voluptate. Ea nihil veritatis laborum dolore nobis qui assumenda amet. Magni doloribus dolores sequi voluptatibus. Saepe ut ut asperiores soluta aut.',	0,	'2024-05-06 11:47:35',	'2024-05-06 11:47:35'),
(11,	'Enim quos consequuntur vel delectus dolorem.',	'Omnis in vitae in. Vero deserunt ducimus dolorem autem tempore quasi laboriosam quo. Expedita maiores amet consectetur maiores soluta voluptas ea. Qui laborum ratione reprehenderit recusandae eos in aut.',	'Nisi saepe non rem iste et. Praesentium eius cum velit voluptatem ut distinctio delectus. Fugit sint id totam ullam expedita dignissimos quibusdam. Ducimus ab aut quo est voluptas eveniet tempore. Voluptas reiciendis architecto nemo voluptatem explicabo hic nostrum. Exercitationem pariatur aut molestias ut qui harum est. Amet ut dolore error reiciendis enim facere molestiae. Aut sit quas blanditiis et incidunt quas.',	1,	'2024-05-06 11:47:35',	'2024-05-06 11:47:35'),
(12,	'Itaque delectus consequuntur et ducimus vel sint qui.',	'Totam illo qui vero. Quaerat sit ratione sed et enim. Earum modi et sequi atque in. Commodi distinctio sed dolores et.',	'Quam distinctio voluptas natus quia veniam incidunt velit nobis. Nihil officia quidem beatae. Iure eligendi molestias esse provident non. Dolores voluptatem sint iure provident similique quisquam. Et laborum eum sit necessitatibus quo. Ea blanditiis minus modi laboriosam pariatur placeat et. Fugiat omnis nihil repudiandae qui.',	0,	'2024-05-06 11:47:35',	'2024-05-06 11:47:35'),
(13,	'Nemo facilis voluptatem facere consequatur doloribus quae autem.',	'Ea non et rerum voluptas est repellendus. Sed unde maxime velit sed qui quidem. Laudantium et voluptatem quis. Quisquam et rerum ut perspiciatis veniam consequatur.',	'Ut aut consequatur nihil laboriosam reprehenderit rerum a. Mollitia nihil ut quo voluptatem deserunt suscipit facere ratione. Praesentium rem perferendis in vitae facere officiis nesciunt. Et in cum accusamus. Odio soluta et incidunt nihil quasi non et. Minus ut est voluptas. Soluta consequatur soluta tenetur et adipisci quo distinctio. Aut consequatur et dolores autem voluptates.',	1,	'2024-05-06 11:47:35',	'2024-05-06 11:47:35'),
(14,	'Et dicta dolor nemo ea.',	'Sed non sit unde voluptatem. Temporibus est sapiente eius quam. Perferendis dolorum ad perspiciatis voluptatem magnam perspiciatis. Beatae iure quia recusandae beatae. A ex fugiat velit dolores sapiente.',	'Tempora sunt aut ea fugiat consequatur reiciendis. Aperiam et adipisci repudiandae ducimus at. Maiores voluptatem nam dolores inventore aliquid. Perspiciatis id unde est consequuntur ipsam voluptatum. Ut rerum similique accusamus eaque. Eius quas rerum rerum commodi sint fugit quae.',	0,	'2024-05-06 11:47:35',	'2024-05-06 11:47:35'),
(15,	'Culpa sed deserunt hic.',	'Ducimus sit maiores nobis aliquam illum. Distinctio consequatur maiores corporis laudantium dolor.',	'Deserunt cumque perferendis nesciunt. Dolorem illo facilis asperiores sed vitae modi. Qui porro culpa officia et maiores quis nostrum. Et sequi excepturi placeat perspiciatis. Sapiente similique molestiae magnam voluptatem. Alias quia quisquam explicabo necessitatibus est qui incidunt.',	1,	'2024-05-06 11:47:35',	'2024-05-06 11:47:35'),
(16,	'Officiis porro nisi aspernatur laudantium.',	'In qui dolores quis id corporis est. Delectus non rerum consequatur. Fugit in eos sed officiis odit.',	'Nemo debitis quos dolores et. Consequuntur voluptates voluptatem officia labore quisquam. Architecto tempora aspernatur quis nam odio. Aut a assumenda quaerat facilis. Error nihil ut sunt qui numquam. Aliquam et tempore et deserunt est quia sapiente quia. Qui vel vel rerum et dolorem vel.',	0,	'2024-05-06 11:47:35',	'2024-05-06 11:47:35'),
(17,	'Iure qui et laudantium odit harum.',	'Eligendi qui mollitia quasi quisquam ut tempora. Harum cum repellendus ut. Delectus aut expedita qui ducimus. A numquam aut eos qui.',	'Qui dignissimos praesentium esse consequatur. Nostrum iure ipsa eos et. Ut dolorem aut porro ut sit. Repellat sint ea dignissimos aliquid voluptates eius unde. Odit ea sed et doloremque perspiciatis dolor iusto ipsa.',	0,	'2024-05-06 11:47:35',	'2024-05-06 11:47:35'),
(18,	'Quia tempora odit quas.',	'Velit et explicabo quia non sint. Itaque perferendis autem fuga velit delectus eligendi vel. Voluptatem eius consequatur sit quas ut.',	'Debitis non ut enim totam consequatur. Quia quidem qui vero non cum possimus et. Porro ad molestiae occaecati et architecto. Sed assumenda impedit provident quo. Sed cupiditate incidunt nihil ratione. Minus ipsa autem ut quas sequi veniam reprehenderit. Eius et quos et vel. Repudiandae ut aliquam vero aut voluptatem doloribus. Tenetur dignissimos laboriosam ullam ut cumque facere non. Minima voluptatibus et et laudantium est.',	0,	'2024-05-06 11:47:35',	'2024-05-06 11:47:35'),
(19,	'Doloribus a accusamus unde in praesentium consequatur.',	'Esse doloremque tempore repudiandae voluptas qui. Ipsam provident consequatur natus repellendus porro mollitia. Fugiat debitis nemo odio culpa incidunt temporibus rem. Perspiciatis magni assumenda voluptas quidem.',	'Mollitia odit aut porro eum sint omnis necessitatibus et. Tempora veritatis voluptatibus culpa sapiente. Amet est blanditiis similique voluptates dolorem. Ad aperiam doloremque aut iure repellat possimus id. Quidem nostrum molestiae et inventore aut distinctio et. Quo error eum impedit perspiciatis blanditiis id. Sunt et officiis ipsum libero unde unde est. Labore et est saepe voluptatum. Sunt debitis voluptatem voluptate et ut qui. Doloribus ut provident excepturi.',	1,	'2024-05-06 11:47:35',	'2024-05-06 11:47:35'),
(20,	'Magni delectus recusandae officia facere soluta alias temporibus voluptatem.',	'Temporibus eos quasi ratione ut dicta error sed velit. Nisi necessitatibus rerum qui qui. Qui doloribus porro est maxime tenetur consectetur vel. Qui hic omnis saepe molestiae autem error eligendi.',	'Enim repudiandae molestiae ad qui voluptatem corporis. Dolor doloremque error tempore neque similique explicabo. Quos excepturi necessitatibus eius porro sint earum magni inventore. Voluptas est optio sint qui. Commodi similique unde optio sed fuga voluptatem et. Eaque veritatis soluta suscipit dolores odit optio cum. Fuga dolorem enim mollitia labore. Iure aut quibusdam doloremque sunt harum.',	1,	'2024-05-06 11:47:35',	'2024-05-06 11:47:35');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1,	'Lauriane Wintheiser',	'juliet87@example.org',	'2024-05-06 11:47:34',	'$2y$12$fiP7rneWpagbb4khbK4l3Oq5oZgX5WunCprCq2Yqaevl4ryxO2fpO',	'MpLCZRB2Kn',	'2024-05-06 11:47:34',	'2024-05-06 11:47:34'),
(2,	'Jena Kuhlman',	'jacynthe.sipes@example.com',	'2024-05-06 11:47:34',	'$2y$12$fiP7rneWpagbb4khbK4l3Oq5oZgX5WunCprCq2Yqaevl4ryxO2fpO',	'dW9UUqOUm6',	'2024-05-06 11:47:34',	'2024-05-06 11:47:34'),
(3,	'Henderson Moen',	'cleveland.watsica@example.org',	'2024-05-06 11:47:34',	'$2y$12$fiP7rneWpagbb4khbK4l3Oq5oZgX5WunCprCq2Yqaevl4ryxO2fpO',	'Y324HNS9ve',	'2024-05-06 11:47:34',	'2024-05-06 11:47:34'),
(4,	'Kenyon Bergstrom',	'kip.thompson@example.org',	'2024-05-06 11:47:34',	'$2y$12$fiP7rneWpagbb4khbK4l3Oq5oZgX5WunCprCq2Yqaevl4ryxO2fpO',	'yasNYt07ts',	'2024-05-06 11:47:34',	'2024-05-06 11:47:34'),
(5,	'Mr. Jevon Herzog',	'jerel.rice@example.net',	'2024-05-06 11:47:34',	'$2y$12$fiP7rneWpagbb4khbK4l3Oq5oZgX5WunCprCq2Yqaevl4ryxO2fpO',	'v6nF4uI6NB',	'2024-05-06 11:47:34',	'2024-05-06 11:47:34'),
(6,	'Mrs. Veda Wunsch',	'lesch.dimitri@example.org',	'2024-05-06 11:47:34',	'$2y$12$fiP7rneWpagbb4khbK4l3Oq5oZgX5WunCprCq2Yqaevl4ryxO2fpO',	'aG8mpMRAJo',	'2024-05-06 11:47:34',	'2024-05-06 11:47:34'),
(7,	'Mr. Diego Leffler MD',	'andy03@example.org',	'2024-05-06 11:47:34',	'$2y$12$fiP7rneWpagbb4khbK4l3Oq5oZgX5WunCprCq2Yqaevl4ryxO2fpO',	'RmoQagOMhO',	'2024-05-06 11:47:34',	'2024-05-06 11:47:34'),
(8,	'Dr. Leland Bahringer V',	'effertz.torrance@example.net',	'2024-05-06 11:47:34',	'$2y$12$fiP7rneWpagbb4khbK4l3Oq5oZgX5WunCprCq2Yqaevl4ryxO2fpO',	'IqZidbafpz',	'2024-05-06 11:47:34',	'2024-05-06 11:47:34'),
(9,	'Autumn Buckridge',	'igreenholt@example.org',	'2024-05-06 11:47:34',	'$2y$12$fiP7rneWpagbb4khbK4l3Oq5oZgX5WunCprCq2Yqaevl4ryxO2fpO',	'BOHqxkiNRy',	'2024-05-06 11:47:34',	'2024-05-06 11:47:34'),
(10,	'Amiya Tromp',	'tabitha.sipes@example.com',	'2024-05-06 11:47:34',	'$2y$12$fiP7rneWpagbb4khbK4l3Oq5oZgX5WunCprCq2Yqaevl4ryxO2fpO',	'5tSaip560n',	'2024-05-06 11:47:34',	'2024-05-06 11:47:34'),
(11,	'Mr. Furman Bins Sr.',	'tdamore@example.org',	NULL,	'$2y$12$fiP7rneWpagbb4khbK4l3Oq5oZgX5WunCprCq2Yqaevl4ryxO2fpO',	'VD3R4ddNb0',	'2024-05-06 11:47:35',	'2024-05-06 11:47:35'),
(12,	'Dr. Jerel McCullough DDS',	'ahackett@example.com',	NULL,	'$2y$12$fiP7rneWpagbb4khbK4l3Oq5oZgX5WunCprCq2Yqaevl4ryxO2fpO',	'3TvOWBYat7',	'2024-05-06 11:47:35',	'2024-05-06 11:47:35');

-- 2024-05-06 03:51:07
