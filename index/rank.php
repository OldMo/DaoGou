<?php

	//首页文件

	//接受用户动作
	$act = isset($_REQUEST['act']) ? $_REQUEST['act'] : 'index';
	
	//加载初始化文件
	include_once './includes/init.php';

	//判断动作，处理动作
	if($act == 'index'){
		

		$_SESSION['uri'] = $_SERVER['REQUEST_URI'];

		//获取分类ID
		if(empty($_GET["id"])) {
			 $c_id = 4;
		}else{
			$c_id = $_GET['id'];
		 }

		//接受商品列表显示页码
		$page = isset($_GET['page']) ? $_GET['page'] : 1;
		$pagecount = $config['pagecount'];
		//var_dump($pagecount);
		//获取该类商品的总记录数
		$goods = new Goods();
		$counts = $goods->getCartGoodsCounts($c_id)['c'];
		//var_dump($counts);
		$pages = ceil($counts / $pagecount);
		//var_dump($pages);exit;
		//对用户传递$page进行判断
		if(!is_numeric($page) || $page > $pages || $page < 1){
			$page=1;
		}

		$cartGoods = $goods->getGoodsByCartId($c_id,$page,$pagecount);
		//var_dump($cartGoods);exit;
		
		//分页显示
		//分页链接字符串
		$pageString = Page::getPageStr('rank.php','index',$counts,$page,$pagecount,$c_id);
		 
		 
		//加载首页显示模板
		include_once YIMAI_TEMP.'rank.html';

	}