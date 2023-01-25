-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mungudb
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `account_no` int NOT NULL AUTO_INCREMENT,
  `account_name` varchar(1000) DEFAULT NULL,
  `account_type` varchar(1000) DEFAULT NULL,
  `account_idno` varchar(1000) DEFAULT NULL,
  `acc_owner` varchar(1000) DEFAULT NULL,
  `acc_zipcode` varchar(1000) DEFAULT NULL,
  `acc_address` varchar(2000) DEFAULT NULL,
  `acc_address2` varchar(2000) DEFAULT NULL,
  `acc_conditions` varchar(1000) DEFAULT NULL,
  `acc_category` varchar(1000) DEFAULT NULL,
  `acc_manager` varchar(1000) DEFAULT NULL,
  `acc_enddate` date DEFAULT NULL,
  `acc_state` int DEFAULT NULL,
  `acc_telnum` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`account_no`)
) ENGINE=InnoDB AUTO_INCREMENT=1023 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1001,'이마트 풍산점','대형마트','206-86-50913','강희석','10311','경기도 고양시 일산동구 무궁화로 237','이마트풍산점','소매업','대형마켓, 판매업','정용진','2025-12-31',0,'070-6522-1234'),(1002,'이마트 마포점','대형마트','206-86-50913','강희석','04196','서울특별시 마포구 백범로 212','대우 월드마크마포','소매업','대형마켓, 판매업','문동은','2026-12-31',0,'070-1234-5678'),(1003,'이마트 용산점','대형마트','206-86-50913','강희석','04377','서울특별시 용산구 한강대로23길 55','이마트용산점','소매업','대형마켓, 판매업','전재준','2024-12-31',0,'070-2589-3698'),(1004,'홈플러스 합정점','대형마트','220-81-60348','이제훈','04036','서울특별시 마포구 양화로 45','메세나폴리스','소매업','대형마켓, 판매업','박연진','2022-12-31',1,'070-5555-9999'),(1005,'홈플러스 목동점','대형마트','220-81-60348','이제훈','07992','서울특별시 양천구 목동서로 170','홈플러스목동점','소매업','대형마켓, 판매업','주여정','2024-12-31',0,'02-4587-7748'),(1006,'홈플러스 고양터미널점','대형마트','220-81-60348','이제훈','10450','경기도 고양시 일산동구 중앙로 1036','고양터미널점 B2','소매업','대형마켓, 판매업','이사라','2025-12-31',0,'02-4568-7841'),(1007,'모닝글로리 연희점','문구점','105-81-63968','허상일','03708','서울특별시 서대문구 연희맛로 28','모닝글로리 연희점','소매업','문구,팬시용품','정지소','2024-12-31',0,'02-333-2400'),(1008,'모닝글로리 경복궁점','문구점','105-81-63968','허상일','03044','서울특별시 종로구 자하문로2길 3','1층 모닝글로리 경복궁','소매업','문구,팬시용품','진도준','2022-12-31',1,'02-736-1023'),(1009,'모닝글로리 식사점','문구점','105-81-63968','허상일','10323','경기도 고양시 일산동구 위시티3로 60','모닝글로리 식사점','소매업','문구,팬시용품','송혜교','2024-12-31',0,'031-966-4040'),(1010,'텐바이텐 대학로점','문구점','211-87-00620','최은희','03086','서울특별시 종로구 대학로12길 31','자유빌딩 1층','소매업','문구,팬시용품','송중기','2024-12-31',0,'02-741-9010'),(1011,'텐바이텐 신제주점','문구점','211-87-00620','최은희','63123','제주특별자치도 제주시 연동7길 26','1층 텐바이텐','소매업','문구,팬시용품','장원영','2025-12-31',0,'0507-1357-1693'),(1012,'교보문고 광화문점','서점','102-81-11670','안병현','03154','서울특별시 종로구 종로 1','교보생명빌딩 지하1층','도소매업','대형서점','이영지','2025-12-31',0,'1544-1900'),(1013,'교보문고 영등포점','서점','102-81-11670','안병현','07305','서울특별시 영등포구 영중로 15','타임스퀘어 멀티플렉스 2층','도소매업','대형서점','김광현','2026-12-31',0,'1544-1903'),(1014,'교보문고 은평 바로드림센터','서점','102-81-11670','안병현','03306','서울특별시 은평구 통일로 1050','롯데몰 은평점 3층','도소매업','대형서점','최정','2026-12-31',0,'1544-1906'),(1015,'예쓰이십사','서점','229-81-37000','김석환','98542','서울시 영등포구 은행로 11','5층~6층(여의도동,일신빌딩)','도소매업','대형서점,인터넷판매업','김강민','2025-12-31',0,'02-8988-4152'),(1016,'창신동문구완구','문구점','102-85-4567','최예솔','03121','서울특별시 종로구 종로52길 21-1','3층 302호','도매업','문구 도소매','최주환','2025-12-31',0,'02-743-7424'),(1017,'하나제이','문구점','102-78-12345','박병철','10212','경기도 고양시 일산서구 송산로 559-16','하나빌딩 101호','도매업','문구 도매','최민준','2026-12-31',0,'031-911-2870'),(1018,'홍익아트문구센터','문구점','102-85-445789','윤소희','10414','경기도 고양시 일산동구 장백로 178','뉴욕프라자상가 110호','소매업','문구소매','박정권','2022-12-31',1,'031-1420-7770'),(1019,'탱크유통','문구점','211-87-22365','진성준','25803','강원도 동해시 동회길 8','탱크유통','도매업','문구 도매','정근우','2025-12-31',0,'0507-1319-2293'),(1020,'문구야놀자','문구점','102-87-78456','김구월','21016','인천광역시 계양구 양지로 138','블루빌 1층','소매업','문구,팬시용품','양현종','2026-12-31',0,'070-888-6618'),(1021,'드림디포 구월점','문구점','214-86-77209','장낙전','36321','인천광역시 남동구 용천로 68','써니프라자 지하1층','도소매업','문구,팬시용품','이대호','2025-12-31',0,'032-472-0009'),(1022,'천삼백케이','문구점','211-87-15370','이윤석','107884','서울시 구로구 디지털로 26길 72','2층','도소매업','문구 도소매,인터넷판매업','박세리','2025-12-31',0,'02-4574-7845');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authority`
--

DROP TABLE IF EXISTS `authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authority` (
  `AUTH_NO` int NOT NULL COMMENT '권한 번호',
  `AUTH_NAME` varchar(1000) DEFAULT NULL COMMENT '권한 명칭',
  PRIMARY KEY (`AUTH_NO`),
  UNIQUE KEY `PK_AUTHORITY` (`AUTH_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authority`
--

LOCK TABLES `authority` WRITE;
/*!40000 ALTER TABLE `authority` DISABLE KEYS */;
INSERT INTO `authority` VALUES (0,'user'),(1,'admin');
/*!40000 ALTER TABLE `authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comm`
--

DROP TABLE IF EXISTS `comm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comm` (
  `BCD` int NOT NULL,
  `MCD` int NOT NULL,
  `COMM_DETAIL` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comm`
