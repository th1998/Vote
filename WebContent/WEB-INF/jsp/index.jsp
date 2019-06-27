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
<title>后台首页</title>
</head>
<body class="index">
        <!-- 顶部开始 -->
        <div class="container">
            <div class="logo">
                <a href="./index.html">投票系统后台管理</a></div>
            <div class="left_open">
                <a><i title="展开左侧栏" class="iconfont">&#xe699;</i></a>
            </div>
            <ul class="layui-nav left fast-add" lay-filter="">
                <li class="layui-nav-item">
                    
                </li>
            </ul>
            <ul class="layui-nav right" lay-filter="">
                <li class="layui-nav-item">
                    <a href="javascript:;">${username}</a> 
                    <dl class="layui-nav-child">
                        <!-- 二级菜单 -->
                        <dd>
                            <a onclick="xadmin.open('个人信息','http://www.baidu.com')">个人信息</a></dd>
                        <dd>
                            <a onclick="xadmin.open('切换帐号','http://www.baidu.com')">切换帐号</a></dd>
                        <dd>
                            <a href="./login.html">退出</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item to-index">
                    <a href="/">前台首页</a></li>
            </ul>
        </div>
        <!-- 顶部结束 -->
        <!-- 中部开始 -->
        <!-- 左侧菜单开始 -->
        <div class="left-nav">
            <div id="side-nav">
                <ul id="nav">
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="会员管理">&#xe6b8;</i>
                            <cite>会员管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="参赛人员管理">&#xe723;</i>
                            <cite>参赛人员管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                        	<li>
                                <a onclick="xadmin.add_tab('参赛选手录入','${pageContext.request.contextPath}/manager/participants_entry')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>参赛选手录入</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('参赛人员列表','${pageContext.request.contextPath}/manager/participant_list')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>参赛人员列表</cite></a>
                            </li>
                             <li>
                                <a onclick="xadmin.add_tab('选手海报录入','${pageContext.request.contextPath}/manager/bill_entry')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>选手海报录入</cite></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="PK管理">&#xe723;</i>
                            <cite>PK管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                        	<li>
                                <a onclick="xadmin.add_tab('比赛信息录入','${pageContext.request.contextPath}/manager/competition_entry')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>比赛信息录入</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('PK选手录入','${pageContext.request.contextPath}/manager/pk_entry')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>PK选手录入</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('PK信息列表','${pageContext.request.contextPath}/manager/pk_information')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>PK信息列表</cite></a>
                            </li>
                        </ul>
                    </li>
                    
                    
                </ul>
            </div>
        </div>
        <!-- <div class="x-slide_left"></div> -->
        <!-- 左侧菜单结束 -->
        <!-- 右侧主体开始 -->
        <div class="page-content">
            <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
                <ul class="layui-tab-title">
                    <li class="home">
                        <i class="layui-icon">&#xe68e;</i>我的桌面</li></ul>
                <div class="layui-unselect layui-form-select layui-form-selected" id="tab_right">
                    <dl>
                        <dd data-type="this">关闭当前</dd>
                        <dd data-type="other">关闭其它</dd>
                        <dd data-type="all">关闭全部</dd></dl>
                </div>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <iframe src='${pageContext.request.contextPath}/manager/welcome' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
                    </div>
                </div>
                <div id="tab_show"></div>
            </div>
        </div>
        <div class="page-content-bg"></div>
        <style id="theme_style"></style>
        <!-- 右侧主体结束 -->
        <!-- 中部结束 -->
        
    </body>

</html>