package business;

import java.io.Serializable;
import java.text.NumberFormat;

public class Product implements Serializable
{
    private String code;
    private String name;
    private String image;
    private String description;
    private String specification;
    private double price;
    
    public Product()
    {
        code = "";
        name = "";
        image = "";
        description = "";
        specification = "";
        price = 0;
    }
    
     public Product(String code, String name, String image, String description, String specification, double price)
    {
        this.code = code;
        this.name = name;
        this.image = image;
        this.description = description;
        this.specification = specification;
        this.price = price;
    }
    
    public void setCode(String code)
    {
        this.code = code;
    }
    
    public String getCode()
    { 
        return code; 
    }
    
      public void setName(String name)
    {
        this.name = name;
    }

    public String getName()
    { 
        return name; 
    }
    
        public void setImage(String image)
    {
        this.image = image;
    }
    
    public String getImage()
    { 
        return image; 
    }
    
    public void setDescription(String description)
    {
        this.description = description;
    }

    public String getDescription()
    { 
        return description; 
    }
    
    public void setSpecification(String specification)
    {
        this.specification = specification;
    }
    
    public String getSpecification()
    { 
        return specification; 
    }
    
    public void setPrice(double price)
    {
        this.price = price;
    }
    
    public double getPrice()
    { 
        return price; 
    }
    
    public String getPriceCurrencyFormat()
    {
        NumberFormat currency = NumberFormat.getCurrencyInstance();
        return currency.format(price);
    }    
}