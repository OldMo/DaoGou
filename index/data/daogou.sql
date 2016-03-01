-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: 2016-03-01 08:46:57
-- 服务器版本： 10.1.8-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `daogou`
--

-- --------------------------------------------------------

--
-- 表的结构 `szg_admin`
--

CREATE TABLE `szg_admin` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `a_username` varchar(20) NOT NULL COMMENT '管理员账号',
  `a_password` char(50) DEFAULT NULL,
  `a_email` varchar(50) NOT NULL COMMENT '管理员邮箱',
  `getpasstime` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `szg_admin`
--

INSERT INTO `szg_admin` (`id`, `a_username`, `a_password`, `a_email`, `getpasstime`) VALUES
(7, 'akic4', 'c274356a86dab629a36523a0bcae7ec8a9676f24', '584747429@qq.com', 1432045135),
(10, 'admin', '1def7f88480fe5259add565683dd8be3e67765c2', '23523525@qq.com', 0),
(12, 'akic3', '2894d58dcbf0c10089caa6e4c61fe103684e29df', '1577011161@qq.com', 1432055505),
(13, 'akic5', '2d2354db1accba75d297ce358ee373954dd72f2a', '624816868@qq.com', 0);

-- --------------------------------------------------------

--
-- 表的结构 `szg_category`
--

