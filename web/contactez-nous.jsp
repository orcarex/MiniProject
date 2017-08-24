<%@page language="Java" pageEncoding="utf-8" %>
<%@page contentType="text/html;charset=utf-8" %>
<%@page import="java.util.Calendar"%>
<!--henry 引入商品類-->
<%@page import="entities.Msg"%>
<%@page import="java.util.Vector"%>
<!--henry 引入商品控制類-->
<%@page import="dao.MsgDao"%>
<%@include file="headerTop.jsp" %>
<%@include file="header.jsp" %>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
<!--henry 本頁面功能尚未程式化 僅有靜態呈現-->

<body>

<div class="RightSide">
    <%
    request.setCharacterEncoding("UTF-8");//orcarex BODY內設置ENCODING解決jsp:param中文亂碼問題
    %>
    <jsp:include page="bredCrum.jsp" flush="true">
        <jsp:param name="select" value="聯絡我們"/>
    </jsp:include>

    
 <%
    //henry 新增產品成功則顯示下方區塊代碼 會以橫幅 綠色 Bar形式顯示
    if(request.getParameter("MsgAddStatus") != null && request.getParameter("MsgAddStatus").equals("success"))
    {
%>
<p class="success_msg">新增留言成功</p>
<%}%>
        
   <form style=" padding: 95px; padding-top:50px;" id="contact_form" action="AddMsgServlet" method="get">
	<div class="row">
		<label for="name">姓名 :</label><br />
		<input id="name" class="input" name="msgGuestName" type="text" value="" size="33" /><br />
	</div>
	<div class="row">
		<label for="email">電子信箱 : </label><br />
		<input id="email" class="input" name="guestGuestEmail" type="text" value="" size="33" /><br />
	</div>
	<div class="row">
		<label for="message">留言內容 : </label><br />
		<textarea id="message" class="input" name="guestGuestMsgContent" rows="7" cols="35"></textarea><br />
	</div>
	<input style="margin-left:-14px; " id="submit_button" type="submit" value="發送" /><br /><br /><br />
         <div class="linemaster"> 
        <div class="line1">  <img src="images/addfriends_zh-Hant.png" height="80px"  ></div><br />
         <div class="line2">  <img src="images/line_id_uprite.png" height="90px"  ></div>
        </div>
        
</form>				
<h3 style="margin-top:-420px;margin-left:388px; color:skyblue  ">**有任何問題請留言給我們，我們將盡快為您處理**</h3>       
<img src="images/server.jpg" width="61%" style="margin-left:370px;margin-top:18px;  "/>  
    
    
    
</div>

</body>

<!--henry 引入footer頁面-->
<%@include file="footer.jsp" %>
<%@include file="FooterBottom.jsp" %>