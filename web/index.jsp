<%@page language="Java" pageEncoding="utf-8" %>
<%@page contentType="text/html;charset=utf-8" %>
<%@page import="java.util.Calendar"%>
<!--henry 引入 產品類-->
<%@page import="entities.Article"%>
<%@page import="java.util.Vector"%>
<!--henry 引入 產品控制類->
<%@page import="dao.ArticleDao"%>
<!--henry 引入 header.jsp-->
<%@include file="headerTop.jsp" %>
<%@include file="SlideShowtest.jsp" %>
<%@include file="header.jsp" %>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
<link href="css/carousel.css" rel="stylesheet">

<div class="RightSide">
    
    <%
        //henry 如request中con參數為null 則顯示 
        if(request.getParameter("con") != null)
        {
    %>
    <div class="login">
        <p style="padding: 5px;"> 請登入會員帳號密碼...</p>
    </div>
    
    <% } %>
    
    
    <!--henry 引入 幻燈片 slideshow -->
   
    
    
      <!--<div class="bredCrum" style="margin-bottom:38px;">-->
        <p>最新產品..</p>
        
      <!--</div>-->
    
    <% 
        //henry 產品分頁
            int NB_PRODUIT_PAGE = 6 ;//vince 產品要每幾項產品為一頁
            
            int pageCourante = 1;
            if(request.getParameter("page") != null)
            {
                pageCourante = Integer.parseInt(request.getParameter("page"));
            }
            
            ArticleDao dao = new ArticleDao();
            //henry取得所有產品
            Vector<Article> articles = dao.findAll();
            //henry 定義總頁數
            int nbTotalePages = (int)Math.ceil(articles.size() / NB_PRODUIT_PAGE /1.0)+1;
            //henry 初始頁
            int init = ((pageCourante - 1) * NB_PRODUIT_PAGE);
            
            String cls = "";
            
            boolean arret = true ;
            int t = 0 ;
          %>
    
    <!-- DEBUT  BOUCLE !! -->
        
<% 
while(t  < NB_PRODUIT_PAGE/3 )
{
%>
      <div class="catrow">

        <ul>


   <% 
            for(int i = init; i < init + 3; i++)
            { 
                cls = "" ;
                if(i >= articles.size())
                {
                    break;
                }

                if(i >= init + 2)
                { 
                    cls+= "last ";

                }
                if(articles.get(i).getDateAjout()!=null){//vince 修正網頁無法顯示沒上傳日期的產品(有這種產品的頁面就會跳出 500 ERROR)
                    if(articles.get(i).getDateAjout().getYear()+1900 >= 2017)
                    {
                    cls+= "new ";
                    }
                }
        %>
 
          <li class="<%= cls %>"   >
              
              <div class="catThum">
                  <a href="article.jsp?id=<%= articles.get(i).getIdArticle() %>">
                      <img width="303" height="286" src="<%= articles.get(i).getImg() %>" alt="" />
                  </a>
<%
    if(articles.get(i).getDateAjout()!=null)    //vince 修正網頁無法顯示沒上傳日期的產品(有這種產品的頁面就會跳出 500 ERROR)
    {
        if(articles.get(i).getDateAjout().getYear()+1900 >= 2017)
        {
%>
                <div class="new"></div>
                
<%}%>
            </div>
            <div class="catDetail">
                <h4 style="width:250px;"><a href="article.jsp?id=<%= articles.get(i).getIdArticle() %>"><%= articles.get(i).getLibelle() %> </a></h4>
              <p style="width:250px;"><%= articles.get(i).getPrix() %>$</p>
            </div>
              
          </li>
          <% }
    } %>
        
        </ul>
              
        <div class="clr"></div>
      </div>

<% 
t++ ;
init += 3 ;
}%>        
        <!-- FIN BOUCLE !! -->
      <!--henry 分頁狀態顯示 上一頁  下一頁-->
      <div class="paging">
        <div class="pagingDiv">
            <span class="label">Page 
                <!--vince 首頁顯示頁數方法先改成這樣喔!有更好的方式可以直接改喔!像是用slideshow那樣更好-->
                <b>
                    <%if(true){
                    for(int i=1;i<=nbTotalePages;i++)
                    {    
                        if(i==pageCourante){%> <a style="color:blue" href="?page=<%= pageCourante %>"><%= i %> </a><%}
                        else{%><a href="?page=<%= i %>"> <%=i%> </a><%}
                    }
                    %>
                </b>
               
            </span>
                <% if(!(pageCourante <= 1) ){ %>    <!--vince 原始碼!(pageCourante <= 1)-->
                <span class="back">
                    <a href="?page=<%= pageCourante - 1 %>"><img src="images/back.gif" alt="" /></a>
                </span>
                 <% } %>   
                 
                  <% if(pageCourante>=1&& pageCourante<nbTotalePages){ %>      <!--vince 原始碼 !(pageCourante >= nbTotalePages) -->
                <span class="next">
                    <a href="?page=<%= pageCourante + 1 %>"><img src="images/next.gif" alt="" /></a>
                </span>
                <% } %>
               <% } %>
               
        </div>
                
        <div class="clr"></div>
      </div>
    </div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
    <script src="/Scripts/AssetsBS3/docs.min.js"></script>

<!--henry 引入 底部footer.jsp-->
<%@include file="footer.jsp" %>
<%@include file="FooterBottom.jsp" %>