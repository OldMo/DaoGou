<?php
error_reporting(E_ALL);
	$config = include_once "../config/config.php";
	include "../includes/core/MyPDO.class.php";
	include "../includes/model/Category.class.php";

    include "TopSdk.php";
    date_default_timezone_set('Asia/Shanghai');
	

	
	
	$isTMall = false;
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
		
		$thread_array[$key] = new thread_run($category['c_name'],$isTMall);  
		$thread_array[$key]->start();  
		
		// foreach ($thread_array as $thread_array_key => $thread_array_value)   
        // {  
            // while($thread_array[$thread_array_key]->isRunning())  
            // {  
                // usleep(10);  
            // }  
		// }
		
		// api_data_get($c,$category['c_name'],$isTMall);
	
		if($index >3)
			break;
			
		$index++;
	}


	
	
	
	
	
	class thread_run extends Thread   
	{
	
		public $category;  
		public $data;
		public $isTMall;
		public function __construct($category,$isTMall)
		{
			$this->category = $category;
			$this->isTMall = $isTMall;
		}

		public function run()
		{
		
			echo $this->category.'--'.$this->isTMall.'<br/>';
			$this->data = $this->api_data_get($this->category,$this->isTMall);
		}  
		
		function api_data_get($category,$isTMall)
		{  
			echo '1';
	$appkey = '23329942';
			$secretKey = '96a5402b10955deea6c2d4a7d967f5e1';
			$c = new TopClient;
			$c->appkey = $appkey;
			$c->secretKey = $secretKey;
			$req = new TbkItemGetRequest;
			echo '1';
			$req->setFields("num_iid,title,pict_url,small_images,reserve_price,zk_final_price,item_url,user_type");
			$req->setQ('日用');
			
			//	$req->setCat("16,18");
			// $req->setItemloc("杭州");
			// $req->setSort("tk_rate_des");
			 $req->setIsTmall($isMall);
			// $req->setIsOverseas("false");
			 $req->setStartPrice("9");
			 $req->setEndPrice("10");
			// $req->setStartTkRate("123");
			// $req->setEndTkRate("123");
			// $req->setPlatform("1");
			// $req->setPageNo("123");
			// $req->setPageSize("20");
			
			$resp = $c->execute($req);
			
			$totalResults = $resp->total_results;
			echo 'totalResults:'.$totalResults.'<br/>';
			return $totalResults;
		}  
	}  
	
	
	
//	print_r($resp);

	/**
	 * 存储xml文件
	 */
//	$filename = 'xml/'.date('YmdH', time()).'-'.$source.'.xml';
//	$resp->asXml($filename);


	/**
	 * 提取信息并入库
	 */
//	$results = $resp->results;
//	$items = $results->n_tbk_item;
//	foreach($items as $item)
//		echo $item->title.'----'.$item->item_url.'<br/><br/>';
?>