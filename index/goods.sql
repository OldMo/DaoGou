-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-03-30 16:56:07
-- 服务器版本： 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `daogou`
--

-- --------------------------------------------------------

--
-- 表的结构 `szg_goods`
--

CREATE TABLE IF NOT EXISTS `szg_goods` (
  `id` int(11) NOT NULL,
  `g_id` varchar(20) NOT NULL COMMENT '商品id',
  `g_name` varchar(50) NOT NULL DEFAULT '' COMMENT '商品名字',
  `mall_id` int(11) NOT NULL COMMENT '商城id',
  `c_id` int(11) NOT NULL DEFAULT '1' COMMENT '商品分类',
  `g_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `g_bar_price` decimal(10,2) DEFAULT '88.00' COMMENT '商品特价',
  `g_desc` text COMMENT '商品描述',
  `g_image` varchar(50) DEFAULT NULL COMMENT '商品图片的路径：原图',
  `g_url` varchar(500) DEFAULT NULL COMMENT '商品链接',
  `g_addtime` datetime DEFAULT NULL COMMENT '商品添加时间'
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `szg_goods`
--

INSERT INTO `szg_goods` (`id`, `g_id`, `g_name`, `mall_id`, `c_id`, `g_price`, `g_bar_price`, `g_desc`, `g_image`, `g_url`, `g_addtime`) VALUES
(41, '0', '婴贝儿', 0, 4, '48.00', '1.00', '', 'pic/TB1yCKyKpXXXXbiXFXXXXXXXXXX_!!0-item_pic.jpg', '', '0000-00-00 00:00:00'),
(42, '0', '五香葵瓜子', 0, 4, '5.00', '1.00', '', 'pic/TB1A7p7IXXXXXbFXFXXXXXXXXXX_!!0-item_pic.jpg', '', '0000-00-00 00:00:00'),
(43, '0', 'iPhone6', 0, 4, '5299.00', '1.00', '', 'pic/TB1Vy27KXXXXXbnXpXXXXXXXXXX_!!0-item_pic.jpg', '', '0000-00-00 00:00:00'),
(44, '0', '3D壁钟', 0, 4, '3888.00', '1.00', '', 'pic/TB1DU7jLXXXXXXyaXXXXXXXXXXX_!!0-item_pic.jpg', '', '0000-00-00 00:00:00'),
(45, '0', '劳力士', 0, 4, '299.00', '1.00', '', 'pic/TB1OUZbLFXXXXXxXVXXXXXXXXXX_!!0-item_pic.jpg', '', '0000-00-00 00:00:00'),
(47, '0', '三开式双门冰箱', 0, 4, '499.00', '1.00', '', 'pic/TB1OUZbLFXXXXXxXVXXXXXXXXXX_!!0-item_pic.jpg', '', '0000-00-00 00:00:00'),
(48, '0', '名牌钢笔', 0, 4, '199.00', '1.00', '', 'pic/TB1L450HpXXXXcsXVXXXXXXXXXX_!!0-item_pic.jpg', '', '0000-00-00 00:00:00'),
(55, '0', '键盘', 0, 4, '100.00', '88.00', NULL, 'pic/TB1yv.aLFXXXXaMXVXXXXXXXXXX_!!0-item_pic.jpg', '', '0000-00-00 00:00:00'),
(57, '0', '衣服', 0, 4, '100.00', '88.00', NULL, 'pic/TB12wFDLpXXXXcLXFXXXXXXXXXX_!!0-item_pic.jpg', '', '0000-00-00 00:00:00'),
(58, '0', '鼠标垫', 0, 11, '30.00', '88.00', NULL, 'pic/TB12wFDLpXXXXcLXFXXXXXXXXXX_!!0-item_pic.jpg', '', '0000-00-00 00:00:00'),
(59, '0', '雨伞', 0, 7, '50.00', '88.00', NULL, 'pic/TB1jU1QLFXXXXbqXVXXXXXXXXXX_!!0-item_pic.jpg', '', '0000-00-00 00:00:00'),
(61, '0', '星巴克', 0, 3, '20.00', '88.00', NULL, 'pic/TB1jU1QLFXXXXbqXVXXXXXXXXXX_!!0-item_pic.jpg', '', '0000-00-00 00:00:00'),
(62, '0', '贝得力宝宝洗头帽婴儿洗发帽幼儿童防水浴帽洗澡帽可调节加大加厚', 0, 1, '9.90', '88.00', NULL, 'pic/TB1a8K0JpXXXXa.XVXXXXXXXXXX_!!0-item_pic.jpg', 'http://detail.tmall.com/item.htm?id=520559024016', NULL),
(63, '0', '三惠尖角脆 妙脆角 500克 福建特产 锅巴三角塔 膨化零食品大礼包', 0, 1, '8.90', '8.90', NULL, 'pic/TB1Vy27KXXXXXbnXpXXXXXXXXXX_!!0-item_pic.jpg', 'http://detail.tmall.com/item.htm?id=523727759064', NULL),
(64, '0', '夏季韩版人字拖男防水防滑越南托潮流45码沙滩拖鞋罗马拖男潮拖鞋', 0, 1, '9.90', '9.90', NULL, 'pic/TB1mzGyLpXXXXbFXFXXXXXXXXXX_!!0-item_pic.jpg', 'http://detail.tmall.com/item.htm?id=526229170066', NULL),
(65, '0', '魔电 M19重低音小米红米2s/2A/3/4C/Note入耳式线控通用手机耳机', 0, 1, '9.90', '9.90', NULL, 'pic/TB1uJo.HVXXXXXmXXXXXXXXXXXX_!!0-item_pic.jpg', 'http://detail.tmall.com/item.htm?id=45797892162', NULL),
(66, '0', '方凡 大肚子肠清茶 荷叶大肚子汤 袋泡代用茶2.5g*18袋', 0, 1, '9.90', '9.90', NULL, 'pic/TB1yCKyKpXXXXbiXFXXXXXXXXXX_!!0-item_pic.jpg', 'http://detail.tmall.com/item.htm?id=524060899814', NULL),
(67, '0', '2016夏季纯棉男士短袖T恤圆领修身韩版打底衫空白纯色绘画纯黑白', 0, 1, '9.90', '88.00', NULL, 'pic/TB1A7p7IXXXXXbFXFXXXXXXXXXX_!!0-item_pic.jpg', 'http://detail.tmall.com/item.htm?id=521736119720', NULL),
(68, '0', '2016新款夏季春款男士短袖T恤半袖男装韩版夏天男式日系潮流圆领', 0, 1, '9.90', '9.90', NULL, 'pic/TB1yv.aLFXXXXaMXVXXXXXXXXXX_!!0-item_pic.jpg', 'http://detail.tmall.com/item.htm?id=44208320792', NULL),
(69, '0', '天猫正品Farger发歌卡特蓝藻瞬间修护发膜柔顺干枯毛躁买二送一', 0, 1, '9.90', '9.90', NULL, 'pic/TB1Y7Z4KVXXXXcKXXXXXXXXXXXX_!!0-item_pic.jpg', 'http://detail.tmall.com/item.htm?id=21005763775', NULL),
(70, '0', '十月结晶一次性马桶垫纸产妇旅行马桶套坐垫纸孕妇坐便套防水坐厕', 0, 1, '9.90', '9.90', NULL, 'pic/TB12wFDLpXXXXcLXFXXXXXXXXXX_!!0-item_pic.jpg', 'http://detail.tmall.com/item.htm?id=36962307418', NULL),
(71, '0', '倍丝柔一次性内裤孕产妇产后月子用品女款纸内裤纯棉档7条装', 0, 1, '9.90', '9.90', NULL, 'pic/TB1H20mLFXXXXaKXVXXXXXXXXXX_!!0-item_pic.jpg', 'http://detail.tmall.com/item.htm?id=36663433297', NULL),
(72, '0', '嘉洋品牌高清树脂镜片男女老花镜高档防疲劳超轻直框年轻老花眼镜', 0, 1, '9.90', '9.90', NULL, 'pic/TB1OUZbLFXXXXXxXVXXXXXXXXXX_!!0-item_pic.jpg', '嘉洋品牌高清树脂镜片男女老花镜高档防疲劳超轻直框年轻老花眼镜', NULL),
(73, '0', '故乡月老花镜 折叠便携 品牌高档 眼镜 男女式超轻防疲劳树脂进口', 0, 1, '9.90', '9.90', NULL, 'pic/TB1kEIgLFXXXXbhXFXXXXXXXXXX_!!0-item_pic.jpg', '故乡月老花镜 折叠便携 品牌高档 眼镜 男女式超轻防疲劳树脂进口', NULL),
(74, '0', '2016夏装卡通大码短袖T恤女韩范闺蜜修身半袖套头上衣棉打底衫潮', 0, 1, '9.90', '9.90', NULL, 'pic/TB1jU1QLFXXXXbqXVXXXXXXXXXX_!!0-item_pic.jpg', '2016夏装卡通大码短袖T恤女韩范闺蜜修身半袖套头上衣棉打底衫潮', NULL),
(75, '0', '2016新款短袖t恤女夏季女装大码中长款纯色宽松半袖韩版上衣T恤潮', 0, 1, '9.90', '9.90', NULL, 'pic/TB1oaqmLpXXXXcpXFXXXXXXXXXX_!!0-item_pic.jpg', 'http://detail.tmall.com/item.htm?id=526266053881', NULL),
(76, '0', '班服情侣装春夏季宽松大码纯色打底衫上衣韩版学生闺蜜短袖T恤女', 0, 1, '9.90', '9.90', NULL, 'pic/TB1DU7jLXXXXXXyaXXXXXXXXXXX_!!0-item_pic.jpg', 'http://detail.tmall.com/item.htm?id=525953864667', NULL),
(77, '0', '新款2016韩版春夏季女士半袖打底衫上衣套头宽松圆领印花小马T恤', 0, 1, '9.90', '9.90', NULL, 'pic/TB182v4LFXXXXX8XFXXXXXXXXXX_!!0-item_pic.jpg', 'http://detail.tmall.com/item.htm?id=527007691030', NULL),
(78, '0', '中学生2016修身百搭T恤短袖女装闺蜜装夏季卡通学院风个性上衣服', 0, 1, '9.90', '9.90', NULL, 'pic/TB1L450HpXXXXcsXVXXXXXXXXXX_!!0-item_pic.jpg', 'http://detail.tmall.com/item.htm?id=526138052540', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `szg_goods`
--
ALTER TABLE `szg_goods`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `szg_goods`
--
ALTER TABLE `szg_goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=79;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
