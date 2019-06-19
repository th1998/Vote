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
<script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
<title>参赛人员录入</title>
</head>
<body>
        <div class="layui-fluid">
           
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-header">比赛信息录入</div>
                        <div class="layui-card-body ">
                           <form class="layui-form">
                           
                             <div class="layui-form-item">
							    <label class="layui-form-label">比赛主题代号</label>
							    <div class="layui-input-block">
							      <select id="title">
							        <c:forEach items="${comid}" var="item">
										<option value="${item.id}">${item.id}</option>
									</c:forEach>
							      </select>
							    </div>
							  </div>
							  
                           	  <div class="layui-form-item">
							    <label class="layui-form-label">选手①编号</label>
							    <div class="layui-input-block">
							      <select id="con_id1" name="con_id1" lay-filter="con_id1">
							        <c:forEach items="${conid}" var="item">
										<option value="${item.id}" id="a">${item.con_id}</option>
									</c:forEach>
							      </select>
							    </div>
							  </div>
							  <div class="layui-form-item">
							    <label class="layui-form-label">选手①姓名</label>
							    <div class="layui-input-block">
							      <input type="text" id="name1" name="name1" readonly value="${cname.name }" placeholder="请输入" autocomplete="off" class="layui-input" lay-verify="required" >
							    </div>
							  </div>
							  <div class="layui-form-item">
							    <label class="layui-form-label">选手①歌曲</label>
							    <div class="layui-input-block">
							      <input type="text" id="music1" name="music1" placeholder="请输入" autocomplete="off" class="layui-input" lay-verify="required" >
							    </div>
							  </div>
							  
							  <div class="layui-form-item">
							    <label class="layui-form-label">选手②编号</label>
							    <div class="layui-input-block">
							      <select id="con_id2">
							        <c:forEach items="${conid}" var="item">
										<option value="${item.id}" id="a">${item.con_id}</option>
									</c:forEach>
							      </select>
							    </div>
							  </div>
							  <div class="layui-form-item">
							    <label class="layui-form-label">选手②姓名</label>
							    <div class="layui-input-block">
							      <input type="text" id="name2" name="name2" placeholder="请输入" autocomplete="off" class="layui-input" lay-verify="required" >
							    </div>
							  </div>
							  <div class="layui-form-item">
							    <label class="layui-form-label">选手②歌曲</label>
							    <div class="layui-input-block">
							      <input type="text" id="music2" name="music2" placeholder="请输入" autocomplete="off" class="layui-input" lay-verify="required" >
							    </div>
							  </div>
							  
                              <div class="layui-form-item">
							    <div class="layui-input-block">
							      <p class="layui-btn" lay-submit lay-filter="entry">立即提交</p>
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
	
	
layui.use(['form','layer','laydate'], function(){
  var form = layui.form;
  var laydate = layui.laydate;
 
  form.render({
	  elem: '#title'
  });
 //执行一个laydate实例
  laydate.render({
    elem: '#start'
    ,type: 'datetime'
  });

  //执行一个laydate实例
  laydate.render({
    elem: '#end'
    ,type: 'datetime'
  });
  

  form.on('select(con_id1)', function(data){
	  var id = data.value
	  var url = '${pageContext.request.contextPath}/manager/findplayname';
	  var param={id:id};	
	     $.post(url, param, function (data) {
	        /*if(data.flag == 1){
	        	layer.msg(data.content, {icon: 1});
	        }else{
	        	layer.alert(data.content, {icon: 2});
	        }*/
	     });
	 /* layer.msg(3, {icon: 1});*/
  });

  
	//表单验证
	 form.verify({
		 introduce: function(value){
			  if(value.length > 200){
				return '选手介绍必须少于200字！';
			  }
		}
	 });
  //异步提交表单
  form.on('submit(entry)', function(data){
     var url = '${pageContext.request.contextPath}/manager/addPlayer_submit';
     var param = $(".layui-form").serialize();
	
     $.post(url, param, function (data) {
        if(data.flag == 1){
        	layer.msg(data.content, {icon: 1});
			$(".layui-input").val("");
			$("#introduce").val("");
        }else{
        	layer.alert(data.content, {icon: 2});
        }
         
     });
    });
  

 
});



</script>
</html>