-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2017 年 08 月 03 日 08:48
-- 服务器版本: 5.5.53
-- PHP 版本: 5.4.45

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `wshop`
--

-- --------------------------------------------------------

--
-- 表的结构 `article`
--

CREATE TABLE IF NOT EXISTS `article` (
  `idarticle` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(100) DEFAULT NULL,
  `desc` varchar(500) DEFAULT NULL,
  `prix` int(11) DEFAULT '0',
  `img` varchar(200) DEFAULT 'images/OXO---Homepage_39.jpg',
  `qte` int(11) DEFAULT '0',
  `dateajout` datetime DEFAULT NULL,
  PRIMARY KEY (`idarticle`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `article`
--

INSERT INTO `article` (`idarticle`, `libelle`, `desc`, `prix`, `img`, `qte`, `dateajout`) VALUES
(1, 'Nac nac 時尚環保外出側背袋 \n', '時尚又環保絕對不能錯過的經典款式，走在絕對吸引大家的目光，男女皆可戴。                       \n 材質:棉帆布\n\n\n\n\n\n\n', 250, 'produitImages/product01.jpg', 100, '2017-08-03 11:31:29'),
(2, 'Nac nac  童趣收納帳篷\n', '\n\n讓可愛又有趣的童趣森林遊戲屋，一起陪寶貝度過一個快樂的遊戲時光吧！', 250, 'produitImages/product02.jpg', 100, '2017-08-03 12:06:58'),
(3, 'Nac nac 戶外野餐保溫提籃 \n', '\n麗嬰房Nac nac魔漾童趣野餐提籃  款式:綠色/粉紅色', 200, 'produitImages/product03.jpg', 100, '2017-08-03 18:27:23'),
(4, '親子旅用摺疊收納袋-新品\n', '適合收納泳衣,內衣,盥洗用品或是當化妝包使用 \n尺寸:寬165mm 高135mm\n材質:優質尼龍', 300, 'produitImages/product04.jpg', 100, '2017-08-03 18:41:47'),
(5, ' Nac nac   304不鏽鋼燜燒罐 ', '品名：nac nac不鏽鋼真空燜燒罐(粉藍)(粉紅)\n\n容量：400ml\n\n材質：#304不鏽鋼(內膽)、PP(上蓋內杯)、矽膠(上蓋阻水圈)\n\n製造日期：2013/08\n\n產地：中國\n\n附件：附提袋(如圖三)，無湯匙\n\n售價：400元/個(含運)\n\n寄送方式：7-11或全家店到店寄送', 300, 'produitImages/product05.jpg', 100, '2017-12-27 18:41:47'),
(6, '熊本熊童趣收納椅凳\n', '◆熊本熊正版授權 \n◆椅子、收納箱兩用 \n◆上蓋內部軟墊設計 \n◆車縫細緻，堅固耐用 \n◆整齊收納，增添生活品味\n', 200, 'produitImages/product06.jpg', 100, '2017-12-27 18:41:47'),
(7, 'Nac nac 擁抱幾米彩繪杯', '◆Nac nac 擁抱幾米彩繪杯                                                                     \n◆幾米正版授權                      ', 99, 'produitImages/product07.jpg', 100, '2017-12-27 18:41:47'),
(8, '時尚空氣背包(側背或後背)', '時尚空氣包包讓嬤嬤們跟上潮流的腳步!\n', 300, 'produitImages/product08.png', 100, '2017-12-27 18:41:47'),
(9, '單面絨野餐墊\n', '單面絨野餐墊', 250, 'produitImages/product09.jpg', 100, '2017-12-27 18:41:47'),
(10, '2in1 親子野餐墊vs購物袋\n', '2in1 親子野餐墊vs購物袋', 250, 'produitImages/product10.jpg', 100, '2017-12-27 18:41:47'),
(11, 'Galaxy A', '旗艦級 IP68 防水防塵* 與無蓋防水設計**\n即使下雨天、游泳池、浴室內，都能盡情使用 Galaxy A，盡興玩水、風雨無阻，享樂生活無極限。', 22, 'produitImages/phone11.jpg', 3, '2014-12-27 18:41:47'),
(12, '\niPhone 7 ', 'iPhone 7 將 iPhone 體驗中最重要的環節，大幅提升。它全新推出先進的攝錄鏡頭系統，與 iPhone 歷來最出色的效能表現、最持久的電池續航力，讓人身歷其境的立體聲揚聲器，最亮麗、色彩最豐富的 iPhone 顯示器，而且還能防潑抗水1，更有足以媲美強大效能的耀眼外觀。這，就是 iPhone 7。', 30, 'produitImages/phone12.jpg', 8, '2014-12-27 19:04:21'),
(13, 'iPhone 6s', '1200 萬像素攝錄鏡頭\n具備影像穩定功能的 Live Photos\n自動對焦，採用 Focus Pixels\n光學影像穩定功能 (僅限 iPhone 6s Plus)\nTrue Tone 閃光燈\n全景模式 (高達 6300 萬像素)\n照片自動 HDR\n曝光控制\n連拍模式\n計時模式\nƒ/2.2 光圈\n五枚鏡片組\n5 倍數位變焦\n混合式 IR 濾鏡\n背照式感光元件\n藍寶石水晶玻璃保護鏡\n自動影像穩定功能\n局部色調對映功能\n雜點消除功能\n面孔偵測功能\n照片地理位置標記', 23, 'produitImages/phone13.jpg', 9, '2014-12-27 19:04:21');

-- --------------------------------------------------------

--
-- 表的结构 `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `login` varchar(100) NOT NULL,
  `mdp` varchar(100) NOT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `prenom` varchar(100) DEFAULT NULL,
  `dtnaissance` datetime DEFAULT NULL,
  `address` varchar(50) NOT NULL,
  `phone_number` varchar(30) NOT NULL,
  `level` int(3) NOT NULL DEFAULT '2',
  PRIMARY KEY (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `client`
--

INSERT INTO `client` (`login`, `mdp`, `nom`, `prenom`, `dtnaissance`, `address`, `phone_number`, `level`) VALUES
('ali', '123', 'Ali', 'ila', '1988-10-12 00:00:00', '', '0', 1),
('jerry', '123', '林', '哲', '2017-08-03 08:46:08', '0988123456', '台北市士林區', 2),
('test', 'E', 'Z', 'sakZhana2', '1988-10-12 00:00:00', '', '0', 2);

-- --------------------------------------------------------

--
-- 表的结构 `commande`
--

CREATE TABLE IF NOT EXISTS `commande` (
  `idcommande` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(100) DEFAULT NULL,
  `datecmd` datetime DEFAULT NULL,
  `prixtotale` double DEFAULT NULL,
  `etat` int(11) DEFAULT '0',
  `address` varchar(50) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  PRIMARY KEY (`idcommande`),
  KEY `Login_idx` (`login`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1030 ;

--
-- 转存表中的数据 `commande`
--

INSERT INTO `commande` (`idcommande`, `login`, `datecmd`, `prixtotale`, `etat`, `address`, `phone_number`) VALUES
(1027, 'test', '2017-07-27 22:38:23', 7, 0, '台北市士林區', '09898989'),
(1028, 'test', '2017-07-28 00:05:53', 5.32, 0, '台北市', '456'),
(1029, 'test', '2017-07-28 00:11:45', 5.32, 0, '台北市士林區士東路301號', '0911123456');

-- --------------------------------------------------------

--
-- 表的结构 `ligne_commande`
--

CREATE TABLE IF NOT EXISTS `ligne_commande` (
  `idcmd` int(11) NOT NULL,
  `idart` int(11) NOT NULL,
  `nbr` int(11) DEFAULT NULL,
  PRIMARY KEY (`idcmd`,`idart`),
  KEY `idArt_idx` (`idart`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ligne_commande`
--

INSERT INTO `ligne_commande` (`idcmd`, `idart`, `nbr`) VALUES
(1027, 3, 1),
(1028, 2, 1),
(1029, 2, 1);

-- --------------------------------------------------------

--
-- 表的结构 `msg`
--

CREATE TABLE IF NOT EXISTS `msg` (
  `msgGuestId` int(11) NOT NULL AUTO_INCREMENT,
  `msgGuestName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `guestGuestEmail` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `guestGuestMsgContent` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`msgGuestId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=20 ;

--
-- 转存表中的数据 `msg`
--

INSERT INTO `msg` (`msgGuestId`, `msgGuestName`, `guestGuestEmail`, `guestGuestMsgContent`) VALUES
(4, 'mary', 'mary@gmail.com', 'aaa'),
(19, '林', 'jeerry', 'handsomeboy in the town');

--
-- 限制导出的表
--

--
-- 限制表 `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `Login` FOREIGN KEY (`login`) REFERENCES `client` (`login`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- 限制表 `ligne_commande`
--
ALTER TABLE `ligne_commande`
  ADD CONSTRAINT `idArt` FOREIGN KEY (`idart`) REFERENCES `article` (`idarticle`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `idCmd` FOREIGN KEY (`idcmd`) REFERENCES `commande` (`idcommande`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
