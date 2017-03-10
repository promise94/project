<?php	if(!defined('IN_PHPMYWIND')) exit('Request Error!');

/*
 * 分页类
 *
**************************
(C)2010-2014 phpMyWind.com
update: 2014-5-31 21:55:23
person: Feng
**************************
*/


$dopage = new Page();

class Page
{
	var $page;      //当前页码
	var $totalpage; //总共页数
	var $pagenum;   //每页记录数
	var $total;     //总共记录数

    function __construct()
    {
		$this->Init();
    }

    function Page()
    {
		$this->__construct();
    }

	function Init()
    {
		$this->page      = '';
		$this->totalpage = '';
		$this->pagenum   = '';
		$this->total     = '';
    }

	//获取分页变量
	function GetPage($sql,$pagenum=20)
	{
		global $dosql;

		$dosql->Execute($sql);
		$this->page      = @$GLOBALS['page'];
		$this->total     = $dosql->GetTotalRow();
		$this->pagenum   = $pagenum;
		$this->totalpage = ceil($this->total / $this->pagenum);

		if(!isset($this->page) || !intval($this->page) || $this->page<=0 || $this->page > $this->totalpage)
		{
			$this->page = 1;
		}

		$startnum = ($this->page-1) * $this->pagenum;

		$sql .= " limit $startnum, $this->pagenum";

		return $dosql->Execute($sql);
	}

