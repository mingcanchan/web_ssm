<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>layer用例</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/layer/layer.js"></script>
<script type="text/javascript">
// 	注意事项:
// 		1.layer的alert是非阻断线程的,必须加入回调函数控制业务逻辑
// 		2.layer的函数会覆盖前面的重载函数,例如,多个alert时只会执行最后一个alert函数
// 		3.如果是2.3以下的版本,prompt和tab属于拓展模块,所以必须导入layer.ext.js文件
// 		4.注意从2.3开始,无需通过layer.config来加载拓展模块,以为layer.js已经做了整合

	$(function(){
		//拓展函数需要额外引入,亦可通过以下的方式引入
// 		layer.config({
// 			skin: 'skin/layer.ext.css',
// 			extend: 'extend/layer.ext.js'
// 			//引入多个文件或者皮肤时使用['xxx','xxx','xxx']
// 		});
		
		//alert提示框
		$("#btn0").click(function(){
			//1.简单的提示
			layer.alert("简单的提示!");
			//2.加入图表
			layer.alert("加个图表!",{icon:1})
			//加入回调函数
			layer.alert("加入回调函数",{icon:3},function(index){
				//do something
				layer.msg("hello.layer");
				//关闭layer
				layer.close(index);
			});
		});
		
		//皮肤拓展
		$("#btn1").click(function(){
			layer.alert("皮肤拓展",{
				icon: 1,
				skin: 'layer-ext-moon'//
			})
		});
		
		//询问框
		$("#btn2").click(function(){
			layer.confirm("layer的询问框是非线程阻断的,所以最好加入回调函数", {
				btn: ['确定','取消'],//按钮
				},function(){
					layer.msg("确定按钮,编写放行后的逻辑");//默认是3秒消失提示
				},function(){
					layer.msg("取消按钮,编写取消后的逻辑",{
						time: 5000,//也可以设置提示语的停留时间,单位是毫秒
						btn: ['明白了','知道了']
					});
				}
			);
			alert("layer并没有阻断线程,所以这里也执行了,控制逻辑请放到回调函数中!!!");
		});
		
		//提示层
		$("#btn3").click(function(){
			//layer.msg("提示语,默认停留3秒");
			layer.msg("提示语,设置停留5秒", {
				time: 5000	
			})
		});
		
		//墨绿深蓝风
		$("#btn4").click(function(){
			layer.alert('墨绿风格，点击确认看深蓝', {
			  skin: 'layui-layer-molv' //样式类名
			  ,closeBtn: 1 //关系按钮,1,2,不展示位0
			}, function(){
			  layer.alert('偶吧深蓝style', {
			    skin: 'layui-layer-lan'
			    ,closeBtn: 2
			    ,shift: 3 //动画类型:默认是0,提供0-6种
			  });
			});
		});
		
		//捕获页
		$("#btn5").click(function(){
			//捕获页
			layer.open({
			  type: 0,
			  shade: false,//遮罩,默认为0.3 弹出层区域
			  title: "捕获页", //false,不显示标题
			  content: $('#catch'), //捕获的元素
			  cancel: function(index){//关闭窗体后回调函数
			    layer.close(index);
			    this.content.show();//将元素内容展示,如果type:1会将被show的元素内容会从display:none 变成display:""
			    layer.msg('捕获就是从页面已经存在的元素上，包裹layer的结构', {time: 5000, icon:6});
			  }
			});
			
		});
		
		//页面层
		$("#btn6").click(function(){
			layer.open({
			  type: 1,
			  skin: 'layui-layer-rim', //加上边框
			  area: ['420px', '240px'], //宽高
			  content: '<font color="red" size="6">wellcome layer</font>'
			});
		});
		
		//自定义层
		$("#btn7").click(function(){
			layer.open({
				  type: 0,
				  skin: 'layui-layer-demo', //样式类名,目前内置的skin有 layui-layer-lan layui-layer-molv
				  closeBtn: 2, //不显示关闭按钮
				  shift: 2,//动画类型:默认是0,提供0-6种类型
				  shadeClose: true, //开启遮罩关闭
				  content: '内容'
				});

		});
		
		//tips层
		$("#btn8").click(function(){
			layer.tips('Hi，我是tips', '#btn8'//'吸附元素选择器，如#id'
					);	
			layer.tips('我是另外一个tips，只不过我长得跟之前那位稍有些不一样。', '#btn7', {
				  tips: [1, '#3595CC'],//[位置,底色]
				  time: 4000 //停留时间,毫秒值,默认为3秒
				});
		});
		
		//iframe层
		$("#btn9").click(function(){
			layer.open({
				  type: 2,//0信息框,默认;1页面层;2iframe层;3加载层;4tips层
				  title: '首页',
				  shadeClose: false,// 是否点击遮罩关闭 true时点击遮罩区域可以关闭iframe层,设置为false时,只能通过关闭按钮来关闭
				  maxmin: true,//展示最大化按钮,默认不展示
				  shade: 0.5,//遮罩的透明度,1为不透明
				  area: ['600px', '80%'],//iframe框体大小
				  content: 'http://layer.layui.com/mobile/'  //iframe的url,可以给action等请求的url
				}); 
		});
		
		
		//iframe窗
		$("#btn10").click(function(){
			layer.open({
				  type: 2,
				  title: false,//不展示标题
				  closeBtn: 1, //不显示关闭按钮
				  shade: [0.5],//String/Array/Boolean，默认：0.3
				  area: ['340px', '215px'],
				  offset: ['500px','600px'],//'rb', //右下角弹出
				  time: 2000, //2秒后自动关闭
				  shift: 2,//动画类型
				  content: ['index.jsp', 'no'], //iframe的url，no代表不显示滚动条
				  end: function(){ //此处用于演示
				    layer.open({
				      type: 2,
				      title: '很多时候，我们想最大化看，比如像这个页面。',
				      shadeClose: true,
				      shade: false,
				      maxmin: true, //开启最大化最小化按钮
				      area: ['893px', '600px'],
				      content: 'index.jsp'
				    });
				  }
				});
		});
		
		//加载层
		$("#btn11").click(function(){
			//var index = layer.load(0, {shade: false}); //0代表加载的风格，支持0-2 shade表示没有弹出区域
			var index = layer.load(1, {shade: false,time: 5000});  //0代表加载的风格，支持0-2 shade表示没有弹出区域
			//var index = layer.load(2, {shade: [0.1,'#3595CC'],/*[透明度,背景色]*/ time: 5000});  //0代表加载的风格，支持0-2 shade表示没有弹出区域
		});
		
		//prompt层
		$("#btn12").click(function(){
			layer.prompt({
				  title: '输入任何口令，并确认',
				  formType: 0 //prompt风格，支持0-2
				}, function(pass){
				  layer.prompt({title: '随便写点啥，并确认', formType: 2}, function(text){
				    layer.msg('演示完毕！您的口令：'+ pass +' 您最后写下了：'+ text);
				  });
				});
		});
		
		//TAB层
		$("#btn13").click(function(){
			layer.tab({
				  area: ['600px', '300px'],
				  tab: [{
				    title: 'TAB1', 
				    content: 'hello,java'
				  }, {
				    title: 'TAB2', 
				    content: 'hello,layer'
				  }, {
				    title: 'TAB3', 
				    content: 'hello,jiwei'
				  }]
				});

		});
		
		//相册层
		$("#btn14").click(function(){
			//模拟照片数据
			var json = {
					"title": "美女相册",//相册标题
					"id": 0,//相册id
					"start": 0,//初始显示的图片序号,默认为0
					"data":[//相册包含的图片,数组格式
					       {
					    	   "alt": "美女1号",//图片名称
					    	   "pid": 1,//图片id
					    	   "src": "img/01.jpg",//原图
					    	   "thumb":"img/01.jpg"//缩略图
					       }, 
					       {
					    	   "alt": "美女2号",
					    	   "pid": 2,
					    	   "src": "img/02.jpg",
					    	   "thumb":"img/02.jpg"
					       }, 
					       {
					    	   "alt": "美女3号",
					    	   "pid": 3,
					    	   "src": "img/03.jpg",
					    	   "thumb":"img/03.jpg"
					       }, 
					       {
					    	   "alt": "美女4号",
					    	   "pid": 4,
					    	   "src": "img/04.jpg",
					    	   "thumb":"img/04.jpg"
					       }, 
					        ]
			
			}
			//$.getJSON('test/photos.json?v='+new Date, function(json){
				  layer.photos({
				    photos: json //格式见API文档手册页
				  });
			//	});
		});
		
		//随机位置打开
		$("#btn15").click(function(){
			layer.open({
				type: 2,
				title: '当你选择窗体时,即会在最顶端',
				area: ['390px','330px'],
				shade: 0,
				maxmin: true,
				offset: [
					Math.random()*($(window).height()-300),
					Math.random()*($(window).height()-390)
				],
				context: 'index.jsp',
				btn: ['确定','关闭']
			})
		});
	});
