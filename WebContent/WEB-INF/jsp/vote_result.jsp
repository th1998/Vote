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
			.center{
				width: 40%;
				height: 500px;
				float: left;
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
				font-size: 20px;
				color: #FFFFFF;
			}
			#main{
				width:100%;
				height:400px; 	
				margin: 0 auto;
				margin-top: 50px;
			}
		</style>
</head>
	<body>
		<div class="bg">
		
			<form class="layui-form">
				<div class="layui-form-item">
					<label class="layui-form-label" style="color:#ffffff;">比赛主题</label>
					<div class="layui-input-inline layui-show-xs-block">
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
			
			<p id="title" style="font-size:26px;"></p>
			<div class="left">
				<div class="bill1">
					<!--选手海报-->
				</div>
				
				<p class="name1"></p> 
			</div>
			<div class="center">
				<div id="main"></div>
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
	layui.use('form', function(){
		  var form = layui.form;
		  
		  form.on('select(competition_name)', function(data){
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
			    	 var xA = [];
			         var yA = [];
			         xA.push(res[0].con1_name,res[0].con2_name);
			         yA.push(res[0].con1_score,res[0].con2_score);

			         myChart.setOption({        //加载数据图表
			             xAxis: {
			                  data: xA   
			             },       
			             series: [{
			                  data: yA
			               
			             }]
			         });
			 	
			 	
			    });
		  });
	});
        var myChart = echarts.init(document.getElementById('main'));
		// 显示标题，图例和空的坐标轴
		myChart.setOption({
		    title: {
		        text: '选手得票数',
		        textStyle:{
		            color:'#c4d9f5',
		            fontStyle:'normal',
		            fontWeight:'bold',
		            fontSize:16
		        }
		    },
		    tooltip: {},
		    legend: {},
		    xAxis: {
		        data: [],
		        axisLabel:{
		            show:true,
		            color:'#ffffff'
		        },
		        splitLine:{
            	　　　　show:false
                }
		    },
		    yAxis: {
		    	axisLabel:{
		            color:'#ffffff',
		        },
		        splitLine:{
            	　　　　show:false
                }
		    },
		    series: [{
		        type: 'bar',
		        barWidth : 50, 
		        itemStyle: {
                    normal: {
                    	label: {
						show: true, //开启显示
						position: 'top', //在上方显示
						textStyle: { //数值样式
							color: '#ffffff',
							fontSize: 18
						}
					},
                    	
          　　　　　　　　　　color: function(params) {
                             var colorList = [
                                   '#C1232B','#27A9E3'
                             ];
                             return colorList[params.dataIndex]
                         },
         
    
                    }
                },
		        data: []
		    }]
		});

// 异步加载数据
	/*$.ajax({
		url:"${pageContext.request.contextPath}/manager/vote_result2",
		success:function(data){
			console.log(data)
      	var xA = [];
        var yA = [];
        for(var i = 0; i < 1; i++) {
            xA.push(data[i].con1_name,data[i].con2_name);
            yA.push(data[i].con1_score,data[i].con2_score);
        }
                myChart.setOption({        //加载数据图表
                    xAxis: {
                        data: xA,
                        color: 'red',
                        axisLabel : {//坐标轴刻度标签的相关设置。
		                interval:0,
		                rotate:"25",
		            }
                    },
                    
                     grid:{//直角坐标系内绘图网格
			            show:true,//是否显示直角坐标系网格。[ default: false ]
			            right:"30px",
			            borderColor:"#000",//网格的边框颜色
			            bottom:"20%" //
			        },
                    series: [{
                        // 根据名字对应到相应的系列
                        name: '评分',
                        data: yA
                    }]
                });
	
	}
	});*/
    </script>
</html>