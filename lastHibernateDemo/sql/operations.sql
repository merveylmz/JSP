-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost
-- Üretim Zamanı: 29 Tem 2017, 10:25:03
-- Sunucu sürümü: 5.7.18-log
-- PHP Sürümü: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `operations`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `departmentName` varchar(45) DEFAULT NULL,
  `departmentDesc` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `department`
--

INSERT INTO `department` (`id`, `departmentName`, `departmentDesc`) VALUES
(2, 'deneme1', 'deneme1'),
(3, 'deneme2', 'deneme2'),
(5, 'deneme', 'deneme'),
(6, 'deneme', 'deneme2'),
(7, 'deneme28', 'deneme98'),
(8, 'adad', 'adad'),
(9, 'deneme28', 'deneme98');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `employeeName` varchar(45) DEFAULT NULL,
  `employeeSurname` varchar(45) DEFAULT NULL,
  `employeeSalary` varchar(150) DEFAULT NULL,
  `departmentId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `employee`
--

INSERT INTO `employee` (`id`, `employeeName`, `employeeSurname`, `employeeSalary`, `departmentId`) VALUES
(8, 'muhammets', 'Enginar', '2.5898', 3),
(9, 'muhammet', 'Enginar', '2.58', 8),
(10, 'muhammet', 'Enginar', '2.55', 7);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `meeting`
--

CREATE TABLE `meeting` (
  `id` int(11) NOT NULL,
  `meetingName` varchar(45) DEFAULT NULL,
  `meetingDesc` varchar(45) DEFAULT NULL,
  `departmentId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `meeting`
--

INSERT INTO `meeting` (`id`, `meetingName`, `meetingDesc`, `departmentId`) VALUES
(5, 'deneme', 'deneme', 3),
(6, 'deneme', 'adsad', 8),
(7, 'deneme1', 'deneme1', 7);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `meeting`
--
ALTER TABLE `meeting`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Tablo için AUTO_INCREMENT değeri `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Tablo için AUTO_INCREMENT değeri `meeting`
--
ALTER TABLE `meeting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
