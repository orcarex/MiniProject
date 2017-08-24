<%-- 
    Document   : AboutUs
    Created on : 2017/8/17, 下午 02:06:01
    Author     : user
--%>

<%@page language="Java" pageEncoding="utf-8" %>
<%@page contentType="text/html;charset=utf-8" %>
<%@page import="java.util.Calendar"%>
<!--henry 引入產品類-->
<%@page import="entities.Article"%>
<%@page import="java.util.Vector"%>
<!--henry 引入產品控制類-->
<%@page import="dao.ArticleDao"%>
<!--henry 引入header.jsp-->
<%@include file="headerTop.jsp" %>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
     
       request.setCharacterEncoding("UTF-8");
       String select = request.getParameter("select");
    //orcarex BODY內設置ENCODING解決jsp:param中文亂碼問題
    %>
         <%
    request.setCharacterEncoding("UTF-8");//orcarex BODY內設置ENCODING解決jsp:param中文亂碼問題
    %>
    <div class="RightSide">
    <jsp:include page="bredCrum.jsp" flush="true">
        <jsp:param name="select" value="關於本站"/>
    </jsp:include>
        </div>
         <div >
         <iframe style="margin-left:175px;" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3614.4919854179984!2d121.54601001554413!3d25.051308783964313!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442abe7ff2d042b%3A0x4e2592aa0b382d26!2zMTA15Y-w5YyX5biC5p2-5bGx5Y2A5Y2X5Lqs5p2x6Lev5LiJ5q61MzQ26JmfMTIwMg!5e0!3m2!1szh-TW!2stw!4v1502951294074" width="600" height="400" frameborder="0" style="border:0" allowfullscreen></iframe>
         
         
       </div>
        <div style="padding:10px 20px 0px 188px; ">
        <center><h3 style="background-color:white;border-radius:10px;color:black; "> 公司簡介</h3></center>
        <center><p style="font-size:15px; background-color: rgba(105, 105, 105, .1);color:black;   ">We Life創意倉庫團隊成立於2017年7月1日的夏天，由一群熱血精英發揮本業所專精，在此為您展開一連串的創意想像空間，其中包含商品設計、開發、創意設計、禮品贈品開發、美術設計、估價、客製化商品、寵物生活百貨、文創小物設計、3C商品、智慧財產相關合作與授權平台、知識產權法專屬法律顧問、專利整體設計、商標logo設計、專利商標代理申請..等。<br> 
           網頁將不定時的發佈商品促銷活動，搶購預定活動、客製化商品欣賞、歐美商品代購。<br>
           We Life 同時提供智慧財產權顧問服務、商品經銷、授權及版權保護。<br>
            敬請給予我們服務的機會!</p></center>
          <center><h3 style="background-color:white;border-radius:10px;color:black; "> 我們的服務</h3></center>
        <p style="font-size:15px; background-color: rgba(105, 105, 105, .1);color:black;   ">
                1.商品設計、開發、創意設計、禮贈品開發、美術設計、估價、客製化商品。<br>
                2.商品促銷活動企劃，搶購預定活動。<br>
                3.客製化商品欣賞、建議。<br>
                4.禮贈品提案與行銷企劃。<br>
                5.歐美商品代購。<br>
                6.智慧財產相關合作與授權平台、知識產權法專屬法律顧問、專利設計、商標logo設計、專利商標代理申請 。<br> 
                7.商標品牌授權、合約、加盟、經銷及合作。<br>
                8.智慧財產相關諮詢與保護。<br> 
                9.創意商品開發。<br>
                10.生活小物、療愈系列商品、3C商品、絨毛公仔圖案授權、禮品、贈品..<br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                敬請給予我們服務的機會!</p>
          <center><h3 style="background-color:white;border-radius:10px;color:black; "> 聯繫我們</h3></center>
          <center><p style="font-size:15px; background-color: rgba(105, 105, 105, .1);color:black;">TEL:+8862-2579-0518(代表號)<br>地址:台北市南京東路三段346號12樓1202室<br>
           E-Mail:service@welife.tw<br>We Life2017  by  We Life Group </p></center>
        </div>
        
        
        
        <h1></h1>
    </body>
     

    
    
    <%@include file="footer.jsp" %>
<%@include file="FooterBottom.jsp" %>
</html>
