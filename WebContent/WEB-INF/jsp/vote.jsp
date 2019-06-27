<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0'/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/swiper.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/vote.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/zan.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.0.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dist/js/swiper.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/swiper.animate.min.js" ></script>
<script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
<script src="http://pv.sohu.com/cityjson?ie=utf-8"></script> 
<title>投票</title>
</head>
<body>
 
<div class="swiper-container">
      <div class="swiper-wrapper">
    <c:forEach items="${statuspk}" var="item" varStatus="status">
		
			<section class="swiper-slide swiper-slide1">
        	<div class="box">  
        		<div id="head1${item.con1_id }" style="display:none;">${item.con1_id }</div> 
        		<div id="head2${item.con2_id }" style="display:none;">${item.con2_id }</div>        	
        		<div class="pic">
      				<div id="pic1${status.index }" style="float:left;"></div> 
        			<div id="pic2${status.index }" style="float:left;"></div>   
        		</div>
        		<div class="intro">
        			<div class="match_name">
        				<p>${item.comp.competition_name }</p>
        			</div>
        		    <div class="constants">
        		    <c:if test="${item.comp.vote_type == 1 }">
        		    <div class="constant1">
        		    		<div class="constant1_intro">
        		    		<p  class="constant1_name">${item.con1_name }</p>
        		    		<p class="music_name" >
        		    			${item.con1_music }
        		    		</p>
        		    		</div>
        		    		<div class="zan1 heart"  id="${item.comp.id }" con_id="${item.con1_id }"  rel="like">
        		    		</div>
        		    	</div>
        		    	<div class="pk">
        		    		<p style="font-size:20px;">PK</p>
        		    	</div>
        		    	<div class="constant2">
        		    		<div class="constant2_intro">
        		    		<p  class="constant2_name">${item.con2_name }</p>
        		    		<p class="music_name" >
        		    			${item.con2_music }
        		    		</p>
        		    		</div>
        		    		<div class="zan2 heart" id="${item.comp.id }" con_id="${item.con2_id }" rel="like">
        		    		</div>
        		    	</div>
        		    </c:if>
        		    
        		     <c:if test="${item.comp.vote_type == 0 }">
        		    <div class="constant1">
        		    		<div class="constant1_intro">
        		    		<p  class="constant1_name">${item.con1_name }</p>
        		    		<p class="music_name" >
        		    			${item.con1_music }
        		    		</p>
        		    		</div>
        		    		<div class="low"  id="${item.comp.id }" con_id="${item.con2_id }" rel="like">
        		    		</div>
        		    	</div>
        		    	<div class="pk">
        		    		<p style="font-size:20px;">PK</p>
        		    	</div>
        		    	<div class="constant2">
        		    		<div class="constant2_intro">
        		    		<p  class="constant2_name">${item.con2_name }</p>
        		    		<p class="music_name" >
        		    			${item.con2_music }
        		    		</p>
        		    		</div>
        		    		<div class="low"  id="${item.comp.id }" con_id="${item.con1_id }" rel="like">
        		    		</div>
        		    	</div>
        		    </c:if>
        		    	
        		    	
        		        <div class="times" >
	        		    	<p>${item.comp.vote_start }</p>
	        		    	<p>至</p>
	        		    	<p>${item.comp.vote_end }</p>
        		    	</div>
        		    </div>
        	
        		</div>
        	</div>
        </section>

		
	</c:forEach>
        
    </div>
 
   <img src="../images/arrow.png" style="width:20px;height:15px; bottom: 10px; left:190px;" id="array" class="resize"> 
  <div class="swiper-pagination"></div>  
</div>

