<?php  
header("Content-type: text/html; charset=utf-8"); 

// $t = new thread_run('日用',true);
// $t->start();

// $t->api_data_get('日用',true);

class InsertDB
{
	public $result_data;
	public $goods;
	public $mall_id;
	public $category_id;
	
	public function __construct($good,$data)
	{	
		$this->result_data = $data;
        $goods =$good;
	}

	public function run_insert()
	{
		// print_r($this->result_data);
		global $goods;
		foreach($this->result_data as $item){
			 // echo $item->title.'----'.$item->item_url.'<br/><br/>';
			// echo 'g_id--'.$item['g_id'].'--g_name--'.($item['g_name']).'--m_id--'.$item['m_id'].'--c_id--'.$item['c_id'].'--g_price--'.($item['g_price']).'--g_bar_price--'.($item['g_bar_price']).'--g_url--'.$item['g_url'].'--g_image--'.($item['g_image']).'<br/>';
			
			$this->insert_data($goods,$item['g_id'],$item['g_name'],$item['m_id'],$item['c_id'],$item['g_price'],$item['g_bar_price'],$item['g_url'],$item['g_image']);
		
		}
	}
	
	
	
	/**
	 * 插入数据方法
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
		$goods->insertGoods($good_id,$good_name,$mall_id,$category_id,$good_price,$good_bar_price,$good_url,$good_image);
	}
}  
?>  