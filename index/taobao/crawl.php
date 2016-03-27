<?php
	$config = include_once "../config/config.php";
	include "../includes/core/MyPDO.class.php";
	include "../includes/model/Category.class.php";

    include "TopSdk.php";
    date_default_timezone_set('Asia/Shanghai');
	$appkey = '23329942';
	$secretKey = '96a5402b10955deea6c2d4a7d967f5e1';

	/**
	 * 获取类型
	 */
	$cate = new Category();
	$categories = $cate->getCategory();
	foreach($categories as $c)
	echo $c['id'].$c['c_name'];


	$isTMall = false;
	if($isTMall)
		$source = 'tmall';
	else
		$source = 'taobao';

	$c = new TopClient;
	$c->appkey = $appkey;
	$c->secretKey = $secretKey;
	$req = new TbkItemGetRequest;
	$req->setFields("num_iid,title,pict_url,small_images,reserve_price,zk_final_price,item_url,user_type");
	$req->setQ("母婴");
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
	// $req->setPageNo("123");
	// $req->setPageSize("20");
	$resp = $c->execute($req);
	$totalResults = $resp->total_results;
	echo $totalResults;
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