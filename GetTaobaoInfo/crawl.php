<?php
    include "TopSdk.php";
    date_default_timezone_set('Asia/Shanghai'); 
	$appkey = '23329942';
	$secretKey = '96a5402b10955deea6c2d4a7d967f5e1';

	$c = new TopClient;
	$c->appkey = $appkey;
	$c->secretKey = $secretKey;
	$req = new TbkItemGetRequest;
	$req->setFields("title,reserve_price,zk_final_price,item_url");
	$req->setQ("女装");
	$req->setCat("16,18");
	// $req->setItemloc("杭州");
	// $req->setSort("tk_rate_des");
	// $req->setIsTmall("false");
	// $req->setIsOverseas("false");
	 $req->setStartPrice("9");
	 $req->setEndPrice("9");
	// $req->setStartTkRate("123");
	// $req->setEndTkRate("123");
	// $req->setPlatform("1");
	// $req->setPageNo("123");
	// $req->setPageSize("20");
	$resp = $c->execute($req);

	/**
	 * 存储xml文件
	 */
	$filename = 'xml/'.date('YmdHi', time()).'.xml';
	$resp->asXml($filename);


	/**
	 * 提取信息并入库
	 */
	$results = $resp->results;
	$items = $results->n_tbk_item;
	foreach($items as $item)
		echo $item->title.'----'.$item->item_url.'<br/><br/>';
?>