<script>
var url = '${pageContext.request.contextPath}/manager/vote_submit';
$.post(url, function (res) {
	for(var i = 0 ;i<res.length;i++){
		var startTime;
		var endTime;
		
		var data = {
			startTime: res[i].comp.vote_start,
			endTime: res[i].comp.vote_end
		}; //模拟后台返回的数据
		startTime = new Date(data.startTime);
		endTime = new Date(data.endTime);
		
		var myDate =new Date();
		
		if(myDate.getTime()>endTime.getTime()){
			var id = res[i].competition_id;
			$.ajax({
			    url: '${pageContext.request.contextPath}/manager/xgzt?id='+id,
			    type:'post',
			    async: true,
			    success:function(data){
			    	location.reload();
			    }
			 });
        }else{
        	if(res[i].comp.vote_type == 1){
        		console.log("有几个正票"+i)
        		$(".swiper-container").append(
    					'<div class="swiper-wrapper">'+
    						'<section class="swiper-slide swiper-slide1">'+
    			        	'<div class="box"> '+ 
    			        		'<div id="head1'+res[i].con1_id+'" style="display:none;">'+res[i].con1_id+'</div>'+ 
    		        			'<div id="head2'+res[i].con2_id+'" style="display:none;">'+res[i].con2_id+'</div> '+ 
    			        		'<div class="pic">'+
    			      				'<div id="pic1'+i+'"></div>'+
    			      				'<div id="pic2'+i+'"></div>'+
    			        		'</div>'+
    			        		'<div class="intro">'+
    			        			'<div class="match_name">'+
    			        				'<p>'+res[i].comp.competition_name+'</p>'+
    			        			'</div>'+
    			        		    '<div class="constants">'+
    			        		    	'<div class="constant1">'+
    			        		    		'<div class="constant1_intro">'+
    			        		    		'<p  class="constant1_name">'+res[i].con1_name+'</p>'+
    			        		    		'<p class="music_name" >'+
    			        		    			''+res[i].con1_music+''+
    			        		    		'</p>'+
    			        		    		'</div>'+
    			        		    		'<div class="zan1 heart"  id="'+res[i].comp.id+'" con_id="'+res[i].con1_id+'" rel="like">'+
    			        		    		'</div>'+
    			        		    	'</div>'+
    			        		    	'<div class="pk">'+
    			        		    		'<p style="font-size:20px;">PK</p>'+
    			        		    	'</div>'+
    			        		    	'<div class="constant2">'+
    			        		    		'<div class="constant2_intro">'+
    			        		    		'<p  class="constant2_name">'+res[i].con2_name+'</p>'+
    			        		    		'<p class="music_name" >'+
    			        		    		''+res[i].con2_music+''+
    			        		    		'</p>'+
    			        		    		'</div>'+
    			        		    		'<div class="zan2 heart" id="'+res[i].comp.id+'" con_id="'+res[i].con2_id+'" rel="like">'+
    			        		    		'</div>'+
    			        		    	'</div>'+
    			        		        '<div class="times">'+
    			        		        '<p>'+res[i].comp.vote_start+'</p>'+
    			        		    	'<p>至</p>'+
    			        		    	'<p>'+res[i].comp.vote_end+'</p>'+
    			        		    '</div>'+
    			        		    '</div>'+
    			        	
    			        		'</div>')
        	}else{
        		console.log("测试："+i)
        		$(".swiper-container").append(
    					'<div class="swiper-wrapper">'+
    						'<section class="swiper-slide swiper-slide1">'+
    			        	'<div class="box"> '+ 
    			        		'<div id="head1'+res[i].con1_id+'" style="display:none;">'+res[i].con1_id+'</div>'+ 
    		        			'<div id="head2'+res[i].con2_id+'" style="display:none;">'+res[i].con2_id+'</div> '+ 
    			        		'<div class="pic">'+
    			      				'<div id="pic1'+i+'"></div>'+
    			      				'<div id="pic2'+i+'"></div>'+
    			        		'</div>'+
    			        		'<div class="intro">'+
    			        			'<div class="match_name">'+
    			        				'<p>'+res[i].comp.competition_name+'</p>'+
    			        			'</div>'+
    			        		    '<div class="constants">'+
    			        		    	'<div class="constant1">'+
    			        		    		'<div class="constant1_intro">'+
    			        		    		'<p  class="constant1_name">'+res[i].con1_name+'</p>'+
    			        		    		'<p class="music_name" >'+
    			        		    			''+res[i].con1_music+''+
    			        		    		'</p>'+
    			        		    		'</div>'+
    			        		    		'<div class="low"  id="'+res[i].comp.id+'" con_id="'+res[i].con2_id+'" rel="like">'+
    			        		    		'</div>'+
    			        		    	'</div>'+
    			        		    	'<div class="pk">'+
    			        		    		'<p style="font-size:20px;">PK</p>'+
    			        		    	'</div>'+
    			        		    	'<div class="constant2">'+
    			        		    		'<div class="constant2_intro">'+
    			        		    		'<p  class="constant2_name">'+res[i].con2_name+'</p>'+
    			        		    		'<p class="music_name" >'+
    			        		    		''+res[i].con2_music+''+
    			        		    		'</p>'+
    			        		    		'</div>'+
    			        		    		'<div class="low" id="'+res[i].comp.id+'" con_id="'+res[i].con1_id+'" rel="like">'+
    			        		    		'</div>'+
    			        		    	'</div>'+
    			        		        '<div class="times">'+
    			        		        '<p>'+res[i].comp.vote_start+'</p>'+
    			        		    	'<p>至</p>'+
    			        		    	'<p>'+res[i].comp.vote_end+'</p>'+
    			        		    '</div>'+
    			        		    '</div>'+
    			        	
    			        		'</div>')
        	}
        	
        }
        	
        
			
			/*--------------------------------*/
			
		    /*--------------------------------------------*/
			var a = $("#head1"+res[i].con1_id).html();
			var b = $("#head2"+res[i].con2_id).html();
			
			
			
			$.ajax({
			    url:'${pageContext.request.contextPath}/manager/findhead?con_id='+a,
			    type:'post',
			    async: false,
			    success:function(res2){
					$("#pic1"+i).html('<img src="${pageContext.request.contextPath}/upload/'+res2[0].picture+'" width="180" height="300">');   
			    }
			 });
			
			$.ajax({
			    url:'${pageContext.request.contextPath}/manager/findhead?con_id='+b,
			    type:'post',
			    async: false,
			    success:function(res3){
					$("#pic2"+i).html('<img src="${pageContext.request.contextPath}/upload/'+res3[0].picture+'" width="180" height="300">');  
			       }
			 });

			
			
			        		
			        	
	
	}
	
	
});





