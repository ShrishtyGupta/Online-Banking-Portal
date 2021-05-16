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

    User userp = (User) session.getAttribute("current-user");
    if (userp == null) {

        session.setAttribute("message", "You are not logged in !! Login first to access user profile page");
        response.sendRedirect("login.jsp");
        return;

    }
    
    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=userp.getUserName()%>'s Profile</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body style="background: #fff">
     <%@include file="components/navbar_1.jsp" %><br><br>
        <%
                UserDao dao=new UserDao(FactoryProvider.getFactory());
                List<User> list = dao.getUserDet();
                PrimAccDao pdao=new PrimAccDao(FactoryProvider.getFactory());
                List<PrimAcc> plist = pdao.getPrimAcc();
                SaveAccDao sdao=new SaveAccDao(FactoryProvider.getFactory());
                List<SaveAcc> slist = sdao.getSaveAcc();
          %> 
        <% String sx="Active";
                    if(userp.getUserStatus()!=1)
                    {sx="Inactive"; }%>
          
        <div class="container">
            <div class="row">
            <div class="col md-6">
                <div class="card" style="background: #0b2239;   box-shadow: 0 0 20px rgba(0,0,0,0.4);   border-radius: 5px;      padding: 20px;   text-align: center;   color: white;   ">
                <div class="card-body"> 
                <div class="form-group" style="padding-left: 30px; padding-right: 30px">
                    <h3 class="text-center " >PROFILE DETAILS</h3><br>
                    <img src="img/icon.png" style="align-content: center; width: 90px; height: 90px"><br><BR>
                    <div style="padding-left: 5px">
                        <br>
                    <h5 class="text-justify " >USER ID : <%=userp.getUserId()%></h5>
                    <h5 class="text-justify " >NAME : <%=userp.getUserName()%> </h5>
                    <h5 class="text-justify " >ADDRESS : <%=userp.getUserAddress()%></h5>
                    <h5 class="text-justify " >EMAIL ID: <%=userp.getUserEmail()%></h5>
                    <h5 class="text-justify " >PHONE : <%=userp.getUserPhone()%></h5>
                   
                    <h5 class="text-justify " >USER STATUS : <%=sx%></h5><br>
                    
                    
                    </div>
                </div>    
                </div>
                </div>
            </div>
                
                
            <div class="col md-6">
            <div class="row mt-6">
                <div class="card" style="background: #0b2239;   box-shadow: 0 0 20px rgba(0,0,0,0.4);   border-radius: 5px;      padding: 20px;   text-align: center;   color: white;   ">
                <div class="card-body"> 
                <div class="form-group" style="padding-left: 30px; padding-right: 30px">
                    <h3 class="text-center " >PRIMARY ACCOUNT DETAILS</h3>
                    <div style="padding-left: 5px">
                        <br>
                        <% String s;
                        for(PrimAcc primacc:plist)
                        { if(primacc.getPacct().getUserId()==userp.getUserId()){
                            %>
                    <h5 class="text-justify ">ACCOUNT ID : <%=primacc.getPaccId()%></h5>
                    <h5 class="text-justify " >ACCOUNT BALANCE : <%=primacc.getPaccBal()%> </h5>
                    <% if(primacc.getPaccStatus()==1)
                        s="Activated";
                    else
                        s="Not Activated";%>
                    <h5 class="text-justify " >ACCOUNT STATUS : <%=s%></h5>
                    <% }} %>
                    </div>
                    
                </div>    
                </div>
                </div>
            </div><br>
            <div class="row mt-6">
                <div class="card" style="background: #0b2239;   box-shadow: 0 0 20px rgba(0,0,0,0.4);   border-radius: 5px;      padding: 20px;   text-align: center;   color: white;   ">
                
                <div class="card-body"> 
                <div class="form-group" style="padding-left: 30px; padding-right: 30px">
                    <h3 class="text-center " >SAVINGS ACCOUNT DETAILS</h3>
                    <div style="padding-left: 5px">
                        <br>
                    <% String ss;
                        for(SaveAcc saveacc:slist)
                        { if(saveacc.getSacct().getUserId()==userp.getUserId()){
                            %>
                    <h5 class="text-justify ">ACCOUNT ID : <%=saveacc.getSaccId()%></h5>
                    <h5 class="text-justify " >ACCOUNT BALANCE : <%=saveacc.getSaccBal()%> </h5>
                    <% if(saveacc.getSaccStatus()==1)
                        ss="Activated";
                    else
                        ss="Not Activated";%>
                    <h5 class="text-justify " >ACCOUNT STATUS : <%=ss%></h5>
                    <% }} %>
                    
                    </div>
                </div>    
                </div>
                </div>
            </div>
            </div>
            </div>
        </div>
        
        
        <br><br>
        <%@include file="components/footer.jsp" %>
    </body>
</html>
