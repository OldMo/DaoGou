<?php  
	set_time_limit(0);
	header("Content-type: text/html; charset=utf-8"); 
    date_default_timezone_set('Asia/Shanghai');


	$dsn = 'mysql:host=localhost;dbname=daogou';
	$db = new PDO($dsn,'root','admin',array(PDO::ATTR_PERSISTENT => true));
	// $db->query('delete from testsql');
	
	$count = 100;
	$testInsert = new InsertDB();
	// $testInsert->run_batch_insert($count,$db);
	// $testInsert->run_batch_insert_update($count,$db);
	// $testInsert->run_insert($count,$db);
	// $testInsert->run_insert_update($count,$db);
	$testInsert->run_insert_transation($count,$db);

class InsertDB
{

	/*
	* 批量插入数据
	*/
	public function run_batch_insert($count,$db)
	{
	
		$t1 = microtime(true);
		$sqlStr = "insert into testsql(g_id,g_name) values";
		for($i = 1; $i <= $count; $i++){
			// echo 'insert_batch g_id--'.$i.'<br/>';
			
			 $sqlStr = $sqlStr.'(\'520310904229\',\'新奇特创意家居韩国实用家庭生活日用品懒人礼物百货小商品神器\'),';
		}
		
		$sqlStr = substr($sqlStr,0,strlen($sqlStr)-1);
		
		//数据插入更新
		// $goodMethods->insertGoods($sqlStr);
		$db->query($sqlStr);
		$t2 = microtime(true);

		echo '合并插入执行时间：'.(($t2-$t1)*1000).'ms'.'<br/>';
	}
	
	
	/*
	* 批量插入更新数据
	*/
	public function run_batch_insert_update($count,$db)
	{
		$t1 = microtime(true);
		$sqlStr = "insert into testsql(g_id,g_name) values";
		for($i = 1; $i <= $count; $i++){
			// echo 'insert_update_batch  g_id--'.$i.'<br/>';
			
			 $sqlStr = $sqlStr.'(\'520310904229\',\'新奇特创意家居韩国实用家庭生活日用品懒人礼物百货小商品神器\'),';
		}
		
		$sqlStr = substr($sqlStr,0,strlen($sqlStr)-1). '  ON DUPLICATE KEY UPDATE g_id=values(g_id),g_name = values(g_name)';
		// echo $sqlStr;
		
		//数据插入更新
		$db->query($sqlStr);
		$t2 = microtime(true);
		echo '合并插入并更新执行时间：'.(($t2-$t1)*1000).'ms'.'<br/>';
	}
	
	/**
	 * 单条记录插入
	 */
	 
	 function run_insert($count,$db){ 
		$t1 = microtime(true);
		for($i = 1; $i <= $count; $i++){
			 // echo 'insert g_id--'.$i.'<br/>';
			$sql="insert into testsql(g_id,g_name) values('520310904229','新奇特创意家居韩国实用家庭生活日用品懒人礼物百货小商品神器')";
			$db->query($sql);
		}
		$t2 = microtime(true);
		echo '单条插入执行时间：'.(($t2-$t1)*1000).'ms'.'<br/>';
		
	}
	
	/**
	 * 单条记录插入更新
	 */
	 
	 function run_insert_update($count,$db){ 
		$t1 = microtime(true);
		for($i = 1; $i <= $count; $i++){
			// echo 'insert_update g_id--'.$i.'<br/>';
			
			$sql="insert into testsql(g_id,g_name) values('520310904229','新奇特创意家居韩国实用家庭生活日用品懒人礼物百货小商品神器') ON DUPLICATE KEY UPDATE g_id=values(g_id),g_name = values(g_name)";
			$db->query($sql);
		}
		$t2 = microtime(true);
		echo '单条插入并更新执行时间：'.(($t2-$t1)*1000).'ms'.'<br/>';
	}
	
	
	/**
	 * 单条记录插入采用事务
	 */
	 
	 function run_insert_transation($count,$db){ 
		$t1 = microtime(true);
		$db->beginTransaction();
		for($i = 1; $i <= $count; $i++){
			 // echo 'insert g_id--'.$i.'<br/>';
			$sql="insert into testsql(g_id,g_name) values('520310904229','新奇特创意家居韩国实用家庭生活日用品懒人礼物百货小商品神器')";
			$db->query($sql);
		}
		$db->commit();
		$t2 = microtime(true);
		echo '单条插入执行时间：'.(($t2-$t1)*1000).'ms'.'<br/>';
		
	}
}  
?>  