<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="x-admin-sm">
<head>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.0.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>

<title>我的桌面，欢迎页面</title>
</head>
 <body>
        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-body ">
                            <blockquote class="layui-elem-quote">欢迎管理员：
                                <span class="x-red">${username}</span>
                            </blockquote>
                        </div>
                    </div>
                </div>
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-header">数据统计</div>
                        <div class="layui-card-body ">
                            <ul class="layui-row layui-col-space10 layui-this x-admin-carousel x-admin-backlog">
                                <li class="layui-col-md2 layui-col-xs6">
                                    <a href="javascript:;" class="x-admin-backlog-body">
                                        <h3>参赛人数</h3>
                                        <p>
                                            <cite id="csrs"></cite></p>
                                    </a>
                                </li>
                                <li class="layui-col-md2 layui-col-xs6">
                                    <a href="javascript:;" class="x-admin-backlog-body">
                                        <h3>比赛主题数</h3>
                                        <p>
                                            <cite id="bszts"></cite></p>
                                    </a>
                                </li>
                                <li class="layui-col-md2 layui-col-xs6">
                                    <a href="javascript:;" class="x-admin-backlog-body">
                                        <h3>比赛个数</h3>
                                        <p>
                                            <cite id="bsgs"></cite></p>
                                    </a>
                                </li>
                                
                            </ul>
                        </div>
                    </div>
                </div>
                
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-header">系统信息</div>
                        <div class="layui-card-body ">
                            <table class="layui-table">
                                <tbody>
                                    <tr>
                                        <th>系统版本</th>
                                        <td>1.0.190627</td></tr>
                                    <tr>
                                        <th>服务器地址</th>
                                        <td>localhost:8011</td></tr>
                                    <tr>
                                        <th>操作系统</th>
                                        <td>WINDOWS</td></tr>
                                    <tr>
                                        <th>运行环境</th>
                                        <td>apache-tomcat-8.0.35</td></tr>
                                    <tr>
                                        <th>JDK版本</th>
                                        <td>1.8</td></tr>
                                    <tr>
                                        <th>MYSQL版本</th>
                                        <td>5.5.53</td></tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-header">开发团队</div>
                        <div class="layui-card-body ">
                            <table class="layui-table">
                                <tbody>
                                    <tr>
                                        <th>版权所有</th>
                                        <td>实训项目小组
                                            <a href="#" target="_blank"></a></td>
                                    </tr>
                                    <tr>
                                        <th>开发者</th>
                                        <td>唐浩(850528794@qq.com)</td></tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <style id="welcome_style"></style>
                <div class="layui-col-md12">
                    <blockquote class="layui-elem-quote layui-quote-nm"></blockquote></div>
            </div>
        </div>
        </div>
    </body>
    <script>
    	var url= "${pageContext.request.contextPath}/manager/getNum1";
    	$.post(url,function(data1){
    		$("#csrs").html(data1);
    	})
    	var url= "${pageContext.request.contextPath}/manager/getNum2";
    	$.post(url,function(data2){
    		$("#bszts").html(data2);
 
    	})
    	var url= "${pageContext.request.contextPath}/manager/getNum3";
    	$.post(url,function(data3){
    		$("#bsgs").html(data3);
    	})
    </script>
</html>