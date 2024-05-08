-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Počítač: db
-- Vytvořeno: Stř 08. kvě 2024, 11:06
-- Verze serveru: 8.4.0
-- Verze PHP: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `db`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `Fakulty`
--

CREATE TABLE `Fakulty` (
  `id` int NOT NULL,
  `Nazev` text NOT NULL,
  `Dekan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Vypisuji data pro tabulku `Fakulty`
--

INSERT INTO `Fakulty` (`id`, `Nazev`, `Dekan`) VALUES
(1, 'Přírodovědecká Fakulta', 'RNDr. Michal Varady, Ph. D.');

-- --------------------------------------------------------

--
-- Struktura tabulky `Katedry`
--

CREATE TABLE `Katedry` (
  `id` int NOT NULL,
  `Fakulta_id` int NOT NULL,
  `Nazev` text NOT NULL,
  `Zkratka` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Vypisuji data pro tabulku `Katedry`
--

INSERT INTO `Katedry` (`id`, `Fakulta_id`, `Nazev`, `Zkratka`) VALUES
(1, 1, 'Katedra informatiky', 'KI'),
(2, 1, 'Katedra matematiky', 'KMA');

-- --------------------------------------------------------

--
-- Struktura tabulky `Obory`
--

CREATE TABLE `Obory` (
  `id` int NOT NULL,
  `Fakulta_id` int NOT NULL,
  `Nazev` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Vypisuji data pro tabulku `Obory`
--

INSERT INTO `Obory` (`id`, `Fakulta_id`, `Nazev`) VALUES
(1, 1, 'Aplikovaná informatika');

-- --------------------------------------------------------

--
-- Struktura tabulky `Predmety`
--

CREATE TABLE `Predmety` (
  `id` int NOT NULL,
  `Katedra_id` int NOT NULL,
  `Nazev` text NOT NULL,
  `Zkratka` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Vypisuji data pro tabulku `Predmety`
--

INSERT INTO `Predmety` (`id`, `Katedra_id`, `Nazev`, `Zkratka`) VALUES
(1, 1, 'Principy operačních systémů', 'POS'),
(2, 1, 'Softwarové inženýrství', 'SWI'),
(3, 2, 'Pokročilé statistické metody', 'PSM'),
(4, 2, 'Pravděpodobnost a statistika', 'PAS');

-- --------------------------------------------------------

--
-- Struktura tabulky `Studenti`
--

CREATE TABLE `Studenti` (
  `id` int NOT NULL,
  `Obor_id` int NOT NULL,
  `Jmeno` text NOT NULL,
  `Email` text NOT NULL,
  `Zacatek` year NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Vypisuji data pro tabulku `Studenti`
--

INSERT INTO `Studenti` (`id`, `Obor_id`, `Jmeno`, `Email`, `Zacatek`) VALUES
(1, 1, 'ST NO1', 'st1@ujep.cz', '2023'),
(2, 1, 'ST NO2', 'st2@ujep.cz', '2024');

-- --------------------------------------------------------

--
-- Struktura tabulky `Vedouci`
--

CREATE TABLE `Vedouci` (
  `id` int NOT NULL,
  `Katedra_id` int NOT NULL,
  `Jmeno` text NOT NULL,
  `Telefon` text NOT NULL,
  `Email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Vypisuji data pro tabulku `Vedouci`
--

INSERT INTO `Vedouci` (`id`, `Katedra_id`, `Jmeno`, `Telefon`, `Email`) VALUES
(1, 1, 'RNDr. Jiří Škvor, Ph.D.', '+420475286711', 'jiri.skvor@ujep.cz'),
(2, 2, 'PhDr. Magdalena Krátká, Ph.D.', '+420475286685', 'magdalena.kratka@ujep.cz');

-- --------------------------------------------------------

--
-- Struktura tabulky `Zamestnanci`
--

CREATE TABLE `Zamestnanci` (
  `id` int NOT NULL,
  `Katedra_id` int NOT NULL,
  `Jmeno` text NOT NULL,
  `Telefon` text NOT NULL,
  `Email` text NOT NULL,
  `Pozice` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Vypisuji data pro tabulku `Zamestnanci`
--

INSERT INTO `Zamestnanci` (`id`, `Katedra_id`, `Jmeno`, `Telefon`, `Email`, `Pozice`) VALUES
(1, 1, 'Mgr. Jiří Fišer, Ph.D.', ' +420475286715', 'jiri.fiser@ujep.cz', 'zástupce vedoucího katedry, odborný asistent'),
(2, 1, 'Ing. Mgr. Pavel Beránek', '+420475286724', 'Pavel.Beranek@ujep.cz', 'odborný asistent, PR katedry'),
(3, 2, 'Mgr. Alena Černíková, MSc., Ph.D.', '+420475286677', 'alena.cernikova@ujep.cz', 'odborná asistentka'),
(4, 2, 'doc. PhDr. Mgr. Ing. Martin Boďa, PhD.', '+420475286680', 'martin.boda@ujep.cz', 'docent');

--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `Fakulty`
--
ALTER TABLE `Fakulty`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `Katedry`
--
ALTER TABLE `Katedry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FAKULTA_REALTION` (`Fakulta_id`) USING BTREE;

--
-- Indexy pro tabulku `Obory`
--
ALTER TABLE `Obory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FAKULTA_RELATION1` (`Fakulta_id`);

--
-- Indexy pro tabulku `Predmety`
--
ALTER TABLE `Predmety`
  ADD PRIMARY KEY (`id`),
  ADD KEY `KATEDRA_RELATION3` (`Katedra_id`);

--
-- Indexy pro tabulku `Studenti`
--
ALTER TABLE `Studenti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `OBOR_RELATION` (`Obor_id`);

--
-- Indexy pro tabulku `Vedouci`
--
ALTER TABLE `Vedouci`
  ADD PRIMARY KEY (`id`),
  ADD KEY `KATEDRA_RELATION` (`Katedra_id`);

--
-- Indexy pro tabulku `Zamestnanci`
--
ALTER TABLE `Zamestnanci`
  ADD PRIMARY KEY (`id`),
  ADD KEY `KATEDRA_RELATION2` (`Katedra_id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `Fakulty`
--
ALTER TABLE `Fakulty`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pro tabulku `Katedry`
--
ALTER TABLE `Katedry`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pro tabulku `Obory`
--
ALTER TABLE `Obory`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pro tabulku `Predmety`
--
ALTER TABLE `Predmety`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pro tabulku `Studenti`
--
ALTER TABLE `Studenti`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pro tabulku `Vedouci`
--
ALTER TABLE `Vedouci`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pro tabulku `Zamestnanci`
--
ALTER TABLE `Zamestnanci`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `Katedry`
--
ALTER TABLE `Katedry`
  ADD CONSTRAINT `FK_myKey` FOREIGN KEY (`Fakulta_id`) REFERENCES `Fakulty` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Omezení pro tabulku `Obory`
--
ALTER TABLE `Obory`
  ADD CONSTRAINT `FAKULTA_RELATION1` FOREIGN KEY (`Fakulta_id`) REFERENCES `Fakulty` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Omezení pro tabulku `Predmety`
--
ALTER TABLE `Predmety`
  ADD CONSTRAINT `KATEDRA_RELATION3` FOREIGN KEY (`Katedra_id`) REFERENCES `Katedry` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Omezení pro tabulku `Studenti`
--
ALTER TABLE `Studenti`
  ADD CONSTRAINT `OBOR_RELATION` FOREIGN KEY (`Obor_id`) REFERENCES `Obory` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Omezení pro tabulku `Vedouci`
--
ALTER TABLE `Vedouci`
  ADD CONSTRAINT `KATEDRA_RELATION` FOREIGN KEY (`Katedra_id`) REFERENCES `Katedry` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Omezení pro tabulku `Zamestnanci`
--
ALTER TABLE `Zamestnanci`
  ADD CONSTRAINT `KATEDRA_RELATION2` FOREIGN KEY (`Katedra_id`) REFERENCES `Katedry` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
