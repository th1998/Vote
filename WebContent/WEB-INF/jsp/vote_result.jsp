<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/echarts.min.js" ></script>
<script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
<script src='https://code.jquery.com/jquery-1.11.2.min.js'></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/3/amcharts.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/3/serial.js"></script>

<title>投票结果</title>
<style>
			*{
				margin: 0;
				padding: 0;
			}
			.bg{
				width: 100%;
				height: 754px;
				background-image: url(../images/bg1.jpg);
				background-size: 100% 754px;
			}
			p{
				color: #FFFFFF; 
				width:100%;
				text-align: center;
				padding-top: 100px;
			}
			.left{
				width: 30%;
				height: 500px;
				float: left;
			}
			#chartdiv{
				width: 40%;
				height: 400px;
				float: left;
				/*background:#ffffff;*/
			}
			.right{
				width: 30%;
				height: 500px;
				float: left;
			}
			.bill1,.bill2{
				width: 200px;
				height: 300px;
				position: relative;
				top: 70px;
				margin: 0 auto;
				/*border: 1px solid red;*/
			}
			img{
			  border-raduis:5px;
			}
			.bfb{
				width: 75px;
				height: 75px;
				border-radius: 50%;
				
			}
			.name1,.name2{
				text-align: center;
				font-size: 30px;
				color: #FFFFFF;
			}
			#main{
				width:100%;
				height:400px; 	
				margin: 0 auto;
				margin-top: 60px;
			}
			#cd{
			   width:400px;
			   height:50px;
			  
			   float:left;
			  }
			#cd1{
				float:left;
			}
			#nav{
				width:50px;
				height:50px;
				float:left;
			}
			.pk{
				float:left;
				position: relative;
			}
			#chartdiv{
				z-index:-1;
			}
		</style>
</head>
	<body>
		<div class="bg">
			<div id="nav"></div>
			<form class="layui-form" id="cd1">
				<div class="layui-form-item" id="cd" style="display:none;">
					<label class="layui-form-label" style="color:#ffffff;">比赛主题</label>
					<div class="layui-input-inline layui-show-xs-block" id="se">
						<select id="id" name="id" lay-filter="competition_name">
							<c:forEach items="${pk}" var="item" varStatus="status">
								<c:if test='${item.comp.competition_status==1 }'>
									<option value="${item.competition_id}" con1_id="${item.con1_id}" con2_id="${item.con2_id}">${item.comp.competition_name}</option>
								</c:if>
							</c:forEach>
						</select>
					</div>
				</div>
			</form>
			
			<p id="title" style="font-size:40px;"></p>
			<div class="left">
				<div class="bill1">
					<!--选手海报-->
				</div>
				
				<p class="name1"></p> 
			</div>
			<div class="center">
				<div id="chartdiv">
					
				</div>
			</div>
			<div class="right">
				<div class="bill2">
					<!--选手海报-->
				</div>
				
				<p class="name2"></p>
			</div>
		</div>
		
	</body>
	
	<script type="text/javascript">
	$("#nav").mouseover(function(){
		var status = $("#cd");
		status.attr("style","display:block");
	});
	
	layui.use('form', function(){
		  var form = layui.form;
		  
		  form.on('select(competition_name)', function(data){
			  $("#cd").attr("style","display:none");
			  var id = $("#id option:selected").attr("value");
			  var con1_id = $("#id option:selected").attr("con1_id");
			  var con2_id = $("#id option:selected").attr("con2_id");
			  $("#title").html($("#id option:selected").html());
			  var url2 = '${pageContext.request.contextPath}/manager/findhead?con_id='+con1_id;
			  $.post(url2, function (res2) {
				  $(".bill1").html('<img src="${pageContext.request.contextPath}/upload/'+res2[0].picture+'" width="200" height="300">');
			  });
			  
			  var url3 = '${pageContext.request.contextPath}/manager/findhead?con_id='+con2_id;
			  $.post(url3, function (res3) {
				  $(".bill2").html('<img src="${pageContext.request.contextPath}/upload/'+res3[0].picture+'" width="200" height="300">');
			  });
			  
			  var url = '${pageContext.request.contextPath}/manager/onepk?id='+id;		
			     $.post(url, function (res) {
			    	 $(".name1").html(res[0].con1_name);
					 $(".name2").html(res[0].con2_name);
					 
					 
					 var chart = AmCharts.makeChart("chartdiv", {
						    "theme": "none",
						    "type": "serial",
						    "fontSize":18,
						    "color":"#ffffff",
							 "startDuration": 2,
						    "dataProvider": [{
						        "country": res[0].con1_name,
						        "visits": res[0].con1_score,
						        "color": "#FF0F00"
						    },{
						        "country": "VS",
						        "visits": '<img src="../images/pk.png" width="100">',
						        "color": "#0D8ECF"

						    },{
						        "country": res[0].con2_name,
						        "visits": res[0].con2_score,
						        "color": "#0D8ECF"

						    }],
						    "valueAxes": [{
						        "axisAlpha":0,
						        "gridAlpha":0 ,
						        "labelsEnabled":false,
						    }],
						    "graphs": [{
						        "balloonText": "[[category]]: <b>[[value]]</b>",
						        "labelText":"[[value]]",
						        "colorField": "color",
						        "fillAlphas": 0.85,
						        "lineAlpha": 0.1,
						        "type": "column",
						        "topRadius":1,
						        "valueField": "visits",
						        "columnWidth" :0.5,
						        "fontSize":20
						        
						    }],
						    "depth3D": 50,
							  "angle": 10,
						    "chartCursor": {
						        "categoryBalloonEnabled": false,
						        "cursorAlpha": 0,
						        "zoomable": true
						    },    
						    "categoryField": "country",
						    "categoryAxis": {
						        "gridPosition": "start",
						        "axisAlpha":0,
						        "gridAlpha":0
						    },
							"exportConfig":{
								    "menuTop":"20px",
						        "menuRight":"20px",
						        "menuItems": [{
						        "icon": '/lib/3/images/export.png',
						        "format": 'png'	  
						        }]  
						    }
						},0);

						jQuery('.chart-input').off().on('input change',function() {
							var property	= jQuery(this).data('property');
							var target		= chart;
							chart.startDuration = 0;

							if ( property == 'topRadius') {
								target = chart.graphs[0];
							}

							target[property] = this.value;
							chart.validateNow();
						});
						
					
			    	
			 	
			 	
			    });
		  });
	});
       

    </script>
</html>