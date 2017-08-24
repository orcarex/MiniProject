<%@page language="Java" pageEncoding="utf-8" %>
<%@page contentType="text/html;charset=utf-8" %>
<%@page import="entities.LigneCommande"%>
<%@page import="dao.LigneCommandeDao"%>
<%@page import="dao.CommandeDao"%>
<%@page import="entities.Commande"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="entities.Article"%>
<%@page import="java.util.Vector"%>
<%@page import="dao.ArticleDao"%>
<%@include file="headerTop.jsp" %>
<%@include file="header.jsp" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">

<%    Client client = (Client) request.getSession().getAttribute("client");


    
    if (client == null)
    {
        response.sendRedirect("index.jsp?con");
        return;
    }
    
    Vector<Commande> cmd = (new CommandeDao()).findByLogin(client.getLogin());    
    
    if(cmd == null)
        cmd = new Vector<Commande>();
    

%>


<div class="RightSide">
    <body>    
    <%
        request.setCharacterEncoding("UTF-8"); //orcarex BODY內設置ENCODING解決jsp:param中文亂碼問題
        %>
    </body>
    <jsp:include page="bredCrum.jsp" flush="true">
        <jsp:param name="select" value="我的訂單"/>
      </jsp:include>  



    <table  style="border-style:solid  ;width: 100%; text-align: center">
        <!--Vince 不知道無效 有效什麼-->
        <!--Orcarex 訂單是否成立，根據狀態設定顏色-->
        <%
            for(Commande c : cmd)
            {
                String etat = "待處理";
                String color = "blue";
                if(c.getEtat() == 1){
                    etat = "訂單成立";
                    color= "green";
                }
                if(c.getEtat() == 2){
                    etat = "訂單未成立";
                    color = "red";
                }
        %>
        <tr style="text-align: left">
            <td colspan="2" style="background-color: #E6E6E6; font-size: larger; color: #000000">
                <b>訂單編號 : </b><%= c.getIdCommande() %> <b> 建立日期 </b><%= c.getDateCmd() %>  
            </td>
        
            <td colspan="1" style="background-color: #E6E6E6; font-size: larger; color: #000000; color: <%=color %>">
                <center><b>(<%= etat %>)</b></center>
            </td>
            
            <%--
            <td style="background-color: #E6E6E6; font-size: larger; color: #000000">
                <center><a href="#">
                    <img src="images/no.png" width="30">
                </a></center>
            </td>
            --%>
        
        </tr>
        
        <% 
        
            LigneCommandeDao daolc = new LigneCommandeDao();
            Vector<LigneCommande> lc = daolc.findAll(c.getIdCommande());
            
            for(LigneCommande l : lc){
                Article a = (new ArticleDao()).findByID(l.getIdArticle());
        
        %>
        
        <tr>
            <td>
                <%= a.getLibelle() %>
            </td>
            <td>
                <%= a.getPrix()%> $
            </td>
            <td>
                <%= l.getNbr() %>
            </td>
        </tr>
        <% } %>
        <tr>
            <td colspan="5" style="text-align: right; padding-right: 20px; font-size: 20px;border-style: dashed; border-width: 1px">
              總價格 : <%= c.getPrixTotale() %>
            </td>    
        </tr>
        <% } %>
    </table>    


</div>



<%@include file="footer.jsp" %>
<%@include file="FooterBottom.jsp" %>