<%@page language="Java" pageEncoding="utf-8" %>
<%@page contentType="text/html;charset=utf-8" %>
<!--henry 引入商品類-->
<%@page import="entities.Article"%>
<!--henry 引入商品控制類-->
<%@page import="dao.ArticleDao"%>
<%@page import="panier.LignePanier"%>
<%@page import="panier.Panier"%>
<%@page import="entities.Client"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="We Life 久易立實業有限公司 袋子 包包 露營 帳篷" />
<meta name="description" content="We Life 久易立實業有限公司 袋子 包包 露營 帳篷" />
<title>We Life 久易立實業有限公司 </title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/slideshow.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/jquery.cycle.js"></script>
<script type="text/javascript" src="js/jquery.functions.js"></script>
<script src="js/cufon-yui.js" type="text/javascript"></script>
<script src="js/Comfortaa_400.font.js" type="text/javascript"></script>
<script type="text/javascript">
			Cufon.replace('h1', { fontFamily: 'Comfortaa',"微軟中黑體","sans-serif"; });
			Cufon.replace('h2', { fontFamily: 'Comfortaa',"微軟中黑體","sans-serif"; });
			Cufon.replace('h3', { fontFamily: 'Comfortaa',"微軟中黑體","sans-serif"; });
			Cufon.replace('h4', { fontFamily: 'Comfortaa',"微軟中黑體","sans-serif"; });
		</script>
<script type="text/javascript" src="assets/js/font-delicious.js"></script>

</head>
<body>
<div id="Layout">
  <!-- BEGIN HEADER -->
  <div id="Top">
    
    <!-- end div #Logo -->
   
    <!-- end div #TopContent -->
    <!--<div id="Nav">
      <div class="NavBody">
        <ul>
            <li> <a href="index.jsp">首頁</a></li>
            <li> <a href="produits.jsp">我們的產品</a></li>
            <li> <a href="mon_compte.jsp">會員專區</a></li>
          <li> <a href="contactez-nous.jsp">聯繫我們</a></li>
          <li class="search">
              <form action="produits.jsp" method="GET">
                <input type="image" class="action" src="images/search-action.jpg" />
                <input name="keyword" type="text" class="searchfeild" />
            </form>
          </li>
        </ul>
      </div>
    </div>-->
    <!-- end div #Nav -->
  </div>
  <!-- end div #Top -->
  <!-- END HEADER -->
  <!-- BEGIN CONTENT -->
  <div id="Content">
    <div class="LeftSide">
        
        <!-- Connexion DIV -->
        <!-- henry 判斷是否已登入帳號(會員)如果未登入就顯示下方區塊 -->
       
      
      
      
      
      <div class="leftBox">
        <h3>隨機產品</h3>
        <div class="leftBoxBody">
          <ul class="sellerlist">
            <%
                //henry 隨機產生並顯示四個產品
                ArticleDao daoo = new ArticleDao();
                int ii = 0;
                for(Article a : daoo.findRandom(4))
                {
                    ii++;
            %>
                <li><span><%= ii %>.</span>
                    <!-- henry 取得產品資料各欄位值並插入html -->
                    <p><a href="article.jsp?id=<%= a.getIdArticle() %>"><%= a.getLibelle() + " <br> <b>" + a.getPrix() + "$</b>" %></a></p>
                    <div class="clr"></div>
                </li>
            <% 
                } 
            %>
          </ul>
          <div class="clr"></div>
          
        </div>
          
      </div>
          
     
    </div>
    <!-- end div #LeftSide -->
    
