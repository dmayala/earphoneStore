<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>The Earphone Store</title>
    <link href="stylesheets/style.css" rel="stylesheet" type="text/css" media="all">
  	<script type="text/javascript" src="scripts/billing.js"></script>
</head>
<body>    
 <h1>Billing Information</h1>
    <p>Please fill out all the fields. <br>
     Then, click on the Review Order button to continue with the order.</p>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <!-- Encode URL w/ Session ID if cookies disabled, validate input -->
    <form onsubmit="return validateForm()" action="<c:url value='/BillingServlet' />" method="post">
    <table cellspacing="5" border="0">
        <tr>
            <td align="right">Email:</td>
            <td><input type="text" name="email"></td>
        </tr>
        
        <tr>
            <td align="right">Card Holder Name:</td>
            <td><input type="text" name="cardHolderName"></td>
        </tr>
        
        <tr>
            
            <td align="right">Card Number:</td>
            <td><input onkeypress="return isNumberKey(event)" type="text" name="cardNumber" maxlength="16"></td>
        </tr> 
        
        <tr>
            <td align="right">Expiration Month:</td>
            <td><input onkeypress="return isNumberKey(event)" type="text" name="expirationMonth" maxlength="2"></td>
        </tr>  
        
        <tr>
            <td align="right">Expiration Year:</td>
            <td><input onkeypress="return isNumberKey(event)" type="text" name="expirationYear" maxlength="4"></td>
        </tr>   
        
       <tr>
            <td align="right">Secure Code:</td>
            <td><input onkeypress="return isNumberKey(event)" type="text" name="secureCode" maxlength="4"></td>
        </tr>   
        
        <tr>
            <td></td>
            <td><br><input class="classname" type="submit" value="Review Order"></td>
        </tr>
        
    </table>
    </form>
    
      <form action="<c:url value='shipping.jsp' />" method="get">
                <input class="classname" type="submit" value="Return to Shipping">
      </form>
</body>
</html>