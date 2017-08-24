<%@page language="Java" pageEncoding="utf-8" %>
<%@page contentType="text/html;charset=utf-8" %>
<!--henry 購物車類-->
<%@page import="panier.LignePanier"%>
<!--henry 引入購物車與產品中間控制類-->
<%@page import="panier.Panier"%>
<%@page import="java.util.Calendar"%>
<!--henry 引入產品類-->
<%@page import="entities.Article"%>
<%@page import="java.util.Vector"%>
<!--henry 引入產品控制類-->
<%@page import="dao.ArticleDao"%>
<!--henry 引入header.jsp頁-->

<%@include file="headerTop.jsp" %>
<%@include file="header.jsp" %>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">


<div class="RightSide"> 
    <body>    
    <%
        request.setCharacterEncoding("UTF-8"); //orcarex BODY內設置ENCODING解決jsp:param中文亂碼問題
        %>
    </body>
    <jsp:include page="bredCrum.jsp" flush="true">
        <jsp:param name="select" value="我的購物車"/>
      </jsp:include>
    <div class="cartDetail">
        <div class="headings">
            <ul>
                <li class="perview">產品預覽</li>
                <li class="proName">產品名稱</li>
                <li class="priceHead">產品單價</li>
                <li class="quanitity">數量</li>
                <li class="total">總價格</li>
            </ul>
            <div class="clr"></div>
        </div>

<%
int i = 0 ;
//henry 取得購物車資料將資料賦值給lp並迴圈跑出對應產品各明細
for(LignePanier lp : panier.getLignesPanier())
{
    i++;
%>
        
        <div class="proList">
            <ul>
                <li class="number"> <%= i %>. </li>
                <li class="thumbMail">
                    <!--henry 取得並顯示產品圖片-->
                    <a href="#"><img width="82" height="60" src="<%= lp.getArticle().getImg() %>" alt=""/></a>
                </li>							
                
                <li class="proName">
                     <!--henry 取得並顯示產品名稱-->
                    <a href="#"><%= lp.getArticle().getLibelle()%></a>
                </li>
                 <!--henry 取得並顯示產品價格-->
                <li class="priceHead">$<%= lp.getArticle().getPrix()%></li>
                
                <li class="quanitity">
                    <div class="icons">
                         <!--henry 取得產品id並拼接成超動態連結-->
                        <a href="PanierServlet?op=add&sender=panier.jsp&id=<%= lp.getArticle().getIdArticle() %>" title="plus-pro"><img src="images/plus-pro.gif" alt="plus-pro"/></a>
                        <a href="PanierServlet?op=sous&sender=panier.jsp&id=<%= lp.getArticle().getIdArticle() %>" title="minus-pro"><img src="images/minus-pro.gif" alt="minus-pro"/></a>
                    </div>
                     <!--henry 取得並顯示購物車中產品數量-->
                    <div class="box"><%= lp.getQuantite() %></div>
                </li>
                     <!--henry 取得並顯示購物車中產品價格-->
                <li class="total">$<%= lp.getArticle().getPrix()* lp.getQuantite() %>
                    <span><a href="PanierServlet?op=rem&sender=panier.jsp&id=<%= lp.getArticle().getIdArticle() %>" title="Remove"><img src="images/cross.gif" alt="Remove"/></a></span>
                </li>
                
                
            </ul>
            <div class="clr"></div>
        </div>
<%
}
%>
        <div class="totalShiping">
            <div class="txtTotal"><h4>總價格  =</h4></div>
            <div class="toalPrice">$ <%= prixT %></div>
        </div>
        <div class="clr"></div>
    </div>
<!--<div class="information"> 
       <form action="CommanderServlet" method="get">  
           <label for="address">地址 :</label><br />
		<input id="address" class="input" name="address" type="text" value="" size="30" /><br />
                <label for="phone_number">電話 :</label><br />
		<input id="phone_number" class="input" name="phone_number" type="text" value="" size="30" /><br />
                <br />
                <input id="submit_button" name="client_information" type="submit" value="發送" />
      </form>
   </div>-->
   <div class="bs-example">
    <form class="form-horizontal" role="form" action="CommanderServlet" method="get">
      <div class="form-group">
        <label for="address" class="col-sm-2 control-label">地址<!--Email--></label>
        <div class="col-sm-10">
          <input type="text" class="form-control" name="address" id="address" placeholder="請輸入地址">
        </div>
      </div>
      <div class="form-group">
        <label for="phone_number" class="col-sm-2 control-label">電話<!--Password--></label>
        <div class="col-sm-10">
          <input name="phone_number" type="text" class="form-control" id="inputPassword3" placeholder="請輸入電話">
        </div>
      </div>   
        <div class="clr"></div>
    <div class="paging">
      <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button style="margin-left:640px; margin-top:-15px;  " type="submit" class="btn btn-default">送出<!--Sign in--></button>
        </div>
          <div class="pagingInfo" style="margin-top:-50px;"><h4><a  " href="produits.jsp" title="CONTINUE SHOPPING">繼續選購</a></h4></div>
      </div>
    </div>
    </form>
  </div><!-- /.bs-example -->
    
        
        <% 
        if(panier.getLignesPanier().size() > 0)
        {
        %>
        
        
        <%}%>
        
      
        <div class="clr"></div> 
    </div>
</div>



<script src="js/jquery-3.2.1.min.js" />
<script src="js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<%@include file="footer.jsp" %>
<%@include file="FooterBottom.jsp" %>