-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июл 09 2021 г., 08:54
-- Версия сервера: 10.4.11-MariaDB
-- Версия PHP: 7.3.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `audiokitab`
--

-- --------------------------------------------------------

--
-- Структура таблицы `authors`
--

CREATE TABLE `authors` (
  `id` int(10) UNSIGNED NOT NULL,
  `title_az` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc_az` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categories` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `authors`
--

INSERT INTO `authors` (`id`, `title_az`, `desc_az`, `image`, `categories`, `created_at`, `updated_at`) VALUES
(1, 'Qurban Said', 'Kurban Said, is the pseudonym of the author of Ali and Nino, a novel originally published in 1937 in the German language by the Austrian publisher E.P. Tal. The novel has since been published in more than 30 languages.', 'authors\\June2021\\lEcwXWHozZdo4OPebi7l.jpg', '[\"5\",\"7\",\"9\",\"11\"]', '2021-06-15 13:52:00', '2021-06-20 14:14:58');

-- --------------------------------------------------------

--
-- Структура таблицы `books`
--

CREATE TABLE `books` (
  `id` int(10) UNSIGNED NOT NULL,
  `title_az` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc_az` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `viewed` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sound` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publisher_id` int(11) DEFAULT NULL,
  `narrator_id` int(11) DEFAULT NULL,
  `isage` tinyint(4) DEFAULT NULL,
  `isbn` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT 0,
  `isactive` int(11) DEFAULT NULL,
  `isfree` int(11) DEFAULT NULL,
  `categories` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `books`
--

INSERT INTO `books` (`id`, `title_az`, `desc_az`, `category_id`, `author_id`, `viewed`, `created_at`, `updated_at`, `image`, `sound`, `publisher_id`, `narrator_id`, `isage`, `isbn`, `price`, `isactive`, `isfree`, `categories`) VALUES
(1, 'Əli və Nino', 'Əli və Nino - ilk dəfə 1937ci ildə Vyanada alman dilində E.P.Tal Verlaq tərəfindən nəşr edilən və indiyədək dunyanın 42 dilinə tərcümə edilən məhəbbət romanidir.', 3, 1, 1, '2021-06-02 03:49:00', '2021-07-01 02:00:50', 'books\\June2021\\iNCVTdToxCrIYmCJcKwv.png', '[]', NULL, 1, 0, NULL, 0, 1, 0, '[\"1\",\"3\",\"4\",\"5\"]'),
(2, 'Mavi mələklər', 'BMT -nin gizli əməkdaşlarını mavi mələklər adlandırırlar.', 3, 1, 5, '2021-06-02 04:02:00', '2021-07-04 04:08:12', 'books\\June2021\\59GHfJu8jHgr5Ou07q9T.png', '[]', 2, 1, 0, NULL, 555, 1, 1, '[\"1\",\"2\",\"3\",\"5\"]');

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `title_az` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `title_az`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Uşaq ədəbiyyatı', '2021-06-02 03:59:41', '2021-06-02 03:59:41'),
(2, NULL, 'Hekayə', '2021-06-02 03:59:51', '2021-06-02 03:59:51'),
(3, NULL, 'Detektiv', '2021-06-02 04:00:00', '2021-06-02 04:00:00'),
(4, NULL, 'Roman', '2021-06-02 04:00:08', '2021-06-02 04:00:08'),
(5, NULL, 'Digər', '2021-06-02 04:00:24', '2021-06-02 04:00:24'),
(6, NULL, 'Lətifə', '2021-06-02 04:00:32', '2021-06-02 04:00:32'),
(7, NULL, 'Satirik roman', '2021-06-02 04:00:40', '2021-06-02 04:00:40'),
(8, NULL, 'Felyeton', '2021-06-02 04:00:47', '2021-06-02 04:00:47'),
(9, NULL, 'Müsahibə', '2021-06-02 04:00:55', '2021-06-02 04:00:55'),
(10, NULL, 'Tarixi əsər', '2021-06-02 04:01:16', '2021-06-02 04:01:16'),
(11, NULL, 'Romantika', '2021-06-02 04:01:28', '2021-06-02 04:01:28');

-- --------------------------------------------------------

--
-- Структура таблицы `customerusers`
--

CREATE TABLE `customerusers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `isactive` tinyint(4) DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb_id` int(11) DEFAULT NULL,
  `google_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `customerusers`
--

INSERT INTO `customerusers` (`id`, `name`, `email`, `phone`, `status`, `isactive`, `token`, `fb_id`, `google_id`, `created_at`, `updated_at`, `password`) VALUES
(3, NULL, 'alishixiyev@gmail.com', NULL, 1, 1, '$2y$10$iWl43HGaENcAyymRfBLXbOtHeLC33ODj7BBcJt/qFpXLJ1EefrWL2', NULL, NULL, '2021-06-04 10:43:00', '2021-06-23 10:01:09', '$2y$10$8x7Wa0Wxr39H.1XHHpwSIOiAuD3w70qqsd2rW7bmsDNW3CiH5wb6m');

-- --------------------------------------------------------

--
-- Структура таблицы `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(23, 4, 'title_az', 'text', 'Title Az', 0, 1, 1, 1, 1, 1, '{}', 5),
(24, 4, 'desc_az', 'text', 'Desc Az', 0, 0, 1, 1, 1, 1, '{}', 6),
(25, 4, 'category_id', 'text', 'Category Id', 0, 0, 1, 1, 1, 1, '{}', 7),
(26, 4, 'author_id', 'text', 'Author Id', 0, 1, 1, 1, 1, 1, '{}', 8),
(27, 4, 'viewed', 'text', 'Viewed', 0, 0, 1, 1, 1, 1, '{}', 9),
(28, 4, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 15),
(29, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 17),
(30, 5, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(31, 5, 'parent_id', 'text', 'Parent Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(32, 5, 'title_az', 'text', 'Title Az', 0, 1, 1, 1, 1, 1, '{}', 3),
(33, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(34, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(35, 5, 'category_belongsto_category_relationship', 'relationship', 'categories', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Category\",\"table\":\"categories\",\"type\":\"belongsTo\",\"column\":\"parent_id\",\"key\":\"id\",\"label\":\"title_az\",\"pivot_table\":\"books\",\"pivot\":\"0\",\"taggable\":\"0\"}', 6),
(36, 4, 'book_belongsto_category_relationship', 'relationship', 'Category', 0, 0, 1, 1, 1, 1, '{\"model\":\"App\\\\Category\",\"table\":\"categories\",\"type\":\"belongsTo\",\"column\":\"category_id\",\"key\":\"id\",\"label\":\"title_az\",\"pivot_table\":\"books\",\"pivot\":\"0\",\"taggable\":\"0\"}', 4),
(37, 4, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 2),
(38, 4, 'sound', 'file', 'Sound', 0, 0, 1, 1, 1, 1, '{}', 3),
(40, 6, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(41, 6, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(43, 6, 'phone', 'text', 'Phone', 0, 1, 1, 1, 1, 1, '{}', 4),
(44, 6, 'status', 'text', 'Status', 0, 1, 1, 1, 1, 1, '{}', 5),
(45, 6, 'isactive', 'select_dropdown', 'Isactive', 0, 1, 1, 1, 1, 1, '{\"default\":\"0\",\"options\":{\"0\":\"\\u00d6d\\u0259ni\\u015fsiz hesab\",\"1\":\"\\u00d6d\\u0259ni\\u015fli hesab\"}}', 6),
(46, 6, 'token', 'text', 'Token', 0, 1, 1, 1, 1, 1, '{}', 7),
(47, 6, 'fb_id', 'text', 'Fb Id', 0, 1, 1, 1, 1, 1, '{}', 8),
(48, 6, 'google_id', 'text', 'Google Id', 0, 1, 1, 1, 1, 1, '{}', 9),
(49, 6, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 10),
(50, 6, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 11),
(51, 6, 'email', 'text', 'Email', 0, 1, 1, 1, 1, 1, '{}', 3),
(52, 6, 'password', 'text', 'Password', 0, 1, 1, 1, 1, 1, '{}', 12),
(53, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(54, 7, 'title_az', 'text', 'Title Az', 0, 1, 1, 1, 1, 1, '{}', 2),
(55, 7, 'desc_az', 'text_area', 'Desc Az', 0, 1, 1, 1, 1, 1, '{}', 3),
(56, 7, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 4),
(57, 7, 'categories', 'hidden', 'Categories', 0, 0, 1, 1, 1, 1, '{}', 5),
(58, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6),
(59, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(60, 4, 'book_belongsto_author_relationship', 'relationship', 'Author', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Author\",\"table\":\"authors\",\"type\":\"belongsTo\",\"column\":\"author_id\",\"key\":\"id\",\"label\":\"title_az\",\"pivot_table\":\"authors\",\"pivot\":\"0\",\"taggable\":\"0\"}', 19),
(61, 4, 'publisher_id', 'text', 'Publisher Id', 0, 0, 1, 1, 1, 1, '{}', 16),
(62, 4, 'narrator_id', 'text', 'Narrator Id', 0, 0, 1, 1, 1, 1, '{}', 18),
(63, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(64, 8, 'title_az', 'text', 'Title Az', 0, 1, 1, 1, 1, 1, '{}', 2),
(65, 8, 'desc_az', 'text_area', 'Desc Az', 0, 1, 1, 1, 1, 1, '{}', 3),
(66, 8, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 4),
(67, 8, 'categories', 'hidden', 'Categories', 0, 0, 1, 1, 1, 1, '{}', 5),
(68, 8, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6),
(69, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(70, 4, 'book_belongsto_narrator_relationship', 'relationship', 'Narrator', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Narrator\",\"table\":\"narrators\",\"type\":\"belongsTo\",\"column\":\"narrator_id\",\"key\":\"id\",\"label\":\"title_az\",\"pivot_table\":\"authors\",\"pivot\":\"0\",\"taggable\":\"0\"}', 20),
(71, 4, 'isage', 'select_dropdown', 'Yaş Həddi', 0, 0, 1, 1, 1, 1, '{\"default\":\"0\",\"options\":{\"0\":\"Ham\\u0131 \\u00fc\\u00e7\\u00fcn\",\"1\":\"18+\"}}', 13),
(72, 4, 'isbn', 'text', 'Isbn', 0, 0, 1, 1, 1, 1, '{}', 12),
(73, 4, 'price', 'text', 'Price', 0, 0, 1, 1, 1, 1, '{\"default\":\"0\"}', 10),
(74, 4, 'isactive', 'select_dropdown', 'Active', 0, 0, 1, 1, 1, 1, '{\"default\":\"1\",\"options\":{\"0\":\"Deaktiv\",\"1\":\"Aktiv\"}}', 14),
(75, 4, 'isfree', 'select_dropdown', 'Odenisli?', 0, 0, 1, 1, 1, 1, '{\"default\":\"0\",\"options\":{\"0\":\"\\u00d6d\\u0259ni\\u015fsiz\",\"1\":\"\\u00d6d\\u0259ni\\u015fli\"}}', 11),
(76, 4, 'categories', 'multiple_checkbox', 'Categories', 0, 0, 1, 1, 1, 1, '{}', 18),
(77, 4, 'book_belongsto_user_relationship', 'relationship', 'Nəşriyyat', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"publisher_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"authors\",\"pivot\":\"0\",\"taggable\":\"0\"}', 21);

-- --------------------------------------------------------

--
-- Структура таблицы `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2021-06-01 11:47:49', '2021-06-01 11:47:49'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2021-06-01 11:47:49', '2021-06-01 11:47:49'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2021-06-01 11:47:49', '2021-06-01 11:47:49'),
(4, 'books', 'books', 'Book', 'Books', NULL, 'App\\Book', NULL, 'App\\Http\\Controllers\\Voyager\\BooksController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-06-02 03:43:37', '2021-07-04 04:09:13'),
(5, 'categories', 'categories', 'Category', 'Categories', NULL, 'App\\Category', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-06-02 03:47:12', '2021-06-02 03:58:51'),
(6, 'customerusers', 'customerusers', 'Customeruser', 'Customerusers', NULL, 'App\\Customeruser', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-06-04 08:58:26', '2021-06-23 09:59:48'),
(7, 'authors', 'authors', 'Author', 'Authors', NULL, 'App\\Author', NULL, 'App\\Http\\Controllers\\Voyager\\AuthorsController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-06-15 13:51:21', '2021-06-20 12:59:20'),
(8, 'narrators', 'narrators', 'Narrator', 'Narrators', NULL, 'App\\Narrator', NULL, 'App\\Http\\Controllers\\Voyager\\NarratorsController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-06-16 03:14:27', '2021-06-20 12:58:22');

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2021-06-01 11:47:49', '2021-06-01 11:47:49');

-- --------------------------------------------------------

--
-- Структура таблицы `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2021-06-01 11:47:49', '2021-06-01 11:47:49', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2021-06-01 11:47:49', '2021-06-01 11:47:49', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2021-06-01 11:47:49', '2021-06-01 11:47:49', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2021-06-01 11:47:49', '2021-06-01 11:47:49', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2021-06-01 11:47:49', '2021-06-01 11:47:49', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 10, '2021-06-01 11:47:49', '2021-06-01 11:47:49', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 11, '2021-06-01 11:47:49', '2021-06-01 11:47:49', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 12, '2021-06-01 11:47:49', '2021-06-01 11:47:49', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2021-06-01 11:47:49', '2021-06-01 11:47:49', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 14, '2021-06-01 11:47:49', '2021-06-01 11:47:49', 'voyager.settings.index', NULL),
(11, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 13, '2021-06-01 11:47:50', '2021-06-01 11:47:50', 'voyager.hooks', NULL),
(12, 1, 'Books', '', '_self', NULL, NULL, NULL, 15, '2021-06-02 03:43:37', '2021-06-02 03:43:37', 'voyager.books.index', NULL),
(13, 1, 'Categories', '', '_self', NULL, NULL, NULL, 16, '2021-06-02 03:47:12', '2021-06-02 03:47:12', 'voyager.categories.index', NULL),
(14, 1, 'Customerusers', '', '_self', NULL, NULL, NULL, 17, '2021-06-04 08:58:27', '2021-06-04 08:58:27', 'voyager.customerusers.index', NULL),
(15, 1, 'Authors', '', '_self', NULL, NULL, NULL, 18, '2021-06-15 13:51:21', '2021-06-15 13:51:21', 'voyager.authors.index', NULL),
(16, 1, 'Narrators', '', '_self', NULL, NULL, NULL, 19, '2021-06-16 03:14:27', '2021-06-16 03:14:27', 'voyager.narrators.index', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `narrators`
--

CREATE TABLE `narrators` (
  `id` int(10) UNSIGNED NOT NULL,
  `title_az` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc_az` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categories` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `narrators`
--

INSERT INTO `narrators` (`id`, `title_az`, `desc_az`, `image`, `categories`, `created_at`, `updated_at`) VALUES
(1, 'Emine Dilbazi', NULL, 'narrators\\June2021\\UE8j564YCyngwi1HVkW0.jpg', '[\"1\",\"4\",\"5\",\"9\"]', '2021-06-16 03:23:00', '2021-06-27 09:42:57');

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2021-06-01 11:47:49', '2021-06-01 11:47:49'),
(2, 'browse_bread', NULL, '2021-06-01 11:47:49', '2021-06-01 11:47:49'),
(3, 'browse_database', NULL, '2021-06-01 11:47:49', '2021-06-01 11:47:49'),
(4, 'browse_media', NULL, '2021-06-01 11:47:49', '2021-06-01 11:47:49'),
(5, 'browse_compass', NULL, '2021-06-01 11:47:49', '2021-06-01 11:47:49'),
(6, 'browse_menus', 'menus', '2021-06-01 11:47:49', '2021-06-01 11:47:49'),
(7, 'read_menus', 'menus', '2021-06-01 11:47:49', '2021-06-01 11:47:49'),
(8, 'edit_menus', 'menus', '2021-06-01 11:47:49', '2021-06-01 11:47:49'),
(9, 'add_menus', 'menus', '2021-06-01 11:47:49', '2021-06-01 11:47:49'),
(10, 'delete_menus', 'menus', '2021-06-01 11:47:49', '2021-06-01 11:47:49'),
(11, 'browse_roles', 'roles', '2021-06-01 11:47:49', '2021-06-01 11:47:49'),
(12, 'read_roles', 'roles', '2021-06-01 11:47:49', '2021-06-01 11:47:49'),
(13, 'edit_roles', 'roles', '2021-06-01 11:47:49', '2021-06-01 11:47:49'),
(14, 'add_roles', 'roles', '2021-06-01 11:47:49', '2021-06-01 11:47:49'),
(15, 'delete_roles', 'roles', '2021-06-01 11:47:49', '2021-06-01 11:47:49'),
(16, 'browse_users', 'users', '2021-06-01 11:47:49', '2021-06-01 11:47:49'),
(17, 'read_users', 'users', '2021-06-01 11:47:49', '2021-06-01 11:47:49'),
(18, 'edit_users', 'users', '2021-06-01 11:47:49', '2021-06-01 11:47:49'),
(19, 'add_users', 'users', '2021-06-01 11:47:49', '2021-06-01 11:47:49'),
(20, 'delete_users', 'users', '2021-06-01 11:47:49', '2021-06-01 11:47:49'),
(21, 'browse_settings', 'settings', '2021-06-01 11:47:49', '2021-06-01 11:47:49'),
(22, 'read_settings', 'settings', '2021-06-01 11:47:49', '2021-06-01 11:47:49'),
(23, 'edit_settings', 'settings', '2021-06-01 11:47:49', '2021-06-01 11:47:49'),
(24, 'add_settings', 'settings', '2021-06-01 11:47:49', '2021-06-01 11:47:49'),
(25, 'delete_settings', 'settings', '2021-06-01 11:47:49', '2021-06-01 11:47:49'),
(26, 'browse_hooks', NULL, '2021-06-01 11:47:50', '2021-06-01 11:47:50'),
(27, 'browse_books', 'books', '2021-06-02 03:43:37', '2021-06-02 03:43:37'),
(28, 'read_books', 'books', '2021-06-02 03:43:37', '2021-06-02 03:43:37'),
(29, 'edit_books', 'books', '2021-06-02 03:43:37', '2021-06-02 03:43:37'),
(30, 'add_books', 'books', '2021-06-02 03:43:37', '2021-06-02 03:43:37'),
(31, 'delete_books', 'books', '2021-06-02 03:43:37', '2021-06-02 03:43:37'),
(32, 'browse_categories', 'categories', '2021-06-02 03:47:12', '2021-06-02 03:47:12'),
(33, 'read_categories', 'categories', '2021-06-02 03:47:12', '2021-06-02 03:47:12'),
(34, 'edit_categories', 'categories', '2021-06-02 03:47:12', '2021-06-02 03:47:12'),
(35, 'add_categories', 'categories', '2021-06-02 03:47:12', '2021-06-02 03:47:12'),
(36, 'delete_categories', 'categories', '2021-06-02 03:47:12', '2021-06-02 03:47:12'),
(37, 'browse_customerusers', 'customerusers', '2021-06-04 08:58:27', '2021-06-04 08:58:27'),
(38, 'read_customerusers', 'customerusers', '2021-06-04 08:58:27', '2021-06-04 08:58:27'),
(39, 'edit_customerusers', 'customerusers', '2021-06-04 08:58:27', '2021-06-04 08:58:27'),
(40, 'add_customerusers', 'customerusers', '2021-06-04 08:58:27', '2021-06-04 08:58:27'),
(41, 'delete_customerusers', 'customerusers', '2021-06-04 08:58:27', '2021-06-04 08:58:27'),
(42, 'browse_authors', 'authors', '2021-06-15 13:51:21', '2021-06-15 13:51:21'),
(43, 'read_authors', 'authors', '2021-06-15 13:51:21', '2021-06-15 13:51:21'),
(44, 'edit_authors', 'authors', '2021-06-15 13:51:21', '2021-06-15 13:51:21'),
(45, 'add_authors', 'authors', '2021-06-15 13:51:21', '2021-06-15 13:51:21'),
(46, 'delete_authors', 'authors', '2021-06-15 13:51:21', '2021-06-15 13:51:21'),
(47, 'browse_narrators', 'narrators', '2021-06-16 03:14:27', '2021-06-16 03:14:27'),
(48, 'read_narrators', 'narrators', '2021-06-16 03:14:27', '2021-06-16 03:14:27'),
(49, 'edit_narrators', 'narrators', '2021-06-16 03:14:27', '2021-06-16 03:14:27'),
(50, 'add_narrators', 'narrators', '2021-06-16 03:14:27', '2021-06-16 03:14:27'),
(51, 'delete_narrators', 'narrators', '2021-06-16 03:14:27', '2021-06-16 03:14:27');

-- --------------------------------------------------------

--
-- Структура таблицы `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(6, 2),
(7, 1),
(7, 2),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(27, 2),
(27, 3),
(28, 1),
(28, 2),
(28, 3),
(29, 1),
(29, 2),
(30, 1),
(30, 2),
(31, 1),
(31, 2),
(32, 1),
(32, 2),
(33, 1),
(33, 2),
(34, 1),
(34, 2),
(35, 1),
(35, 2),
(36, 1),
(36, 2),
(37, 1),
(37, 2),
(38, 1),
(38, 2),
(39, 1),
(39, 2),
(40, 1),
(40, 2),
(41, 1),
(41, 2),
(42, 1),
(42, 2),
(43, 1),
(43, 2),
(44, 1),
(44, 2),
(45, 1),
(45, 2),
(46, 1),
(46, 2),
(47, 1),
(47, 2),
(48, 1),
(48, 2),
(49, 1),
(49, 2),
(50, 1),
(50, 2),
(51, 1),
(51, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2021-06-01 11:47:49', '2021-06-01 11:47:49'),
(2, 'user', 'Normal User', '2021-06-01 11:47:49', '2021-06-01 11:47:49'),
(3, 'publisher', 'Publisher', '2021-07-04 03:54:47', '2021-07-04 03:54:47');

-- --------------------------------------------------------

--
-- Структура таблицы `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Audiokitab', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'İndi kitabları dinləmək zamanıdır!', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Структура таблицы `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'ali', 'alishixiyev@gmail.com', 'users/default.png', NULL, '$2y$10$6zJLB204QGQ5fbZQDgyp/O7W441Xpo5Fmn11V4cf/eQsRrE8Z2Aqa', NULL, NULL, '2021-06-01 11:54:40', '2021-06-01 11:54:40'),
(2, 3, 'Ali ve Nino', 'alinino@gmail.com', 'users/default.png', NULL, '$2y$10$J1hiGJ4f8Jpp8RDVbEWC2OtV/jiKun1coomQD.Bg3K29zPsZJ2s7a', NULL, '{\"locale\":\"en\"}', '2021-07-04 03:55:58', '2021-07-04 03:55:58');

-- --------------------------------------------------------

--
-- Структура таблицы `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(2, 3);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `customerusers`
--
ALTER TABLE `customerusers`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Индексы таблицы `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Индексы таблицы `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `narrators`
--
ALTER TABLE `narrators`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Индексы таблицы `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Индексы таблицы `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Индексы таблицы `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Индексы таблицы `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `authors`
--
ALTER TABLE `authors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `books`
--
ALTER TABLE `books`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `customerusers`
--
ALTER TABLE `customerusers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT для таблицы `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT для таблицы `narrators`
--
ALTER TABLE `narrators`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Ограничения внешнего ключа таблицы `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
