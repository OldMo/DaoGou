<?php
//商品分类

  class Category extends MyPDO{
    //属性
	 protected $table ='szg_category';
	 
	 /*
	  * 查询分类 数据
	  * return 数组，失败返回 空数组
	 */
     public function getCategory($stop_id = 0){
	   //组织SQL
	   $sql = "select * from szg_category";

	   //执行sql
	   $products= $this->db_getAll($sql);
	   //调用无限级分类
	    return $this->Nolist($products,0,$stop_id);
	  }

	  /*
	    * 无限级分类
		* @ param1 array $products 要分类的数组
		* @ param2 int $parent_id  分类的id
		* @ param3 int $stop_id 不显示的分类的ID
		* @ Param4 int $level  缩进的层级
		* return 成功返回分类好的数组，失败返回false
	  */
	  private function Nolist($products,$parent_id,$stop_id=0,$level=0){
	   //定义一个数组来保存分类好的数据 
	   static $list=array();

	   //遍历数组找出所有需要分类的顶级类 
		 foreach($products as $pro){
		  //判断遍历出的结果是否符合顶级分类
		   if($pro['c_parent_id'] == $parent_id && $pro['id'] != $stop_id){

			  //符合当前层级:将当前层级属性添加到对应的属性列表
			  $pro['level']=$level;

		     //符合要求:存放到数组中
			  $list[]=$pro;
              $this->Nolist($products,$pro['id'],$stop_id,$level+1);
		   }	
	    }
	    //返回对应数组
		return $list;
	 }

	  /*
     * 根据商城名查询商城ID
     * return id
    */
	  public function getCategoryId($categoryName){
		  //组织SQL
		  $sql = "select * from szg_category where c_name ='".$categoryName."'";
		  //执行sql
		  $c = $this->db_getOne($sql);
		  return $c;
	  }
  }
  