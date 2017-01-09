<%--
  Created by IntelliJ IDEA.
  User: wolter
  Date: 2017/1/8
  Time: 23:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ckplayer</title>


</head>
<body>
<div id="a1"></div>
<script type="text/javascript" src="js/ckplayer/ckplayer.js" charset="utf-8"></script>
<script type="text/javascript">  var flashvars={    f:'http://movie.ks.js.cn/flv/other/1_0.mp4',    c:0,    loaded:'loadedHandler'  };  var video=['http://movie.ks.js.cn/flv/other/1_0.mp4->video/mp4'];  CKobject.embed('ckplayer/ckplayer.swf','a1','ckplayer_a1','600','400',false,flashvars,video);</script>

</body>
</html>