</script>

<script>  

scaleW=window.innerWidth/320;
scaleH=window.innerHeight/480;

  var mySwiper = new Swiper ('.swiper-container', {
   direction : 'vertical',
   pagination: {
    el: '.swiper-pagination',
  },
  //virtualTranslate : true,
   mousewheelControl : true,
   onInit: function(swiper){
   swiperAnimateCache(swiper);
   swiperAnimate(swiper);
	  },
   onSlideChangeEnd: function(swiper){
	swiperAnimate(swiper);
    },
	onTransitionEnd: function(swiper){
	swiperAnimate(swiper);
    },
	
	
	watchSlidesProgress: true,

      onProgress: function(swiper){
        for (var i = 0; i < swiper.slides.length; i++){
          var slide = swiper.slides[i];
          var progress = slide.progress;
          var translate = progress*swiper.height/4;  
		  scale = 1 - Math.min(Math.abs(progress * 0.5), 1);
          var opacity = 1 - Math.min(Math.abs(progress/2),0.5);
          slide.style.opacity = opacity;
		  es = slide.style;
		  es.webkitTransform = es.MsTransform = es.msTransform = es.MozTransform = es.OTransform = es.transform = 'translate3d(0,'+translate+'px,-'+translate+'px) scaleY(' + scale + ')';
		  
        }
      },
	
	   onSetTransition: function(swiper, speed) {
        for (var i = 0; i < swiper.slides.length; i++){
          es = swiper.slides[i].style;
		  es.webkitTransitionDuration = es.MsTransitionDuration = es.msTransitionDuration = es.MozTransitionDuration = es.OTransitionDuration = es.transitionDuration = speed + 'ms';
		  
        }
     },	
	   })         
  </script>
  
  <script>   
	$('body').on("click",'.heart',function(){
    	var id=$(this).attr("id");
    	var con_id=$(this).attr("con_id");
    	console.log(id);
    	console.log(con_id);
    	$(this).css("background-position","")
        var D=$(this).attr("rel");
    	if($(this).hasClass("heartAnimation")){
            $(this).removeClass("heartAnimation");
        }else{
            $(".heart").each(function () {
                $(this).removeClass("heartAnimation");
            })
            $(this).addClass("heartAnimation").attr("rel","unlike");
            
        }
    	
    	var voter_ip = returnCitySN["cip"];
    	
    	$.ajax({
		    url: '${pageContext.request.contextPath}/manager/findip?voted_comid='+id+'&voter_ip='+voter_ip,
		    type:'post',
		    async: true,
		    success:function(data){
		    	console.log(data)
		    	if(data == 1){
		    		layui.use('form', function(){
		    			  var form = layui.form;
		    			  layer.alert("每场比赛只能投一票！", {icon: 2});
		    		});
		    	}else{
		    		$.ajax({
		    		    url: '${pageContext.request.contextPath}/manager/zan_submit?voter_ip='+voter_ip+'&voted_comid='+id+'&voted_contestantid='+con_id,
		    		    type:'post',
		    		    async: true,
		    		    success:function(data){
		    		    	
		    		    }
		    		 });
		    	}
		    }
		 });
    	
       	
    });
	
	$('.low').on("click",function(){   	
		      
		        if($(this).hasClass("low_hover")){
		            $(this).removeClass("low_hover");
		           
		        }
		        else{
		            $(".low").each(function () {
		            	$(this).addClass("low").attr("rel","like");
		                $(this).removeClass("low_hover");
		                
		            })          
		            $(this).addClass("low_hover").attr("rel","unlike");
		        }
		          var con_id=$(this).attr("con_id");
		          var id=$(this).attr("id");
		          
		          var voter_ip = returnCitySN["cip"];
		      	
		      	$.ajax({
		  		    url: '${pageContext.request.contextPath}/manager/findip?voted_comid='+id+'&voter_ip='+voter_ip,
		  		    type:'post',
		  		    async: true,
		  		    success:function(data){
		  		    	console.log(data)
		  		    	if(data == 1){
		  		    		alert("只能投一次");
		  		    	}else{
		  		    		$.ajax({
		  		    		    url: '${pageContext.request.contextPath}/manager/zan_submit?voter_ip='+voter_ip+'&voted_comid='+id+'&voted_contestantid='+con_id,
		  		    		    type:'post',
		  		    		    async: true,
		  		    		    success:function(data){
		  		    		    	
		  		    		    }
		  		    		 });
		  		    	}
		  		    }
		  		 });
	});
	</script>
 
</body>
</html>