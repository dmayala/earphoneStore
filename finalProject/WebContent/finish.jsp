<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <title>The Earphone Store</title>
    <link href="stylesheets/style.css" rel="stylesheet" type="text/css" media="all">
</head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
    <h1>Thanks, ${ship.name}, your order number is ${orderID} and the total amount is ${total}. An email for 
    this order has been sent to you.</h1>

    <p>Print out this confirmation for your records and then press OK</p>

    <form action="index" method="get">
        <input class="classname" type="submit" value="OK">
    </form>
</body>
</html>