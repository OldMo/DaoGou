| szg_goods | CREATE TABLE `szg_goods` (
  `g_id` varchar(50) NOT NULL COMMENT '商品id',
  `g_name` varchar(100) NOT NULL COMMENT '商品名字',
  `mall_id` int(11) NOT NULL COMMENT '商城id',
  `c_id` int(11) NOT NULL DEFAULT '1' COMMENT '商品分类',
  `g_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `g_bar_price` decimal(10,2) DEFAULT '88.00' COMMENT '商品特价',
  `g_desc` text COMMENT '商品描述',
  `g_image` varchar(250) DEFAULT NULL COMMENT '商品图片的路径：原图',
  `g_url` varchar(500) DEFAULT NULL COMMENT '商品链接',
  `g_addtime` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '商品添加时间',
  `g_updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`g_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8



| testsql | CREATE TABLE `testsql` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `g_id` varchar(50) DEFAULT NULL,
  `g_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=307434 DEFAULT CHARSET=utf8 |