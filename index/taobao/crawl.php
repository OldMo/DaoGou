<?php
	error_reporting(E_ALL);
	$config = include_once "../config/config.php";
	include "../includes/core/MyPDO.class.php";
	include "../includes/model/Category.class.php";

    include "TopSdk.php";
    date_default_timezone_set('Asia/Shanghai');
	$appkey = '23329942';
	$secretKey = '96a5402b10955deea6c2d4a7d967f5e1';
	$client = new TopClient;
	$client->appkey = $appkey;
	$client->secretKey = $secretKey;

	
	
	$isTMall = true;
	if($isTMall)
		$source = 'tmall';
	else
		$source = 'taobao';

		
	/**
	 * 获取类型
	 */
	$cate = new Category();
	$categories = $cate->getCategory();
	$index = 1;

	foreach($categories as $key => $category){

		for($page = 1; $page <= 10; $page++){
//			$data = api_data_get($client,$category['c_name'],$isTMall,$page);
			echo $category['c_name'].'---'.$isTMall.'---'.$page;
		}

		if($index >3)
			break;
			
		$index++;
	}

	function api_data_get($client,$category,$isTMall,$page)
	{
		$req = new TbkItemGetRequest;
		echo '1';
		$req->setFields("num_iid,title,pict_url,small_images,reserve_price,zk_final_price,item_url,user_type");
		$req->setQ($category);

		//	$req->setCat("16,18");
		// $req->setItemloc("杭州");
		// $req->setSort("tk_rate_des");
		$req->setIsTmall($isTMall);
		// $req->setIsOverseas("false");
		$req->setStartPrice("9");
		$req->setEndPrice("10");
		// $req->setStartTkRate("123");
		// $req->setEndTkRate("123");
		// $req->setPlatform("1");
		 $req->setPageNo($page);
		 $req->setPageSize("100");

		$resp = $client->execute($req);

//		$totalResults = $resp->total_results;
//		echo 'totalResults:'.$totalResults.'<br/>';
		return $resp;
	}


	
	
	
	
	
//	class thread_run extends Thread
//	{
//
//		public $category;
//		public $data;
//		public $isTMall;
//
//		public function __construct($category, $isTMall)
//		{
//			$this->category = $category;
//			$this->isTMall = $isTMall;
//		}
//
//		public function run()
//		{
//
//			echo $this->category . '--' . $this->isTMall . '<br/>';
//			$this->data = $this->api_data_get($this->category, $this->isTMall);
//		}
//	}







//	print_r($resp);

	/**
	 * 存储xml文件
	 */
//	$filename = 'xml/'.date('YmdH', time()).'-'.$source.'.xml';
//	$resp->asXml($filename);




?>