<?php
	error_reporting(E_ALL);
	$config = include_once "../config/config.php";
	include "../includes/core/MyPDO.class.php";
	include "../includes/model/Category.class.php";
	include "../includes/model/MallSource.class.php";
	include "../includes/model/Goods.class.php";
	include "insert_db.php";
    include "TopSdk.php";
    date_default_timezone_set('Asia/Shanghai');
	$appkey = '23329942';
	$secretKey = '96a5402b10955deea6c2d4a7d967f5e1';
	$client = new TopClient;
	$client->appkey = $appkey;
	$client->secretKey = $secretKey;

	$productCount = 1000;  //每一种类的商品需要获取的数据量
	$pageCount = 10;    //需要存储记录的总页数
	$pageSize = 100;     //每一页的记录数
	
	/**
	* 获取商城id
	*/
	$mallSouce = new MallSource();
	$isTMall = false;
	$isTMallStr = 'true';
	if($isTMall){
		$mallName = '天猫';
	}else{
		$mallName = '淘宝';
		$isTMallStr = 'false';
	}

	$mall_id = $mallSouce->getMallId($mallName);

	/**
	 * 获取类型
	 */
	$cate = new Category();
	$categories = $cate->getCategory();
	$index = 1;

	$goodMethods = new Goods();
	
	ob_start();//打开输出控制缓冲
    ob_end_flush();//输出缓冲区内容并关闭缓冲
    ob_implicit_flush(1);//立即输出
	
	foreach($categories as $key => $category){

		if($index >1)
			break;
		$p_thread = [];
		
		$record_results = api_results_get($client,$category['c_name'],$isTMallStr);
		// echo $record_results;
		
		// 搜索记录数不足需要的记录量，则全部获取，如果超出需要的量，则只取需要的数据量
		if($record_results < $productCount){
			$pageCount = floor($record_results / $pageSize) + 1;
		}else{
			$pageCount = ($productCount / $pageSize);
		}
		
		
		for($page = 1; $page <= $pageCount; $page++){
			$data = api_data_get($client,$category['c_name'],$isTMallStr,$page,$pageSize);
			$product_info = analyseResults($data,$mall_id,$category['id']);
			
			$insertToDB = new InsertDB($product_info);
			
			$insertToDB->run_insert($goodMethods);
		}
			
		$index++;
		 sleep(2);
        ob_flush();//输出缓冲区中的内容
        flush();//刷新输出缓冲
	}
	
	/**
	*获取本次查询的总记录数
	*/
	function api_results_get($client,$category,$isTMallStr)
	{
		$req = new TbkItemGetRequest;
		$req->setFields("num_iid");
		$req->setQ($category);

		$pageStr = '1';
		$pageSizeStr = '10';
		
		$req->setIsTmall($isTMallStr);
		$req->setStartPrice("9");
		$req->setEndPrice("10");
		 $req->setPageNo($pageStr);
		 $req->setPageSize($pageSizeStr);

		$resp = $client->execute($req);
		// print_r($resp);
		$totalResults = $resp->total_results;
		return $totalResults;
	}

	/**
	* 获取查询的记录信息
	*/
	function api_data_get($client,$category,$isTMallStr,$page,$pageSize)
	{
		$req = new TbkItemGetRequest;
		$req->setFields("num_iid,title,pict_url,small_images,reserve_price,zk_final_price,item_url,user_type");
		$req->setQ($category);

		$pageStr = ''.$page;
		$pageSizeStr = ''.$pageSize;
		
		//	$req->setCat("16,18");
		// $req->setItemloc("杭州");
		$req->setSort("tk_rate_des");
		$req->setIsTmall($isTMallStr);
		// $req->setIsOverseas("false");
		$req->setStartPrice("9");
		$req->setEndPrice("10");
		// $req->setStartTkRate("123");
		// $req->setEndTkRate("123");
		// $req->setPlatform("1");
		 $req->setPageNo($pageStr);
		 $req->setPageSize($pageSizeStr);

		$resp = $client->execute($req);
		return $resp;
	}


	/**
	 * 解析api返回的数据并将数据入库
	 * @param $result
	 */
	function analyseResults($api_result,$mall_id,$category_id){
		$results = $api_result->results;
		$items = $results->n_tbk_item;
		$products_value = array();
		$index = 0;
		foreach($items as $item){
			$products_value[$index] = array('g_id'=>(string)($item[0]->num_iid),'g_name'=>(string)($item->title),'m_id'=>$mall_id,'c_id'=>$category_id,'g_price'=>(string)($item->reserve_price),'g_bar_price'=>(string)($item->zk_final_price),'g_url'=>(string)($item->item_url),'g_image'=>(string)($item->pict_url));
			$index++;
		}
		return $products_value;
	}



?>