<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.0.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
<title>参赛人员录入</title>
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
        <div id="mes" style="display:none;">${mes}</div>
        <div class="layui-fluid">
           
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-header">选手海报录入</div>
                        <div class="layui-card-body ">
                           <form class="layui-form" action="${pageContext.request.contextPath}/manager/upload_submit" method="post" enctype="multipart/form-data"> 
							   
							   <div class="layui-form-item">
							    <label class="layui-form-label">选手姓名</label>
							    <div class="layui-input-block">
							      <select id="con1_name" lay-filter="con1_name" name="con1_name">
							        <c:forEach items="${conid}" var="item">
										<option value="${item.name}" id="a" playerid="${item.con_id}">${item.name}</option>
									</c:forEach>
							      </select>
							    </div>
							  </div>
							  <div class="layui-form-item">
							    <label class="layui-form-label">选手编号</label>
							    <div class="layui-input-block">
							     <input type="text" id="con_id" name="con_id" value="${conid[0].con_id  }" layui-disabled readonly="readonly" autocomplete="off" class="layui-input" lay-verify="required" >
							    </div>
							  </div>
							  <div class="layui-form-item">
							    <div class="layui-upload">
							    <label class="layui-form-label">选手海报</label>
							   	 <button type="button" class="layui-btn" id="up">上传</button>
								  <input type="file" class="layui-btn" name="file" id="file" onchange="upload(this.files)" style="display:none;">  
								  <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;margin-left:110px;">
								    预览图：
								    <div class="layui-upload-list" id="demo2"></div>
								 </blockquote>
								</div>
							  </div>
							  <div class="layui-form-item">
							    <div class="layui-input-block">
							      <button type="submit" class="layui-btn" lay-submit lay-filter="entry">立即提交</button>
							      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
							    </div>
							  </div>
							</form>
                        </div>
                    </div>
                </div>
                
             </div> 
              
    </body>
    
    <script>
	$("#up").click(function () {
		$("#file").click();
	});
    function upload(f){	 
        var str = "";
        for(var i=0;i<f.length;i++){
            var reader = new FileReader();
            reader.readAsDataURL(f[i]);
            reader.onload = function(e){
                $('#demo2').append('<img src="'+e.target.result+'"  class="layui-upload-img" width="130px">')
            }
        }
 
    }
    
    
	
layui.use(['form','layer'], function(){
  var form = layui.form;
  
  form.on('select(con1_name)', function(data){
	  $("#con_id").val($("#con1_name option:selected").attr("playerid"))
  });
  
  
	if($("#mes").html() == "成功"){
		layer.alert("上传海报成功");
	}else if($("#mes").html() == "失败"){
		layer.alert("上传海报失败");
	}
  
});
</script>
</html>