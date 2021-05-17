

<%@page import="com.learn.icinbank.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ICIN Bank</title>
        <%@include file="components/common_css_js.jsp" %>
      
     </head>
     <body>
        
             
        <%@include file="components/navbar.jsp" %>
<div style="background-color:#0b2239;color:white;padding:20px;">
    <br><br>
    <center>
    <h1 style=font-size:95px><B>ICIN BANK</B></h1>
    <H2>We  Specialize In Customer Satisfaction</H2></center>
    
    <form action="register.jsp">
      <div class="wrap" style="width: 90%;   position: absolute;   top: 50%;   left: 50%;   transform: translate(-50%, -50%);">
   <div class="search" style="width: 100%;   position: relative;   display: flex;">
       
      <input type="text" class="searchTerm" placeholder="Email Address" style="width: 100%;    border: 3px solid #ffffff;   border-right: none;   padding: 5px;   height: 40px;   border-radius: 5px 0 0 5px;   outline: none;   color: #9DBFAF;">
      <button type="submit" class="searchButton" style="width: 200px;  height: 40px;  border: 1px solid #e57373;   background: #e57373;   text-align: center;   color: #fff;   border-radius: 0 5px 5px 0;   cursor: pointer;   font-size: 20px;">
       &nbsp;&nbsp;&nbsp;&nbsp;   Subscribe &nbsp;&nbsp;&nbsp;&nbsp;
     </button>
     
   </div>
      </div></form>
    <br><br>  <br>   <br>     <br>
</div> 
<div  style="background-color:#ffffff">
       <br><br>  <br>   <br>
       <h2 style="color: #0b2239">
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           ICIN BANK</h2><br><br>
       <div class="clearfix" style="padding-left:80px; padding-right:80px; text-align: justify">
        <img class="indeximg" src="img/bar4.png" style="float:right; width:30%" /> 
       We are third largest private sector bank in India offering entire spectrum of financial services for personal & corporate banking.
       ICIN Bank Limited is an Indian private sector bank headquartered in Mumbai, Maharashtra. It sells financial services to large and mid-size companies, SMEs and retail businesses.
       The bank was founded in December 1993 as UTI Bank, opening its registered office in Ahmedabad and a corporate office in Mumbai.[11] The bank was promoted jointly by the Administrator of the Unit Trust of India (UTI),[12] Life Insurance Corporation of India (LIC), General Insurance Corporation, National Insurance Company, The New India Assurance Company, The Oriental Insurance Corporation and United India Insurance Company. The first branch was inaugurated on 2 April 1994 in Ahmedabad by Manmohan Singh, then finance minister of India
      Services : Retail Banking : The bank offers lending services to individuals and small businesses, along with liability products, card services, Internet banking, automated teller machines (ATM) services, depository, financial advisory services, and Non-resident Indian (NRI) services.
      Corporate banking:

Transaction banking: Axis Bank provides products and services related to transaction banking to customers in areas of current accounts, cash management services, capital market services, trade, foreign exchange and derivatives, cross-border trade and correspondent banking services and tax collections on behalf of the Government and various State Governments in India
       </div>
       </div>   
        <%@include file="components/footer.jsp" %>
    </body>
</html>