--

LOCK TABLES `comm` WRITE;
/*!40000 ALTER TABLE `comm` DISABLE KEYS */;
/*!40000 ALTER TABLE `comm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dept`
--

DROP TABLE IF EXISTS `dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dept` (
  `DEPT_NO` int NOT NULL COMMENT '부서 번호',
  `DEPT_NAME` varchar(1000) DEFAULT NULL COMMENT '부서 이름',
  PRIMARY KEY (`DEPT_NO`),
  UNIQUE KEY `PK_DEPT` (`DEPT_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept`
--

LOCK TABLES `dept` WRITE;
/*!40000 ALTER TABLE `dept` DISABLE KEYS */;
INSERT INTO `dept` VALUES (1,'사업부'),(2,'영업부'),(3,'기획부'),(4,'개발부'),(5,'작업부');
/*!40000 ALTER TABLE `dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp`
--

DROP TABLE IF EXISTS `emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp` (
  `EMP_NO` int NOT NULL COMMENT '사원 번호',
  `EMP_NAME` varchar(1000) DEFAULT NULL COMMENT '사원 이름',
  `EMP_ID` varchar(1000) DEFAULT NULL COMMENT '사원 아이디',
  `EMP_PASSWORD` varchar(1000) DEFAULT NULL COMMENT '사원 비밀번호',
  `EMP_ADDRESS` varchar(10000) DEFAULT NULL COMMENT '사원 주소',
  `EMP_GENDER` varchar(1000) DEFAULT NULL COMMENT '사원 성별',
  `EMP_HIRE_DATE` timestamp(6) NULL DEFAULT NULL COMMENT '사원 입사일',
  `EMP_EMAIL` varchar(1000) DEFAULT NULL COMMENT '사원 이메일',
  `DEPT_NO` int DEFAULT NULL COMMENT '부서 번호',
  `POSIT_NO` int DEFAULT NULL COMMENT '직급 번호',
  `AUTH_NO` int DEFAULT NULL COMMENT '권한 번호',
  PRIMARY KEY (`EMP_NO`),
  UNIQUE KEY `PK_EMP` (`EMP_NO`),
  KEY `FK_DEPT_TO_EMP` (`DEPT_NO`),
  KEY `FK_POSITION_TO_EMP` (`POSIT_NO`),
  KEY `FK_AUTHORITY_TO_EMP` (`AUTH_NO`),
  CONSTRAINT `FK_AUTHORITY_TO_EMP` FOREIGN KEY (`AUTH_NO`) REFERENCES `authority` (`AUTH_NO`),
  CONSTRAINT `FK_DEPT_TO_EMP` FOREIGN KEY (`DEPT_NO`) REFERENCES `dept` (`DEPT_NO`),
  CONSTRAINT `FK_POSITION_TO_EMP` FOREIGN KEY (`POSIT_NO`) REFERENCES `posit` (`POSIT_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp`
--

LOCK TABLES `emp` WRITE;
/*!40000 ALTER TABLE `emp` DISABLE KEYS */;
INSERT INTO `emp` VALUES (2201001,'관리자','test','$2a$10$PX2Gip0Ca6ekP3bLgwFn0e6xH75lGhobfwEt0Dam7nW8Zq1aRmVry','10412 경기 고양시 일산동구 산두로 3-1 /111동 1910호','남자','2022-01-01 07:27:59.000000','test@naver.com',1,9,1),(2301001,'권동주','kdj1234','$2a$10$A7L3wNiPyw22y0in1lfgM.ZcH.6PRYO9yYx5Re/EMkw/0sx94titO','04766 서울 성동구 서울숲길 17 /1234','여자','2022-12-31 15:00:00.000000','kdj1234@naver.com',1,1,0),(2301002,'김우석','wskimjeju','$2a$10$L5vyYktUz2n.tJJQJiRyD.Ky8wBW8JnqlzP73Qx.KgrEY11KaiMD2','','남자','2022-12-31 15:00:00.000000','',1,1,0),(2302001,'박은주','pej1234','$2a$10$gfsM4qzlKyAJArKQwUmJ/uWHRRXwq4HsFNiI7Unj66UptrCtpZsN.','05315 서울 강동구 양재대로123길 7 /1234','여자','2022-12-31 15:00:00.000000','pej1234@naver.com',2,1,0),(2302002,'오태우','otw1234','$2a$10$uf6L82nCAccIOTxr5eghsuCbrdZ8w33sk.RzICd9rJ6N81lnIIm5u','46531 부산 북구 와석장터로 1 /1234','남자','2022-12-31 15:00:00.000000','otw1234@naver.com',2,1,0),(2303001,'이우현','lwh1234','$2a$10$olSF584kpayosxtHB3tmmes0KupsLQaDiYNU4U/Wqae.I9bv0i7bG','08700 서울 관악구 조원로 3-2 /1234','여자','2022-12-31 15:00:00.000000','lwh1234@naver.com',3,1,0),(2303002,'이한주','lhj1234','$2a$10$7.6T8YoOhSKWNLWUGjxFV.EYd8RFpD/q9JqTZ1iOXRPyFnm9lDRH6','12461 경기 가평군 설악면 미사리로 267-177 /','여자','2022-12-31 15:00:00.000000','lhj1234@naver.com',3,1,0),(2304001,'임재우','ljw1234','$2a$10$ZJd2Vqx6i.Bz/L8/slq22.qcMwS5sS/.21sHLfIdqCiBywIpzpvZe','06126 서울 강남구 논현로 555 /1234','남자','2022-12-31 15:00:00.000000','ljw1234@naver.com',4,1,0),(2304002,'장제환','jjh1234','$2a$10$vJsYbbtasOwcJUOHTSWkBughIuClz5LFSCE5dpTE8KFwR3idFzpbW','08788 서울 관악구 관악로14길 38-9 /1234','남자','2022-12-31 15:00:00.000000','jjh1234@naver.com',4,1,0),(2305001,'장하영','jhy1234','$2a$10$zoqWNmq0S5pMVcr2ktp0h.Xr2/pQNeIfAwqKK2M3wl8FIsmdBh0hS','','여자','2022-12-31 15:00:00.000000','',5,1,0),(2305002,'한의정','hej1234','$2a$10$x5c7ksbkSMtqJvbjgkPFWezgp5HeK6avWH6u37B.Nc2VwX7KQo2L6','02576 서울 동대문구 왕산로19마길 23 /1234','여자','2022-12-31 15:00:00.000000','hej1234@naver.com',5,1,0);
/*!40000 ALTER TABLE `emp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_list`
--

DROP TABLE IF EXISTS `emp_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp_list` (
  `EMP_NO` int NOT NULL COMMENT '사원 번호',
  `EMP_NAME` varchar(1000) DEFAULT NULL COMMENT '사원 이름',
  `EMP_HIRE_DATE` timestamp(6) NULL DEFAULT NULL COMMENT '사원 입사일',
  `DEPT_NO` int DEFAULT NULL COMMENT '부서 번호',
  `POSIT_NO` int DEFAULT NULL COMMENT '직급 번호',
  `AUTH_NO` int DEFAULT NULL COMMENT '권한 번호',
  PRIMARY KEY (`EMP_NO`),
  UNIQUE KEY `PK_EMP2` (`EMP_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_list`
--

LOCK TABLES `emp_list` WRITE;
/*!40000 ALTER TABLE `emp_list` DISABLE KEYS */;
INSERT INTO `emp_list` VALUES (2201001,'관리자','2021-12-31 15:00:00.000000',1,9,1),(2301001,'권동주','2022-12-31 15:00:00.000000',1,1,0),(2301002,'김우석','2022-12-31 15:00:00.000000',1,1,0),(2302001,'박은주','2022-12-31 15:00:00.000000',2,1,0),(2302002,'오태우','2022-12-31 15:00:00.000000',2,1,0),(2303001,'이우현','2022-12-31 15:00:00.000000',3,1,0),(2303002,'이한주','2022-12-31 15:00:00.000000',3,1,0),(2304001,'임재우','2022-12-31 15:00:00.000000',4,1,0),(2304002,'장제환','2022-12-31 15:00:00.000000',4,1,0),(2305001,'장하영','2022-12-31 15:00:00.000000',5,1,0),(2305002,'한의정','2022-12-31 15:00:00.000000',5,1,0);
/*!40000 ALTER TABLE `emp_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factory`
--

DROP TABLE IF EXISTS `factory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factory` (
  `factory_no` int NOT NULL AUTO_INCREMENT,
  `factory_name` varchar(100) DEFAULT NULL,
  `factory_address1` varchar(100) DEFAULT NULL,
  `factory_address2` varchar(100) DEFAULT NULL,
  `factory_call` varchar(100) DEFAULT NULL,
  `factory_use` int DEFAULT NULL,
  PRIMARY KEY (`factory_no`)
) ENGINE=InnoDB AUTO_INCREMENT=710 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factory`
--

LOCK TABLES `factory` WRITE;
/*!40000 ALTER TABLE `factory` DISABLE KEYS */;
INSERT INTO `factory` VALUES (701,'포승공장','(17960) 경기도 평택시 포승읍 포승공단순환로 245','포승공장','031-8053-4754',1),(702,'부천공장','(14665) 경기도 부천시 안곡로 266 (역곡동)','부천공장','032-888-9875',1),(703,'염창동공장','(07535) 서울특별시 강서구 양천로67길 63 (염창동)','염창동공장','02-8877-9875',1),(704,'부산공장','(46042) 부산광역시 기장군 일광읍 일광로 188','부산공장','051-977-2345',1),(705,'대구공장','(42943) 대구광역시 달성군 화원읍 사문진로 384','대구공장','053-535-6789',1),(706,'파주공장','(10845) 경기도 파주시 월롱면 엘씨디로 284','파주공장','031-942-6578',1),(707,'인천공장','(22509) 인천광역시 동구 제물량로 386 (만석동)','인천공장','032-777-5287',1),(708,'일산공장','(10431) 경기 고양시 일산동구 장항로 297-38','일산공장','031-985-1387',1),(709,'안성공장','(17541) 경기 안성시 대덕면 모산로 345','안성공장','031-685-1875',1);
/*!40000 ALTER TABLE `factory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `item_no` int NOT NULL AUTO_INCREMENT,
  `factory_no` int NOT NULL,
  `item_Name` varchar(1000) DEFAULT NULL,
  `stock_Unit` int DEFAULT NULL,
  `item_Check` varchar(10) DEFAULT NULL COMMENT '상품을  생산하는지 안하는지',
  `hs_Code` varchar(1000) DEFAULT NULL COMMENT 'ex) 바코드 공통 번호',
  PRIMARY KEY (`item_no`),
  KEY `factory_no` (`factory_no`),
  CONSTRAINT `item_ibfk_1` FOREIGN KEY (`factory_no`) REFERENCES `factory` (`factory_no`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (100,701,'모나미 유성펜 0.7mm',12,'생산','223104'),(101,701,'알파 트리핏500 유성펜 1.0mm',12,'생산','410227'),(102,701,'유니 제트스트림 유성펜 SXN-150 0.7mm',12,'생산','140299'),(103,702,'알파 언더라인m 형광펜 5색',3,'생산','493778'),(104,702,'알파 언더라인m 형광펜 3색',5,'생산','493776'),(105,702,'알파 언더라인m 형광펜',12,'생산 중단','493770'),(106,703,'파버카스텔 TK-Fine Executive 샤프 0.5mm',12,'생산','1253283'),(107,703,'알파 제도샤프 0.5mm 블랙',12,'생산','282922'),(108,703,'동아 샤프 프로매틱 0.5mm',12,'생산','517826'),(109,704,'펜탈 아인슈타인 샤프심 0.5mm',10,'생산','523329'),(110,704,'제노 샤프심 0.5mm',20,'생산','1872882'),(111,704,'파버카스텔 연필 블랙 HB',12,'생산','1078765'),(112,705,'하고로모 탄산분필 백색',72,'생산','1634584'),(113,705,'하고로모 탄산분필 10색 혼합',12,'생산','1286076'),(114,705,'하고로모 분필케이스',5,'생산','1428850'),(115,706,'알파 스테플러 33호 침용',3,'생산','100400'),(116,706,'화신 스테플러 33호 침용',3,'생산','281589'),(117,706,'알파 스테플러침 33호',10,'생산','100459'),(118,707,'알파 OPP 박스테이프 투명 48mmx40M',4,'생산','1783866'),(119,707,'프랑스 마패드 포커스 컷터칼',20,'생산','902211'),(120,707,'화신 사무용가위 베스트 17.5cm',10,'생산','516720'),(121,708,'바이하츠 점보 실버클립',10,'생산','243513'),(122,708,'바이하츠 점보 칼라클립',10,'생산','243519'),(123,708,'알파 논스키드 클립',10,'생산 중단','243512'),(124,709,'화일보관함 A4(소)',20,'생산','1795971'),(125,709,'멀티 L홀더 A4',10,'생산','1854375'),(126,709,'문화 문서보존용 표지 F298-7 연갈색 A4',100,'생산','331827');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `Suju_No` int NOT NULL AUTO_INCREMENT,
  `emp_no` int NOT NULL,
  `account_no` int NOT NULL,
  `Suju_Date` date DEFAULT NULL,
  `Last_Date` date DEFAULT NULL,
  `Order_Note` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`Suju_No`),
  KEY `emp_no` (`emp_no`),
  KEY `account_no` (`account_no`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `emp` (`EMP_NO`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`account_no`) REFERENCES `accounts` (`account_no`)
) ENGINE=InnoDB AUTO_INCREMENT=10010 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (10001,2201001,1001,'2023-01-04','2023-02-12','이마트 풍산점 모나미 유성펜 0.7mm 5개 알파 언더라인m 형광펜 5색 100개 고로모 탄산분필 백색 110개'),(10002,2201001,1002,'2022-12-21','2023-02-03','이마트 마포점 화신 스테플러 33호 침용 60개 알파 제도샤프 0.5mm 블랙 70개 펜탈 아인슈타인 샤프심 0.5mm 50개'),(10003,2201001,1004,'2022-12-24','2023-01-24','홈플러스 합정점 화일보관함 A4(소) 80개 알파 논스키드 클립 100개 알파 스테플러침 33호 70개'),(10004,2201001,1006,'2022-12-31','2023-02-14','홈플러스 고양터미널점 문화 문서보존용 표지 F298-7 연갈색 A4 100개 알파 언더라인m 형광펜 110개 알파 제도샤프 0.5mm 블랙 140개'),(10005,2201001,1007,'2023-01-03','2023-02-07','모닝글로리 연희점 화신 스테플러 33호 침용 70개 알파 OPP 박스테이프 투명 48mmx40M 60개 바이하츠 점보 칼라클립 40개'),(10006,2201001,1009,'2023-01-01','2023-02-17','모닝글로리 식사점 알파 제도샤프 0.5mm 블랙 100개 파버카스텔 연필 블랙 HB 130개 하고로모 분필케이스 production_orderproduction_order70개'),(10007,2201001,1012,'2022-12-17','2023-01-23','교보문고 광화문점 프랑스 마패드 포커스 컷터칼 60개 바이하츠 점보 칼라클립 70개 하고로모 분필케이스 90개'),(10008,2201001,1013,'2022-12-18','2023-02-01','교보문고 영등포점 알파 언더라인m 형광펜 110개 파버카스텔 TK-Fine Executive 샤프 0.5mm 120개 하고로모 탄산분필 10색 혼합 130개'),(10009,2201001,1020,'2023-01-03','2023-01-17','문구야놀자 문구점 멀티 L홀더 A4 100개 화신 스테플러 33호 침용 70개 동아 샤프 프로매틱 0.5mm 90개');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_detail`
--

DROP TABLE IF EXISTS `orders_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_detail` (
  `Suju_No` int NOT NULL,
  `item_no` int NOT NULL,
  `Suju_Amount` int DEFAULT NULL,
  `balju_no` int DEFAULT NULL,
  PRIMARY KEY (`Suju_No`,`item_no`),
  KEY `item_no` (`item_no`),
  CONSTRAINT `orders_detail_ibfk_1` FOREIGN KEY (`Suju_No`) REFERENCES `orders` (`Suju_No`) ON DELETE CASCADE,
  CONSTRAINT `orders_detail_ibfk_2` FOREIGN KEY (`item_no`) REFERENCES `item` (`item_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_detail`
--

LOCK TABLES `orders_detail` WRITE;
/*!40000 ALTER TABLE `orders_detail` DISABLE KEYS */;
INSERT INTO `orders_detail` VALUES (10001,100,5,NULL),(10001,103,100,NULL),(10001,112,110,NULL),(10002,107,70,10056),(10002,109,50,10057),(10002,116,60,10058),(10003,117,70,NULL),(10003,123,100,NULL),(10003,124,80,NULL),(10004,105,110,NULL),(10004,107,140,10059),(10004,126,100,10063),(10005,116,70,NULL),(10005,118,60,10060),(10005,122,40,NULL),(10006,107,100,NULL),(10006,111,130,NULL),(10006,114,70,NULL),(10007,114,90,NULL),(10007,119,60,NULL),(10007,122,70,NULL),(10008,105,110,NULL),(10008,106,120,10062),(10008,113,130,NULL),(10009,108,90,10055),(10009,116,70,NULL),(10009,125,100,NULL);
/*!40000 ALTER TABLE `orders_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `output`
--

DROP TABLE IF EXISTS `output`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `output` (
  `prod_no` int NOT NULL AUTO_INCREMENT COMMENT 'sequence. = 제조오더번호. AI.',
  `item_no` int NOT NULL,
  `emp_no` int NOT NULL,
  `factory_no` int NOT NULL COMMENT '=입고창고',
  `item_name` varchar(100) DEFAULT NULL,
  `finish_date` datetime DEFAULT NULL COMMENT '=작업완료일?',
  `prod_amount` int DEFAULT NULL COMMENT '생산지시에서 가져옴',
  `poor_quantity` int DEFAULT NULL,
  `yield` float DEFAULT NULL COMMENT '투입 수량 대비 완성된 양품의 비율',
  PRIMARY KEY (`prod_no`),
  KEY `item_no` (`item_no`),
  KEY `emp_no` (`emp_no`),
  KEY `factory_no` (`factory_no`),
  CONSTRAINT `output_ibfk_1` FOREIGN KEY (`item_no`) REFERENCES `item` (`item_no`),
  CONSTRAINT `output_ibfk_2` FOREIGN KEY (`emp_no`) REFERENCES `emp` (`EMP_NO`),
  CONSTRAINT `output_ibfk_3` FOREIGN KEY (`factory_no`) REFERENCES `factory` (`factory_no`)
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `output`
--

LOCK TABLES `output` WRITE;
/*!40000 ALTER TABLE `output` DISABLE KEYS */;
INSERT INTO `output` VALUES (1,100,2201001,701,'모나미 유성펜 0.7mm','2023-01-06 14:08:58',5,0,0),(2,103,2201001,702,'알파 언더라인m 형광펜 5색','2023-01-06 14:08:58',100,0,0),(3,105,2201001,702,'알파 언더라인m 형광펜','2023-01-06 14:08:58',110,0,0),(4,105,2201001,702,'알파 언더라인m 형광펜','2023-01-06 14:08:58',110,0,0),(5,106,2201001,703,'파버카스텔 TK-Fine Executive 샤프 0.5mm','2023-01-06 14:08:58',120,0,0),(6,107,2201001,703,'알파 제도샤프 0.5mm 블랙','2023-01-06 14:08:58',70,0,0),(7,107,2201001,703,'알파 제도샤프 0.5mm 블랙','2023-01-06 14:08:58',140,0,0),(8,107,2201001,703,'알파 제도샤프 0.5mm 블랙','2023-01-06 14:08:58',100,0,0),(9,108,2201001,703,'동아 샤프 프로매틱 0.5mm','2023-01-06 14:08:58',90,0,0),(10,109,2201001,704,'펜탈 아인슈타인 샤프심 0.5mm','2023-01-06 14:08:58',50,0,0),(11,111,2201001,704,'파버카스텔 연필 블랙 HB','2023-01-06 14:08:58',130,0,0),(12,112,2201001,705,'하고로모 탄산분필 백색','2023-01-06 14:08:58',110,0,0),(13,113,2201001,705,'하고로모 탄산분필 10색 혼합','2023-01-06 14:08:58',130,0,0),(14,114,2201001,705,'하고로모 분필케이스','2023-01-06 14:08:58',70,0,0),(15,114,2201001,705,'하고로모 분필케이스','2023-01-06 14:08:58',90,0,0),(16,116,2201001,706,'화신 스테플러 33호 침용','2023-01-06 14:08:58',60,0,0),(17,116,2201001,706,'화신 스테플러 33호 침용','2023-01-06 14:08:58',70,0,0),(18,116,2201001,706,'화신 스테플러 33호 침용','2023-01-06 14:08:58',70,0,0),(19,117,2201001,706,'알파 스테플러침 33호','2023-01-06 14:08:58',70,0,0),(20,118,2201001,707,'알파 OPP 박스테이프 투명 48mmx40M','2023-01-06 14:08:58',60,0,0),(21,119,2201001,707,'프랑스 마패드 포커스 컷터칼','2023-01-06 14:08:58',60,0,0),(22,122,2201001,708,'바이하츠 점보 칼라클립','2023-01-06 14:08:58',40,0,0),(23,122,2201001,708,'바이하츠 점보 칼라클립','2023-01-06 14:08:58',70,0,0),(24,123,2201001,708,'알파 논스키드 클립','2023-01-06 14:08:58',100,0,0),(25,124,2201001,709,'화일보관함 A4(소)','2023-01-06 14:08:58',80,0,0),(26,125,2201001,709,'멀티 L홀더 A4','2023-01-06 14:08:58',100,0,0),(27,126,2201001,709,'문화 문서보존용 표지 F298-7 연갈색 A4','2023-01-06 14:08:58',100,0,0);
/*!40000 ALTER TABLE `output` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posit`
--

DROP TABLE IF EXISTS `posit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posit` (
  `POSIT_NO` int NOT NULL COMMENT '직급 번호',
  `POSIT_NAME` varchar(1000) DEFAULT NULL COMMENT '직급 명',
  PRIMARY KEY (`POSIT_NO`),
  UNIQUE KEY `PK_POSITION` (`POSIT_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posit`
--

LOCK TABLES `posit` WRITE;
/*!40000 ALTER TABLE `posit` DISABLE KEYS */;
INSERT INTO `posit` VALUES (1,'사원'),(2,'계장'),(3,'과장'),(4,'차장'),(5,'부장'),(6,'이사'),(7,'상무'),(8,'사장'),(9,'회장');
/*!40000 ALTER TABLE `posit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `production_order`
--

DROP TABLE IF EXISTS `production_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `production_order` (
  `Suju_No` int NOT NULL AUTO_INCREMENT,
  `item_no` int NOT NULL,
  `emp_no` int NOT NULL,
  `finish_Date` date DEFAULT NULL,
  `Prod_Date` date DEFAULT NULL,
  `Prod_Amount` int DEFAULT NULL COMMENT '= 수주수량',
  `Prod_State` varchar(100) DEFAULT NULL COMMENT '관리자 승인  전, 진행상태표시',
  `Factory_no` int DEFAULT NULL,
  PRIMARY KEY (`Suju_No`,`item_no`),
  KEY `item_no` (`item_no`),
  KEY `emp_no` (`emp_no`),
  CONSTRAINT `production_order_ibfk_1` FOREIGN KEY (`Suju_No`) REFERENCES `orders` (`Suju_No`) ON DELETE CASCADE,
  CONSTRAINT `production_order_ibfk_2` FOREIGN KEY (`item_no`) REFERENCES `item` (`item_no`),
  CONSTRAINT `production_order_ibfk_3` FOREIGN KEY (`emp_no`) REFERENCES `emp` (`EMP_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=10010 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `production_order`
--

LOCK TABLES `production_order` WRITE;
/*!40000 ALTER TABLE `production_order` DISABLE KEYS */;
INSERT INTO `production_order` VALUES (10001,100,2201001,NULL,'2023-01-04',5,'지시 전',701),(10001,103,2201001,NULL,'2023-01-04',100,'지시 전',701),(10001,112,2201001,NULL,'2023-01-04',110,'지시 전',705),(10002,107,2201001,'2023-01-04','2022-12-21',70,'생산완료',703),(10002,109,2201001,'2023-01-04','2022-12-21',50,'생산완료',704),(10002,116,2201001,'2023-01-04','2022-12-21',60,'생산완료',706),(10003,117,2201001,NULL,'2022-12-24',70,'지시 전',706),(10003,123,2201001,NULL,'2022-12-24',100,'지시 전',708),(10003,124,2201001,NULL,'2022-12-24',80,'지시 전',709),(10004,105,2201001,NULL,'2022-12-31',110,'지시 전',702),(10004,107,2201001,'2023-01-04','2022-12-31',140,'생산완료',703),(10004,126,2201001,'2023-01-04','2022-12-31',100,'생산완료',709),(10005,116,2201001,NULL,'2023-01-03',80,'지시 전',706),(10005,118,2201001,'2023-01-04','2023-01-03',60,'생산완료',707),(10005,122,2201001,NULL,'2023-01-03',120,'지시 전',708),(10006,107,2201001,NULL,'2023-01-01',100,'지시 전',703),(10006,111,2201001,NULL,'2023-01-01',130,'지시 전',704),(10006,114,2201001,NULL,'2023-01-01',123,'지시 전',705),(10007,114,2201001,NULL,'2022-12-17',133,'지시 전',705),(10007,119,2201001,'2023-01-19','2022-12-17',333,'생산완료',707),(10007,122,2201001,'2023-01-19','2022-12-17',265,'생산완료',708),(10008,105,2201001,NULL,'2022-12-18',555,'지시 전',702),(10008,106,2201001,'2023-01-04','2022-12-18',120,'생산완료',703),(10008,113,2201001,NULL,'2022-12-18',111,'지시 전',705),(10009,108,2201001,'2023-01-04','2023-01-03',90,'지시 전',703),(10009,116,2201001,NULL,'2023-01-03',100,'지시 전',706),(10009,125,2201001,NULL,'2023-01-03',100,'지시 전',709);
/*!40000 ALTER TABLE `production_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storages`
--

DROP TABLE IF EXISTS `storages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storages` (
  `factory_no` int NOT NULL,
  `item_no` int NOT NULL,
  `stock_count` int DEFAULT NULL,
  PRIMARY KEY (`factory_no`,`item_no`),
  KEY `item_no` (`item_no`),
  CONSTRAINT `storages_ibfk_1` FOREIGN KEY (`factory_no`) REFERENCES `factory` (`factory_no`),
  CONSTRAINT `storages_ibfk_2` FOREIGN KEY (`item_no`) REFERENCES `item` (`item_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storages`
--

LOCK TABLES `storages` WRITE;
/*!40000 ALTER TABLE `storages` DISABLE KEYS */;
INSERT INTO `storages` VALUES (701,100,500),(701,101,500),(701,102,498),(702,103,500),(702,104,500),(702,105,500),(703,106,380),(703,107,290),(703,108,410),(704,109,450),(704,110,500),(704,111,500),(705,112,500),(705,113,500),(705,114,500),(706,115,500),(706,116,440),(706,117,500),(707,118,440),(707,119,500),(707,120,500),(708,121,500),(708,122,500),(708,123,500),(709,124,500),(709,125,490),(709,126,400);
/*!40000 ALTER TABLE `storages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subul`
--

DROP TABLE IF EXISTS `subul`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subul` (
  `subul_num` int NOT NULL AUTO_INCREMENT COMMENT 'auto_increment',
  `item_no` int NOT NULL,
  `emp_no` int NOT NULL,
  `serial_no` int DEFAULT NULL,
  `subul_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `amount` int DEFAULT NULL,
  `gubun` varchar(50) DEFAULT NULL COMMENT '생산, 출하, 불량, 실사재고, 실사누락, 임시실사',
  `subul_note` varchar(50) DEFAULT NULL,
  `db_amount` int DEFAULT NULL,
  PRIMARY KEY (`subul_num`),
  KEY `item_no` (`item_no`),
  KEY `emp_no` (`emp_no`),
  CONSTRAINT `subul_ibfk_1` FOREIGN KEY (`item_no`) REFERENCES `item` (`item_no`),
  CONSTRAINT `subul_ibfk_2` FOREIGN KEY (`emp_no`) REFERENCES `emp` (`EMP_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=10067 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subul`
--

LOCK TABLES `subul` WRITE;
/*!40000 ALTER TABLE `subul` DISABLE KEYS */;
INSERT INTO `subul` VALUES (10001,100,2201001,1,'2023-01-06 14:08:58',5,'입고','',0),(10002,103,2201001,2,'2023-01-06 14:08:58',100,'입고','',0),(10003,105,2201001,3,'2023-01-06 14:08:58',110,'입고','',0),(10004,105,2201001,4,'2023-01-06 14:08:58',110,'입고','',110),(10005,106,2201001,5,'2023-01-06 14:08:58',120,'입고','',0),(10006,107,2201001,6,'2023-01-06 14:08:58',70,'입고','',0),(10007,107,2201001,7,'2023-01-06 14:08:58',140,'입고','',70),(10008,107,2201001,8,'2023-01-06 14:08:58',100,'입고','',210),(10009,108,2201001,9,'2023-01-06 14:08:58',90,'입고','',0),(10010,109,2201001,10,'2023-01-06 14:08:58',50,'입고','',0),(10011,111,2201001,11,'2023-01-06 14:08:58',130,'입고','',0),(10012,112,2201001,12,'2023-01-06 14:08:58',110,'입고','',0),(10013,113,2201001,13,'2023-01-06 14:08:58',130,'입고','',0),(10014,114,2201001,14,'2023-01-06 14:08:58',70,'입고','',0),(10015,114,2201001,15,'2023-01-06 14:08:58',90,'입고','',70),(10016,116,2201001,16,'2023-01-06 14:08:58',60,'입고','',0),(10017,116,2201001,17,'2023-01-06 14:08:58',70,'입고','',60),(10018,116,2201001,18,'2023-01-06 14:08:58',70,'입고','',130),(10019,117,2201001,19,'2023-01-06 14:08:58',70,'입고','',0),(10020,118,2201001,20,'2023-01-06 14:08:58',60,'입고','',0),(10021,119,2201001,21,'2023-01-06 14:08:58',60,'입고','',0),(10022,122,2201001,22,'2023-01-06 14:08:58',40,'입고','',0),(10023,122,2201001,23,'2023-01-06 14:08:58',70,'입고','',40),(10024,123,2201001,24,'2023-01-06 14:08:58',100,'입고','',0),(10025,124,2201001,25,'2023-01-06 14:08:58',80,'입고','',0),(10026,125,2201001,26,'2023-01-06 14:08:58',100,'입고','',0),(10027,126,2201001,27,'2023-01-06 14:08:58',100,'입고','',0),(10028,100,2201001,0,'2023-01-05 17:58:00',500,'재고실사','기초 재고실사',5),(10029,101,2201001,0,'2023-01-05 17:58:00',500,'재고실사','기초 재고실사',500),(10030,102,2201001,0,'2023-01-05 17:58:00',500,'재고실사','기초 재고실사',500),(10031,103,2201001,0,'2023-01-05 17:58:00',500,'재고실사','기초 재고실사',100),(10032,104,2201001,0,'2023-01-05 17:58:00',500,'재고실사','기초 재고실사',500),(10033,105,2201001,0,'2023-01-05 17:58:00',500,'재고실사','기초 재고실사',220),(10034,106,2201001,0,'2023-01-05 17:58:00',500,'재고실사','기초 재고실사',120),(10035,107,2201001,0,'2023-01-05 17:58:00',500,'재고실사','기초 재고실사',310),(10036,108,2201001,0,'2023-01-05 17:58:00',500,'재고실사','기초 재고실사',90),(10037,109,2201001,0,'2023-01-05 17:58:00',500,'재고실사','기초 재고실사',50),(10038,110,2201001,0,'2023-01-05 17:58:00',500,'재고실사','기초 재고실사',500),(10039,111,2201001,0,'2023-01-05 17:58:00',500,'재고실사','기초 재고실사',130),(10040,112,2201001,0,'2023-01-05 17:58:00',500,'재고실사','기초 재고실사',110),(10041,113,2201001,0,'2023-01-05 17:58:00',500,'재고실사','기초 재고실사',130),(10042,114,2201001,0,'2023-01-05 17:58:00',500,'재고실사','기초 재고실사',160),(10043,115,2201001,0,'2023-01-05 17:58:00',500,'재고실사','기초 재고실사',500),(10044,116,2201001,0,'2023-01-05 17:58:00',500,'재고실사','기초 재고실사',200),(10045,117,2201001,0,'2023-01-05 17:58:00',500,'재고실사','기초 재고실사',70),(10046,118,2201001,0,'2023-01-05 17:58:00',500,'재고실사','기초 재고실사',60),(10047,119,2201001,0,'2023-01-05 17:58:00',500,'재고실사','기초 재고실사',60),(10048,120,2201001,0,'2023-01-05 17:58:00',500,'재고실사','기초 재고실사',500),(10049,121,2201001,0,'2023-01-05 17:58:00',500,'재고실사','기초 재고실사',500),(10050,122,2201001,0,'2023-01-05 17:58:00',500,'재고실사','기초 재고실사',110),(10051,123,2201001,0,'2023-01-05 17:58:00',500,'재고실사','기초 재고실사',100),(10052,124,2201001,0,'2023-01-05 17:58:00',500,'재고실사','기초 재고실사',80),(10053,125,2201001,0,'2023-01-05 17:58:00',500,'재고실사','기초 재고실사',100),(10054,126,2201001,0,'2023-01-09 16:06:34',500,'재고실사','기초 재고실사',100),(10055,108,2201001,10009,'2023-01-10 15:33:42',90,'출하','기초출하',500),(10056,107,2201001,10002,'2023-01-12 10:44:00',70,'출하','',500),(10057,109,2201001,10002,'2023-01-12 10:46:56',50,'출하','',500),(10058,116,2201001,10002,'2023-01-12 10:48:15',60,'출하','',500),(10059,107,2201001,10004,'2023-01-12 10:51:11',140,'출하','',430),(10060,118,2201001,10005,'2023-01-12 14:00:50',60,'출하','',500),(10061,103,2201001,0,'2023-01-13 09:14:53',498,'재고실사','',500),(10062,106,2201001,10008,'2023-01-16 12:06:09',120,'출하','',500),(10063,126,2201001,10004,'2023-01-17 09:42:18',100,'출하','',500),(10064,110,2303001,NULL,'2023-01-20 10:42:03',495,'임시실사','불량재고 제거',500),(10065,116,2303001,NULL,'2023-01-20 10:42:30',450,'임시실사','재고수정',440),(10066,125,2201001,NULL,'2023-01-25 08:55:11',490,'재고실사','재고누락',500);
/*!40000 ALTER TABLE `subul` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mungudb'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `updateAccState` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`mungu`@`%`*/ /*!50106 EVENT `updateAccState` ON SCHEDULE EVERY 1 DAY STARTS '2023-01-10 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO update accounts set acc_state = 1 where date(acc_enddate) < date(sysdate()) */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `updateAccState0` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`mungu`@`%`*/ /*!50106 EVENT `updateAccState0` ON SCHEDULE EVERY 1 DAY STARTS '2023-01-10 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO update accounts set acc_state = 0 where date(acc_enddate) > date(sysdate()) */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'mungudb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-25  8:56:42
