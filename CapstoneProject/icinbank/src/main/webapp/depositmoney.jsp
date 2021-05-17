<%@page import="java.util.List"%>
<%@page import="com.learn.icinbank.dao.UserDao"%>
<%@page import="com.learn.icinbank.dao.SaveAccDao"%>
<%@page import="com.learn.icinbank.dao.PrimAccDao"%>
<%@page import="com.learn.icinbank.helper.FactoryProvider"%>
<%@page import="com.learn.icinbank.entities.User"%>
<%@page import="com.learn.icinbank.entities.PrimAcc"%>
<%@page import="com.learn.icinbank.entities.SaveAcc"%>
<%@page import="com.learn.icinbank.entities.User"%>
<%@page import="com.learn.icinbank.entities.PrimAcc"%>
<%@page import="com.learn.icinbank.entities.SaveAcc"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.icinbank.entities.Trans"%>
<%@page import="com.learn.icinbank.dao.UserDao"%>
<%@page import="com.learn.icinbank.dao.PrimAccDao"%>
<%@page import="com.learn.icinbank.dao.SaveAccDao"%>
<%@page import="com.learn.icinbank.helper.FactoryProvider"%>
<%@page import="com.learn.icinbank.entities.User"%>
<%

    User userd = (User) session.getAttribute("current-user");
    if (userd == null) {

        session.setAttribute("message", "You are not logged in !! Login first to access deposit services");
        response.sendRedirect("login.jsp");
        return;

    }
   
    
    
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transfer Money</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body style="background: #0b2239">
    <%
                UserDao dao=new UserDao(FactoryProvider.getFactory());
                List<User> list = dao.getUserDet();
                PrimAccDao pdao=new PrimAccDao(FactoryProvider.getFactory());
                List<PrimAcc> plist = pdao.getPrimAcc();
                SaveAccDao sdao=new SaveAccDao(FactoryProvider.getFactory());
                List<SaveAcc> slist = sdao.getSaveAcc();
    %> 
    <%@include file="components/navbar.jsp" %><br><br>
    <div class="container">
    <div class="row mt-5">     
    <div class="col-md-6">
    <div class="card">
    <div class="card-body">      
        <form action="DepoPMServlet" method="post">
        <div class="form-group">
            <h3 class="text-center">Deposit in Primary</h3>
            <%       for(PrimAcc primacc:plist)
                        { if(primacc.getPacct().getUserId()==userd.getUserId()){
            %>
            
            <input  name="pacc_status" type="hidden" class="form-control" id="pacc_status" value="<%=primacc.getPaccStatus()%>" >

            <input  name="pacc_bal" type="hidden" class="form-control" id="pacc_bal" value="<%=primacc.getPaccBal()%>" >
            <small id="emailHelp" class="form-text text-muted text-center">You have INR <%=primacc.getPaccBal()%> Primary balance </small><br>
            <%
                }}
            %>
            <%@include file="message.jsp" %>
            <label for="pacct_user_id">User ID</label>
            <input  name="pacct_user_id" type="text" class="form-control" id="pacct_user_id" value="<%=userd.getUserId()%>" readonly>
            <small id="emailHelp" class="form-text text-muted">This is your unique ICIN user ID.</small>
        </div>
            
        <div class="form-group">
        
            <label for="pacc_id">Account ID</label>
            <input  name="pacc_id" type="text" class="form-control" id="pacc_id" value="<%=userd.getUserId()%>" readonly >
        </div>
        <div class="form-group">
            <label for="pacc_balnew">Amount</label>
            <input  name="pacc_balnew" type="text" class="form-control" id="pacc_balnew"  >
        </div>
        
        <div class="container text-center">
            <button class="btn btn-outline-success">Deposit Into Primary</button>
        </div>
        </form>    
    </div>
    </div>
    </div>
        
    
    <div class="col-md-6">
    <div class="card">
    <div class="card-body">      
        <form action="DepoSMServlet" method="post">
        <div class="form-group">
            <h3 class="text-center ">Deposit in Savings</h3>
            <%       for(SaveAcc saveacc:slist)
                        { if(saveacc.getSacct().getUserId()==userd.getUserId()){
            %>
                        <input  name="sacc_status" type="hidden" class="form-control" id="sacc_status" value="<%=saveacc.getSaccStatus()%>"  >
          
            <input  name="sacc_bal" type="hidden" class="form-control" id="pacc_bal" value="<%=saveacc.getSaccBal()%>" >
            <small id="emailHelp" class="form-text text-muted text-center">You have INR <%=saveacc.getSaccBal()%> Savings balance </small><br>
            <%
                }}
            %>
            <%@include file="message_1.jsp" %>
            <label for="sacct_user_id">User ID</label>
            <input  name="sacct_user_id" type="text" class="form-control" id="sacct_user_id" value="<%=userd.getUserId()%>" readonly>
            <small id="emailHelp" class="form-text text-muted">This is your unique ICIN user ID.</small>
        </div>
        <div class="form-group">
            <label for="sacc_id">Account ID</label>
            <input  name="sacc_id" type="text" class="form-control" id="sacc_id" value="<%=userd.getUserId()%>" readonly >
        </div>
        <div class="form-group">
            <label for="sacc_balnew">Amount</label>
            <input  name="sacc_balnew" type="text" class="form-control" id="sacc_balnew"  >
        </div>
        <div class="container text-center">
            <button class="btn btn-outline-success">Deposit into Savings</button>
        </div>
        </form>    
    </div>
    </div>
    </div> 

  
  
    

 
    </div>
    </div>  
     <br><br>
     <%@include file="components/footer_1.jsp" %>   
    </body>
</html>
