/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package order;

import business.Billing;
import business.Cart;
import business.LineItem;
import business.Shipping;
import data.ConnectionPool;
import email.Gmail;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DatabaseServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    Connection conn = null;
    PreparedStatement pstmt = null;
    HttpSession session = request.getSession();
    Cart cart = (Cart) session.getAttribute("cart");
    Shipping ship = (Shipping) session.getAttribute("ship");
    Billing bill = (Billing) session.getAttribute("bill");
    
    //Order Information
    int orderID = 0;
    Double total = 0.0;
    String dateTime = "";

    //Shipping Information
    String shippingID = "null";
    //Order_orderID
    String name = ship.getName();
    String street = ship.getStreet();
    String city = ship.getCity();
    String state = ship.getState();
    int zip = Integer.parseInt(ship.getZip());

    //Billing Information
    String billingID = "null";
    String email = bill.getEmail();
    String cardHolderName = bill.getCardHolderName();
    String cardNumber = bill.getCardNumber();
    int expirationMonth = Integer.parseInt(bill.getExpirationMonth());
    int expirationYear = Integer.parseInt(bill.getExpirationYear());
    int secureCode = Integer.parseInt(bill.getSecureCode());

    //OrderLine Info
    String orderlineID = "null";
    //Order_orderID
    int quantity = 0;
    double subtotal = 0.00;
    int itemID = 0;
    
    try {
    ConnectionPool pool = ConnectionPool.getInstance();
    conn = pool.getConnection();
      
//Insert Order 
      //Get Total
    ArrayList<LineItem> items2 = cart.getItems();
    for (int i = 0;i<items2.size(); i++)
    {
       LineItem lineItem = (LineItem) items2.get(i);
       total += lineItem.getTotal();
       request.setAttribute("total", total);
    }
      
    //Get Date
    Date now = new Date();
    SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

    dateTime = date.format(now);
     
      String query = "INSERT into earphone.Order VALUES(null, ?, ?)";
      pstmt = conn.prepareStatement(query); // create a statement
      pstmt.setDouble(1, total);
      pstmt.setString(2, dateTime);
      pstmt.executeUpdate(); // execute insert statement
     
      
      //Get OrderID
     Statement statement = conn.createStatement();
     String sqlStatement = "SELECT * FROM earphone.Order ORDER BY orderID DESC Limit 1";
     ResultSet rs = statement.executeQuery(sqlStatement);
     rs.next();
     orderID = rs.getInt("orderID");
     request.setAttribute("orderID", orderID);

    
//Shipping
      query = "INSERT into earphone.Shipping VALUES(null, ?, ?, ?, ?, ? ,?)";
      pstmt = conn.prepareStatement(query); // create a statement
      pstmt.setInt(1, orderID);
      pstmt.setString(2, name);
      pstmt.setString(3, street);
      pstmt.setString(4, city);
      pstmt.setString(5, state);
      pstmt.setInt(6, zip);
      pstmt.executeUpdate(); // execute insert statement
      
//Billing
    query = "INSERT into earphone.Billing VALUES(null, ?, ?, ?, ?, ? ,?, ?)";
    pstmt = conn.prepareStatement(query);
    pstmt.setInt(1, orderID);
    pstmt.setString(2, email);
    pstmt.setString(3, cardHolderName);
    pstmt.setString(4, cardNumber);
    pstmt.setInt(5, expirationMonth);
    pstmt.setInt(6, expirationYear);
    pstmt.setInt(7, secureCode);
    pstmt.executeUpdate();

//Order Line
    query = "INSERT into earphone.orderline VALUES(null, ?, ?, ?, ?)";
    pstmt = conn.prepareStatement(query);
    pstmt.setInt(1, orderID);
    String itemDetails = "";
    ArrayList<LineItem> items = cart.getItems();
    for (int i = 0;i<items.size(); i++)
    {
       LineItem lineItem = (LineItem) items.get(i);
       
        pstmt.setInt(2, lineItem.getQuantity());
        pstmt.setDouble(3, lineItem.getTotal());
        pstmt.setInt(4, Integer.parseInt(lineItem.getProduct().getCode()));
        pstmt.executeUpdate();
        itemDetails+= lineItem.getQuantity() + " of: " + lineItem.getProduct().getDescription() + " @ " + lineItem.getTotalCurrencyFormat() +"\n";
    }     
    
    //Email
    try{
        Gmail gmail = new Gmail(email, "theearphonestore@gmail.com", "advancedjava", "Order Confirmation", 
                "Thank you for ordering, your order number is " + orderID + "." 
                + "\n\n Shipping Details:"
                + "\n Name: " + name
                + "\n Street: " + street
                + "\n City: " + city
                + "\n State: " + state
                + "\n Zip: " + zip 
                + "\n\n Item Details: \n" + itemDetails
                + "\n Grand Total: " + "$" + total, false);
    }catch (Exception ex){
        //do nothing
    }
    String url = "/finish.jsp";
    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
    dispatcher.forward(request, response);
            
    } catch(SQLException e) {
      e.printStackTrace();
    } 
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
