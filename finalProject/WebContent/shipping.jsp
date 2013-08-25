<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>The Earphone Store</title>
    <link href="stylesheets/style.css" rel="stylesheet" type="text/css" media="all">
	<script type="text/javascript" src="scripts/shipping.js"></script>
</head>
<body>
 <h1>Shipping Information</h1>
    <p>Please fill out all the fields. <br>
     Then, click on the Go to Billing button to continue with the order.</p>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <!-- Encode URL w/ Session ID if cookies disabled, validate input -->
    <form action="<c:url value='/ShippingServlet' />" onsubmit="return validateForm()" method="get">
    <table cellspacing="5" border="0">
        <tr>
            <td align="right">First name:</td>
            <td><input type="text" name="firstName"></td>
        </tr>
        
        <tr>
            <td align="right">Last name:</td>
            <td><input type="text" name="lastName"></td>
        </tr>
        
       <tr>
            
            <td align="right">Street:</td>
            <td><input type="text" name="street"></td>
        </tr> 
        
        <tr>
            
            <td align="right">City:</td>
            <td><input type="text" name="city"></td>
        </tr> 
        
        <tr>
            <td align="right">State:</td>
            <td><input type="text" name="state"></td>
        </tr>  
        
        <tr>
            <td align="right">Zip:</td>
            <td><input onkeypress="return isNumberKey(event)" type="text" name="zip"></td>
        </tr>   
        
        <tr>
            <td></td>
            <td><br><input class="classname" type="submit" value="Go to Billing"></td>
        </tr>
        
    </table>
    </form>
    
      <form action="<c:url value='cart.jsp' />" method="get">
                <input class="classname" type="submit" value="Return to Cart">
      </form>
</body>
</html>