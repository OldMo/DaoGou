 <?php
  //�̳���Ϣ��
class MallSource extends MyPDO{
//����
	 protected $table ='szg_source';
	 
	 /*
	  * ��ѯ���� ����
	  * return ���飬ʧ�ܷ��� ������
	 */
	 public function getMallSource(){
	   //��֯SQL
	   $sql = "select * from ".$table;

	   //ִ��sql
	   $sources= $this->db_getAll($sql);
	   //�������޼�����
		return $sources;
	  }
}
	  
?>