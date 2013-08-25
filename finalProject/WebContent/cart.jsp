<!doctype html public "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
    <title>The Earphone Store</title>
    <link href="stylesheets/style.css" rel="stylesheet" type="text/css" media="all">
</head>

<body>

<h1>Your cart</h1>

<table class="bordered">
  <tr>
    <th>Quantity</th>
    <th>Description</th>
    <th>Price</th>
    <th>Amount</th>
    <th></th>
  </tr>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Loop to generate rows for items in cart-->
<c:forEach var="item" items="${cart.items}">
  <tr valign="top">
    <td>
      <form action="<c:url value='/cart' />">
        <input type="hidden" name="productCode" 
               value="${item.product.code}">
        <input type=text size=2 name="quantity" 
               value="${item.quantity}">
        <input type="submit" class="classname" value="Update">
      </form>
    </td>
    <td>${item.product.description}</td>
    <td>${item.product.priceCurrencyFormat}</td>
    <td>${item.totalCurrencyFormat}</td>
    <td>
      <form action="<c:url value='/cart' />">
        <input type="hidden" name="productCode" 
               value="${item.product.code}">
        <input type="hidden" name="quantity" 
               value="0">
        <input type="image" src="<c:url value='/Image?img=remove.png'/>" name="Submit">
      </form>
    </td>
  </tr>
</c:forEach>
  
  <tr>
    <td colspan="3">
      <p><b>To change the quantity</b>, enter the new quantity 
            and click on the Update button.</p>
    </td>
    <td colspan="2">
      <p><b>Total: </b> ${cart.total}</p>
    </td>
  </tr>
</table>

<br>

<form action="<c:url value='/index' />" method="get">
  <input class="classname" type="submit" value="Continue Shopping">
</form>

<form action="<c:url value='/shipping.jsp' />" method="get">
  <input class="classname" type="submit" value="Go to Shipping">
</form>

</body>
</html>