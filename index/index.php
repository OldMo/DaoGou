<?php

	//首页文件

	//接受用户动作
	$act = isset($_REQUEST['act']) ? $_REQUEST['act'] : 'index';
	
	//加载初始化文件
	include_once './includes/init.php';

	
	//获取分类ID
	if(empty($_GET["id"])) {
		 $c_id = 0;
	}else{
		$c_id = $_GET['id'];
	 }
	 
	 //获取商城id
	 if(empty($_GET["mall_id"])) {
		 $mall_id = 0;
	}else{
		$mall_id = $_GET['mall_id'];
	}
	
	//查看所有商品分类并显示
	$category = new Category();
	$categories = $category->getCategory();
	$categoryStr="";
	
	if($c_id == 0){
		//没有选择分类，则默认全部分类被选中
		$categoryStr.="<a href=\"./index.php?mall_id=".$mall_id."\" class=\"curcateitem\">\<span class=\"curcateitemword\">全部</span></a>";
	}else{
		$categoryStr.="<a href=\"./index.php?mall_id=".$mall_id."\" class=\"cateitem\"><span class=\"cateitemword\">全部</span></a>";
	}
	
	for($i = 0; $i < count($categories); $i++){
		if($c_id == ($i+1)){
			//分类id对应则显示该分类被选中
			$categoryStr.= "<a href=\"./index.php?mall_id=".$mall_id."&id=".($i+1)."\" class=\"curcateitem\"><span class=\"curcateitemword\">". $categories[$i]['c_name']."</span></a>";
		}else{
			$categoryStr.= "<a href=\"./index.php?mall_id=".$mall_id."&id=".($i+1)."\" class=\"cateitem\"><span class=\"cateitemword\">".$categories[$i]['c_name']."</span></a>";
		}
	}
	
	
	//查看所有商城信息
	$mallSource = new MallSource();
	$sources = $mallSource->getMallSource();
	$mallStr = "";
	if($mall_id == 0){
		//没有选择商城，则默认全部商城被选中
		$mallStr.="<a href=\"./index.php?id=".$c_id."\" class=\"curcateitem\"><span class=\"curcateitemword\">全部</span></a>";
	}else{
		$mallStr.="<a href=\"./index.php?id=".$c_id."\" class=\"cateitem\"><span class=\"cateitemword\">全部</span></a>";
	}
	
	for($i = 0; $i < count($sources); $i++){
		if($mall_id == ($i+1)){
			//商城id对应则显示该分类被选中
			$mallStr.= "<a href=\"./index.php?id=".$c_id."&mall_id=".($i+1)."\" class=\"curcateitem\"><span class=\"curcateitemword\">". $sources[$i]['mallName']."</span></a>";
		}else{
			$mallStr.= "<a href=\"./index.php?id=".$c_id."&mall_id=".($i+1)."\" class=\"cateitem\"><span class=\"cateitemword\">". $sources[$i]['mallName']."</span></a>";
		}
	}
	
	
	$_SESSION['uri'] = $_SERVER['REQUEST_URI'];

	

	//接受商品列表显示页码
	$page = isset($_GET['page']) ? $_GET['page'] : 1;
	$pagecount = $config['pagecount'];

	//获取该类商品的总记录数
	$goods = new Goods();
	$counts = $goods->getCartGoodsCounts($c_id)['c'];

	$pages = ceil($counts / $pagecount);

	//对用户传递$page进行判断
	if(!is_numeric($page) || $page > $pages || $page < 1){
		$page=1;
	}

	$cartGoods = $goods->getGoodsByCartId($c_id,$page,$pagecount);
	
	//分页显示
	//分页链接字符串
	$pageString = Page::getPageStr('index.php','index',$counts,$page,$pagecount,$c_id);
	 
	 
	//加载首页显示模板
	include_once YIMAI_TEMP.'index.html';
