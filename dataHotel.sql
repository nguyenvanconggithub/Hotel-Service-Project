-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: hotel
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `anhks`
--

DROP TABLE IF EXISTS `anhks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `anhks` (
  `idanhks` int(11) NOT NULL AUTO_INCREMENT,
  `linkanh` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MaKS` int(11) DEFAULT NULL,
  PRIMARY KEY (`idanhks`),
  KEY `fk_anhks_idx` (`MaKS`),
  CONSTRAINT `fk_anhks` FOREIGN KEY (`MaKS`) REFERENCES `khachsan` (`MaKS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anhks`
--

LOCK TABLES `anhks` WRITE;
/*!40000 ALTER TABLE `anhks` DISABLE KEYS */;
/*!40000 ALTER TABLE `anhks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anhphong`
--

DROP TABLE IF EXISTS `anhphong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `anhphong` (
  `idanhphong` int(11) NOT NULL AUTO_INCREMENT,
  `linkanh` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MaPH` int(11) DEFAULT NULL,
  PRIMARY KEY (`idanhphong`),
  KEY `fk_anhphong_idx` (`MaPH`),
  CONSTRAINT `fk_anhphong` FOREIGN KEY (`MaPH`) REFERENCES `phong` (`MaPH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anhphong`
--

LOCK TABLES `anhphong` WRITE;
/*!40000 ALTER TABLE `anhphong` DISABLE KEYS */;
/*!40000 ALTER TABLE `anhphong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datphong`
--

DROP TABLE IF EXISTS `datphong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `datphong` (
  `MaDatPH` int(11) NOT NULL AUTO_INCREMENT,
  `MaPH` int(11) NOT NULL,
  `idNguoiDung` int(11) DEFAULT NULL,
  `TenChuPH` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ThoiGianDat` datetime DEFAULT NULL,
  `ThoiGianDen` date DEFAULT NULL,
  `ThoiGianDi` date NOT NULL,
  `SoLuongDat` int(11) NOT NULL,
  `GhiChu` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TinhTrangDat` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaDatPH`,`MaPH`),
  KEY `fk_id_nguoidung_idx` (`idNguoiDung`),
  KEY `fk_Maph_Phong_idx` (`MaPH`),
  CONSTRAINT `fk_Maph_Phong` FOREIGN KEY (`MaPH`) REFERENCES `phong` (`MaPH`),
  CONSTRAINT `fk_id_nguoidung` FOREIGN KEY (`idNguoiDung`) REFERENCES `nguoidung` (`idNguoiDung`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datphong`
--

LOCK TABLES `datphong` WRITE;
/*!40000 ALTER TABLE `datphong` DISABLE KEYS */;
/*!40000 ALTER TABLE `datphong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giuong`
--

DROP TABLE IF EXISTS `giuong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `giuong` (
  `MaGiuong` int(11) NOT NULL AUTO_INCREMENT,
  `TenGiuong` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`MaGiuong`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giuong`
--

LOCK TABLES `giuong` WRITE;
/*!40000 ALTER TABLE `giuong` DISABLE KEYS */;
/*!40000 ALTER TABLE `giuong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khachsan`
--

DROP TABLE IF EXISTS `khachsan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `khachsan` (
  `MaKS` int(11) NOT NULL AUTO_INCREMENT,
  `TenKS` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SoSao` int(11) DEFAULT NULL,
  `DiaChi` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AnhKS` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TenDangNhap` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TienIch` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`MaKS`),
  KEY `fk_taikhoan` (`TenDangNhap`),
  CONSTRAINT `fk_taikhoan` FOREIGN KEY (`TenDangNhap`) REFERENCES `taikhoan` (`TenDangNhap`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khachsan`
--

LOCK TABLES `khachsan` WRITE;
/*!40000 ALTER TABLE `khachsan` DISABLE KEYS */;
/*!40000 ALTER TABLE `khachsan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loaiphong`
--

DROP TABLE IF EXISTS `loaiphong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `loaiphong` (
  `MaLoaiPH` int(11) NOT NULL AUTO_INCREMENT,
  `TenLoaiPH` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`MaLoaiPH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loaiphong`
--

LOCK TABLES `loaiphong` WRITE;
/*!40000 ALTER TABLE `loaiphong` DISABLE KEYS */;
/*!40000 ALTER TABLE `loaiphong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nguoidung`
--

DROP TABLE IF EXISTS `nguoidung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `nguoidung` (
  `idNguoiDung` int(11) NOT NULL AUTO_INCREMENT,
  `Ten` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Email` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `SDT` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `TenDangNhap` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`idNguoiDung`),
  KEY `fk_nguoidung` (`TenDangNhap`),
  CONSTRAINT `fk_nguoidung` FOREIGN KEY (`TenDangNhap`) REFERENCES `taikhoan` (`TenDangNhap`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nguoidung`
--

LOCK TABLES `nguoidung` WRITE;
/*!40000 ALTER TABLE `nguoidung` DISABLE KEYS */;
/*!40000 ALTER TABLE `nguoidung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phong`
--

DROP TABLE IF EXISTS `phong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `phong` (
  `MaPH` int(11) NOT NULL AUTO_INCREMENT,
  `TenPH` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MaKS` int(11) NOT NULL,
  `MaGiuong` int(11) NOT NULL,
  `MaLoaiPH` int(11) NOT NULL,
  `DienTich` float DEFAULT NULL,
  `Gia` int(11) DEFAULT NULL,
  `SoLuongNguoi` int(11) DEFAULT NULL,
  `SoLuongPH` int(11) DEFAULT NULL,
  `TinhTrang` int(11) DEFAULT NULL,
  `GhiChu` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`MaPH`),
  KEY `fk_giuong_idx` (`MaGiuong`),
  KEY `fk_loaiph_idx` (`MaLoaiPH`),
  KEY `fk_phks_idx` (`MaKS`),
  CONSTRAINT `fk_giuong` FOREIGN KEY (`MaGiuong`) REFERENCES `giuong` (`MaGiuong`),
  CONSTRAINT `fk_loaiph` FOREIGN KEY (`MaLoaiPH`) REFERENCES `loaiphong` (`MaLoaiPH`),
  CONSTRAINT `fk_phks` FOREIGN KEY (`MaKS`) REFERENCES `khachsan` (`MaKS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phong`
--

LOCK TABLES `phong` WRITE;
/*!40000 ALTER TABLE `phong` DISABLE KEYS */;
/*!40000 ALTER TABLE `phong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taikhoan`
--

DROP TABLE IF EXISTS `taikhoan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `taikhoan` (
  `TenDangNhap` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `MatKhau` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `Quyen` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`TenDangNhap`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taikhoan`
--

LOCK TABLES `taikhoan` WRITE;
/*!40000 ALTER TABLE `taikhoan` DISABLE KEYS */;
/*!40000 ALTER TABLE `taikhoan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tienich`
--

DROP TABLE IF EXISTS `tienich`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tienich` (
  `MaTienIch` int(11) NOT NULL AUTO_INCREMENT,
  `TenTienIch` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`MaTienIch`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tienich`
--

LOCK TABLES `tienich` WRITE;
/*!40000 ALTER TABLE `tienich` DISABLE KEYS */;
/*!40000 ALTER TABLE `tienich` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tienichks`
--

DROP TABLE IF EXISTS `tienichks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tienichks` (
  `MaTienIch` int(11) NOT NULL,
  `MaKS` int(11) NOT NULL,
  PRIMARY KEY (`MaTienIch`,`MaKS`),
  KEY `fk_tienichks_idx` (`MaKS`),
  CONSTRAINT `fk_kstienich` FOREIGN KEY (`MaTienIch`) REFERENCES `tienich` (`MaTienIch`),
  CONSTRAINT `fk_tienichks` FOREIGN KEY (`MaKS`) REFERENCES `khachsan` (`MaKS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tienichks`
--

LOCK TABLES `tienichks` WRITE;
/*!40000 ALTER TABLE `tienichks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tienichks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tienichphong`
--

DROP TABLE IF EXISTS `tienichphong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tienichphong` (
  `MaTienIch` int(11) NOT NULL,
  `MaPH` int(11) NOT NULL,
  PRIMARY KEY (`MaTienIch`,`MaPH`),
  KEY `fk_tientichphong_idx` (`MaPH`),
  CONSTRAINT `fk_tienich` FOREIGN KEY (`MaTienIch`) REFERENCES `tienich` (`MaTienIch`),
  CONSTRAINT `fk_tientichphong` FOREIGN KEY (`MaPH`) REFERENCES `phong` (`MaPH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tienichphong`
--

LOCK TABLES `tienichphong` WRITE;
/*!40000 ALTER TABLE `tienichphong` DISABLE KEYS */;
/*!40000 ALTER TABLE `tienichphong` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-04 20:16:11
