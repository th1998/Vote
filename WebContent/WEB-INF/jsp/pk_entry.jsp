<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                        <div class="layui-card-header">PK选手录入</div>
                        <div class="layui-card-body ">
                           <form class="layui-form">
                           
                             <div class="layui-form-item layui-input-inline">
							    <label class="layui-form-label">选择框</label>
							    <div class="layui-input-block">
							      <select name="city" lay-verify="required">
							        <option value=""></option>
							        <option value="0">北京</option>
							        <option value="1">上海</option>
							        <option value="2">广州</option>
							        <option value="3">深圳</option>
							        <option value="4">杭州</option>
							      </select>
							    </div>
							  </div> 
							   
                           <div class="layui-card-header" style="margin-top:-50px;"></div>
							  <div class="layui-form-item">
							    <label class="layui-form-label">选手1编号</label>
							    <div class="layui-input-block">
							      <input type="text" id="con1_id" name="con1_id" placeholder="请输入" autocomplete="off" class="layui-input" lay-verify="required" >
							    </div>
							  </div>
							  <div class="layui-form-item">
							    <label class="layui-form-label">选手1姓名</label>
							    <div class="layui-input-block">
							      <input type="text" id="name" name="name" placeholder="请输入" autocomplete="off" class="layui-input" lay-verify="required" >
							    </div>
							  </div>
							  <div class="layui-form-item">
							    <label class="layui-form-label">参赛歌曲</label>
							    <div class="layui-input-block">
							      <input type="text" id="music" name="music" placeholder="请输入" autocomplete="off" class="layui-input" lay-verify="required" >
							    </div>
							  </div>
							  <div class="layui-card-header" style="margin-top:-50px;"></div>
							  <div class="layui-form-item" style="margin-top:10px;">
							    <label class="layui-form-label">选手2编号</label>
							    <div class="layui-input-block">
							      <input type="text" id="con1_id" name="con1_id" placeholder="请输入" autocomplete="off" class="layui-input" lay-verify="required" >
							    </div>
							  </div>
							  <div class="layui-form-item">
							    <label class="layui-form-label">选手2姓名</label>
							    <div class="layui-input-block">
							      <input type="text" id="name" name="name" placeholder="请输入" autocomplete="off" class="layui-input" lay-verify="required" >
							    </div>
							  </div>
							  <div class="layui-form-item">
							    <label class="layui-form-label">参赛歌曲</label>
							    <div class="layui-input-block">
							      <input type="text" id="music" name="music" placeholder="请输入" autocomplete="off" class="layui-input" lay-verify="required" >
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