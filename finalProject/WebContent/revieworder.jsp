<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <title>The Earphone Store</title>
    <link href="stylesheets/style.css" rel="stylesheet" type="text/css" media="all">
</head>
<body>
    <h1>Review your order</h1>
    
    <p>Please review your order information below. <br>
     Then, click on the Finish button to complete your order.</p>
    
    
    <p>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <table class="bordered">    

    <tr><td colspan ="2">
<p><b>Order Details:</b></p>
<!-- Loop to get list of items from cart -->
<p><c:forEach var="item" items="${cart.items}">

    ${item.quantity} of: ${item.product.description} @ ${item.totalCurrencyFormat}
    
    <BR/>
</c:forEach></p>
    <p><b>Grand Total:</b> ${cart.total}</p> 
        </td>
    </tr>
    
    <tr><td>
    <p><b>Shipping Information:</b></p>
    <p>Name: ${ship.name}</p>
    <p>Street: ${ship.street}</p>
    <p>City: ${ship.city}</p>
    <p>State: ${ship.state}</p>
    <p>Zip: ${ship.zip}</p></td>
    <td> 
    <p><b>Billing Information:</b></p>
    <p>Email: ${bill.email}</p>
    <p>Card Holder Name: ${bill.cardHolderName}</p>
    <p>Card Number: ${bill.cardNumber}</p>
    <p>Expiration Month: ${bill.expirationMonth}</p>
    <p>Expiration Year: ${bill.expirationYear}</p>
    <p>Secure Code: ${bill.secureCode}</p>
    </td></tr>
    
    </table>
    <a href ="<c:url value='billing.jsp' />"><input class="classname" type="submit" value="Return to Billing"></a>
    <a href ="<c:url value='DatabaseServlet' />"><input class="classname" type="submit" value="Finish"></a>
</body>
</html>