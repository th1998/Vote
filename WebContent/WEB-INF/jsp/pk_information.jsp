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
<title>pk信息列表</title>
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
                                        <th width="8%">比赛主题</th>
                                        <th width="8%">姓名①</th>
                                        <th width="10%">歌曲①</th>
                                        <th width="8%">票数①</th>
                                        <th width="8%">姓名②</th>
                                        <th width="10%">歌曲②</th>
                                        <th width="8%">票数②</th>
                                        <th width="5%">状态</th>
                                        <th width="5%">类型</th>
                                        <th width="14%">开启时间</th>
                                        <th width="14%">关闭时间</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${pklist.list}" var="item" varStatus="status">
									<tr>
										<th>
                                            <input type="checkbox"  lay-skin="primary">
                                        </th>
                                        <th>${item.comp.competition_name}</th>
                                        <th>${item.con1_name}</th>
                                        <th>${item.con1_music}</th>
                                        <th>${item.con1_score}</th>
                                        <th>${item.con2_name}</th>
                                        <th>${item.con2_music}</th>
                                        <th>${item.con2_score}</th>
                                        <th>
                                        	<c:if test="${item.comp.competition_status ==1}">
												 <button type="button" onclick="updateStatus('${item.competition_id}')" id="${item.competition_id}" sta="${item.comp.competition_status}" class="layui-btn layui-btn-sm layui-btn-normal">开启</button> 
											</c:if>
											<c:if test="${item.comp.competition_status==0}">
												 <button type="button" onclick="updateStatus('${item.competition_id}')" id="${item.competition_id}" sta="${item.comp.competition_status}" class="layui-btn layui-btn-sm layui-btn-danger" >关闭</button> 
											</c:if>
                                        </th>
                                       
                                        <c:if test="${item.comp.vote_type ==1}">
                                        	<th style="color:#1E9FFF;">
												正选 
											</th>
										</c:if>
										<c:if test="${item.comp.vote_type==0}">
											<th style="color:orange;">
												反选
											</th>
										</c:if>
                                        
                                        <th>${item.comp.vote_start}</th>
                                        <th>${item.comp.vote_end}</th>
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
    
    var total="${pklist.total}";
	
	if(total%8 == 0){
		var page = total/8;
	}else{
		var page = parseInt(total/8)+1;
	}
    // pageMe.js 使用方法
    $("#page").paging({
        pageNum: 1, // 当前页面
        totalNum: page, // 总页码
        totalList: total, // 记录总数量
        callback: function (num) { //回调函数
 
        	var url="${pageContext.request.contextPath}/manager/pk_information2?pageSize="+num;
        	var tr = "";
    		$.get(url,function(data){
    			
    			for(var i = 0;i<data.cpk.length;i++){
    				
	    			tr += "<tr>";
	    			tr += "<th><input type='checkbox' name='' lay-skin='primary'></th>";
	    			tr += "<th id='con_id'"+i+">"+data.cpk[i].comp.competition_name+"</th>";
	    			tr += "<th id='name'"+i+">"+data.cpk[i].con1_name+"</th>";
	    			tr += "<th id='sex'"+i+">"+data.cpk[i].con1_music+"</th>";
	    			tr += "<th id='sex'"+i+">"+data.cpk[i].con1_score+"</th>";
	    			tr += "<th id='name'"+i+">"+data.cpk[i].con2_name+"</th>";
	    			tr += "<th id='sex'"+i+">"+data.cpk[i].con2_music+"</th>";
	    			tr += "<th id='sex'"+i+">"+data.cpk[i].con2_score+"</th>";
	    			
	    			if(data.cpk[i].comp.competition_status == 1){
	    				tr += "<th><button type='button' onclick='updateStatus("+data.cpk[i].competition_id+")' id="+data.cpk[i].competition_id+" sta="+data.cpk[i].comp.competition_status+" class='layui-btn layui-btn-sm layui-btn-normal' >开启</button> </th>";
	    				
	    			}else{
	    				tr += "<th><button type='button' onclick='updateStatus("+data.cpk[i].competition_id+")' id="+data.cpk[i].competition_id+" sta="+data.cpk[i].comp.competition_status+" class='layui-btn layui-btn-sm layui-btn-danger' >关闭</button> </th>";
	    				
	    			}
	    			if(data.cpk[i].comp.vote_type == 1){
	    				tr += "<th style='color:#1E9FFF;'>正选</th>";
	    			}else{
	    				tr += "<th style='color:orange;'>反选</th>";
	    			}
	    			
	    			tr += "<th id='sex'"+i+">"+data.cpk[i].comp.vote_start+"</th>";
	    			tr += "<th id='sex'"+i+">"+data.cpk[i].comp.vote_end+"</th>";
  
	    			layui.jquery("tbody").html(tr);
	    			
    			}
    		
    		});
    		
        }
    });
    function updateStatus(id){
		if($("#"+id).attr("sta") == 1){
			$("#"+id).attr("sta",0);
		}else{
			$("#"+id).attr("sta",1);
		} 
		var competition_status=$("#"+id).attr("sta");
		var url="${pageContext.request.contextPath}/manager/updateStatus";
        var param={id:id,competition_status:competition_status};
        $.get(url,param,function(data){
        	if(data.flag == 1){
        		location.href="${pageContext.request.contextPath}/manager/pk_information?pageSize=2";
        		return false;
        	}
        });
    }
	layui.use(['form'], function(){
		  var upload = layui.upload;
		   var form = layui.form;
	});
	</script>

 
</html>