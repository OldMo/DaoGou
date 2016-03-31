    <?php  
	header("Content-type: text/html; charset=utf-8"); 
	include "TopSdk.php";
	$config = include_once "../config/config.php";
	include "../includes/core/MyPDO.class.php";
	include "../includes/model/Goods.class.php";
    date_default_timezone_set('Asia/Shanghai');
	
	$t = new thread_run('日用',true);
	// $t->start();
	
	$t->api_data_get('日用',true);

	class thread_db_insert extends Thread
	{
		public $data;
		public $goods;
		public $mall_id;
		public $category_id;
		public function __construct($data,$mall_id,$category_id)
		{
			$this->data = $data;
			$this->mall_id = $mall_id;
			$this->category_id = $category_id;
			$this->goods = new Goods();
		}

		public function run()
		{

			echo $this->category.'--'.$this->isTMall.'<br/>';
			$this->analyseResults($this->data);
		}

		/**
		 * 解析api返回的数据并将数据入库
		 * @param $result
		 */
		function analyseResults($result){
			$results = $result->results;
			$items = $results->n_tbk_item;
			foreach($items as $item){
				echo $item->title.'----'.$item->item_url.'<br/><br/>';
				$this->insert_data($item->num_iid,$item->title,$this->mall_id,$this->category_id,$item->reserve_price,
					$item->zk_final_price,$item->item_url,$item->pict_url);
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
		function insert_data($good_id,$good_name,$mall_id,$category_id,$good_price,$good_bar_price,$good_url,$good_image){
			$this->goods->insertGoods($good_id,$good_name,$mall_id,$category_id,$good_price,$good_bar_price,$good_url,$good_image);

		}
	}  
    ?>  