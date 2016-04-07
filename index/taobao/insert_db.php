<?php  
header("Content-type: text/html; charset=utf-8"); 

class InsertDB
{
	public $result_data;

	public function __construct($data)
	{	
		$this->result_data = $data;
	}

	/*
	* 批量插入更新数据
	*/
	public function run_insert($goodMethods)
	{
		$sqlStr = "insert into szg_goods(g_id,g_name,mall_id,c_id,g_price,g_bar_price,g_image,g_url,g_addtime) values";
		foreach($this->result_data as $item){
			echo 'g_id--'.$item['g_id'].'--g_name--'.($item['g_name']).'--m_id--'.$item['m_id'].'--c_id--'.$item['c_id'].'--g_bar_price--'.$item['g_bar_price'].'--g_url--'.$item['g_url'].'<br/>';
			
			 $sqlStr = $sqlStr.'(\''.$item['g_id'].'\',\''.$item['g_name'].'\','.$item['m_id'].','.$item['c_id'].','.$item['g_price'].','.$item['g_bar_price'].',\''.$item['g_image'].'\',\''.$item['g_url'].'\',now()),';
		}
		
		$sqlStr = substr($sqlStr,0,strlen($sqlStr)-1). '  ON DUPLICATE KEY UPDATE g_name = values(g_name),mall_id = values(mall_id),c_id = values(c_id),g_price=values(g_price),g_bar_price=values(g_bar_price),g_image=values(g_image),g_url=values(g_url),g_updatetime=now()';
		// echo $sqlStr;
		
		//数据插入更新
		$goodMethods->insertGoods($sqlStr);
	}
	
	/**
	 * 单条记录插入
	 * @param $good_id
	 * @param $good_name
	 * @param $mall_id
	 * @param $category_id
	 * @param $good_price
	 * @param $good_bar_price
	 * @param $good_url
	 * @param $good_image
	 */
	function insert_data($goods,$good_id,$good_name,$mall_id,$category_id,$good_price,$good_bar_price,$good_url,$good_image){
		$goods->insertGood($good_id,$good_name,$mall_id,$category_id,$good_price,$good_bar_price,$good_url,$good_image);
	}
}  
?>  