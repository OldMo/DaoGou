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

	class thread_run extends Thread   
	{
		public $data;
		public $goods;
		public function __construct($data)
		{
			$this->data = $data;
			$this->goods = new Goods();
		}

		public function run()
		{

			echo $this->category.'--'.$this->isTMall.'<br/>';
			$this->insert_data($this->goods);
		}  
		
		function insert_data($goodsDB){
			$goodsDB->insertGoods();
			
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
			echo 'totalResults:'.$totalResults.'<br/>';
			return $totalResults;
		}  
	}  
    ?>  