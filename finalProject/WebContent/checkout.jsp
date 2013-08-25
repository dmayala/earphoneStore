<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>The Earphone Store</title>
</head>
<body>
 <h1>Check Out</h1>
    <p>To check out please enter your first name, last name, and email. <br>
     Then, click on the Finish button to finish the order.</p>

    <form action="order" method="post">
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
            <td align="right">Email address:</td>
            <td><input type="text" name="email"></td>
        </tr>     
        <tr>
            <td></td>
            <td><br><input type="submit" value="Finish"></td>
        </tr>
    </table>
    </form>
    
      <form action="cart.jsp" method="get">
                <input type="submit" value="View Cart">
      </form>
</body>
</html>