<%-- 
    Document   : footerTop
    Created on : 2017/8/7, 下午 08:45:32
    Author     : USER
--%>

<%@page language="Java" pageEncoding="utf-8" %>
<%@page contentType="text/html;charset=utf-8" %>
<%@page import="entities.Article"%>
<%@page import="dao.ArticleDao"%>
<%@page import="panier.LignePanier"%>
<%@page import="panier.Panier"%>
<%@page import="entities.Client"%>
<!DOCTYPE html>
<html>
    <head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
    
  



        <title></title>
        
        
    </head>
    <body>
         <div class="headerTop">
           <div id="NewPanier">
            <div id="NewPanierBody">
  
                 <div class="col-sm-3 col-md-3">
        <form class="navbar-form" role="search" action="produits.jsp" method="GET">
        <div class="input-group">
            <input type="text" class="form-control" name="keyword"  placeholder="Search..." size="135px"  >
            <div class="input-group-btn">
                <button class="btn btn-default" ><i class="glyphicon glyphicon-search"></i></button>
            </div>
        </div>
        </form>
    </div>
                 
     <ul>  
             <% 
    //henry 判斷是否已存在 購物車的session 沒有就建立購物車session
if(session.getAttribute("panier") == null )
{
    session.setAttribute("panier", new Panier());
}
 //henry 取得購物車session中的資料
Panier panier = (Panier)session.getAttribute("panier");
//henry 宣告 總價變數 prixT
double prixT = 0 ;
//henry 宣告一變數 lp 並將 panier.getLignesPanier() 回傳的購物車資料賦予給lp
for(LignePanier lp : panier.getLignesPanier())
    //henry 計算總價 pritX 購物車產品數量乘上產品單價
    prixT += lp.getQuantite()*lp.getArticle().getPrix();


%>         
        <li class="cart"><a href="panier.jsp">購物車</a></li>
        <li class="cart-value">
            <span class="blue"><a href="panier.jsp">
                    <!--henry 取得並顯示購物車產品數量 panier.getNumberArticle() -->
                   <%= panier.getNumberArticle() %>項產品</a></span> | <span>$<%= prixT %>  </span></li>
    </ul>
    
   
              </div>
              </div> 
             <div id="NewTop">
             
                    
        <ul>
       
          <li> <a href="index.jsp">首頁</a> </li>
            <li> <a href="produits.jsp">我們的產品</a>
            <ol><li><a href="produits.jsp?x=0&y=0&keyword=nac+nac">nac nac</a></li>
                <li><a href="produits.jsp?x=0&y=0&keyword=野餐">野餐用品</a></li>
                <li><a href="produits.jsp?x=0&y=0&keyword=收納">收納用品</a></li>
                <li><a href="produits.jsp?x=0&y=0&keyword=背">背包 背袋</a></li>
            </ol>  
            </li>   
          <li> <a href="contactez-nous.jsp">聯繫我們</a>
          <ol><li><a href="AboutUs.jsp">關於本站</a></li></ol>
             </li>
              <% if(session.getAttribute("client") == null){ %>
          <ul class="nav navbar-nav navbar-right" style="margin-left:300px;padding:12.7px 0px 15px 0px;margin-top:-14px;  " >
          <li class="dropdown" >
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"style="padding:15px 0px 16px 0px;" ><b style="font-weight:lighter;font-family:Arial, Helvetica,'微軟正黑體',sans-serif;font-size:18px; ">會員專區</b><span class="caret"></span></a>
		<ul id="login-dp" class="dropdown-menu" style="width:250px;">
			<li>
			   <div class="row">
                               <div class="col-md-12" >
                                   <center><h3 style="margin-left:40px;">會員登入</h3></center>
                                   <form class="form" role="form" method="GET" action="ConnexionServlet" accept-charset="UTF-8" id="login-nav">
                                     <div class="form-group">
                                         <center><p style="margin-left:40px;">帳號</p></center>
					<label class="sr-only" for="exampleInputEmail2">請輸入帳號</label>
					<center><input style="margin-left:18px;  "type="text" name="login" class="form-control" id="exampleInputEmail2" placeholder="請輸入帳號" required></center>
				     </div>  
                                       <div class="form-group" >
                                           <center><p style="margin-left:40px;">密碼</p></center>
					<label class="sr-only" for="exampleInputPassword2">請輸入密碼</label>
                                        <center><input style="margin-right:-38px;padding-left:15px; " type="password" name="mdp" class="form-control" id="exampleInputPassword2" placeholder="請輸入密碼" required></center>
                                       </div>   
					<div class="form-group"  >
                                           <button style="margin-left:19px" type="submit" class="btn btn-primary btn-block">登入</button>
					</div>
                                   </form>
                                   </div>
					<div class="bottom text-center">
                                            <center><a href="nonMemberRegist.jsp" style="background-color:white; color:grey; "><b style="margin-left:40px;">註冊會員</b></a></center>
					</div>
                                   </div>
			   </li>
	        </ul>
        </li>
      </ul>
          <% }else{ %>
          <ul class="nav navbar-nav navbar-right"style="margin-left:300px;margin-top:-14px; padding-bottom:15px;padding-bottom:0px;   " >
              <li class="dropdown"style="padding:15px 0px 3px 0px;">
                   <a href="#" class="dropdown-toggle" data-toggle="dropdown"><b style="font-weight:lighter;font-family:Arial, Helvetica,'微軟正黑體',sans-serif;font-size:18px; ">會員專區</b> <span class="caret"></span></a>
                    <ul id="login-dp" class="dropdown-menu"style="width:100px;height:250px;padding-left:30px;padding-right:0px     ">
                        <li>
                            <div class="row">
                                <div class="col-md-12">
                                    <center><h3 style="color:red ">歡迎<b> <%= ((Client)session.getAttribute("client")).getNom()  %></b></h3></center>
                                    
                                   <center> <ul >
                                           <li><a style="border-top-style:groove;" href="mon_compte.jsp"> 我的帳戶 </a></li>
                                        <li><a style="border-top-style:dotted;border-width:1px; " href="panier.jsp"> 購物車 </a></li>
                                        <li><a style="border-top-style:dotted;border-width:1px; "href="mescommandes.jsp"> 我的訂單 </a> </li>
                                        <li> <a style="border-top-style:dotted;border-width:1px; "href="DeconnexionServlet"> 登出 </a> </li>
                                    </ul></center>
                                     
                                </div> 
                            </div>
                        </li>
                    </ul>
              </li> 
          </ul>

           <% } %>
        </ul>
                 
                   
               </div>
    
  <div class="imagebody">
       <div class="image"><a href="index.jsp"><img height="55"src="images/Welife.png"/></a></div>
 </div>    
   
                  </div>
              
  
    </body>
     <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
    <script src="//cdn.jsdelivr.net/jquery.lazyload/1.9.3/jquery.lazyload.min.js"></script>
    <script src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-51a4af6623d99fb3" async></script>
    <script src="/Scripts/AssetsBS3/BS3JS.min.js?kkbruce=201501130444"></script>
    
</html>
