<%--
  Created by IntelliJ IDEA.
  User: chenmingcan
  Date: 2017/1/9
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>vidoe.js示例</title>
    <link href="js/videojs/video-js.min.css" rel="stylesheet" type="text/css">
    <script src="js/videojs/video.min.js"></script>

    <script type="text/javascript">
        var myPlayer = videojs('example_video_1');
        videojs("example_video_1").ready(function(){
            var myPlayer = this;
            myPlayer.play();
        });
    </script>
</head>
<body>

<video id="example_video_1" class="video-js vjs-default-skin" controls preload="none" width="640" height="264"
       poster="http://video-js.zencoder.com/oceans-clip.png"
       data-setup="{}">
    <source src="video/zz.mp4" type='video/mp4' />
    <source src="http://视频地址格式2.webm" type='video/webm' />
    <source src="http://视频地址格式3.ogv" type='video/ogg' />
    <track kind="captions" src="demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->
    <track kind="subtitles" src="demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->
</video>
</body>
</html>
