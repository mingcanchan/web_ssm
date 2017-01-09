<%--
  Created by IntelliJ IDEA.
  User: chenmingcan
  Date: 2017/1/9
  Time: 16:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ckplayer</title>
    <script type="text/javascript" src="js/ckplayer/ckplayer.js"></script>

</head>
<body>
    <div id="a1"></div>
    <div id="nowTime"></div>
    <script type="text/javascript">
        var flashvars={
            f:'video/zz.mp4',
            c:0,
          //  p:1,
          //  l:'http://k.ctsywy.com/xml/ckplayer_4417_20150206.swf',
         //   t:15,
        //    b:1,
         //   i:'/static/images/letitgo.jpg',
            my_url:encodeURIComponent(window.location.href)
        };
        var video=['video/zz.mp4'];
        CKobject.embed('js/ckplayer/ckplayer.swf','a1','ckplayer_a1','80%','80%',false,flashvars,video);
    </script>
</body>
</html>
