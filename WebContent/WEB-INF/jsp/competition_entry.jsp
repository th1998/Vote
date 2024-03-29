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
           
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-header">比赛信息录入</div>
                        <div class="layui-card-body ">
                           <form class="layui-form">
                           
                             <div class="layui-form-item">
							    <label class="layui-form-label">比赛主题</label>
							    <div class="layui-input-block">
							      <input type="text" id="competition_name" name="competition_name" placeholder="请输入" autocomplete="off" class="layui-input" lay-verify="required" >
							    </div>
							  </div>
                           	  <div class="layui-form-item">
							    <label class="layui-form-label">比赛状态</label>
							    <div class="layui-input-block">
							      <select id="competition_status" name="competition_status">
							        <option value="1" selected="selected">开启</option>
							        <option value="0">关闭</option>
							      </select>
							    </div>
							  </div>
							  <div class="layui-form-item">
							    <label class="layui-form-label">投票类型</label>
							    <div class="layui-input-block">
							      <select id="vote_type" name="vote_type">
							        <option value="1" selected="selected">正选</option>
							        <option value="0">反选</option>
							      </select>
							    </div>
							  </div>
							  <div class="layui-form-item">
							  	  <label class="layui-form-label">开始时间</label> 
								  <div class="layui-input-block layui-show-xs-block">
	                                    <input type="text" class="layui-input" id="vote_start" name="vote_start" placeholder=" yyyy-MM-dd HH:mm:ss ">
	                              </div>
                              </div>
                              <div class="layui-form-item">
                              	  <label class="layui-form-label">结束时间</label>
	                              <div class="layui-input-block layui-show-xs-block">
	                             	 <input type="text" class="layui-input" id="vote_end" name="vote_end" placeholder=" yyyy-MM-dd HH:mm:ss ">
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
  form.render();
 //执行一个laydate实例
  laydate.render({
    elem: '#vote_start'
    ,type: 'datetime'
  });

  //执行一个laydate实例
  laydate.render({
    elem: '#vote_end'
    ,type: 'datetime'
  });
	//表单验证
	/* form.verify({
		 introduce: function(value){
			  if(value.length > 200){
				return '选手介绍必须少于200字！';
			  }
		}
	 });*/
  //异步提交表单
  form.on('submit(entry)', function(data){
     var url = '${pageContext.request.contextPath}/manager/competition_entry_submit';
     var param = $(".layui-form").serialize();
     $.post(url, param, function (data) {
        if(data.flag == 1){
        	layer.msg(data.content, {icon: 1});
			$(".layui-input").val("");
        }else{
        	layer.alert(data.content, {icon: 2});
        }
         
     });
    });
  

 
});
</script>
</html>