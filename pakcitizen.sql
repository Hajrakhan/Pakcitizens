-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 09, 2021 at 01:30 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pakcitizen`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryID` int(11) NOT NULL,
  `categoryName` varchar(30) NOT NULL,
  `categoryPosts` int(11) NOT NULL,
  `catImage` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryID`, `categoryName`, `categoryPosts`, `catImage`) VALUES
(1, 'SPORTS', 1, 'Sports.jpg'),
(3, 'TECHNOLOGY', 1, 'Technology.jpg'),
(6, 'Entertainment', 1, 'Entertainment.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `des`
--

CREATE TABLE `des` (
  `desID` int(11) NOT NULL,
  `postid` int(11) NOT NULL,
  `heading` varchar(300) DEFAULT NULL,
  `desImage` varchar(50) DEFAULT NULL,
  `descrip` varchar(2000) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `postID` int(11) NOT NULL,
  `postTitle` varchar(80) NOT NULL,
  `postDescription` mediumtext NOT NULL,
  `postCategory` int(11) NOT NULL,
  `postAuthor` int(11) NOT NULL,
  `postDate` varchar(30) NOT NULL,
  `postimage` varchar(30) DEFAULT NULL,
  `slider` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`postID`, `postTitle`, `postDescription`, `postCategory`, `postAuthor`, `postDate`, `postimage`, `slider`) VALUES
(21, '5 Technology Trends You Need to Know to Work in Any Industry', 'If you\'ve been following the news on exciting tech trends like artificial intelligence, then you\'re probably aware that emerging technologies are changing the way we work and interact with others. In fact, with things like machine learning and touch commerce becoming increasingly popular across every industry from banking to healthcare, technology is revolutionising the way we do business and making high-tech approaches an integral part of our lives.\n<br><br>\nHere are the top five technology trends you need to know to work in any industry.\n<br><br>\n<b>1. Internet of Things (IOT)</b>\nOne of the biggest tech trends to emerge in recent years is the Internet of Things. Simply put, the Internet of Things (abbreviated IOT) is the idea that all technological devices can be connected to the internet and to each other in an attempt to create the perfect marriage between the physical and digital worlds. How will this impact you? It depends on your industry. For example, for those who work in marketing, advertising, media or business management, IOT could provide a wealth of information on how consumers engage with products by tracking their interactions with digital devices. In turn, this data could be used to optimize marketing campaigns and user experiences.\n<br><br>\nHow it\'s affecting industries: The really cool thing about IOT is that it\'s not only changing the way we do business but also the business models we use to do it. For example, pay-per-use models are becoming increasingly popular across all industries as new customer data becomes available.\n<br><br>\n<b>2. Machine learning</b>\nAnother exciting emerging technology is machine learning, which is essentially a computer\'s ability to learn on its own by analyzing data and tracking repeating patterns. For example, social media platforms use machine learning to get a better understanding of how you\'re connected with those in your social network. They do this by analyzing your likes, shares and comments and then prioritizing content from your closest connections, serving you that content first.\n<br><br>\nHow it\'s affecting industries: In addition to shaping your day-to-day interactions with friends on social media, machine learning is also changing the way companies do business with customers. Companies like Google are using machine learning on mobile devices which can continue learning even when offline. The result? Machine learning is reshaping the way businesses interact with their customers in a big way by helping them anticipate and meet customer needs more easily.\n<br><br>\n<b>3. Virtual reality (VR)</b>\nRemember watching movies about virtual reality and thinking how cool it would be if it was actually like that in real life? Well, it\'s about to be. Although VR has been around since the 1950s, until recently the technology wasn\'t able to deliver the fully immersive digital experience users have been craving. That\'s about to change with recent improvements to both hardware and programming, and the effects are going to be felt across almost every industry from retail to education.\n<br><br>\nHow it\'s affecting industries: Virtual reality has been a popular component of video games for several years and this trend is continuing to expand. In addition to video games, VR is likely to affect companies across the board as they adopt the technology to help them engage customers more effectively and optimize their sales and marketing efforts. It\'s also a potentially useful tool for learning and is increasingly being adopted by educational organizations.\n<br><br>\n<b>4. Touch commerce</b>\nBeing able to buy anything you want with the touch of a finger may have seemed like a fantasy a few years ago, but itï¿½s now a reality. Merging touchscreen technology with one-click shopping, touch commerce allows consumers to buy products easily from their phones. After linking their payment information to a general account and enabling the feature, customers are able to buy everything from clothes to furniture with just a fingerprint.\n<br><br>\nHow it\'s affecting industries: This is one of the biggest things to hit eCommerce in recent years with purchases of this type expected to increase by 150% this year alone and retailers in almost every industry anticipating an increase in sales directly related to this new technology.\n<br><br>\n<b>5. Cognitive Technology</b>\nCognitive technology is in the same vein as machine learning and virtual reality except that it\'s a broader concept. For example, the cognitive technology umbrella includes things like natural language processing (NLP) and speech recognition. Combined, these different technologies are able to automate and optimize a lot of tasks that were previously done by people, including certain aspects of accounting and analytics.\n<br><br>\nHow it\'s affecting industries: Although cognitive technologies have a broad range of applications, one of the industry sectors most affected by this trend initially will be the software sector. Automated analysis of user data and experiences will be particularly useful for software companies hoping to scale.\n<br><br>\nWith emerging technologies changing professional industries including banking, eCommerce, healthcare and education, staying up to date on the latest trends will give you a better understanding of your chosen industry and make you a more competitive candidate. Best of all, this knowledge might open up new doors within your field and others.                                                                                                                                     ', 3, 2, '04 Apr,2021', 'Future-Technology.jpg', 'Top-tech.jpg'),
(45, 'Ertugrul’ star Burcu Kıratlı looks stunning in latest photos', 'Turkish actress Burcu Kiratli, who essays the role of Gokce Hatun in historic drama series Dirilis: Ertugrul or Ertugrul Ghazi, looked nothing short of a vision in latest selfies. Burcu turned to Instagram and shared the dazzling pictures with strawberry emoticon. Burcu Kiratli aka Gokce Hatun, who celebrated her 31st birthday last month, looked stunning in the selfies. The endearing post has garnered thousands of hearts within no time. Kiratli recently celebrated her 31st birthday with family and shared adorable photos and videos from her birthday bash. In one of the photo, ‘Gokce Hatun’ could be seen carrying her birthday cake and in other picture she could be seen cheering with the family. Burcu also received a diamond ring from her husband Sinan Akcıl, who is also composer, singer-songwriter and record producer. She also shared the video of the moment.                   ', 6, 1, '18 Jul,2021', 'ertughrul.PNG', 'Ertugrul.jpg'),
(46, 'Three things we learned from the first Test between England and Pakistan', 'MANCHESTER: England\'s dramatic three-wicket win over Pakistan in the first Test at Old Trafford was a brilliant advertisement for the red-ball game. Pakistan, despite not having played international cricket for several months because of the coronavirus, dominated the majority of the match and were still favourites when they reduced England to 117-5, chasing a target of 277, on Saturday´s fourth day in Manchester. But Jos Buttler (75) and Chris Woakes (84 not out) took the game away from the tourists in a sixth-wicket partnership of 139. Below AFP Sport looks at three things we learned from an enthralling first chapter of a three-match series: Woakes works wonders Although he recently reached the landmark of 1,000 runs and 100 wickets in fewer Tests than West Indies hero Garfield Sobers, arguably cricket\'s greatest all-rounder, or England colleague Ben Stokes and has a better bowling average in England than either James Anderson or Stuart Broad, there has been a tendency to regard Chris Woakes as a \'nearly man\'. So it was no surprise that his omission from England\'s first Test against the West Indies last month generated little comment. The affable Woakes is not one to moan publicly about his lot, sometimes to his own detriment. Yet Woakes has since taken 15 wickets for England at a shade under 16 apiece. Woakes had, however, averaged a meagre 5.22 runs with the bat in his six previous Tests. But, with England in trouble, he hit his highest Test score since an unbeaten century against India at Lord\'s in 2018. The astute Warwickshire all-rounder wanted to make sure the second new ball did not become a factor so went on the attack and countered the short ball by making room to hit through the off-side. Plenty of orthodox cover-drives followed in a fifty that came from just 59 balls. And when Buttler was out, Woakes finished the job. \"He\'s Mr Dependable,\" Root said of Woakes. \"He\'s someone you can always trust to deliver exactly what you want.\" The Buttler paradox This match saw Buttler make a case for both why he should be in and out of the England Test side. Utilising the run-chasing skills that make him such a formidable batsman in one-day cricket, Buttler and fellow World Cup-winner Woakes turned the tide when Pakistan were on the brink of victory. Yet they would have been chasing considerably fewer runs to win had not wicketkeeper Buttler dropped and then missed a chance to stump Shan Masood when the opener was on 45 in Pakistan´s first innings. Masood went on to make a Test-best 156, with Buttler\'s keeping in marked contrast to that of impressive Pakistan gloveman Mohammad Rizwan. To his credit, Buttler didn\'t let England´s victory stop him from confronting the issue. \"I know it\'s not good enough as an international wicketkeeper,\" he said. \"If I am going to continue to be a wicketkeeper in this team, I´m going to have to be better.\" Masood\'s persistence rewarded When Masood toured England in 2016 he averaged a lowly 17.75. But he kept working on his game during more than a year of international exile and the now 30-year-old demonstrated great discipline and shot-making during a near eight-hour 156. In the process, Masood joined head coach Misbah-ul-Haq as one of just six Pakistan batsmen to have scored a hundred in three consecutive Test innings. \"It was good application and his hard work has paid off,\" said Misbah. \"Now he has proved himself here in England.\"', 1, 1, '18 Jul,2021', '1597519139-1597501936-c.PNG', 'Pak Vs England.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `websiteName` varchar(60) NOT NULL,
  `Logo` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`websiteName`, `Logo`) VALUES
('Pak Citizens', 'Logo.png');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userID` int(11) NOT NULL,
  `firstname` varchar(30) DEFAULT NULL,
  `lastName` varchar(30) DEFAULT NULL,
  `username` varchar(30) NOT NULL,
  `userpassword` varchar(80) DEFAULT NULL,
  `userRole` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `firstname`, `lastName`, `username`, `userpassword`, `userRole`) VALUES
(1, 'Hajra', 'Khan', 'Hajra', '202cb962ac59075b964b07152d234b70', '1'),
(2, 'Uzair', 'Sultan', 'Uzair', '7815696ecbf1c96e6894b779456d330e', '1'),
(14, 'Waleed', 'Shah', 'Waleed', '7815696ecbf1c96e6894b779456d330e', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryID`);

--
-- Indexes for table `des`
--
ALTER TABLE `des`
  ADD PRIMARY KEY (`desID`),
  ADD KEY `fki` (`postid`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`postID`),
  ADD KEY `Author` (`postAuthor`),
  ADD KEY `category` (`postCategory`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `categoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `des`
--
ALTER TABLE `des`
  MODIFY `desID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `postID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
