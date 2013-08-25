<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>The Earphone Store</title>
    <link href="stylesheets/style.css" rel="stylesheet" type="text/css" media="all">
</head>
<body>
   
<h1>Earphones</h1>

<!-- Create Table for Product Listing -->
<table class="bordered">
  <tr>
    <th>Name</th>
    <th>Image</th>
    <th>Description</th>
    <th>Specification</th>
    <th>Price</th>
    <th>Quantity</th>
    <th></th>
  </tr>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Loop to generate item rows -->
<c:forEach var="i" items="${ll}">
  <tr valign="top">
    <td>${i.name}</td>
    <td><img src="<c:url value='/Image?img=${i.image}'/>"/></td>
    <td>${i.description}</td>
    <td>${i.specification}</td>
    <td>$${i.price}</td>
    <td><form action="<c:url value='cart'/>" method="get">
    <select id="quantity" name="quantity" value ="1">
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
    </select> 
     <input type="hidden" name="productCode" value="${i.code}">     
      <input type="hidden" name="source" value="index">  
</td>
<td><input type="image" src="<c:url value='/Image?img=addtocart.png'/>" name="Submit"></td></form>
  </tr>
</c:forEach>
</table>

</br>
<ul id="pagination-flickr">
<!-- Loop to generate Page Numbers -->
<c:forEach var="pageNum" begin="1" end="${page}" step="1" varStatus ="status">
    <li><a href="index?page=${pageNum}">${pageNum}</a></li>
</c:forEach>
</ul>
</body>
</html>