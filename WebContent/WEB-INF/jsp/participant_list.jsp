<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="x-admin-sm">
<head>
<meta charset="UTF-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/pageMe.js"></script>
<style>
         /* 外面盒子样式---自己定义 */
         .page_box{
			width:54%;
			height；100%;
			margin:0 auto;
		}
        .page_div{margin:20px 10px 20px 0;color:#666}
        /* 页数按钮样式 */
        .page_div button{display:inline-block;min-width:30px;height:28px;cursor:pointer;color:#666;font-size:13px;line-height:28px;background-color:#f9f9f9;border:1px solid #dce0e0;text-align:center;margin:0 4px;-webkit-appearance: none;-moz-appearance: none;appearance: none;}
        #firstPage,#lastPage,#nextPage,#prePage{width:50px;color:#009688;border:1px solid #009688}
        #nextPage,#prePage{width:70px}
        .page_div .current{background-color:#009688;border-color:#009688;color:#FFF}
        /* 页面数量 */
        .totalPages{margin:0 10px}
        .totalPages span,.totalSize span{color:#009688;margin:0 5px}
        /*button禁用*/
        .page_div button:disabled{opacity:.5;cursor:no-drop}
    </style>
<title>参赛人员列表</title>
</head>
<body>
        <div class="x-nav">
            <span class="layui-breadcrumb">
                <a href="">首页</a>
                <a href="">演示</a>
                <a>
                    <cite>导航元素</cite></a>
            </span>
            <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
                <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i>
            </a>
        </div>
        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-body ">
                            <form class="layui-form layui-col-space5">
                                <div class="layui-input-inline layui-show-xs-block">
                                    <input class="layui-input" placeholder="开始日" name="start" id="start"></div>
                                <div class="layui-input-inline layui-show-xs-block">
                                    <input class="layui-input" placeholder="截止日" name="end" id="end"></div>
                                <div class="layui-input-inline layui-show-xs-block">
                                    <select name="contrller">
                                        <option>支付方式</option>
                                        <option>支付宝</option>
                                        <option>微信</option>
                                        <option>货到付款</option></select>
                                </div>
                                <div class="layui-input-inline layui-show-xs-block">
                                    <select name="contrller">
                                        <option value="">订单状态</option>
                                        <option value="0">待确认</option>
                                        <option value="1">已确认</option>
                                        <option value="2">已收货</option>
                                        <option value="3">已取消</option>
                                        <option value="4">已完成</option>
                                        <option value="5">已作废</option></select>
                                </div>
                                <div class="layui-input-inline layui-show-xs-block">
                                    <input type="text" name="username" placeholder="请输入订单号" autocomplete="off" class="layui-input"></div>
                                <div class="layui-input-inline layui-show-xs-block">
                                    <button class="layui-btn" lay-submit="" lay-filter="sreach">
                                        <i class="layui-icon">&#xe615;</i></button>
                                </div>
                            </form>
                        </div>
                        <div class="layui-card-header">
                            <button class="layui-btn layui-btn-danger" onclick="delAll()">
                                <i class="layui-icon"></i>批量删除</button>
						</div>
                        <div class="layui-card-body ">
                            <table class="layui-table layui-form">
                                <thead>
                                    <tr>
                                        <th width="2%">
                                            <input type="checkbox"  lay-skin="primary">
                                        </th>
                                        <th width="12%">选手编号</th>
                                        <th width="10%">姓名</th>
                                        <th width="5%">性别</th>
                                        <th width="50%">选手简介</th>
                                        <th width="10%">照片</th>
                                        <th width="11%">操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${contestants.list}" var="item" varStatus="status">
									<tr>
										<th>
	                                        <input type="checkbox" name="" lay-skin="primary">
	                                    </th>
										<th id="con_id${status.index}">${item.con_id }</th>
										<th id="name${status.index}">${item.name }</th>
										<th id="sex${status.index}">${item.sex }</th>
										<th id="introduce${status.index}">${item.introduce }</th>	
										<th id="picture${status.index}" >
											<c:if test='${item.picture=="" }'>
												<button type="button" class="layui-btn layui-btn-sm layui-btn-danger" style=" margin-left:26%;">无</button> 
											</c:if>
											<c:if test='${item.picture!="" }'>
												<button type="button" class="layui-btn layui-btn-sm" style=" margin-left:26%;">有</button> 
											</c:if>
										
										</th>
										<th class="td-manage">
											 <a title="上传"  href="javascript:;" id="test1">
	                                            <i class="layui-icon">&#xe67c;</i></a>
	                                         <a title="编辑" id="bj${status.index}" onclick="xadmin.open('编辑','${pageContext.request.contextPath}/manager/participant_update?id=${item.id }')" href="javascript:;">
	                                            <i class="layui-icon">&#xe642;</i></a>
	                                         <a title="删除" onclick="del('${item.id}')" href="javascript:;" id="a${status.index}">
	                                            <i class="layui-icon">&#xe640;</i></a>
                                        </th>
									</tr>
								 </c:forEach>
                             
                                </tbody>
                            </table>
                        </div>
                        <div class="layui-card-body ">
                            <div class="page_box">
								<div id="page" class="page_div"></div>
							</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script>
    var total="${contestants.total}";
	var shuliang = 4-(total%4);
	if(total%4 == 0){
		var page = total/4;
	}else{
		var page = parseInt(total/4)+1;
	}
    // pageMe.js 使用方法
    $("#page").paging({
        pageNum: 1, // 当前页面
        totalNum: page, // 总页码
        totalList: total, // 记录总数量
        callback: function (num) { //回调函数
        	var url="${pageContext.request.contextPath}/manager/participant_list2?pageSize="+num;
        	var tr = "";
    		$.get(url,function(data){
    			for(var i = 0;data.con.length;i++){
	    			tr += "<tr>";
	    			tr += "<th><input type='checkbox' name='' lay-skin='primary'></th>";
	    			tr += "<th id='con_id'"+i+">"+data.con[i].con_id+"</th>";
	    			tr += "<th id='name'"+i+">"+data.con[i].name+"</th>";
	    			tr += "<th id='sex'"+i+">"+data.con[i].sex+"</th>";
	    			tr += "<th id='introduce'"+i+">"+data.con[i].introduce+"</th>";
	    			if(data.con[i].picture==""){
	    				tr += "<th id='picture'"+i+"><button type='button' class='layui-btn layui-btn-sm layui-btn-danger' style=' margin-left:26%;'>无</button></th>";
	    			}else{
	    				tr += "<th id='picture'"+i+"><button type='button' class='layui-btn layui-btn-sm layui-btn-danger' style=' margin-left:26%;'>有</button></th>";
	    			}
	    			
	    			tr += '<th class="td-manage">'+
	    					'<a title="上传"  href="javascript:;" id="test1"> '+
	    						'<i class="layui-icon">&#xe67c;</i>'+
	    					'</a>'+
	    					'<a title="编辑" id="bj'+i+'" onclick=\'xadmin.open(\"编辑\",\"${pageContext.request.contextPath}/manager/participant_update?id='+data.con[i].id+'\")\' href="javascript:;">'+
	    						'<i class="layui-icon">&#xe642;</i>'+
	    					'</a>'+
	    					'<a title="删除" onclick="del('+data.con[i].id+')" href="javascript:;" id="a'+i+'">'+
	    						'<i class="layui-icon">&#xe640;</i>'+
	    					'</a>'+
	    			      '</th>';
	            
	    			layui.jquery("tbody").html(tr);
    			}
    		/*	if(page == num){
	    			for(var i = 0;data.con.length;i++){
	    				
		    			$("#con_id"+i).html(data.con[i].con_id);
		        		$("#name"+i).html(data.con[i].name);
		        		$("#sex"+i).html(data.con[i].sex);
		        		$("#introduce"+i).html(data.con[i].introduce);
	
		        		if(data.con[i].picture==""){
		        			$("#picture"+i).html('<button type="button" class="layui-btn layui-btn-sm layui-btn-danger" style=" margin-left:26%;">无</button>');
		        		}else{
		        			$("#picture"+i).html('<button type="button" class="layui-btn layui-btn-sm" style=" margin-left:26%;">有</button>');
		        		}
		        		$('#a'+i).attr('onclick',"del("+data.con[i].id+")");
		        		$('#bj'+i).attr('onclick',"xadmin.open('编辑','${pageContext.request.contextPath}/manager/participant_update?id="+data.con[i].id+"')");
		        	
	    			}
    			}else{
    				for(var i = 0;data.con.length;i++){
    					for(var k = 0;k<=5;k++){
	    					$("table").find("tr").eq(k).attr("style","visibility:visible ;")
	    				}
		    			$("#con_id"+i).html(data.con[i].con_id);
		        		$("#name"+i).html(data.con[i].name);
		        		$("#sex"+i).html(data.con[i].sex);
		        		$("#introduce"+i).html(data.con[i].introduce);
		        		if(data.con[i].picture==""){
		        			$("#picture"+i).html('<button type="button" class="layui-btn layui-btn-sm layui-btn-danger" style=" margin-left:26%;">无</button>');
		        		}else{
		        			$("#picture"+i).html('<button type="button" class="layui-btn layui-btn-sm" style=" margin-left:26%;">有</button>');
		        		}
		        		$('#a'+i).attr('onclick',"del("+data.con[i].id+")");
		        		$('#bj'+i).attr('onclick',"xadmin.open('编辑','${pageContext.request.contextPath}/manager/participant_update?id="+data.con[i].id+"')");
    				}
    			}*/
    		});
        }
    });
	</script>
	<script>
	
	layui.use('upload', function(){
	  var upload = layui.upload;
	   
	  //执行实例
	  var uploadInst = upload.render({
	    elem: '#test1', //绑定元素
	    url: '${pageContext.request.contextPath}/manager/upload_submit',
	    done: function(res){
	      //上传完毕回调
	    	
	    }
	    ,error: function(){
	      //请求异常回调
	
	    }
	  });
	});
	
	layui.use(['laydate','form'], function(){
        var laydate = layui.laydate;
        var  form = layui.form;
	});
</script>
    <script>
    function del(id){
		alert(id)
    	var result=confirm("你确定要删除该参赛者吗？");
    	if(result){
    		var url="${pageContext.request.contextPath}/manager/del_submit";
    		var param={id:id};
    		$.get(url,param,function(data){
    			alert(data.content);
    			if(data.flag == 1){
    				location.reload();
    			}
    		});
    	}
    	
    }
    
    </script>
</html>