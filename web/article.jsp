<%@page language="Java" pageEncoding="utf-8" %>
<%@page contentType="text/html;charset=utf-8" %>
<%@page import="java.util.Calendar"%>
<!--henry 引入商品類-->
<%@page import="entities.Article"%>
<%@page import="java.util.Vector"%>
<!--henry 引入商品控制類-->
<%@page import="dao.ArticleDao"%>
<!--henry 引入header 頁面-->
<%@include file="headerTop.jsp" %>
<%@include file="header.jsp" %>

<% 
    int id = -1;
    //henry 判斷是否取得 商品 id
    if(request.getParameter("id") != null)
     id = (Integer.parseInt(request.getParameter("id")));
    //henry 傳遞id參數給 商品控制器類中查找商品方法並回傳 產品查詢結果的產品實體
    Article article = (new ArticleDao()).findByID(id);
    //henry 如產品回傳為空則賦予預設值 
    if(article == null)
        article = new Article("", "", 0, "", 0);
    
%>
<!--產品詳情頁右側區-->
<div class="RightSide">     
<!--目前位置顯示 bar 俗稱麵包屑-->
    <div class="bredCrum">
        <p><a href="index.jsp">首頁</a>   >>   
            <a href="produits.jsp">我們的產品</a>   >>   
            <!--取出並顯示產品名稱 article.getLibelle()-->
            <a href="#" class="select"> <%= article.getLibelle() %></a></p> 
    </div>
    <!--產品詳情區域-->    
    <div class="productDetial">
        <div class="mainThumb">
            <!--取出並顯示產品圖片(路徑與圖檔名) article.getImg()-->
            <img src="<%= article.getImg()%>" alt="" width="750" height="400"/></div>
        <div class="rightProduct">
            <!--<div class="thumb marRight"><img src="images/product-small.gif" alt=""/></div>
            <div class="thumb"><img src="images/product-small.gif" alt=""/></div>
            <div class="thumb marRight"><img src="images/product-small.gif" alt=""/></div>
            <div class="thumb"><img src="images/product-small.gif" alt=""/></div>
            -->
            <%if(article.getQte()!=0){%>
            <div class="cartBtn fl">
                <!--vince 看不懂的連結-->
               <!-- <a href="PanierServlet?op=add&sender=article.jsp&id=<%= id %>" title="ADD to Cart" class="addToCart"></a>-->
            </div>
            <%}%>
            <div class="clr"></div>	
        </div>
    </div>
           <!--產品資訊-->    
    <div class="detailInfo">
        <p>產品詳情 : </p>
        <!--取得產品描述(欄位)的值 article.getDesc()-->    
        <p> <%= article.getDesc() %> </p>
        <!--取得產品新增時間(欄位)的值 article.getDateAjout()-->    
        <p class="add">產品上架日期 <%= article.getDateAjout()  %></p>
    </div>
    <!--vince 新增 直接購買 (要搭配下拉數量鍵) -->
    <div class="clr"></div>
    <form method="GET" action="PanierServlet">
    <div class="paging">
        <!--vince 判斷庫存-->
        <%if(article.getQte()<1){%>
        庫存量不足！！！
        <%}else{%>
        目前庫存量： <%=article.getQte()%>
         <!--取得產品價格(欄位)的值 article.getPrix()-->    
        <div class="pagingDiv price">$ <%= article.getPrix() %></div>
        <div class="pagingInfo">
        <!--vince 依庫存量而變的數量選單-->
        <% if(article.getQte()>0){%>
        <select name="qte">
            <%for(int i=1;i<=article.getQte();i++){%>
		<option value="<%=i%>"><%=i%></option>
            <%}%>
        </select>
        <!--vince 為了傳送qte 其他id 和op 只好靠 隱藏 <input type="hidden"  來一起傳值-->
        <input type="hidden" name="id" value="<%=id%>"/>
        <input type="hidden" name="op" value="directBuy"/>   
        <input type="submit"  value="直接購買"/>
        <% }%>
        </div>
        <div class="pagingInfo1">
            <img src="images/plus.gif" alt=""/>
            <a href="PanierServlet?op=add&sender=article.jsp&id=<%= id %>">加入購物車</a>
        </div>
        <%}%>
    </form>
        <div class="clr"></div> 
    </div>
</div>    


<!--henry 引入footer頁面-->
<%@include file="footer.jsp" %>
<%@include file="FooterBottom.jsp" %>