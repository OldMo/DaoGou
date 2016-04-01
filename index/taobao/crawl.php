<?php
	error_reporting(E_ALL);
	$config = include_once "../config/config.php";
	include "../includes/core/MyPDO.class.php";
	include "../includes/model/Category.class.php";
	include "../includes/model/Goods.class.php";
	include "get.php";
    include "TopSdk.php";
    date_default_timezone_set('Asia/Shanghai');
	$appkey = '23329942';
	$secretKey = '96a5402b10955deea6c2d4a7d967f5e1';
	$client = new TopClient;
	$client->appkey = $appkey;
	$client->secretKey = $secretKey;

	$pageCount = 1;
	$pageSize = 10;
	
	$isTMall = true;
	if($isTMall)
		$source = 'tmall';
	else
		$source = 'taobao';

	
	
	$mall_id = 1;
	/**
	 * 获取类型
	 */
	$cate = new Category();
	$categories = $cate->getCategory();
	$index = 1;

	foreach($categories as $key => $category){

		if($index >1)
			break;
		$p_thread = [];
		for($page = 1; $page <= $pageCount; $page++){
			$data = api_data_get($client,$category['c_name'],$isTMall,$page,$pageSize);
			$product_info = analyseResults($data,$mall_id,$category['id']);
			 $insertToDB = new thread_db_insert($product_info);
			
			 $p_thread[$page-1] = $insertToDB;
			
			 // print_r($product_info);
		}
		
		foreach($p_thread as $p){
			$p->start();
		}

		
			
		$index++;
	}

	function api_data_get($client,$category,$isTMall,$page,$pageSize)
	{
		$req = new TbkItemGetRequest;
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
		 $req->setPageSize($pageSize);

		$resp = $client->execute($req);

//		$totalResults = $resp->total_results;
//		echo 'totalResults:'.$totalResults.'<br/>';
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
			 // echo $item->title.'----'.$item->item_url.'<br/><br/>';
			$products_value[$index] = array('g_id'=>(string)($item[0]->num_iid),'g_name'=>(string)($item->title),'m_id'=>$mall_id,'c_id'=>$category_id,'g_price'=>(string)($item->reserve_price),'g_bar_price'=>(string)($item->zk_final_price),'g_url'=>(string)($item->item_url),'g_image'=>(string)($item->pict_url));
			// $this->insert_data($item->num_iid,$item->title,$this->mall_id,$this->category_id,$item->reserve_price,$item->zk_final_price,$item->item_url,$item->pict_url);
			$index++;
		}
		return $products_value;
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