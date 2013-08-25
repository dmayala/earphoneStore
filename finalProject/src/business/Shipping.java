/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package business;

import java.io.Serializable;

public class Shipping implements Serializable
{
    private String name;
    private String street;
    private String city;
    private String state;
    private String zip;
    
    public Shipping()
    {
        name = "";
        street = "";
        city = "";
        state = "";
        zip = "";
    }
    
     public Shipping(String firstName, String lastName, String street, String city, String state, String zip)
    {
        this.name = firstName + " " + lastName;
        this.street = street;
        this.city = city;
        this.state = state;
        this.zip = zip;
    }
    
    public void setName(String firstName, String lastName)
    {
        this.name = firstName + " " + lastName;
    }
    
    public String getName()
    { 
        return name; 
    }
    
    public void setStreet(String street)
    {
        this.street = street;
    }
    
    public String getStreet()
    { 
        return street; 
    }
    
     public void setCity(String city)
    {
        this.city= city;
    }
    
    public String getCity()
    { 
        return city; 
    }
    
    public void setState(String state)
    {
        this.state = state;
    }
    
    public String getState()
    { 
        return state; 
    }
    
    public void setZip(String zip)
    {
        this.zip = zip;
    }
    
    public String getZip()
    { 
        return zip; 
    }
}
