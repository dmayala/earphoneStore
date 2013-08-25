package data;
import business.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductIO
{
    public static Product getProduct(String code, String filepath)
    {
        
      try{
        // get a connection
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
            
        // create a prepared statement
        String sqlStatement = "SELECT * FROM Item WHERE itemID = ?";
        PreparedStatement updateCart = connection.prepareStatement(sqlStatement);
        updateCart.setString(1, code);

        ResultSet rs = updateCart.executeQuery();
        
          while (rs.next()) {         
            String code2 = Integer.toString(rs.getInt("itemID"));
            String description = rs.getString("name");
            Double price = rs.getDouble("price");
         
            Product p = new Product();
            p.setCode(code2);
            p.setDescription(description);
            p.setPrice(price);
            return p;
        }
           
        } catch(SQLException e)
        {
            
        }
      return null;
    }
}