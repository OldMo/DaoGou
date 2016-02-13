<?php

	//前台初始化文件

	//设置字符集
	header('content-type:text/html;charset=utf-8');

	//设置目录常量
	define('YIMAI_ROOT',str_replace('includes','',str_replace('\\', '/', __DIR__)));
	define('YIMAI_TEMP',YIMAI_ROOT.'templates/');
	define('YIMAI_INCL',YIMAI_ROOT.'includes/');
	define('YIMAI_CORE',YIMAI_INCL.'core/');
	define('YIMAI_MODE',YIMAI_INCL.'model/');
	define('YIMAI_TOOL',YIMAI_INCL.'tool/');
	define('YIMAI_CONF',YIMAI_ROOT.'config/');

	//定义配置文件变量
	$config = include_once YIMAI_CONF.'config.php';

	//加载公共函数
	include_once YIMAI_INCL.'functions.php';

	//开启session入库
	new Session();
	session_start();