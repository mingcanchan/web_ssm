<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/angular.min.js"></script>
<title>首页</title>
<script type="text/javascript">
$(function () { 
	$("#list").click(function(){
		$.ajax({
				url: "${pageContext.request.contextPath }/customer/list",
				type: "GET",
				dataType:"json",
				success: function(data){
					var dataList = data.list;
// 					var app = angular.module('myApp', []);
// 					app.controller(function($scope) {
// 					   $scope.names = dataList;
// 					});
				//	$scope.names = dataList;
					var tab = $("#tab");
					 $("#tab").empty(); //清空列表
			            var head = "<tr class='topTrStyle'><td>姓名</td><td>编号</td><td>电话</td><td>邮箱</td><td>状态</td></tr>";
			            $("#tab").append(head);
			            //加载列表
			            for (var i = 0; i < dataList.length; i++) {
			                var tr = "<tr style='background-color: #E9F2F7; font-size: 10pt; height: 25px'>";
//			                tr += "<td><a href='Employ_Edit.aspx?type=show&actionId=" + dataList[i].Id + "&actionId2=" + actionId + "&type2=" + type + "&showTitle=查看用户信息'>" + dataList[i].Name + "</a></td>";
			                tr += "<td>" + dataList[i].customerName + "</td>";
			                tr += "<td>" + dataList[i].sn + "</td>"
			                tr += "<td>" + dataList[i].phone + "</td>";
			                tr += "<td>" + dataList[i].email + "</td>";
			                tr += "<td>" + dataList[i].status + "</td>";
			                tr += "</tr>";
			                $("#tab").append($(tr));
			            } //end for dataList
					//$("#data").html(data.list[0].customerName);
					$("#page").html("当前第"+data.firstPage+"页，总共"+data.lastPage+"页");
				}
		});
	});
});

</script>
</head>
<body>
	<div align="center"><h1>welcome,layer</h1></div>
	<div id="list" style="cursor: pointer;">用户列表</div>
	<table id="tab"></table>
	<div id="data"></div>
	<div id="page"></div>
<!--     <table> -->
<!--     	<tr>	 -->
<!--     		<td>111</td> -->
<!--     		<td>222</td> -->
<!--     	</tr> -->
<!-- 	  <tr ng-repeat="x in names"> -->
<!-- 	    <td>{{ x.customerName }}</td> -->
<!-- 	    <td>{{ x.phone }}</td> -->
<!-- 	  </tr> -->
<!-- 	</table> -->
<!--   </tr> -->
</body>
</html>