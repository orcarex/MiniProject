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
<%@include file="SlideShowtest.jsp" %>
<%@include file="header.jsp" %>

   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">   


    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="~/Scripts/AssetsBS3/ie8-responsive-file-warning.js"></script><![endif]-->


<!--henry 產品詳情區域-->
<body>
<div class="RightSide"> 
    <%
    request.setCharacterEncoding("UTF-8");//orcarex BODY內設置ENCODING解決jsp:param中文亂碼問題
    %>
    <jsp:include page="bredCrum.jsp" flush="true">
        <jsp:param name="select" value="我們的產品"/>
      </jsp:include>
    
    <% 
            int NB_PRODUIT_PAGE = 6 ;
            
            int pageCourante = 1;
            if(request.getParameter("page") != null)
            {
                pageCourante = Integer.parseInt(request.getParameter("page"));
            }
    
            String keyword = "";
            //henry 判斷是否有使用關鍵字
            if(request.getParameter("keyword") != null)
                keyword = request.getParameter("keyword");
            
            
            ArticleDao dao = new ArticleDao();
            //henry 查詢所有關鍵字查詢到的產品
            Vector<Article> articles = dao.findAll(keyword);
            //henry 查詢後的產品顯示分頁處理
            int nbTotalePages = 0;
            if(articles != null)
                nbTotalePages =(int)Math.ceil(articles.size() / NB_PRODUIT_PAGE /1.0)+2;
            
            int init = ((pageCourante - 1) * NB_PRODUIT_PAGE);
            
            String cls = "";
            
            boolean arret = true ;
            int t = 0 ;
          %>
    
    <!-- DEBUT  BOUCLE !! -->
    
    
        
<% 
    //henry 如果小於三頁
while(t < NB_PRODUIT_PAGE/3 )
{
%>
      <div class="catrow">

        <ul>


   <% 
            for(int i = init; i < init + 3; i++)
            { 
                cls = "" ;
                if(articles == null || i >= articles.size())
                {
                    break;
                }

                if(i >= init + 2)
                { 
                    cls+= "last ";

                }
                if(articles.get(i).getDateAjout()!=null)    //vince 修正網頁無法顯示沒上傳日期的產品(有這種產品的頁面就會跳出 500 ERROR)
                {
                    if(articles.get(i).getDateAjout().getYear()+1900 >= 2014)
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
    if(articles.get(i).getDateAjout().getYear()+1900 >= 2014)
    {
%>
                <div class="new"></div>
                
   <%}
}%>
            </div>
            <div class="catDetail">
              <h4><a href="article.jsp?id=<%= articles.get(i).getIdArticle() %>"><%= articles.get(i).getLibelle() %> </a></h4>
              <p><%= articles.get(i).getPrix() %>$</p>
            </div>
              
          </li>
          <% } %>
        
        </ul>
              
        <div class="clr"></div>
      </div>

<% 
t++ ;
init += 3 ;
}%>        
        <!-- FIN BOUCLE !! -->
      <!--henry 搜尋產品分頁下方狀態bar 上一頁 下一頁 -->
      <div class="paging">
        <div class="pagingDiv">
            <span class="label">Page 
                <!--vince 頁數顯示方法先改成這樣喔!有更好的方式可以直接改喔!-->
                <b><!--articles.size()/ NB_PRODUIT_PAGE-->
                    <%
                    for(int i=1;i<nbTotalePages;i++)
                    {    
                        if(i==pageCourante){%> <a style="color:blue" href="?page=<%= pageCourante %>"><%= pageCourante %> </a><%}
                        else{%><a href="?page=<%= i %>"> <%=i%> </a><%}
                    }
                    %>
                </b>
                   
            </span>
                <% if(!(pageCourante <= 1) ){ %>
                <span class="back">
                    <a href="?page=<%= pageCourante - 1 %>"><img src="images/back.gif" alt="" /></a>
                </span>
                 <% } %>   
                 <!--<% //if((pageCourante>=1&& pageCourante < articles.size() / NB_PRODUIT_PAGE)){ %>-->
                  <% if((pageCourante>=1&& pageCourante <(nbTotalePages-1))){ %>
                <span class="next">
                    <a href="?page=<%= pageCourante + 1 %>"><img src="images/next.gif" alt="" /></a>
                </span>
                <% } %>
        </div>
                
        <div class="clr"></div>
      </div>
    </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
    <script src="/Scripts/AssetsBS3/docs.min.js"></script>
</body>



<%@include file="footer.jsp" %>
<%@include file="FooterBottom.jsp" %>