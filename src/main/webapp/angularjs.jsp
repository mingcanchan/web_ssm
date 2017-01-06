<!doctype html>
<html>
    <head>
        <script src="${pageContext.request.contextPath }/js/angular.min.js"></script>
    </head>
    <body>
    	<div ng-app>
       	  Your name: <input type="text" ng-model="yourname" placeholder="World121">
       	 <hr>
        	Hello {{yourname || 'World'}}!
        </div>
        	Hello {{yourname || 'World'}}!
    </body>
</html>