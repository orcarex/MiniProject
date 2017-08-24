<%-- 
    Document   : search
    Created on : 2017/7/16, 下午 06:44:20
    Author     : OrcaR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>search check Page</title>
    </head>
    <body>
        <%
            response.setCharacterEncoding("UTF-8");
            String str = request.getParameter("keyword");
            String strC = request.getParameter("choice");

        %>
        <!-- orcarex 根據選單結果轉換頁面 並傳關鍵字參數-->
        <jsp:forward page="<%=strC%>">
        <jsp:param name="keyword" value="<%=str %>"/>
        </jsp:forward>
        <a href="<%=strC%>">去結果<a>
    </body>
</html>
