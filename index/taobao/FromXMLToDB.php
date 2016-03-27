<?php

    //加载初始化文件
    include_once '../includes/init.php';
    date_default_timezone_set('Asia/Shanghai');
    $mallSources = new MallSource();
    $mid = $mallSources->getMallId('天猫');

    $category = new Category();

    /**
     * 存储xml文件
     */
    $source = tmall;
    $filename = 'xml/'.date('YmdH', time()).'-'.$source.'.xml';
    echo $filename;
    $productXml = simplexml_load_file($filename);

    /**
     * 提取信息并入库
     */
    $results = $productXml->results;
    $items = $results->n_tbk_item;
    foreach($items as $item)
        echo $item->title.'----'.$item->item_url.'<br/><br/>';
?>