</script>
</head>
<body>
	<h1 align="center">layer用例</h1>
	<div align="center"><span id="catch" style="display: none"><font color="green" size="3">layer历经三年考验，已经清楚地懂得了人们最需要的是什么，
	因此这一版的核心是做减法，不仅剔除了部分冗余的API，对包括layer.ext.js在内的代码也进行了大量瘦身</font></span></div>
	<div align="center">
		<div style="margin-top: 15px"><input type="button" id="btn0" value="alert"/></div>
		<div style="margin-top: 15px"><input type="button" id="btn1" value="皮肤拓展"/></div>
		<div style="margin-top: 15px"><input type="button" id="btn2" value="询问框"/></div>
		<div style="margin-top: 15px"><input type="button" id="btn3" value="提示语"/></div>
		<div style="margin-top: 15px"><input type="button" id="btn4" value="墨绿深蓝风"/></div>
		<div style="margin-top: 15px"><input type="button" id="btn5" value="捕获页"/></div>
		<div style="margin-top: 15px"><input type="button" id="btn6" value="页面层"/></div>
		<div style="margin-top: 15px"><input type="button" id="btn7" value="自定义层"/></div>
		<div style="margin-top: 15px"><input type="button" id="btn8" value="tips"/></div>
		<div style="margin-top: 15px"><input type="button" id="btn9" value="iframe层"/></div>
		<div style="margin-top: 15px"><input type="button" id="btn10" value="iframe窗"/></div>
		<div style="margin-top: 15px"><input type="button" id="btn11" value="加载层"/></div>
		<div style="margin-top: 15px"><input type="button" id="btn12" value="prompt层"/></div>
		<div style="margin-top: 15px"><input type="button" id="btn13" value="TAB"/></div>
		<div style="margin-top: 15px"><input type="button" id="btn14" value="照片"/></div>
		<div style="margin-top: 15px"><input type="button" id="btn15" value="随机位置"/></div>
	
	</div>
</body>
</html>