	//显示分页列表
	function GetList()
	{
		global $cfg_isreurl,$keyword;

		$pagetxt = '';

		if($this->total <= $this->pagenum)
		{
			$pagetxt = '<li><span class="pageinfo">共<strong>'.$this->totalpage.'</strong>页<strong>'.$this->total.'</strong>条记录</span></li>';
		}

		else
		{
			//获取除page参数外的其他参数
			$query_str = explode('&',$_SERVER['QUERY_STRING']);

			if($query_str[0] != '')
			{
				$query_strs = '';

				foreach($query_str as $k)
				{
					$query_str_arr = explode('=', $k);

					if(strstr($query_str_arr[0],'page') == '')
					{
						$query_str_arr[0] = isset($query_str_arr[0]) ? $query_str_arr[0] : '';
						$query_str_arr[1] = isset($query_str_arr[1]) ? $query_str_arr[1] : '';

						//伪静态设置
						if($cfg_isreurl == 'Y' && !isset($keyword))
						{
							$query_strs .= '-'.$query_str_arr[1];
						}
						else
						{
							$query_strs .= $query_str_arr[0].'='.$query_str_arr[1].'&';
						}
					}
				}

				$nowurl = '?'.$query_strs;
			}
			else
			{
				$nowurl = '?';
			}

			//伪静态设置
			if($cfg_isreurl == 'Y' && !isset($keyword))
			{
				$request_arr = explode('.',$_SERVER['SCRIPT_NAME']);

				//部分环境获取地址为重写后地址，与原始地址不符，临时解决方案
				//使用此方案，文件名中不能包含 - ，否则会出现问题
				if(strpos($request_arr[0], '-'))
				{
					$request_str = explode('-', $request_arr[0]);
					$request_str = $request_str[0];
				}
				else
				{
					$request_str = $request_arr[0];
				}

				//获取除页码以外的参数
				$nowurl      = $request_str.ltrim($nowurl,'?');
			}

			$previous = $this->page - 1;

			if($this->totalpage == $this->page)
				$next = $this->page;
			else
				$next = $this->page + 1;

			$pagetxt = '';

			//上一页 第一页
			if($this->page > 1)
			{
				//伪静态设置
				if($cfg_isreurl == 'Y' && !isset($keyword))
				{
					$pagetxt .= '<li><a href="'.$nowurl.'-1.html" title="第一页">&lt;&lt;</a></li>';
					$pagetxt .= '<li><a href="'.$nowurl.'-'.$previous.'.html" title="上一页">&lt;</a></li>';
				}
				else
				{
					$pagetxt .= '<li><a href="'.$nowurl.'page=1" title="第一页">第一页</a></li>';
					$pagetxt .= '<li><a href="'.$nowurl.'page='.$previous.'" title="上一页">上一页</a></li>';
				}
			}
			else
			{
				$pagetxt .= '<li><a href="javascript:;" title="已是第一页">&lt;&lt;</a></li>';
				$pagetxt .= '<li><a href="javascript:;" title="已是第一页">&lt;</a></li>';
			}

			//当总页数小于10
			if($this->totalpage < 10)
			{
				for($i=1; $i <= $this->totalpage; $i++)
				{
					if($this->page == $i)
					{
						$pagetxt .= '<li class="thisclass"><a>'.$i.'</a></li>';
					}
					else
					{
						//伪静态设置
						if($cfg_isreurl == 'Y' && !isset($keyword))
						{
							$pagetxt .= '<li><a href="'.$nowurl.'-'.$i.'.html" class="num" title="第 '.$i.' 页">&nbsp;&nbsp;'.$i.'&nbsp;&nbsp;</a></li>';
						}
						else
						{
							$pagetxt .= '<li><a href="'.$nowurl.'page='.$i.'" class="num" title="第 '.$i.' 页">&nbsp;&nbsp;'.$i.'&nbsp;&nbsp;</a></li>';
						}
					}
				}
			}
			else
			{
				if($this->page==1 or $this->page==2 or $this->page==3)
				{
					$m = 1;
					$b = 7;
				}

				//如果页面大于前三页并且小于后三页则显示当前页前后各三页链接
				if($this->page>3 and $this->page<$this->totalpage-2)
				{
					$m = $this->page-3;
					$b = $this->page+3;
				}

				//如果页面为最后三页则显示最后7页链接
				if($this->page==$this->totalpage or $this->page==$this->totalpage-1 or $this->page==$this->totalpage-2)
				{
					$m = $this->totalpage - 7;
					$b = $this->totalpage;
				}
				if($this->page > 4)
				{
					$pagetxt .= '<li><a href="javascript:;">...</a></li>';
				}

				//显示数字页码
				for($i=$m; $i<=$b; $i++)
				{
					if($this->page == $i)
					{
						$pagetxt .= '<li class="thisclass"><a href="'.$nowurl.'page='.$i.'" class="current">'.$i.'</a></li>';
					}
					else
					{
						//伪静态设置
						if($cfg_isreurl == 'Y' && !isset($keyword))
						{
							$pagetxt .= '<li><a href="'.$nowurl.'-'.$i.'.html" class="num" title="第 '.$i.' 页">'.$i.'</a></li>';
						}
						else
						{
							$pagetxt .= '<li><a href="'.$nowurl.'page='.$i.'" class="num" title="第 '.$i.' 页">'.$i.'</a></li>';
						}
					}
				}
				if($this->page < $this->totalpage-3)
				{
					$pagetxt .= '<li><a href="javascript:;">...</a><li>';
				}
			}

			//下一页 最后页
			if($this->page < $this->totalpage)
			{
				//伪静态设置
				if($cfg_isreurl == 'Y' &&
				   !isset($keyword))
				{
					$pagetxt .= '<li><a class="disabled next" title="下一页">&gt;</a><li>';
					$pagetxt .= '<li><span class="disabled next">»</span></li>';
				}
				else
				{
					$pagetxt .= '<li><a href="'.$nowurl.'page='.$next.'" title="下一页">&gt;</a></li>';
					$pagetxt .= '<li><a href="'.$nowurl.'page='.$this->totalpage.'" title="最后一页">&gt;&gt;</a></li>';
				}
			}
			else
			{
				$pagetxt .= '<li><a>&gt;</a></li>';
				$pagetxt .= '<li><a>»</a></li>';
			}
			$pagetxt .= '';
		}

		return $pagetxt;
	}
}

?>