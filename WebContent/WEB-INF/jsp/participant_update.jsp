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
        <div class="layui-fluid">
           
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-header">参赛选手录入</div>
                        <div class="layui-card-body ">
                           <form class="layui-form"> 
							  <div class="layui-form-item">
							    <label class="layui-form-label">选手编号</label>
							    <div class="layui-input-block">
							      <input type="text" id="con_id" name="con_id" value="${c.con_id}" placeholder="请输入" autocomplete="off" class="layui-input" lay-verify="required" >
							    </div>
							  </div>
							  <div class="layui-form-item">
							    <label class="layui-form-label">姓名</label>
							    <div class="layui-input-block">
							      <input type="text" id="name" name="name" value="${c.name}" placeholder="请输入" autocomplete="off" class="layui-input" lay-verify="required" >
							    </div>
							  </div>
							  <div class="layui-form-item">
							    <label class="layui-form-label">性别</label>
							    <div class="layui-input-block">
							      <input type="radio" name="sex" value="男" title="男">
							      <input type="radio" name="sex" value="女" title="女">
							    </div>
							  </div>
							  <div class="layui-form-item layui-form-text">
							    <label class="layui-form-label">选手简介</label>
							    <div class="layui-input-block">
							      <textarea placeholder="请输入内容" class="layui-textarea"  name="introduce" id="introduce" lay-verify="required|introduce" ></textarea>
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
                
                
                
    </body>
    
    <script>
    $("input[name=sex][value=${c.sex}]").attr("checked",true);
    $("textarea[name=introduce]").val("${c.introduce}");
	
layui.use(['form','layer'], function(){
  var form = layui.form;
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