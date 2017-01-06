<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户详情</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/highcharts.src.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/exporting.js"></script>
<script type="text/javascript">
$(function () { 
	$("#getHighcharts").click(function () {
		
// 		$.ajax({
// 			url: "${pageContext.request.contextPath }/customer/getHighcharts",
// 			type: "GET",
// 			dataType:"json",
// 			success: function(data){
				
			//	var yData = data.series;
// 				Title:图表标题，包含标题和副标题（subTitle），其中副标题是非必须的。

// 				Axis:坐标轴，包含x轴（xAxis）和y轴（yAxis）。通常情况下，x轴显示在图表的底部，y轴显示在图表的左侧。多个数据列可以共同使用同一个坐标轴，为了对比或区分数据，Highcharts提供了多轴的支持。

// 				Series:数据列。图表上一个或多个数据系列，比如曲线图中的一条曲线，柱状图中的一个柱形。

// 				Tooltip:数据提示框。当鼠标悬停在某点上时，以框的形式提示该点的数据，比如该点的值，数据单位等。数据提示框内提示的信息完全可以通过格式化函数动态指定。

// 				Legend:图例。用不同形状、颜色、文字等 标示不同数据列，通过点击标示可以显示或隐藏该数据列。

// 				Credits:图表版权信息。显示在图表右下方的包含链接的文字，默认是Highcharts官网地址。通过指定credits.enabled=false即可不显示该信息。

// 				Exporting:导出功能按钮。通过引入exporting.js即可增加图表导出为常见文件功能。

// 				PlotLines:标示线（或辅助线）。可以在图表上增加一条标示线，比如平均值线，最高值线等。

// 				PlotBands:标示区域（分辨带）。可以在图表添加不同颜色的区域带，标示出明显的范围区域。

				$('#container').highcharts({   //图表展示容器，与div的id保持一致
					//legend: enable,\
					lang: {
						contextButtonTitle:"图表导出菜单",
						printChart: "打印图表",
						downloadPNG: "下载PNG图片",
						downloadJPEG: "下载JPEG图片",
						downloadPDF: "下载PDF文档",
						downloadSVG: "下载SVG矢量图",
						exportButtonTitle: "到处图片",
						resetZoom:"恢复缩放",
						noData:"没有数据",
						printChart:"打印图表",
					    resetZoomTitle:"恢复图表",
					},
					exporting:{
						filename: '中文命名显示',
						//enabled: false //隐藏打印按钮 
						url:'http://export.hcharts.cn' //调用中文服务,可以支持中文显示
					},
			        chart: {
			           // type: 'column'   //指定图表的类型，默认是折线图（line）
			            type: 'line',
			            // y轴局部放大
			            zoomType: 'xy',
			            panning: true,//是否开启平移功能，highcharts 默认是 false，highstock 默认为 true
			            panKey: 'shift'//平移按键，对应的是键盘的键名，例如 ’Shift’， ‘ctrl’ 。对于 highcharts，开启平移后，还需要设置 
			        },
			        title: {
		        	   style:{//标题样式设置
		        	       color:"red",
		        	       fontWeight:"bold"
		        	   },
			        	useHTML:true,//开启解析html标签
			           text:/**data.title+*/"市场比例 | <a href='http://www.hcharts.cn' target='_blank'>中文教程</a>"
// 			           text: data.title      //指定图表标题
// 			           text:null
			        },
			       
			        //数据提示框的外观配置
			        tooltip: {
			        	//全局设置 
// 			        	valuePrefix: '￥',//值的前缀
// 			        	valueSuffix: '元',//值的后缀
			            backgroundColor: '#FCFFC5',   // 背景颜色
			            borderColor: 'black',         // 边框颜色
			            borderRadius: 10,             // 边框圆角
			            borderWidth: 3,               // 边框宽度
			            shadow: true,                 // 是否显示阴影
			            animation: true,              // 是否启用动画效果
			            style: {                      // 文字内容相关样式
			                color: "#ff0000",
			                fontSize: "12px",
			                fontWeight: "blod",
			                fontFamily: "Courir new"
			            },
			            //数据提示框中单个点的格式化函数,默认是
// 			            pointFormatter: function() {
// 				            return '<span style="color:{'+this.series.color+'}">u25CF</span> {'+
//        							  this.series.name+'}: <b>{'+this.y+'}</b><br/>.'
// 				        },
// 						crosshairs: true,     // 启用竖直方向准星线
// 						crosshairs: [true, true]  // 同时启用竖直及水平准星线
			            crosshairs: [{            // 设置准星线样式
				            width: 3,
				            color: 'red'
				        }, {
				            width: 1,
				            color: "red",
				            dashStyle: 'longdashdot',
				            zIndex: 100 
				        }],
				        positioner: function () {
			                return { x: 60, y: 30 };
			            },
			            //固定数据提示框的位置 
			            shadow: true,
			            borderWidth: 1,
			            shape   : 'square',
			            borderColor:'#006cee',
			            backgroundColor: '#f9f9f9'
			        },
			        //图例 
			        legend:{
			        	enabled: true,
			        	backgroundColor: "#f7a35c",//背景颜色
			        	borderColor:'#006cee',//边框颜色
			        	margin: 25,//外边距
			        	padding: 10, //内边距
			        	maxHeight: 50,//最大高度
			        	 //navigation:
			        	shadow: "blue",
			        	verticalAlign: "bottom",
			        	labelFormatter: function() {
			        		   /*
			        		    *  格式化函数可用的变量：this， 可以用 console.log(this) 来查看包含的详细信息
			        		    *  this 代表当前数据列对象，所以默认的实现是 return this.name 
			        		    */
			        		    return  this.name + '(Click to hide or show)';  

			        			}  
			        },
			        
			        xAxis: {
			            categories: /**data.categories*/['万达','中影','金逸'], //指定x轴分组
			            gridLineWidth:1, //添加网格线
			            gridLineColor:'green',//网格线颜色
			            gridLineDashStyle: 'LongDashDot', //网格线风格
			            //默认情况下x轴刻度高(tickLength属性)为5px，宽为1px；y轴宽为0px(也就是不显示刻度)。
			            tickLength: 10,//刻度线的长度
				        tickWidth: 5,//刻度线的宽度
				        tickColor: 'red',//刻度线的颜色
				        tickInterval: 1,//刻度间隔,作用与lables.step类似
				        //刻度线对齐方式，有between和on可选，默认是between。
				        tickmarkPlacement: 'on',
				        color : "#00ff00",
				        opposite: false,//倒置是将轴倒置而不是x、y对调
				        //标示线
				        plotLines:[{
				            color:'red',            //线的颜色，定义为红色
				            dashStyle:'LongDashDot',//标示线的样式，默认是solid（实线），这里定义为长虚线
				            value:1.5,                //定义在哪个值上显示标示线，这里是在x轴上刻度为3的值处垂直化一条线
				            width:10,                 //标示线的宽度，2px
				            events:{
				                click:function(){
				                     //当标示线被单击时，触发的事件
				                     alert("点击事件");
				                },
// 				                mouseover:function(){
// 				                    //当标示线被鼠标悬停时，触发的事件
// 				                    alert("悬停事件");
// 				                },
				                
// 				                mouseout:function(){
// 				                    //当标示线被鼠标移出时，触发的事件
// 				                    alert("移出事件");
// 				                },
				                
// 				                mousemove:function(){
// 				                    //当标示线被鼠标移动(时，触发的事件
// 				                    alert("移动事件");
// 				                }
				            }
				            
				        }],
				        //标示区
// 				        plotBands: [{
// 				            from: 1,               // 标示区开始值
// 				            to: 2,                 // 标示区结束值
// 				            label: {              // 标示区文字标签配置，详见API
// 				            },
// 				            color: '',            // 标示区背景颜色
// 				            borderWidth: 10,        // 标示区边框宽度
// 				            borderColor: "#00ff00",    // 标示区边框颜色
// 				            id: 1,                 // 标示区 id，用于删除等操作
// 				            zIndex:1,              // 标示区层叠，用于调整显示层次
// 				            events: {             // 事件，支持 click、mouseover、mouseout、mousemove等事件
// 				                click: function(e) {
// 				                },
// 				                mouseover: function(e) {
// 				                },
// 				                mouseout: function(e) {
// 				                },
// 				                mousemove: function(e) {
// 				                }
// 				            }

// 				        }]
			            
				        
			        },
			        yAxis: {
			            title: {
			                text: /*data.text*/'中国三大影视业市场调查', //指定y轴的标题
			            },
			            labels: { //自定义y轴,格式化
			                formatter:function(){
			                  if(this.value <=5) { 
			                    return "第一等级("+this.value+")";
			                  }else if(this.value >5 && this.value <=10) { 
			                    return "第二等级("+this.value+")"; 
			                  }else { 
			                    return "第三等级("+this.value+")";
			                  }
			                },
			           		step: 1, //2:间距为原来的2倍
			           		//图表中所有文字都设置字体、颜色等样式，一般是通过 style.color 来设置文字颜色的，style 里可以用的属性如下所示：
							// 1.标题样式：title.style 及 subtitle.style 2.坐标轴标签样式：xAxis.lables.style 及 yAxis.lables.style
							// 3.图例文字样式：legend.itemStyle 4.数据提示框文字样式：tooltip.style
			           		style: {
							    color: 'green',
							    fontSize: "15px",
							    fontWeight: "blod",
							    fontFamily: "Courier new"
							} ,
			              },
			              gridLineWidth:1, //添加网格线
				          gridLineColor:'green',//网格线颜色
				        //网格线线条样式。和Css border-style类似，常用的有：Solid、Dot、Dash
				          gridLineDashStyle: 'Dash',
				         // 有linear、logarithmic、datetime、category可选，默认是：linear
				         //linear:线性轴。默认类型，x轴按照Axis.tickInterval值增长，y轴默认是自适应。
				         //logarithmic:对数轴。按照数学中的对数增长，例如1,2,4,8... 用的不多，主要用于对数图表。
						 //datetime:时间轴
						 //category:数组轴。用的最多也最简单
				          type: 'linear',
				          allowDecimals: true,//控制数轴是否显示小数,默认显示true
				          min: 0.01,//控制数轴的最小值
				          max: 10,//控制数轴的最大值
				          //注意：控制allowDecimals、min、max 属性你可以轻松控制数轴的显示范围等（这也是很常见的问题）
				         // opposite: true
			        },
			        plotOptions: {//坐标点选项
			            series: {
			              //  pointStart: Date.UTC(2012, 0, 1),
			               // pointInterval: 24 * 3600 * 1000,
			            	cursor: 'pointer',//设置小手效果
			            	lineWidth: 5,//连线的粗细
			            	animation: true,//是否开启动画,默认开启
			            	allowPointSelect: true,// 点的选择（point Selection） 提示：按住 CTRL 或 SHIFT 键可以多选
			                marker: {
			                    fillColor: 'red',//坐标点填充颜色,中心的颜色
			                    lineWidth: 5,//坐标点的大小
			                    lineColor: "black" // 线条颜色,外围的颜色
			                },
			                dataLabels: {
			                    enabled: true,
			                    format: '{x} \t {y} mm',//{x}获取x轴的值,格式化坐标的显示
			                   /*
			                     formatter:function(){
			                     	return this.x + "\t" + this.y + " mm";
			                     }
			                     
			                   */
			                   
			                },
			                
			                /*
			                 * 默认实现是显示或隐藏当前数据列，e 代表事件， this 为当前数据列
			                 */
// 			                events: {
// 			                    legendItemClick: function(e) {
// 			                        return false; // 直接 return false 即可禁用图例点击事件
// 			                    }
// 			                }
// 			                events: {
// 			                    legendItemClick: function(e) {
// 			                        var index = this.index;

// 			                        var series = this.chart.series;

// 			                        if (!series[index].visible) {

// 			                            for (var i = 0; i < series.length; i++) {

// 			                                var s = series[i];

// 			                                i === index ? s.show() : s.hide();
// 			                            }
// 			                        }

// 			                        return false;
// 			                    }
// 			                }
						
			            },
				        column: {
			                colorByPoint: false //即 colorByPoint 决定了图表是否给每个数据列或每个点分配一个颜色，默认值是 false， 
			              					  //即默认是给每个数据类分配颜色， 设置为 true 则是给每个点分配颜色,其他图形也可以使用colorByPoint:
													// 		 bar 条形图
													//  	column 柱状图
													// 		columnrange 柱状范围图
													// 		heatmap 热力图
													// 		treemap
													// 		waterfall 瀑布图
													// 		 boxplot 箱线图
			            }
			        },
			     //  series: data.series,//数据
			    
			       series: [{
			                data: [5,7,9],/**yData[0].data,*/
// 							data: [
// 							         ['Firefox',   45.0],
// 							         ['IE',       26.8],
// 							         {
// 							            name: 'Chrome',
// 							            y: 12.8,
// 							            sliced: true,
// 							            selected: true
// 							         },
// 							         ['Safari',    8.5],
// 							         ['Opera',     6.2],
// 							         ['Others',   0.7]
// 							      ],
			                name: '市场占有率', /**yData[0].name,*/
			                color: '#00FF00',/**yData[0].color,*///可以设置线条或者圆饼的颜色
			                dashStyle: 'longdash',/**yData[0].dashStyle,*///走势图连线的样式
			                //zones:我们经常会遇到这样的需求：用不同颜色标识出不同范围的值，例如 90-100 用绿色表示，60-80 用蓝色表示，小于 60用红色表示。
			                zones: [{
			                    value: 0,
			                    color: '#f7a35c',
			                    dashStyle: 'dot'
			                }, {
			                    value: 7,
			                    color: '#7cb5ec'
			                }, {
			                    color: '#90ed7d'
			                }],
			                //给指定的数据列设置前缀和后缀
			                tooltip: {
			                    valueSuffix: ' mm'
			                }
			         			
			     		  },
			     		
					        {
				                data: /**yData[1].data,*/[5,8,6],
				                name: /**yData[1].name,*/'收入百分比',
				                color: /**yData[1].color,*/'#FF00FF',//可以设置线条或者圆饼的颜色
				                dashStyle: /**yData[1].dashStyle,*/'shortdot',//走势图连线的样式
				                 zones: [{
				                    value: 0,
				                    color: '#f7a35c',
				                    dashStyle: 'dot'
				                }, {
				                    value: 3,
				                    color: '#7cb5ec'
				                }, {
				                    color: '#90ed7d'
				                }],
			         
					       tooltip: {
					           valueSuffix: '°C'
					       }
				       },
				      
			       ],
			       colorByPoint: true ,
// 			       series: [{
// 			    	    data: [1, 3, 2, 4, 5, 4, 6, 2, 3, 5, 6],
// 			    	    dashStyle: 'longdash' //走势图连线的样式
// 			    	}] 
// 			            name : "point 1",
// 			            color : "#00ff00", 可以设置线条或者圆饼的颜色
// 			            y : 0
// 			        }
// 			        credits: {  //去掉highcharts.com的超链接
// 			        	 enabled: false  
// 			        }
					credits:{
						// enabled:true,                    // 默认值，如果想去掉版权信息，设置为false即可
						text:'www.jiwei.cn',               // 显示的文字
						href:'http://www.hcharts.cn',   // 链接地址
						position:{                          // 位置设置
							align: 'right',
							x: -100,
							verticalAlign: 'bottom',
							y: -50
						},
						style: {                            // 样式设置
							cursor: 'pointer',
							color: 'red',
							fontSize: '30px'
						}
					}
			    }); 
// 			}
// 		});
	});
		
// 	var hasPlotBand = false,
//     chart = $('#container').highcharts(),
//     $button = $('#button');
// 	$button.click(function () {
// 	    if (!hasPlotBand) {
// 	    	chart.xAxis[0].addPlotBand({
// 	            from: 5.5,
// 	            to: 7.5,
// 	            color: '#FCFFC5',
// 	            id: 'plot-band-1'
// 	        });
// 	        $button.html('移除');
// 	    } else {
// 	        chart.xAxis[0].removePlotBand('plot-band-1');
// 	        $button.html('动态');
// 	    }
// 	    hasPlotBand = !hasPlotBand;
// 	});
});

</script>
</head>
<body>
<%-- 	<div>姓名:${customerInfo.customerName }</div> --%>
<%-- 	<div>年龄:${customerInfo.email }</div> --%>
<%-- 	<div>地址:${customerInfo.custType }</div> --%>
	<button type="button" id="getHighcharts" value="">图表展示</button>
	<button type="button" id="button" value="">动态</button>
	<div id="container" style="min-width:800px;height:400px;"></div>
</body>
</html>