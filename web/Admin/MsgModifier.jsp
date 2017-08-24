<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--henry 引入訪客留言控制類-->
<%@page import="dao.MsgDao"%>
<!--henry 引入訪客留言類-->
<%@page import="entities.Msg"%>
<% 
    //henry 判斷是否登入
        if(session.getAttribute("user") == null)
        {
            response.sendRedirect("login.jsp");
        }
        int msgGuestId = 0;
        
        try
        {
            
            msgGuestId = Integer.parseInt(request.getParameter("msgGuestId"));
        
        }catch(Exception ex){
            
        }
        
        
        Msg f = (new MsgDao()).findByID(msgGuestId);
        
        if(f == null)
            f = new Msg();
        
%>

<!--henry 引入_header.jsp-->
<%@include file="_header.jsp" %>

<!-- start content-outer -->
<div id="content-outer">
<!-- start content -->
<div id="content">


<div id="page-heading"><h1>修改訪客留言</h1></div>


<table border="0" width="100%" cellpadding="0" cellspacing="0" id="content-table">
<tr>
	<th rowspan="3" class="sized"><img src="images/shared/side_shadowleft.jpg" width="20" height="300" alt="" /></th>
	<th class="topleft"></th>
	<td id="tbl-border-top">&nbsp;</td>
	<th class="topright"></th>
	<th rowspan="3" class="sized"><img src="images/shared/side_shadowright.jpg" width="20" height="300" alt="" /></th>
</tr>
<tr>
	<td id="tbl-border-left"></td>
	<td>
	<!--  start content-table-inner -->
        <div id="content-table-inner" style="width: 60%;float: left">
	
	<table border="0" width="100%" cellpadding="0" cellspacing="0">
	<tr valign="top">
	<td>
	
	<!--henry 產品各欄位-->
		<!--  start step-holder -->
		<div id="step-holder">
			<div class="step-no"> - </div>
			<div class="step-dark-left"><a href="">訪客留言說明</a></div>
			<div class="step-dark-right">&nbsp;</div>
			<div class="step-no-off"> # </div>
			<div class="step-light-left">請填訪客留言內容 </div>
			<div class="step-light-right">&nbsp;</div>
			
		</div>
		<!--  end step-holder -->
	
		<!-- start id-form -->
                 <!--henry 表單送出後給 ModifierArticleServlet處理類處理 路徑對應可參考 專案中web.xml檔中servlet與url對應-->
                <form method="GET" action="../ModifierMsgServlet">
		<table border="0" cellpadding="0" cellspacing="0"  id="id-form">
		<!--
                <tr>
			<th valign="top">ID :</th>
                        <td><input name="id" type="number" min="1" required class="inp-form"   /></td>
			<td></td>
		</tr>
                -->
                
                <tr>
			<th valign="top">編號</th>
                        <td>
                            <input type="text" name="msgGuestId" required  value="<%= f.getMsgGuestId() %>" class="inp-form" style=";text-align: center;border-width: thin;border-radius:4px  ;background-image: none;background-color:  #ececec" readonly />
                        </td>
<!--			-error
                        <td>
			<div class="error-left"></div>
			<div class="error-inner">This field is required.</div>
			</td>-->
		</tr>
                
		<tr>
			<th valign="top">訪客名稱</th>
                        <td><input name="msgGuestName" value="<%= f.getMsgGuestName() %>" required type="text" class="inp-form"  /></td>
<!--			-error
                        <td>
			<div class="error-left"></div>
			<div class="error-inner">This field is required.</div>
			</td>-->
		</tr>
                
		<tr>
			<th valign="top">訪客email</th>
                        <td><input name="guestGuestEmail" value="<%= f.getGuestGuestEmail() %>" required type="text" class="inp-form"  /></td>
<!--			-error
                        <td>
			<div class="error-left"></div>
			<div class="error-inner">This field is required.</div>
			</td>-->
		</tr>
                <tr>
			<th valign="top">訪客留言內容</th>
                        <td><input name="guestGuestMsgContent" value="<%= f.getGuestGuestMsgContent() %>" required type="text" class="inp-form"  /></td>
<!--			-error
                        <td>
			<div class="error-left"></div>
			<div class="error-inner">This field is required.</div>
			</td>-->
		</tr>


	
        
    
	<tr>
		<th>&nbsp;</th>
		<td valign="top">
                    <input type="submit" value="" class="form-submit" />
			<input type="reset" value="" class="form-reset"  />
		</td>
		<td></td>
	</tr>
	</table>
	<!-- end id-form  -->
        </form>
                
	</td>
	<td>

	

</td>
</tr>
<tr>
<td><img src="images/shared/blank.gif" width="695" height="1" alt="blank" /></td>
<td></td>
</tr>
</table>
 
<div class="clear"></div>
 

</div>
<!--  end content-table-inner  -->

</td>
<td id="tbl-border-right"></td>
</tr>
<tr>
	<th class="sized bottomleft"></th>
	<td id="tbl-border-bottom">&nbsp;</td>
	<th class="sized bottomright"></th>
</tr>
</table>









 





<div class="clear">&nbsp;</div>

</div>
<!--  end content -->
<div class="clear">&nbsp;</div>
</div>
<!--  end content-outer -->

 
<%@include file="_footer.jsp" %>
