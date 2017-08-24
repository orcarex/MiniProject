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
<body>
<%
Client client = (Client)request.getSession().getAttribute("client");
//henry 判斷是否登入 沒有登入則跳轉到前台首頁  並提示會員需登入才可以查看本頁面
if(client == null)
{
    response.sendRedirect("index.jsp?con");
    return ;
}


%>
    <div class="RightSide" >
    
        <%
        request.setCharacterEncoding("UTF-8"); //orcarex BODY內設置ENCODING解決jsp:param中文亂碼問題
        %>
          <jsp:include page="bredCrum.jsp" flush="true">
          <jsp:param name="select" value="我的帳號"/>
          </jsp:include>
        <form action="CompteServlet" method="GET" >
         <%if(request.getParameter("add") != null && request.getParameter("add").equals("success"))
         {
            %><p>註冊成功</p><%
         } %> 
         <%if(request.getParameter("update") != null && request.getParameter("update").equals("success"))
         {
            %><p>更新成功</p><%
         } %> 
         
        <center>
        <table style="padding-top: 100px;">
            <tr>
                <td>帳號 : </td>
                <td><input class="form-control chk2" value="<%= client.getLogin()%>"  disabled="true" style="background-color: #E6E6E6" > </td>
                
                <td>
                    <input type="hidden" name="login" value="<%= client.getLogin()%>" >
                     <input type="hidden" name="msg" value="update" >
                </td>
            </tr>

            <tr>
                <td>姓氏 : </td>
                <td><input class="form-control chk2" name="nom" value="<%= client.getNom() %>" > </td>
            </tr>
            
            <tr>
                <td>名字 : </td>
                <td><input class="form-control chk2" name="prenom" value="<%= client.getPrenom()%>"></td>
            </tr>
            
            <tr>
                <td>密碼 : </td>
                <td><input  class="form-control chk2"type="password" name="mdp" value="<%= client.getMdp() %>"></td>
            </tr>
            <tr>
                <td>電話 : </td>
                <td><input class="form-control chk2" name="phone_number" value="<%= client.getphone_number() %>"></td>
            </tr>
            <tr>
                <td>地址 : </td>
                <td><input class="form-control chk2" name="address" value="<%= client.getaddress() %>"></td>
            </tr>
            <tr>
                <td>
                    <button class="btn btn-lg btn-info btn-block" id="send" type="submit" >變更</button>
                </td>
                <td>
                    <button class="btn btn-lg btn-warning btn-block" type="reset" >取消</button>
                </td>
            </tr>
            
    </table>
    </center>
    </form>
    
</div>
</body>
<!--henry 引入 footer.jsp-->
<%@include file="footer.jsp" %>
<%@include file="FooterBottom.jsp" %>