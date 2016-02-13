<?php

	//分页工具类
	class Page{
	
	
		//无属性，使用静态方法

		/*
		 *获取分页链接字符串
		 *@parameter1 string $script 当前脚本的路径
		 *@parameter2 string $act 请求分页的动作
		 *@parameter3 int $counts 数据表内记录总数
		 *@parameter4 int $pagecount 每一页显示的记录数
		 *@parameter5 int $page 当前页数
		 *return string 返回一个分页链接的字符串
		 */
		public static function getPageStr($script,$act,$counts,$page,$pagecount,$c_id){

			$pages = ceil(($counts / $pagecount));

			$prev = $page > 1 ? $page - 1 : 1;
			$next = $page < $pages ? $page + 1 : $pages;

			$showPages = 5;
			$pageOffset = ($showPages - 1) / 2;
			$start = 1;
			$end = $pages;


			//显示分页信息
			$display = '';
			$display .= "<span id='display'>一共有{$counts}条记录，总共有{$pages}页，当前为第{$page}页</span>";

			$beginClick=<<<END
					<span id='click'>
END;
			$endClick=<<<END
					</span>
END;
			$beginSpan=<<<END
					<span class='current'>
END;
			$endSpan=<<<END
					</span>
END;
			//变量后加页数的值
			$currentPageFirst=<<<END
					<a href="{$script}?act={$act}&page=
END;
			//变量后加页数的值
			$currentPageSecond=<<<END
					&id={$c_id}">
END;
			$currentPageThird=<<<END
					</a>
END;
			$firstPage=<<<END
					<a href="{$script}?act={$act}&page=1&id={$c_id}">首页</a>
END;
			$prePage=<<<END
					<a href="{$script}?act={$act}&page={$prev}&id={$c_id}"><上一页</a>
END;
			$nextPage=<<<END
					<a href="{$script}?act={$act}&page={$next}&id={$c_id}">下一页></a>
END;
			$endPage=<<<END
					<a href="{$script}?act={$act}&page={$pages}&id={$c_id}">尾页</a>
END;

			$clickStr = "";

			if($page > 1){
				$clickStr .= $beginClick.$firstPage.$prePage;

			}

			//总页数大于显示页数时
			if($pages > $showPages){
				if($page > $pageOffset + 1){
					$clickStr .= '...';
				}


				if($page > $pageOffset){
					$start = $page - $pageOffset;
					$end = $pages > ($page + $pageOffset) ? $page + $pageOffset : $pages;
				}
				//page为1或者2时
				else{
					$start = 1;
					$end = $pages > $showPages ? $showPages : $pages;
				}

				if($page + $pageOffset > $pages){
					$start = $page - ($page + $pageOffset - $end);
					$end = $pages;
				}
			}

			//打印显示的页码
			for($i = $start; $i <= $end; $i++){
				//当前页码的样式设定
				if($page == $i){
					$clickStr .= $beginSpan. $i .$endSpan;
				}else
					$clickStr .= $currentPageFirst. $i . $currentPageSecond. $i . $currentPageThird;
			}

			//后方加...
			if($pages > $showPages && $pages > $page + $pageOffset){
				$clickStr .= '...';
			}


			if($page < $pages){
				$clickStr .= $nextPage.$endPage.$endClick;
			}

			/* //显示所有页数
			$list='';

			for($i = 1;$i <= $pages;$i++){
				
				$list .= "&nbsp;<a href='{$script}?act={$act}&page={$i}'>".$i.'</a>&nbsp;';
			}

			//选择分页
			$select = "<span id='select'><select onchange=\"location.href='{$script}?act={$act}&page='+this.value\">";
			for($i = 1;$i <= $pages;$i++){
				if($i == $page){
					$select .= "<option value='{$i}' selected='selected'>{$i}</option>";
				}else{
					$select .= "<option value='{$i}'>{$i}</option>";
				}
			}
			$select .= '</select></span>';

			//输入分页
			$form=<<<END
				<form action="{$script}" method='get' id='form' style="display:inline;">
					<input type='hidden' name='act' value="{$act}">
					<input type='text' name='page' onfocus="this.value=''"/>
					<input type='submit' value='跳转' />
				</from>
END;

	
			return $display.$click.$list.$select.$form;*/
			return $display.$clickStr;
		}

		public static function getPageString($script,$act,$counts,$page,$pagecount){
			
			$pages = ceil(($counts / $pagecount));

			$prev = $page > 1 ? $page - 1 : 1;
			$next = $page < $pages ? $page + 1 : $pages;

			//显示分页信息
			$display = '';
			$display .= "<span id='display'>一共有{$counts}条记录，总共有{$pages}页，当前为第{$page}页</span>";
			
			//点击分页
			$click=<<<END
				<span id='click'>
					<a href="{$script}?act={$act}&page=1">首页</a>
					<a href="{$script}?act={$act}&page={$prev}">上一页</a>
					<a href="{$script}?act={$act}&page={$next}">下一页</a>
					<a href="{$script}?act={$act}&page={$pages}">尾页</a>
				</span>
END;

			/*//显示所有页数
			$list='';

			for($i = 1;$i <= $pages;$i++){
				
				$list .= "&nbsp;<a href='{$script}?act={$act}&page={$i}'>".$i.'</a>&nbsp;';
			}

			//选择分页
			$select = "<span id='select'><select onchange=\"location.href='{$script}?act={$act}&page='+this.value\">";
			for($i = 1;$i <= $pages;$i++){
				if($i == $page){
					$select .= "<option value='{$i}' selected='selected'>{$i}</option>";
				}else{
					$select .= "<option value='{$i}'>{$i}</option>";
				}
			}
			$select .= '</select></span>';

			//输入分页
			$form=<<<END
				<form action="{$script}" method='get' id='form' style="display:inline;">
					<input type='hidden' name='act' value="{$act}">
					<input type='text' name='page' onfocus="this.value=''"/>
					<input type='submit' value='跳转' />
				</from>
END;

	
			return $display.$click.$list.$select.$form;*/
			return $display.$click;
		}
}