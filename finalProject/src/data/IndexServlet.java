/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

import business.Product;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.LinkedList;
import java.util.List;

public class IndexServlet extends HttpServlet {

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
        
        String sqlResult = "";
               
        try{
        // get a connection
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
         
        String page = request.getParameter("page");
        if (page == null){
            page = "1";
        }
            
        // create a prepared statement
        ResultSet rs = null;
  
        int pageNo = (Integer.parseInt(page) - 1) * 6;    
        String selectStatement = "SELECT * FROM Item Limit ?, 6";
        PreparedStatement updatePageNo= connection.prepareStatement(selectStatement);
        updatePageNo.setInt(1, pageNo);
        rs = updatePageNo.executeQuery();
        
                    
        // create a statement
        Statement statement = connection.createStatement();
        
        String sqlStatement = "SELECT * FROM Item";
        ResultSet rs2 = statement.executeQuery(sqlStatement);
        double rsCount = 0;
        
        while (rs2.next()) {  
            rsCount = rsCount + 1;
        }

        //but notice that you'll only get correct ResultSet size after end of the while loop
        
        List ll = new LinkedList();
        
        while (rs.next()) {  
            String code = Integer.toString(rs.getInt("itemID"));
            String name = rs.getString("name");
            String image = rs.getString("photoName");
            String description = rs.getString("description");
            String specification = rs.getString("specification");
            Double price = rs.getDouble("price");
            
            //Assuming you have a user object       
            Product product = new Product(code, name, image, description, specification, price);

            ll.add(product);
        }
        
        request.setAttribute("ll", ll);
        
        //See how many pages I'll need
        int pageAmount = (int) Math.ceil(rsCount/6) ;
        request.setAttribute("page", pageAmount);
        
        //Forward to index
        String url = "/index.jsp";
            RequestDispatcher dispatcher =
                    getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request, response);
            
        } catch(SQLException e)
        {
            sqlResult = "Error executing the SQL statement: <br>"
                    + e.getMessage();
            
            String url = "/index2.jsp";
            RequestDispatcher dispatcher =
                    getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request, response);
        }
    }

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        processRequest(request, response);
    }
}