CREATE DATABASE  IF NOT EXISTS `lingospeak` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `lingospeak`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: lingospeak
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `sentences`
--

DROP TABLE IF EXISTS `sentences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sentences` (
  `SentenceId` int NOT NULL AUTO_INCREMENT,
  `English` varchar(1000) NOT NULL,
  `Vietnamese` varchar(1000) NOT NULL,
  `Grade` int DEFAULT NULL,
  `Unit` int DEFAULT NULL,
  `Cefr_tags` varchar(500) DEFAULT NULL,
  `Domain_tags` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`SentenceId`),
  UNIQUE KEY `SentenceId` (`SentenceId`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sentences`
--

LOCK TABLES `sentences` WRITE;
/*!40000 ALTER TABLE `sentences` DISABLE KEYS */;
INSERT INTO `sentences` VALUES (1,'How are you','Bạn khỏe không',NULL,NULL,'A1','greeting'),(2,'Hello everyone','Xin chào mọi người',NULL,NULL,'A1','greeting'),(3,'Hello everyone','Xin chào mọi người',NULL,NULL,'A1','greeting'),(4,'How are you?','Bạn khỏe không?',NULL,NULL,'A2','greeting'),(5,'What is your name?','Bạn tên là gì?',NULL,NULL,'A1','personal information'),(6,'Where are you from?','Bạn đến từ đâu?',NULL,NULL,'A2','personal information'),(7,'What time is it?','Bây giờ là mấy giờ?',NULL,NULL,'A1','time'),(8,'How do you say \"thank you\" in Vietnamese?','Bạn nói \"cảm ơn\" bằng tiếng Việt như thế nào?',NULL,NULL,'A1','language learning'),(9,'What is your favorite food?','Món ăn yêu thích của bạn là gì?',NULL,NULL,'A2','food'),(10,'Can you help me?','Bạn có thể giúp tôi được không?',NULL,NULL,'A2','communication'),(11,'Where is the nearest hospital?','Bệnh viện gần nhất ở đâu?',NULL,NULL,'A2','directions'),(12,'What are your hobbies?','Sở thích của bạn là gì?',NULL,NULL,'A2','personal interests'),(13,'What is your favorite movie?','Phim yêu thích của bạn là gì?',NULL,NULL,'B1','movies'),(14,'Tell me about your last vacation.','Kể cho tôi về kỳ nghỉ gần nhất của bạn.',NULL,NULL,'B1','travel'),(15,'What are the benefits of exercising regularly?','Lợi ích của việc tập thể dục đều đặn là gì?',NULL,NULL,'B1','health'),(16,'What are some environmental issues facing the world today?','Các vấn đề môi trường đang đối diện với thế giới ngày nay là gì?',NULL,NULL,'B2','environment'),(17,'How does climate change affect wildlife?','Biến đổi khí hậu ảnh hưởng như thế nào đến động vật hoang dã?',NULL,NULL,'B2','environment'),(18,'What are the steps to start a small business?','Những bước để bắt đầu một doanh nghiệp nhỏ là gì?',NULL,NULL,'B1','business'),(19,'Can you explain the concept of supply and demand?','Bạn có thể giải thích khái niệm cung cầu được không?',NULL,NULL,'B1','economics'),(20,'What are some strategies for effective time management?','Có những chiến lược nào để quản lý thời gian hiệu quả?',NULL,NULL,'B2','productivity'),(21,'How does social media impact society?','Mạng xã hội ảnh hưởng như thế nào đến xã hội?',NULL,NULL,'B2','social media'),(22,'What are the causes and consequences of deforestation?','Nguyên nhân và hậu quả của sự phá rừng là gì?',NULL,NULL,'B2','environment'),(23,'What are some effective study techniques?','Có những kỹ thuật học hiệu quả nào?',NULL,NULL,'B1','education'),(24,'Discuss the pros and cons of renewable energy sources.','Thảo luận về ưu và nhược điểm của các nguồn năng lượng tái tạo.',NULL,NULL,'B2','energy'),(25,'What are the ethical implications of genetic engineering?','Có những hệ quả đạo đức nào của kỹ thuật di truyền?',NULL,NULL,'B2','science'),(26,'Explain the concept of cultural diversity.','Giải thích khái niệm đa dạng văn hóa.',NULL,NULL,'B1','culture'),(27,'How does globalization affect local economies?','Toàn cầu hóa ảnh hưởng như thế nào đến nền kinh tế địa phương?',NULL,NULL,'B2','economics'),(28,'What are the advantages and disadvantages of online shopping?','Những lợi ích và hạn chế của mua sắm trực tuyến là gì?',NULL,NULL,'B2','shopping'),(29,'Discuss the impact of social media on society.','Thảo luận về tác động của mạng xã hội đối với xã hội.',NULL,NULL,'B2','social media'),(30,'How does stress affect mental health?','Stress ảnh hưởng như thế nào đến sức khỏe tâm lý?',NULL,NULL,'B2','mental health'),(31,'What are the steps to prepare for a job interview?','Những bước chuẩn bị cho cuộc phỏng vấn công việc là gì?',NULL,NULL,'B1','career'),(32,'Discuss the impact of technology on education.','Thảo luận về tác động của công nghệ vào giáo dục.',NULL,NULL,'B2','education'),(33,'What are the causes and consequences of air pollution?','Nguyên nhân và hậu quả của ô nhiễm không khí là gì?',NULL,NULL,'B2','environment'),(34,'How does advertising influence consumer behavior?','Quảng cáo ảnh hưởng như thế nào đến hành vi tiêu dùng?',NULL,NULL,'B2','marketing'),(35,'What are the benefits of learning a second language?','Lợi ích của việc học một ngôn ngữ thứ hai là gì?',NULL,NULL,'B1','language learning'),(36,'Discuss the impact of social media on youth.','Thảo luận về tác động của mạng xã hội đối với thanh thiếu niên.',NULL,NULL,'B2','social media'),(37,'What are the effects of climate change on agriculture?','Hiệu ứng của biến đổi khí hậu đối với nông nghiệp là gì?',NULL,NULL,'B2','environment'),(38,'How does globalization affect cultural diversity?','Toàn cầu hóa ảnh hưởng như thế nào đến đa dạng văn hóa?',NULL,NULL,'B2','culture'),(39,'Discuss the pros and cons of renewable energy sources.','Thảo luận về ưu điểm và nhược điểm của các nguồn năng lượng tái tạo.',NULL,NULL,'B2','energy'),(40,'What are the ethical implications of genetic engineering?','Hệ quả đạo đức của kỹ thuật di truyền là gì?',NULL,NULL,'B2','science'),(41,'How does social media impact interpersonal relationships?','Mạng xã hội ảnh hưởng như thế nào đến mối quan hệ cá nhân?',NULL,NULL,'B2','social media'),(42,'What is your name?','Bạn tên là gì?',NULL,NULL,'A1','personal information'),(43,'How old are you?','Bạn bao nhiêu tuổi?',NULL,NULL,'A1','personal information'),(44,'Where are you from?','Bạn đến từ đâu?',NULL,NULL,'A1','personal information'),(45,'What is your favorite color?','Màu sắc yêu thích của bạn là gì?',NULL,NULL,'A1','personal preferences'),(46,'Do you have any siblings?','Bạn có anh chị em ruột không?',NULL,NULL,'A1','family'),(47,'What is your favorite food?','Món ăn yêu thích của bạn là gì?',NULL,NULL,'A1','food'),(48,'What time is it?','Bây giờ là mấy giờ?',NULL,NULL,'A1','time'),(49,'Where do you live?','Bạn sống ở đâu?',NULL,NULL,'A1','personal information'),(50,'Do you like to read?','Bạn có thích đọc sách không?',NULL,NULL,'A1','hobbies'),(51,'What is your favorite animal?','Động vật yêu thích của bạn là gì?',NULL,NULL,'A1','animals'),(52,'What is your favorite movie?','Bộ phim yêu thích của bạn là gì?',NULL,NULL,'A2','movies'),(53,'Tell me about your hometown.','Kể cho tôi về quê hương của bạn.',NULL,NULL,'A2','travel'),(54,'What do you do in your free time?','Bạn làm gì trong thời gian rảnh của mình?',NULL,NULL,'A2','hobbies'),(55,'Describe your best friend.','Miêu tả người bạn thân nhất của bạn.',NULL,NULL,'A2','relationships'),(56,'What is your dream job?','Công việc mơ ước của bạn là gì?',NULL,NULL,'A2','career'),(57,'Tell me about a memorable trip you have taken.','Kể cho tôi về một chuyến đi đáng nhớ mà bạn đã trải qua.',NULL,NULL,'A2','travel'),(58,'Do you prefer city life or country life?','Bạn thích cuộc sống thành phố hay cuộc sống nông thôn hơn?',NULL,NULL,'A2','lifestyle'),(59,'What is your favorite type of music?','Thể loại nhạc yêu thích của bạn là gì?',NULL,NULL,'A2','music'),(60,'Do you enjoy playing sports?','Bạn có thích chơi thể thao không?',NULL,NULL,'A2','sports'),(61,'What are your future goals?','Mục tiêu tương lai của bạn là gì?',NULL,NULL,'A2','personal development');
/*!40000 ALTER TABLE `sentences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test` (
  `TestId` int NOT NULL AUTO_INCREMENT,
  `UserId` int NOT NULL,
  `Timestamp` datetime NOT NULL,
  `PracticedPhrases` varchar(1000) DEFAULT NULL,
  `Score` double(5,3) DEFAULT NULL,
  `WordMissed` varchar(1000) DEFAULT NULL,
  UNIQUE KEY `TestId` (`TestId`),
  KEY `fk_test_user` (`UserId`),
  CONSTRAINT `fk_test_user` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,1,'2023-04-29 23:49:02','b1',0.814,'Phát âm'),(2,1,'2023-04-29 23:49:06','b1',0.814,'Phát âm'),(3,3,'2023-05-04 14:32:24','b1',0.966,'Phát âm'),(4,3,'2023-05-04 14:54:39','a2',0.230,'Phát âm'),(5,3,'2023-05-04 16:43:38','a1',1.394,'Phát âm'),(6,3,'2023-05-04 16:46:55','a1',1.966,'Phát âm'),(7,3,'2023-05-04 16:52:18','a1',1.466,'Phát âm'),(8,3,'2023-05-04 16:53:20','a1',1.966,'Dịch nghĩa'),(9,3,'2023-05-04 16:55:04','a1',1.966,'Phát âm'),(10,3,'2023-05-05 15:39:17','a1',0.000,'Phát âm'),(11,3,'2023-05-06 01:28:31','a1',0.000,'Phát âm'),(12,3,'2023-05-06 01:29:52','a1',0.000,'Phát âm'),(13,3,'2023-05-06 01:30:30','a1',0.000,'Phát âm'),(14,3,'2023-05-06 01:45:55','a1',0.696,'Phát âm'),(15,3,'2023-05-06 01:52:13','a1',0.000,'Phát âm'),(16,3,'2023-05-06 01:54:14','a1',1.931,'Phát âm'),(17,3,'2023-05-06 01:54:55','a1',1.366,'Phát âm'),(18,3,'2023-05-06 01:55:17','a1',1.366,'Phát âm'),(19,3,'2023-05-06 02:04:59','a1',3.731,'Phát âm'),(20,3,'2023-05-06 02:05:03','a1',3.731,'Phát âm'),(21,3,'2023-05-06 02:07:01','a1',0.000,'Phát âm'),(22,3,'2023-05-06 02:08:07','a1',2.897,'Phát âm'),(23,3,'2023-05-06 02:08:34','a1',4.897,'Phát âm'),(24,3,'2023-05-06 02:08:53','a1',4.897,'Phát âm'),(25,3,'2023-05-06 02:18:28','a1',0.000,'Phát âm');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserId` int NOT NULL AUTO_INCREMENT,
  `UserName` varchar(50) NOT NULL,
  `PassWord` varchar(100) NOT NULL,
  `Gender` enum('MALE','FEMALE') NOT NULL,
  `Birthday` date DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Bio` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`UserName`),
  UNIQUE KEY `UserId` (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (7,'David Johnson','secure789','MALE','1995-09-25','davidjohnson@example.com','5555555555','Nice to meet you!'),(8,'Emily Davis','mypassword','FEMALE','1992-07-10','emilydavis@example.com','7777777777','I love traveling.'),(19,'Hoàng Văn Dũng','pass1234','MALE','1994-05-05','hoangvane@example.com','9999999999','Cuộc sống là một hành trình.'),(6,'Jane Smith','secret456','FEMALE','1988-12-01','janesmith@example.com','9876543210','Hello, I am Jane Smith.'),(10,'Jessica Brown','password987','FEMALE','1994-11-18','jessicabrown@example.com','4444444444','Be yourself.'),(5,'John Doe','password123','MALE','1990-05-15','johndoe@example.com','1234567890','I am John Doe.'),(23,'Lê Ngọc Tiến','password567','MALE','1989-09-09','levani@example.com','6666666666','Không bao giờ từ bỏ.'),(17,'Lê Văn Chính','secure789','MALE','1992-03-03','levanc@example.com','5555555555','Rất vui được gặp bạn!'),(9,'Michael Wilson','pass1234','MALE','1985-03-08','michaelwilson@example.com','9999999999','Life is a journey.'),(20,'Nguyễn Hoàng Hà','password987','FEMALE','1990-06-06','nguyenthif@example.com','4444444444','Hãy luôn là chính mình.'),(24,'Nguyễn Thị Kim Ngân','mypassword123','FEMALE','1991-10-10','nguyenthik@example.com','1111111111','Hãy cười thường xuyên.'),(1,'Nguyen Trong Tue','123456','MALE','2002-01-06','','',''),(15,'Nguyễn Văn Vũ','123456','MALE','2000-01-01','nguyenvana@example.com','1234567890','Xin chào, tôi là Nguyễn Văn A.'),(4,'Nguyễn Việt Sơn','123456','MALE','2002-10-20','son@gmail.com','097712345',''),(14,'Olivia Clark','mypassword123','FEMALE','1987-04-05','oliviaclark@example.com','1111111111','Smile often.'),(18,'Phạm Thị Duyên','mypassword','FEMALE','1988-04-04','phamthid@example.com','7777777777','Tôi yêu du lịch.'),(11,'Robert Taylor','securepass','MALE','1998-02-28','roberttaylor@example.com','2222222222','Stay positive.'),(12,'Sophia Anderson','mysecret','FEMALE','1991-09-12','sophiaanderson@example.com','8888888888','Dream big.'),(22,'Trần Thị Hải','mysecret','FEMALE','1993-08-08','tranthih@example.com','8888888888','Hãy mơ một cách lớn lao.'),(16,'Trần Thị Tâm','secret456','FEMALE','1995-02-02','tranthib@example.com','9876543210','Chào bạn, tôi là Trần Thị B.'),(3,'Trong Nguyen','123456','MALE','2002-06-01','','',''),(21,'Vũ Văn Giang','securepass','MALE','1986-07-07','vuvang@example.com','2222222222','Hãy giữ tinh thần tích cực.'),(13,'William Martinez','password567','MALE','1993-06-20','williammartinez@example.com','6666666666','Never give up.');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `word`
--

DROP TABLE IF EXISTS `word`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `word` (
  `WordId` int NOT NULL AUTO_INCREMENT,
  `English` varchar(500) NOT NULL,
  `Vietnamese` varchar(500) NOT NULL,
  `Pronunciation` varchar(500) NOT NULL,
  `UseFrequency` varchar(500) DEFAULT NULL,
  `Tags` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`WordId`),
  UNIQUE KEY `WordId` (`WordId`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `word`
--

LOCK TABLES `word` WRITE;
/*!40000 ALTER TABLE `word` DISABLE KEYS */;
INSERT INTO `word` VALUES (4,'simple','đơn giản','/ˈsɪm.pəl/',NULL,NULL),(5,'example','ví dụ','/ɪɡˈzæmpəl/',NULL,NULL),(6,'simple','đơn giản','/ˈsɪm.pəl/',NULL,NULL),(7,'beautiful','xinh đẹp','/ˈbjuː.tɪ.fəl/',NULL,NULL),(8,'happy','vui mừng','/ˈhæp.i/',NULL,NULL),(9,'friend','bạn bè','/frend/',NULL,NULL),(10,'cat','mèo','/kæt/',NULL,NULL),(11,'dog','chó','/dɔːɡ/',NULL,NULL),(12,'book','sách','/bʊk/',NULL,NULL),(13,'computer','máy tính','/kəmˈpjuː.tər/',NULL,NULL),(14,'eat','ăn','/iːt/',NULL,NULL),(15,'drink','uống','/drɪŋk/',NULL,NULL),(16,'sleep','ngủ','/sliːp/',NULL,NULL),(17,'run','chạy','/rʌn/',NULL,NULL),(18,'jump','nhảy','/dʒʌmp/',NULL,NULL),(19,'learn','học','/lɜːrn/',NULL,NULL),(20,'write','viết','/raɪt/',NULL,NULL),(21,'listen','nghe','/ˈlɪs.ən/',NULL,NULL),(22,'speak','nói','/spiːk/',NULL,NULL),(23,'watch','xem','/wɑːtʃ/',NULL,NULL),(24,'house','nhà','/haʊs/',NULL,NULL),(25,'car','xe ô tô','/kɑːr/',NULL,NULL),(26,'school','trường học','/skuːl/',NULL,NULL),(27,'family','gia đình','/ˈfæm.əl.i/',NULL,NULL),(28,'friendship','tình bạn','/ˈfrend.ʃɪp/',NULL,NULL),(29,'music','nhạc','/ˈmjuː.zɪk/',NULL,NULL),(30,'food','thức ăn','/fuːd/',NULL,NULL),(31,'water','nước','/ˈwɔː.tər/',NULL,NULL),(32,'sun','mặt trời','/sʌn/',NULL,NULL),(33,'moon','mặt trăng','/muːn/',NULL,NULL),(34,'star','ngôi sao','/stɑːr/',NULL,NULL),(35,'tree','cây','/triː/',NULL,NULL),(36,'flower','hoa','/ˈflaʊ.ər/',NULL,NULL),(37,'book','sách','/bʊk/',NULL,NULL),(38,'pen','bút','/pɛn/',NULL,NULL),(39,'pencil','bút chì','/ˈpɛn.səl/',NULL,NULL),(40,'computer','máy tính','/kəmˈpjuː.tər/',NULL,NULL),(41,'phone','điện thoại','/foʊn/',NULL,NULL),(42,'table','bàn','/ˈteɪ.bəl/',NULL,NULL),(43,'chair','ghế','/tʃɛr/',NULL,NULL),(44,'city','thành phố','/ˈsɪti/',NULL,NULL),(45,'country','quốc gia','/ˈkʌn.tri/',NULL,NULL),(46,'friend','bạn bè','/frend/',NULL,NULL),(47,'teacher','giáo viên','/ˈtiː.tʃər/',NULL,NULL),(48,'student','học sinh','/ˈstuː.dənt/',NULL,NULL),(49,'computer','máy tính','/kəmˈpjuː.tər/',NULL,NULL),(50,'phone','điện thoại','/foʊn/',NULL,NULL),(51,'table','bàn','/ˈteɪ.bəl/',NULL,NULL),(52,'chair','ghế','/tʃɛr/',NULL,NULL),(53,'car','xe hơi','/kɑːr/',NULL,NULL),(54,'book','sách','/bʊk/',NULL,NULL),(55,'pen','bút mực','/pɛn/',NULL,NULL),(56,'pencil','bút chì','/ˈpɛn.səl/',NULL,NULL),(57,'school','trường học','/skuːl/',NULL,NULL),(58,'dog','chó','/dɔːɡ/',NULL,NULL),(59,'cat','mèo','/kæt/',NULL,NULL),(60,'music','nhạc','/ˈmjuː.zɪk/',NULL,NULL),(61,'friendship','tình bạn','/ˈfrend.ʃɪp/',NULL,NULL),(62,'water','nước','/ˈwɔː.tər/',NULL,NULL),(63,'sun','mặt trời','/sʌn/',NULL,NULL),(64,'moon','mặt trăng','/muːn/',NULL,NULL),(65,'star','ngôi sao','/stɑːr/',NULL,NULL),(66,'tree','cây','/triː/',NULL,NULL),(67,'flower','hoa','/ˈflaʊ.ər/',NULL,NULL),(68,'meticulous','cẩn thận tỉ mỉ','/məˈtɪkjʊləs/',NULL,NULL),(69,'ubiquitous','phổ biến','/juːˈbɪkwɪtəs/',NULL,NULL),(70,'exquisite','tinh xảo','/ɪkˈskwɪzɪt/',NULL,NULL),(71,'enigma','động từ','/ɪˈnɪɡmə/',NULL,NULL),(72,'perplexing','gây khó hiểu','/pərˈplɛksɪŋ/',NULL,NULL),(73,'myriad','vô số','/ˈmɪriəd/',NULL,NULL),(74,'benevolent','nhân từ','/bəˈnɛvələnt/',NULL,NULL),(75,'resilient','kiên cường','/rɪˈzɪljənt/',NULL,NULL),(76,'ephemeral','ngắn ngủi','/ɪˈfɛmərəl/',NULL,NULL),(77,'serendipity','may mắn tình cờ','/ˌsɛrənˈdɪpɪti/',NULL,NULL),(78,'vicarious','chung thủy','/vaɪˈkɛriəs/',NULL,NULL),(79,'esoteric','huyền bí','/ˌiːsəˈtɛrɪk/',NULL,NULL),(80,'ambivalent','lưỡng cảm','/æmˈbɪvələnt/',NULL,NULL),(81,'melancholy','buồn bã','/ˈmɛlənˌkɑːli/',NULL,NULL),(82,'quintessential','bản chất','/ˌkwɪntɪˈsɛnʃəl/',NULL,NULL),(83,'cacophony','âm thanh không hài hòa','/kəˈkɒfəni/',NULL,NULL),(84,'reverie','mộng mơ','/ˈrɛvəri/',NULL,NULL),(85,'innocuous','vô hại','/ɪˈnɒkjuəs/',NULL,NULL),(86,'juxtaposition','đối lập','/ˌdʒʌkstəpəˈzɪʃən/',NULL,NULL),(87,'phenomenon','hiện tượng','/fɪˈnɒmɪnən/',NULL,NULL),(88,'surreptitious','lén lút','/ˌsʌrəpˈtɪʃəs/',NULL,NULL),(89,'alacrity','sự nhanh nhẹn','/əˈlæk.rə.ti/',NULL,NULL),(90,'exacerbate','làm trầm trọng thêm','/ɪɡˈzæs.ər.beɪt/',NULL,NULL),(91,'gregarious','thân thiện','/ɡrɪˈɡeəriəs/',NULL,NULL),(92,'infinitesimal','rất nhỏ','/ˌɪn.fɪ.nɪˈtes.ə.məl/',NULL,NULL),(93,'obfuscate','làm mờ mịt','/ˈɒb.fʌs.keɪt/',NULL,NULL),(94,'quixotic','không thực tế','/kwɪkˈsɒt.ɪk/',NULL,NULL),(95,'vexatious','gây phiền phức','/vɛkˈseɪ.ʃəs/',NULL,NULL),(96,'zealous','nhiệt tình','/ˈzɛl.əs/',NULL,NULL),(97,'cogent','thuyết phục','/ˈkəʊ.dʒənt/',NULL,NULL),(98,'deleterious','có hại','/ˌdɛl.ɪˈtɪə.ri.əs/',NULL,NULL),(99,'egalitarian','bình đẳng','/ɪˌɡæl.ɪˈter.i.ən/',NULL,NULL),(100,'fractious','hay gắt','/ˈfræk.ʃəs/',NULL,NULL),(101,'inexorable','không thể ngăn cản','/ɪˈnɛk.sər.ə.bl̩/',NULL,NULL),(102,'malevolent','ác ý','/məˈlɛv.ə.lənt/',NULL,NULL),(103,'nefarious','xấu xa','/nɪˈfeə.ri.əs/',NULL,NULL),(104,'parsimonious','keo kiệt','/ˌpɑː.sɪˈmoʊ.ni.əs/',NULL,NULL),(105,'querulous','hay oán trách','/ˈkwɛr.ə.ləs/',NULL,NULL),(106,'rancorous','ánh thù','/ˈræŋ.kər.əs/',NULL,NULL),(107,'sycophant','người vị thành niên','/ˈsɪk.ə.fənt/',NULL,NULL),(108,'taciturn','lắm im lặng','/ˈtæs.ɪ.tɜːrn/',NULL,NULL),(109,'ubiquitous','phổ biến','/juːˈbɪk.wə.təs/',NULL,NULL),(110,'vacillate','lưỡng lự','/ˈvæs',NULL,NULL);
/*!40000 ALTER TABLE `word` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'lingospeak'
--

--
-- Dumping routines for database 'lingospeak'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-18 23:40:34
