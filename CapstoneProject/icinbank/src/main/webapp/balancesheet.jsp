<%@page import="java.util.List"%>
<%@page import="com.learn.icinbank.entities.Trans"%>
<%@page import="com.learn.icinbank.dao.ReqMDao"%>
<%@page import="com.learn.icinbank.helper.FactoryProvider"%>
<%@page import="com.learn.icinbank.entities.User"%>
<%
    User userb = (User) session.getAttribute("current-user");
    if (userb == null) {
        session.setAttribute("message", "You are not logged in !! Login first to access balancesheet page");
        response.sendRedirect("login.jsp");
        return;
    }    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> <%=userb.getUserName()%>'s Balance Sheet</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    
        <body style="background: #0b2239">
            
            <%
                ReqMDao dao=new ReqMDao(FactoryProvider.getFactory());
                List<Trans> list = dao.getAllTrans();
          %>
          <%  int cnt=0;
              for(Trans trans:list)
              {
                  if(trans.getTranst().getUserId()==userb.getUserId())
                  {  
                    cnt++;
                  }
              }
          %>
            
            
            
            
            
            <%@include file="components/navbar.jsp" %><br><br>
            <div class="container">
                <%@include file="message_1.jsp" %>
                <div class="card">
                    <div class="card-body"> 
                        
                        
                        
                        
                        
                        <div class="form-group" style="padding-left: 30px; padding-right: 30px">
                                            
                                            <h3 class="text-center " >Balance Sheet Status Sheet</h3>
                                            <small id="emailHelp" class="form-text text-muted text-center">You have <%=cnt%> transactions </small><br>
                                         
                                                
                                                
                                               <table class="table">
                                                <thead  style="background:#0b2239; color:#fff">   
                                                <tr>
                                                    <th scope="col">#</th>
                                                    <th scope="col">Transaction ID</th>
                                                      <th scope="col">Transaction Status</th>
                                                    <th scope="col">Transaction Date</th>
                                                     <th scope="col">Transaction Amount</th>
                                                      <th scope="col">Beneficiary Name</th>
                                                       <th scope="col">Beneficiary Bank Name</th>
                                                       <th scope="col">Beneficiary IFSC</th>
                                                       <th scope="col">Beneficiary Acc No.</th>
                                                </tr>    
                                                </thead>
                                               
                                                <tbody>              
                                                <%  int cont=0;
                                                String s;
                                                    for(Trans trans:list)
                                                {    if(trans.getTranst().getUserId()==userb.getUserId())
                                                {  cont++;
                                                %>
                                                <tr>
                                                    <td><%=cont%></td>
                                                   
                                                    <td><%=trans.getTransId()%> </td>
                                                    <%if (trans.isTransStatus()==true){%>
                                                    <td>Successful</td>
                                                     <%}else {%>
                                                     <td>Unsuccessful</td><% }%>
                                                    <td><%=trans.getTransDate()%> </td>
                                                    <td><%=trans.getTransAmt()%> </td>
                                                    <td><%=trans.getTransName()%> </td>
                                                    <td><%=trans.getAccTobank()%> </td>
                                                    <td><%=trans.getTransIFSC()%> </td>
                                                    <td><%=trans.getAccToacc()%> </td>
                                                    
                                                </tr>
                                              
                                                
                                              <%  } }
                                                    %>
                                                </tbody>
                                                
                                                
                                               </table>
                                                    
                                              
                                                                                                                                         
                                                
                                            
                                            
                                        
                                            </div>
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                    </div>
                </div>  
            </div>
        <br><br>
        <%@include file="components/footer_1.jsp" %>
    </body>
</html>
