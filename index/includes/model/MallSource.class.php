 <?php
  //商城信息类
class MallSource extends MyPDO{
//属性
	 protected $table ='szg_source';
	 
	 /*
	  * 查询分类 数据
	  * return 数组，失败返回 空数组
	 */
	 public function getMallSource(){
	   //组织SQL
	   $sql = "select * from szg_source";

	   //执行sql
	   $sources= $this->db_getAll($sql);
	   //调用无限级分类
		return $sources;
	  }
}
	  
?>