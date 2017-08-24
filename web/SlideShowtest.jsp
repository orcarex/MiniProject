<%-- 
    Document   : SlideShowtest
    Created on : 2017/8/12, 下午 05:50:47
    Author     : USER
--%>

<%@page language="Java" pageEncoding="utf-8" %>
<%@page contentType="text/html;charset=utf-8" %>

<html>
<head>
<link rel="icon" href="/Content/AssetsBS3/img/favicon.ico">    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="~/Scripts/AssetsBS3/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="/Scripts/AssetsBS3/ie-emulation-modes-warning.js"></script>
<link href="css/carousel.css" rel="stylesheet">


<title>Insert title here</title>
</head>

<body>
<div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="item active">
          <div class="aa"><img src="images/2.jpg" alt="First slide" ></div>
          <div class="container">
            <div class="carousel-caption">
                <h1><a style="text-decoration:none; color:white;background-color: rgba(105, 105, 105, .3);" href="produits.jsp?x=0&y=0&keyword=背">We Life潮流背袋、包包現正熱售中!!!</a></h1>
               
             
            </div>
          </div>
        </div>
        <div class="item">
          <div class="aa"><img src="images/3(1).jpg" alt="Second slide"></div>
          <div class="container">
            <div class="carousel-caption">
              <h1><a style="text-decoration:none; color:yellow; background-color: rgba(105, 105, 105, .2);"  href="produits.jsp?x=0&y=0&keyword=野餐墊">各式野餐墊現正特價中!!!</a></h1>
              
              
            </div>
          </div>
        </div>
        <div class="item">
            <div class="aa"><img src="images/1.jpg" alt="Second slide"></div>
          <div class="container">
            <div class="carousel-caption">
                <h1><a style="text-decoration:none; color:white;background-color: rgba(105, 105, 105, .1);" href="produits.jsp?x=0&y=0&keyword=幾米">Nac nac 擁抱幾米杯好評熱銷中!!!</a></h1>
             
            </div>
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev"  >
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div><!-- /.carousel -->




 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
    <script src="/Scripts/AssetsBS3/docs.min.js"></script>
   
</body>
</html>