CREATE TABLE `szg_category` (
  `id` int(11) NOT NULL,
  `c_name` varchar(20) NOT NULL COMMENT '商品名称',
  `c_goods` int(11) DEFAULT NULL COMMENT '商品库存',
  `c_parent_id` int(11) DEFAULT '0' COMMENT '商品分类父类id：0表示顶级分类',
  `category_logo` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `szg_category`
--

INSERT INTO `szg_category` (`id`, `c_name`, `c_goods`, `c_parent_id`, `category_logo`) VALUES
(1, '日用', 2, 0, 'images/qunzi.jpg'),
(2, '母婴', 1, 1, 'images/shangyi.jpg'),
(3, '数码', 1, 1, 'images/kuzi.jpg'),
(4, '家电', 0, 0, 'images/xiezi.jpg'),
(5, '食品', 0, 4, 'images/baobao.jpg'),
(6, '服装', 2, 4, 'images/baobao.jpg'),
(7, '美妆配饰', 4, 4, 'images/baobao.jpg'),
(8, '运动户外', 6, 4, 'images/baobao.jpg'),
(9, '汽车用品', 1, 4, 'images/baobao.jpg'),
(10, '促销活动', 0, 1, 'images/xiezi.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `szg_goods`
--

CREATE TABLE `szg_goods` (
  `id` int(11) NOT NULL,
  `g_name` varchar(200) NOT NULL DEFAULT '' COMMENT '商品名字',
  `mall_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL DEFAULT '1' COMMENT '商品分类',
  `g_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `g_desc` text COMMENT '商品描述',
  `g_image` varchar(50) DEFAULT NULL COMMENT '商品图片的路径：原图',
  `g_url` varchar(500) DEFAULT NULL COMMENT '商品链接',
  `g_addtime` datetime DEFAULT NULL COMMENT '商品添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `szg_goods`
--

INSERT INTO `szg_goods` (`id`, `g_name`, `mall_id`, `c_id`, `g_price`, `g_desc`, `g_image`, `g_url`, `g_addtime`) VALUES
(41, '婴贝儿', 0, 4, '48.00', '', 'pic/TB1yCKyKpXXXXbiXFXXXXXXXXXX_!!0-item_pic.jpg', '', '0000-00-00 00:00:00'),
(42, '五香葵瓜子', 0, 4, '5.00', '', 'pic/TB1A7p7IXXXXXbFXFXXXXXXXXXX_!!0-item_pic.jpg', '', '0000-00-00 00:00:00'),
(43, 'iPhone6', 0, 4, '5299.00', '', 'pic/TB1Vy27KXXXXXbnXpXXXXXXXXXX_!!0-item_pic.jpg', '', '0000-00-00 00:00:00'),
(44, '3D壁钟', 0, 4, '3888.00', '', 'pic/TB1DU7jLXXXXXXyaXXXXXXXXXXX_!!0-item_pic.jpg', '', '0000-00-00 00:00:00'),
(45, '劳力士', 0, 4, '299.00', '', 'pic/TB1OUZbLFXXXXXxXVXXXXXXXXXX_!!0-item_pic.jpg', '', '0000-00-00 00:00:00'),
(47, '三开式双门冰箱', 0, 4, '499.00', '', 'pic/TB1OUZbLFXXXXXxXVXXXXXXXXXX_!!0-item_pic.jpg', '', '0000-00-00 00:00:00'),
(48, '名牌钢笔', 0, 4, '199.00', '', 'pic/TB1L450HpXXXXcsXVXXXXXXXXXX_!!0-item_pic.jpg', '', '0000-00-00 00:00:00'),
(55, '键盘', 0, 4, '100.00', NULL, 'pic/TB1yv.aLFXXXXaMXVXXXXXXXXXX_!!0-item_pic.jpg', '', '0000-00-00 00:00:00'),
(57, '衣服', 0, 4, '100.00', NULL, 'pic/TB12wFDLpXXXXcLXFXXXXXXXXXX_!!0-item_pic.jpg', '', '0000-00-00 00:00:00'),
(58, '鼠标垫', 0, 11, '30.00', NULL, 'pic/TB12wFDLpXXXXcLXFXXXXXXXXXX_!!0-item_pic.jpg', '', '0000-00-00 00:00:00'),
(59, '雨伞', 0, 7, '50.00', NULL, 'pic/TB1jU1QLFXXXXbqXVXXXXXXXXXX_!!0-item_pic.jpg', '', '0000-00-00 00:00:00'),
(61, '星巴克', 0, 3, '20.00', NULL, 'pic/TB1jU1QLFXXXXbqXVXXXXXXXXXX_!!0-item_pic.jpg', '', '0000-00-00 00:00:00'),
(62, '贝得力宝宝洗头帽婴儿洗发帽幼儿童防水浴帽洗澡帽可调节加大加厚', 0, 1, '9.90', NULL, 'pic/TB1a8K0JpXXXXa.XVXXXXXXXXXX_!!0-item_pic.jpg', 'http://detail.tmall.com/item.htm?id=520559024016', NULL),
(63, '三惠尖角脆 妙脆角 500克 福建特产 锅巴三角塔 膨化零食品大礼包', 0, 1, '8.90', NULL, 'pic/TB1Vy27KXXXXXbnXpXXXXXXXXXX_!!0-item_pic.jpg', 'http://detail.tmall.com/item.htm?id=523727759064', NULL),
(64, '夏季韩版人字拖男防水防滑越南托潮流45码沙滩拖鞋罗马拖男潮拖鞋', 0, 1, '9.90', NULL, 'pic/TB1mzGyLpXXXXbFXFXXXXXXXXXX_!!0-item_pic.jpg', 'http://detail.tmall.com/item.htm?id=526229170066', NULL),
(65, '魔电 M19重低音小米红米2s/2A/3/4C/Note入耳式线控通用手机耳机', 0, 1, '9.90', NULL, 'pic/TB1uJo.HVXXXXXmXXXXXXXXXXXX_!!0-item_pic.jpg', 'http://detail.tmall.com/item.htm?id=45797892162', NULL),
(66, '方凡 大肚子肠清茶 荷叶大肚子汤 袋泡代用茶2.5g*18袋', 0, 1, '9.90', NULL, 'pic/TB1yCKyKpXXXXbiXFXXXXXXXXXX_!!0-item_pic.jpg', 'http://detail.tmall.com/item.htm?id=524060899814', NULL),
(67, '2016夏季纯棉男士短袖T恤圆领修身韩版打底衫空白纯色绘画纯黑白', 0, 1, '9.90', NULL, 'pic/TB1A7p7IXXXXXbFXFXXXXXXXXXX_!!0-item_pic.jpg', 'http://detail.tmall.com/item.htm?id=521736119720', NULL),
(68, '2016新款夏季春款男士短袖T恤半袖男装韩版夏天男式日系潮流圆领', 0, 1, '9.90', NULL, 'pic/TB1yv.aLFXXXXaMXVXXXXXXXXXX_!!0-item_pic.jpg', 'http://detail.tmall.com/item.htm?id=44208320792', NULL),
(69, '天猫正品Farger发歌卡特蓝藻瞬间修护发膜柔顺干枯毛躁买二送一', 0, 1, '9.90', NULL, 'pic/TB1Y7Z4KVXXXXcKXXXXXXXXXXXX_!!0-item_pic.jpg', 'http://detail.tmall.com/item.htm?id=21005763775', NULL),
(70, '十月结晶一次性马桶垫纸产妇旅行马桶套坐垫纸孕妇坐便套防水坐厕', 0, 1, '9.90', NULL, 'pic/TB12wFDLpXXXXcLXFXXXXXXXXXX_!!0-item_pic.jpg', 'http://detail.tmall.com/item.htm?id=36962307418', NULL),
(71, '倍丝柔一次性内裤孕产妇产后月子用品女款纸内裤纯棉档7条装', 0, 1, '9.90', NULL, 'pic/TB1H20mLFXXXXaKXVXXXXXXXXXX_!!0-item_pic.jpg', 'http://detail.tmall.com/item.htm?id=36663433297', NULL),
(72, '嘉洋品牌高清树脂镜片男女老花镜高档防疲劳超轻直框年轻老花眼镜', 0, 1, '9.90', NULL, 'pic/TB1OUZbLFXXXXXxXVXXXXXXXXXX_!!0-item_pic.jpg', '嘉洋品牌高清树脂镜片男女老花镜高档防疲劳超轻直框年轻老花眼镜', NULL),
(73, '故乡月老花镜 折叠便携 品牌高档 眼镜 男女式超轻防疲劳树脂进口', 0, 1, '9.90', NULL, 'pic/TB1kEIgLFXXXXbhXFXXXXXXXXXX_!!0-item_pic.jpg', '故乡月老花镜 折叠便携 品牌高档 眼镜 男女式超轻防疲劳树脂进口', NULL),
(74, '2016夏装卡通大码短袖T恤女韩范闺蜜修身半袖套头上衣棉打底衫潮', 0, 1, '9.90', NULL, 'pic/TB1jU1QLFXXXXbqXVXXXXXXXXXX_!!0-item_pic.jpg', '2016夏装卡通大码短袖T恤女韩范闺蜜修身半袖套头上衣棉打底衫潮', NULL),
(75, '2016新款短袖t恤女夏季女装大码中长款纯色宽松半袖韩版上衣T恤潮', 0, 1, '9.90', NULL, 'pic/TB1oaqmLpXXXXcpXFXXXXXXXXXX_!!0-item_pic.jpg', 'http://detail.tmall.com/item.htm?id=526266053881', NULL),
(76, '班服情侣装春夏季宽松大码纯色打底衫上衣韩版学生闺蜜短袖T恤女', 0, 1, '9.90', NULL, 'pic/TB1DU7jLXXXXXXyaXXXXXXXXXXX_!!0-item_pic.jpg', 'http://detail.tmall.com/item.htm?id=525953864667', NULL),
(77, '新款2016韩版春夏季女士半袖打底衫上衣套头宽松圆领印花小马T恤', 0, 1, '9.90', NULL, 'pic/TB182v4LFXXXXX8XFXXXXXXXXXX_!!0-item_pic.jpg', 'http://detail.tmall.com/item.htm?id=527007691030', NULL),
(78, '中学生2016修身百搭T恤短袖女装闺蜜装夏季卡通学院风个性上衣服', 0, 1, '9.90', NULL, 'pic/TB1L450HpXXXXcsXVXXXXXXXXXX_!!0-item_pic.jpg', 'http://detail.tmall.com/item.htm?id=526138052540', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `szg_guestbook`
--

CREATE TABLE `szg_guestbook` (
  `g_id` int(10) UNSIGNED NOT NULL COMMENT '用户id',
  `g_name` varchar(10) NOT NULL COMMENT '用户姓名',
  `g_send_message` text,
  `g_send_text` text COMMENT '用户留言的内容',
  `g_send_time` int(11) DEFAULT NULL,
  `g_is_replay` int(11) DEFAULT '0',
  `g_text_replay` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `szg_guestbook`
--

INSERT INTO `szg_guestbook` (`g_id`, `g_name`, `g_send_message`, `g_send_text`, `g_send_time`, `g_is_replay`, `g_text_replay`) VALUES
(5, 'alice', NULL, '哈哈', NULL, 1, 'dggdgf'),
(7, 'alice', NULL, '哈哈', NULL, 1, 'd'),
(8, 'alice', NULL, '哈哈', NULL, 1, '你有病啊？'),
(9, 'alice', NULL, '哈哈', NULL, 1, '要死啦'),
(11, '去屎吧', NULL, '哈哈', NULL, 1, '韩国的？'),
(12, '去屎吧', NULL, '哈哈', NULL, 0, NULL),
(13, '去屎吧', NULL, '哈哈', NULL, 0, NULL),
(14, '该死的留言板', NULL, '哈哈', NULL, 1, '我和你没仇'),
(15, '该死的留言板', NULL, '哈哈', NULL, 0, NULL),
(32, '江文', '啊啊啊啊啊啊', '阿迪', NULL, 0, NULL),
(33, 'nini', 'nii', 'nin', NULL, 0, NULL),
(34, 'akic', 'akic', 'akic', NULL, 0, NULL),
(35, 'aaa', 'aa', 'aa', NULL, 0, NULL),
(36, '咪咪', '我的货呢', '用空运吗', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `szg_news`
--

CREATE TABLE `szg_news` (
  `id` int(11) NOT NULL,
  `n_title` varchar(30) DEFAULT NULL COMMENT '新闻标题',
  `n_content` text COMMENT '新闻内容'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `szg_news`
--

INSERT INTO `szg_news` (`id`, `n_title`, `n_content`) VALUES
(1, '猪八戒爱上孙悟空', '<h1>&nbsp;&nbsp;&nbsp;<strong>&nbsp; &nbsp;&nbsp;&nbsp;猪八戒爱上孙悟空啦！</strong></h1>\r\n\r\n<p><span class="marker"><strong>&nbsp;</strong><em>消息来自新浪网:</em></span></p>\r\n'),
(4, '蛇精男', '<ol>\r\n	<li>\r\n	<h3>【15岁<em>蛇精男</em><span class="marker"><strong>刘梓晨</strong></span>PK韩安冉Abby李蒽熙Danae】近日,刘梓晨的一组照片在网上热传,看了15岁<em>蛇精男</em>刘梓晨照片,瞬间觉得韩安冉Abby李蒽熙Danae美爆了。</h3>\r\n	</li>\r\n	<li>瞬间觉得韩安冉Abby李蒽熙Danae美爆了。<img alt="" src="/admin/upload/images/2015/05/19/20150519154026yxzLyU.jpg" style="height:240px; width:240px" /></li>\r\n</ol>\r\n');

-- --------------------------------------------------------

--
-- 表的结构 `szg_order_goods`
--

CREATE TABLE `szg_order_goods` (
  `id` int(11) NOT NULL,
  `o_id` char(10) NOT NULL COMMENT '订单订单id',
  `g_id` int(11) NOT NULL COMMENT '该订单的商品ID',
  `g_code` char(10) NOT NULL COMMENT '该订单商品的货号',
  `o_name` varchar(20) NOT NULL COMMENT '订单内商品的名字',
  `o_price` decimal(10,2) NOT NULL COMMENT '订单内商品的价格',
  `o_number` int(11) NOT NULL COMMENT '订单内商品的数量',
  `o_comment` text COMMENT '用户备注',
  `o_is_pay` int(11) DEFAULT '0' COMMENT '用户是否支付'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `szg_order_goods`
--

INSERT INTO `szg_order_goods` (`id`, `o_id`, `g_id`, `g_code`, `o_name`, `o_price`, `o_number`, `o_comment`, `o_is_pay`) VALUES
(1, '2', 1, 'YM000000', '钢铁是怎样', '100.00', 1, '', 1),
(2, '6', 41, 'YM000006', '婴贝儿', '48.00', 1, '', 1),
(3, '7', 41, 'YM000006', '婴贝儿', '48.00', 1, '', 1),
(4, '8', 43, 'YM000008', 'iPhone6', '5299.00', 1, '', 1),
(5, '9', 41, 'YM000006', '婴贝儿', '48.00', 1, '', 1),
(6, '10', 43, 'YM000008', 'iPhone6', '5299.00', 1, '', 1),
(7, '11', 42, 'YM000007', '五香葵瓜子', '5.00', 1, '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `szg_order_info`
--

CREATE TABLE `szg_order_info` (
  `id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL COMMENT '该订单的用户id',
  `i_number` char(10) NOT NULL COMMENT '该订单的订单号',
  `i_name` varchar(20) NOT NULL COMMENT '接收人姓名',
  `i_phone` char(11) NOT NULL COMMENT '接收人电话',
  `i_address` varchar(50) NOT NULL COMMENT '接收人地址',
  `status` int(11) DEFAULT '0' COMMENT '订单状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `szg_order_info`
--

INSERT INTO `szg_order_info` (`id`, `u_id`, `i_number`, `i_name`, `i_phone`, `i_address`, `status`) VALUES
(1, 1, '0000000001', '江文', '18280933905', '广东省广州市天河区棠东毓桂大街一巷29号', 1),
(2, 1, '0000000002', '江文', '18280933905', '广东省广州市天河区棠东毓桂大街一巷29号', 1),
(3, 1, '0000000003', 'ada', '15088138276', '广东省广州市天河区asdasd', 1),
(6, 4, '0000000004', 'akic', '15088138276', '广东省广州市天河区arq', 0),
(7, 4, '0000000005', 'asdas', '15088138276', '广东省广州市天河区asdad', 0),
(8, 4, '0000000006', '1sfr', '12345678901', '广东省广州市天河区', 0),
(9, 4, '0000000007', 'akk', '15088138276', '广东省广州市天河区aa', 0),
(10, 6, '0000000008', 'jason', '13167890345', '广东省广州市天河区棠东韵达', 0),
(11, 9, '0000000009', '咪咪', '18677577631', '广东省广州市天河区广东', 0);

-- --------------------------------------------------------

--
-- 表的结构 `szg_session`
--

CREATE TABLE `szg_session` (
  `sess_id` char(36) NOT NULL COMMENT 'sessionID',
  `sess_content` text COMMENT 'session内容',
  `sess_expire` int(11) DEFAULT NULL COMMENT 'session最后更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `szg_session`
--

INSERT INTO `szg_session` (`sess_id`, `sess_content`, `sess_expire`) VALUES
('02s78b731jtpsljkp4eg1cb7d3', '', 1432088999),
('041v51u4i8fhn9697t26b4ovm6', 'captcha|s:4:"b3Tr";userreset|s:2:"12";u_id|s:2:"12";', 1432053950),
('08d41ev9s42tj5ojqa07h9p0o2', 'uri|s:25:"/index.php?act=view&id=42";captcha|s:4:"nRdw";user_id|s:1:"9";orderGoods|a:7:{s:4:"u_id";s:1:"9";s:4:"g_id";s:2:"42";s:7:"sess_id";s:26:"08d41ev9s42tj5ojqa07h9p0o2";s:6:"c_name";s:15:"五香葵瓜子";s:7:"c_price";s:4:"5.00";s:8:"c_number";s:1:"1";s:6:"g_code";s:8:"YM000007";}totalPrice|s:1:"5";orderNumber|s:10:"0000000009";orderId|s:2:"11";', 1432090574),
('09qb18882dhaqr3dmp4etdgmb3', 'uri|s:54:"http://qusujr.com:8078/?ip=120.27.126.115:80&type=http";', 1456816213),
('0impir1e468raqhi4u8ab8rup1', 'uri|s:10:"/index.php";', 1456797241),
('12plf4632it9cer8o3n90il8t2', 'captcha|s:4:"VtDM";', 1432054123),
('15hcmcputs251i6grj58otpl80', 'captcha|s:4:"7SFc";userreset|s:2:"12";', 1432054611),
('16dtt79r2l8pp524d71qvvm0j2', 'uri|s:17:"www.baidu.com:443";', 1456803483),
('1a6ed2f7qm8j6478fqtm3bng65', '', 1432088048),
('1h1pkaauu74ejmei94lv48ca20', 'uri|s:17:"www.baidu.com:443";', 1456814682),
('22j6h7an2m94d43dg2lpcp0c87', 'captcha|s:4:"sJL8";u_id|s:1:"7";gettId|s:2:"13";uri|s:31:"/yimai/index.php?act=view&id=41";user_id|s:1:"4";orderGoods|a:7:{s:4:"u_id";s:1:"4";s:4:"g_id";s:2:"41";s:7:"sess_id";s:26:"22j6h7an2m94d43dg2lpcp0c87";s:6:"c_name";s:9:"婴贝儿";s:7:"c_price";s:5:"48.00";s:8:"c_number";s:1:"1";s:6:"g_code";s:8:"YM000006";}totalPrice|s:2:"48";orderNumber|s:10:"0000000005";orderId|s:1:"7";', 1432055438),
('28nq0m4kogv5eh8ig196b1a5v4', 'uri|s:25:"/index.php?act=view&id=45";captcha|s:4:"9XiV";', 1432090575),
('2mbac0qvptavsjvohqie8qi8b6', 'uri|s:25:"/index.php?act=view&id=47";captcha|s:4:"7e8m";user_id|s:1:"8";', 1432090358),
('2mg9gijab14vtghq4aoe0d9mj1', 'uri|s:17:"www.baidu.com:443";', 1456797163),
('2sejopvvasnfl8ps2spmv13rn0', 'captcha|s:4:"EGcP";u_id|s:1:"7";id|s:1:"2";gettId|s:2:"13";', 1432052586),
('38r3ljbbuii0eaue18m5kj9s41', 'uri|s:10:"/index.php";', 1456762314),
('3p2u3b4a9ivhpg92hd653hjjc7', 'uri|s:22:"http://biji.baidu.com/";', 1456816243),
('436ftjghmq5hfl19takgn3k470', 'uri|s:1:"/";', 1456786619),
('449ej9qsjne8ti9n51gucfmoe0', 'uri|s:49:"/index.php?s=%E8%8B%8F%E5%AE%81%E6%98%93%E8%B4%AD";', 1456798507),
('49b48j7ojoj6gfj4v84rkpme76', 'uri|s:25:"/index.php?act=view&id=42";', 1432084944),
('4b6klenh2o80k9lbml83i2ihg0', 'uri|s:17:"http://azenv.net/";', 1456783333),
('4hlu81uc2s79hm2lupjtabc7m2', '', 1432088396),
('4l1lphlecm9grvho4ecuvv76q7', 'uri|s:17:"http://azenv.net/";', 1456775254),
('55q5veohqml6a8k2k8ve09b6k7', '', 1432087791),
('5drcharaplpbjhv89cch8gq3q3', 'uri|s:26:"/index.php?act=view&id=41#";captcha|s:4:"wwtv";user_id|s:1:"7";orderGoods|a:7:{s:4:"u_id";s:1:"7";s:4:"g_id";s:2:"41";s:7:"sess_id";s:26:"5drcharaplpbjhv89cch8gq3q3";s:6:"c_name";s:9:"婴贝儿";s:7:"c_price";s:5:"48.00";s:8:"c_number";s:1:"3";s:6:"g_code";s:8:"YM000006";}', 1432090352),
('5u6k2d4mageictf552t7kcdkl1', 'uri|s:32:"/index.php?act=index&page=3&id=1";', 1456759775),
('65abc7bv6s33dbrja77qs8s182', 'captcha|s:4:"fUnm";u_id|s:1:"7";id|s:1:"2";gettId|s:2:"13";', 1432090299),
('66vfg9ata1l40gqi2lp15ghtd4', 'uri|s:25:"/index.php?act=view&id=41";', 1432089529),
('69ijp5t6trb6e824f3q4n7sif7', 'uri|s:17:"www.baidu.com:443";', 1456798995),
('6c1reuqajqcabh7lhbpjl4fs40', 'uri|s:18:"www.alipay.com:443";', 1456797190),
('790bgciv02qjq7dun10uu5ipa3', 'captcha|s:4:"r6mx";uri|s:31:"/yimai/index.php?act=view&id=41";u_id|s:1:"7";id|s:1:"3";user_id|s:1:"4";orderGoods|a:7:{s:4:"u_id";s:1:"4";s:4:"g_id";s:2:"41";s:7:"sess_id";s:26:"790bgciv02qjq7dun10uu5ipa3";s:6:"c_name";s:9:"婴贝儿";s:7:"c_price";s:5:"48.00";s:8:"c_number";s:1:"1";s:6:"g_code";s:8:"YM000006";}totalPrice|s:2:"48";orderNumber|s:10:"0000000004";orderId|s:1:"6";', 1432049520),
('7caije9cdoj2s72hjetsbumip3', 'uri|s:18:"www.alipay.com:443";', 1456773269),
('7dpqqthgk5f26pdhmtk44gise7', 'uri|s:17:"www.baidu.com:443";', 1456791513),
('7i7r9m9t5tf0rks9m8ltqihg04', 'uri|s:18:"www.alipay.com:443";', 1456783334),
('7rj3bdgcjsdq7bglskt607l010', 'uri|s:9:"/rank.php";', 1456761794),
('810mh7a4su5q028l63o853hb23', 'uri|s:1:"/";', 1456797008),
('8almvvkejvcon27ptnqhjb1fb5', 'uri|s:25:"/index.php?act=view&id=41";captcha|s:4:"36ky";', 1432089032),
('8ck4tkeheko05r2h7lc9he4dr0', 'uri|s:17:"www.baidu.com:443";', 1456785810),
('8fg5hhv54966lfhfe4eda5lv22', 'captcha|s:4:"uH3e";userreset|s:2:"12";', 1432054580),
('9di5bnorcrp7pdu0tm8rgqqeo3', 'uri|s:10:"/index.php";', 1456756965),
('9m2udelumgt4mo5endco80t4g2', 'uri|s:1:"/";', 1456779562),
('aku2r8n54kohuk8dh98mq7l866', 'uri|s:25:"/index.php?act=view&id=41";captcha|s:4:"zK3E";user_id|s:1:"4";orderGoods|a:7:{s:4:"u_id";s:1:"4";s:4:"g_id";s:2:"41";s:7:"sess_id";s:26:"aku2r8n54kohuk8dh98mq7l866";s:6:"c_name";s:9:"婴贝儿";s:7:"c_price";s:5:"48.00";s:8:"c_number";s:1:"1";s:6:"g_code";s:8:"YM000006";}', 1432085766),
('anmoq9huvutnod2olhmfd70ag5', '', 1432085144),
('ap55qhffhitr86oou31kjcbr17', 'uri|s:1:"/";', 1456797817),
('arnjdu9vj8is4lkrrr189bfnr1', 'captcha|s:4:"A7iJ";u_id|s:1:"7";gettId|s:2:"13";', 1432089515),
('asvfm7aofr1i49uh3b4nc6hkv6', 'captcha|s:4:"nyfc";', 1432090573),
('b53qht34p8qk9dogu6durdcko5', 'uri|s:12:"/DaoGou/web/";', 1454593855),
('bn5rg485ig2acg8gldretuitr4', 'captcha|s:4:"UJvj";u_id|s:1:"7";gettId|s:2:"13";uri|s:31:"/yimai/index.php?act=view&id=41";', 1432084479),
('bohcrgdau2kdm1dj0pk6ev3md2', 'uri|s:17:"www.baidu.com:443";', 1456788477),
('cmna8tkfc9o4it7fbgglj773m1', 'captcha|s:4:"tt2p";u_id|s:1:"7";gettId|s:2:"13";', 1432087488),
('cnatlcem1teodv166ilfandal3', 'uri|s:32:"vip163mx01.mxmail.netease.com:25";', 1456813369),
('cpqpm2qi7t440i1ffo2dkosad3', 'gettId|s:2:"13";', 1432085885),
('ctdsca56md5blfki73thep9cv3', 'uri|s:29:"163mx02.mxmail.netease.com:25";', 1456797114),
('d3oktv3h160irlic4lmkrt6qq3', 'uri|s:22:"http://www.zhenai.com/";', 1456782705),
('d5n83hhd0jnoemt38hkukq3p87', 'captcha|s:4:"5mPs";u_id|s:1:"7";gettId|s:2:"12";', 1432048377),
('dd21vcat6edhbbgof07tkleiq3', 'uri|s:1:"/";', 1456808487),
('ddv0jl7bqtre8g8sc4dv83bu74', 'uri|s:26:"/DaoGou/web/index.php?id=3";', 1456149602),
('e2ecos1obna74ifbut1l7rh2u5', 'uri|s:32:"/index.php?act=index&page=2&id=1";', 1456798621),
('e6u9em9grat1rl62ic6s7lfen3', 'captcha|s:4:"yUx5";', 1432054067),
('e815146p5hvruki3n5ggc4rte4', 'uri|s:1:"/";', 1456765953),
('ecfc1s6ektq4p9cvo17bsr1jp3', 'uri|s:10:"/index.php";', 1456756920),
('ehuef37rfc81everqve3a2jvu1', 'captcha|s:4:"2inf";', 1432055510),
('etj01n9ba3f1grd1kp8t4lf874', 'uri|s:1:"/";', 1456801490),
('f207m86rb5nhu64e2oi2fnjd41', 'uri|s:1:"/";', 1456765987),
('f5nqcn4elaep4c14lq9jrni9f7', 'uri|s:17:"www.baidu.com:443";', 1456770280),
('fgd4tehcvhsno2cusubi4mjal3', 'uri|s:24:"http://zhidao.baidu.com/";', 1456767841),
('fldo2f1n5k1crsfsjqs5ejn944', 'uri|s:20:"http://mail.163.com/";', 1456780996),
('frmcj5cdur5dv9ns287s9uf915', 'uri|s:21:"http://www.hzins.com/";', 1456782710),
('gavn584m5l7luhbkke2q6m86u3', 'captcha|s:4:"Jxnq";uri|s:25:"/index.php?act=view&id=43";user_id|s:1:"4";orderGoods|a:7:{s:4:"u_id";s:1:"4";s:4:"g_id";s:2:"43";s:7:"sess_id";s:26:"gavn584m5l7luhbkke2q6m86u3";s:6:"c_name";s:7:"iPhone6";s:7:"c_price";s:7:"5299.00";s:8:"c_number";s:1:"1";s:6:"g_code";s:8:"YM000008";}totalPrice|s:4:"5299";orderNumber|s:10:"0000000006";orderId|s:1:"8";', 1432089289),
('gfhjms4c958a70fmi8dms5nhn5', 'uri|s:25:"/index.php?act=view&id=43";captcha|s:4:"E3g7";user_id|s:1:"6";orderGoods|a:7:{s:4:"u_id";s:1:"6";s:4:"g_id";s:2:"43";s:7:"sess_id";s:26:"gfhjms4c958a70fmi8dms5nhn5";s:6:"c_name";s:7:"iPhone6";s:7:"c_price";s:7:"5299.00";s:8:"c_number";s:1:"1";s:6:"g_code";s:8:"YM000008";}totalPrice|s:4:"5299";orderNumber|s:10:"0000000008";orderId|s:2:"10";', 1432090574),
('ghqsjf2jqlq9s5o029qlfliis5', 'uri|s:22:"http://phtv.ifeng.com/";', 1456807056),
('gucv35qtiosvnt4agsc09it7r2', 'uri|s:22:"http://www.lmbang.com/";', 1456801549),
('h5a7rdh89egcqnutl6lg7ukc64', 'uri|s:33:"/DaoGou/index/index.php?k=clothes";', 1456659904),
('hiad6jc1k696uv13mo430f78t1', '', 1432085070),
('hktc9bb0pehckoh2e0v0hn2hm2', 'uri|s:1:"/";', 1456808438),
('hp04hj0a53e7qipp01vld8vav7', 'uri|s:25:"/index.php?act=view&id=41";captcha|s:4:"CzbA";user_id|s:1:"4";orderGoods|a:7:{s:4:"u_id";s:1:"4";s:4:"g_id";s:2:"41";s:7:"sess_id";s:26:"hp04hj0a53e7qipp01vld8vav7";s:6:"c_name";s:9:"婴贝儿";s:7:"c_price";s:5:"48.00";s:8:"c_number";s:1:"3";s:6:"g_code";s:8:"YM000006";}', 1432088783),
('hqntf03lnsok121snbrefrmn33', 'captcha|s:4:"usfd";userreset|s:2:"12";u_id|s:1:"7";gettId|s:2:"13";id|s:1:"4";', 1432055066),
('ivgucmd1t9qpt3akntcnnk3rh7', 'uri|s:17:"http://azenv.net/";', 1456803482),
('j55sp3tpctq83mmqp0hib5cv41', 'uri|s:25:"/index.php?act=view&id=44";captcha|s:4:"vRW8";', 1432089286),
('jnmivo7442cm2lpmph5v2q3po1', 'uri|s:1:"/";', 1456777618),
('jqkhi1n8a2ipgbjkhcspfl15t2', 'uri|s:1:"/";', 1456765969),
('kuk83orl4802rj332qlqj3vsn0', 'uri|s:1:"/";', 1456786610),
('l1bnaddlj5ju8vbefbgdj79755', 'captcha|s:4:"P1tY";user_id|s:1:"5";uri|s:25:"/index.php?act=view&id=41";orderGoods|a:7:{s:4:"u_id";s:1:"5";s:4:"g_id";s:2:"41";s:7:"sess_id";s:26:"l1bnaddlj5ju8vbefbgdj79755";s:6:"c_name";s:9:"婴贝儿";s:7:"c_price";s:5:"48.00";s:8:"c_number";s:1:"1";s:6:"g_code";s:8:"YM000006";}', 1432090065),
('ldv7s8b5ftjvj4okmt93a87nn0', 'uri|s:1:"/";', 1456777603),
('m4nicurg3eampph73jvjf5i7n2', 'uri|s:20:"search.yahoo.com:443";', 1456777050),
('mrp9pikv6hepqg2kqikbcbiid7', 'uri|s:1:"/";', 1456797817),
('mrvm4q0nq64bn2up69n5musea7', 'uri|s:25:"/index.php?act=view&id=41";captcha|s:4:"fPVR";user_id|s:1:"4";orderGoods|a:7:{s:4:"u_id";s:1:"4";s:4:"g_id";s:2:"43";s:7:"sess_id";s:26:"gavn584m5l7luhbkke2q6m86u3";s:6:"c_name";s:7:"iPhone6";s:7:"c_price";s:7:"5299.00";s:8:"c_number";s:1:"1";s:6:"g_code";s:8:"YM000008";}u_id|s:1:"7";gettId|s:2:"13";', 1432089321),
('n5te118s513cv24h65nqm4h094', 'uri|s:1:"/";', 1456796992),
('nblvs2vcp0tdc08ag91shojrj4', 'uri|s:23:"http://www.gome.com.cn/";', 1456807079),
('ng3bmno137qm6co228m16devm5', 'uri|s:10:"/index.php";', 1456797327),
('ni0hviajs6s07eoud1d3ibj9i5', 'uri|s:1:"/";', 1456798786),
('ntmdpekdriqfsaljr6aaqo7ji3', 'uri|s:26:"/DaoGou/web/index.php?id=2";', 1455348697),
('pr1l96ghfajgihf5aag3rgv3r6', 'uri|s:10:"/index.php";', 1456756964),
('q12st7juo7he0qqrusc90b0o06', 'uri|s:1:"/";', 1456810609),
('q6tki9d71vtppms8lvfkdp1kc7', 'uri|s:27:"http://finance.sina.com.cn/";', 1456762416),
('qaug9uiarjh09l2dqujhc0enj0', 'uri|s:25:"/index.php?act=view&id=41";captcha|s:4:"AVDx";user_id|s:1:"4";orderGoods|a:7:{s:4:"u_id";s:1:"4";s:4:"g_id";s:2:"41";s:7:"sess_id";s:26:"qaug9uiarjh09l2dqujhc0enj0";s:6:"c_name";s:9:"婴贝儿";s:7:"c_price";s:5:"48.00";s:8:"c_number";s:1:"1";s:6:"g_code";s:8:"YM000006";}totalPrice|s:2:"48";orderNumber|s:10:"0000000007";orderId|s:1:"9";', 1432090223),
('qisskil05fo1l0ijeadha4ovc2', 'captcha|s:4:"d6CH";uri|s:25:"/index.php?act=view&id=43";u_id|s:1:"7";gettId|s:2:"13";', 1432086079),
('r2gdv27sopdumri5gkgtfnt652', 'uri|s:1:"/";', 1456776001),
('r5j737fnv6n6e38hci14f2mfr5', 'captcha|s:4:"g4dm";userreset|s:2:"12";u_id|s:2:"12";', 1432054866),
('r7bmom5dsvg51uhvbku4kp13i3', '', 1432087817),
('r7pbrs54chqd6o7gdgr30iruh6', 'uri|s:20:"search.yahoo.com:443";', 1456777050),
('rmq8f0tt956s04vkq0hmnie832', 'uri|s:21:"http://www.dajie.com/";', 1456765249),
('rttrrv3e723rbt5d22bm0k32r0', 'uri|s:10:"/index.php";', 1456756965),
('rurj2nhlccqn9i5tomfrfq41s0', 'uri|s:23:"/DaoGou/index/index.php";', 1456756255),
('s6ckpp3srq1jdcjgm7ddhlnkl2', '', 1432088687),
('snustll21pgumtnk8vf77g5jk1', 'uri|s:17:"www.baidu.com:443";', 1456816065),
('tla1u21o4k4j4sg4fnsb6lsth6', 'uri|s:27:"http://www.tencentmind.com/";', 1456782709),
('to9bu1j441v0eb477jtsbof3n3', 'uri|s:17:"www.baidu.com:443";', 1456775255),
('u8mql38s0369clt36g0gjlspp1', 'captcha|s:4:"KKl5";', 1432054529),
('ubqtfsldsh6tvfgm6djal8c666', 'uri|s:25:"/index.php?act=view&id=43";captcha|s:4:"cTjq";', 1432090504),
('uda6b1fvuasp7o0mbehjgtc9g2', 'uri|s:32:"/index.php?act=index&page=2&id=1";', 1456757559),
('us550oukgpmtnrsptahulac340', 'uri|s:1:"/";', 1456797816),
('v2pu8qm5j116d5od7b36h7g5m7', '', 1432087741),
('vk2ci0h5i0odh0cm6qees0ok16', 'uri|s:1:"/";', 1456775991),
('vluko9e18hlmvjjjgqdommvu61', 'uri|s:17:"www.baidu.com:443";', 1456793258),
('vnqbvqlogobcr2ua24f784je57', 'userreset|s:2:"12";captcha|s:4:"hBRN";', 1432055525),
('vsfjftg1s7kcm58ct4kug12775', 'uri|s:17:"http://azenv.net/";', 1456773268);

-- --------------------------------------------------------

--
-- 表的结构 `szg_source`
--

CREATE TABLE `szg_source` (
  `id` int(11) NOT NULL,
  `mallName` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '商城名'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `szg_source`
--

INSERT INTO `szg_source` (`id`, `mallName`) VALUES
(1, '天猫'),
(2, '淘宝'),
(3, '京东'),
(4, '1号店');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `szg_admin`
--
ALTER TABLE `szg_admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `a_username` (`a_username`);

--
-- Indexes for table `szg_category`
--
ALTER TABLE `szg_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `szg_goods`
--
ALTER TABLE `szg_goods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `g_name` (`g_name`);

--
-- Indexes for table `szg_guestbook`
--
ALTER TABLE `szg_guestbook`
  ADD PRIMARY KEY (`g_id`);

--
-- Indexes for table `szg_news`
--
ALTER TABLE `szg_news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `szg_order_goods`
--
ALTER TABLE `szg_order_goods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `szg_order_info`
--
ALTER TABLE `szg_order_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `i_number` (`i_number`);

--
-- Indexes for table `szg_session`
--
ALTER TABLE `szg_session`
  ADD PRIMARY KEY (`sess_id`);

--
-- Indexes for table `szg_source`
--
ALTER TABLE `szg_source`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `szg_admin`
--
ALTER TABLE `szg_admin`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- 使用表AUTO_INCREMENT `szg_category`
--
ALTER TABLE `szg_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- 使用表AUTO_INCREMENT `szg_goods`
--
ALTER TABLE `szg_goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;
--
-- 使用表AUTO_INCREMENT `szg_guestbook`
--
ALTER TABLE `szg_guestbook`
  MODIFY `g_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户id', AUTO_INCREMENT=37;
--
-- 使用表AUTO_INCREMENT `szg_news`
--
ALTER TABLE `szg_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `szg_order_goods`
--
ALTER TABLE `szg_order_goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- 使用表AUTO_INCREMENT `szg_order_info`
--
ALTER TABLE `szg_order_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- 使用表AUTO_INCREMENT `szg_source`
--
ALTER TABLE `szg_source`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
