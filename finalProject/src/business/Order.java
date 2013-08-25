package business;

public class Order
{
    private String firstName;
    private String lastName;
    private String email;
    private Cart cart;
    private String date;
    private String grandTotal;
    
    public Order()
    {
        firstName = "";
        lastName = "";
        email = "";
        cart = null;
        date = "";
        grandTotal = "";
        
    }
    
    public Order(String firstName, String lastName, String email, Cart cart, String date, String grandTotal)
    {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.cart = cart;
        this.date = date;
        this.grandTotal = grandTotal;
    }
    
    public void setFirstName(String firstName)
    {
        this.firstName = firstName;
    }

    public String getFirstName()
    { 
        return firstName; 
    }
    
    public void setLastName(String lastName)
    {
        this.lastName = lastName;
    }

    public String getLastName()
    { 
        return lastName; 
    }
    
    public void setEmail(String email)
    {
        this.email = email;
    }

    public String getEmail()
    { 
        return email; 
    }
    
    public void setCart(Cart cart)
    {
        this.cart = cart;
    }

    public Cart getCart()
    { 
        return cart; 
    }
    
    public void setDate(String date)
    {
        this.date = date;
    }

    public String getDate()
    { 
        return date; 
    }
    
    public void setGrandTotal(String grandTotal)
    {
        this.grandTotal = grandTotal;
    }

    public String getGrandTotal()
    { 
        return grandTotal; 
    }
}
