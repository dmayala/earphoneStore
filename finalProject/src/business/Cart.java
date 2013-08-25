package business;

import java.io.Serializable;
import java.text.NumberFormat;
import java.util.ArrayList;

public class Cart implements Serializable
{
    private ArrayList<LineItem> items;
    
    public Cart()
    {
        items = new ArrayList<LineItem>();
    }
    
    public ArrayList<LineItem> getItems()
    { 
        return items;
    }
    
    public int getCount()
    { 
        return items.size();
    }
    
    public void addItem(LineItem item, String source, String tester)
    {
        String code = item.getProduct().getCode();
        String source2 = "";
        if (source != null){
            source2 = source;
        }
        
        
        int testInt = 1;
        
        if (tester != null){
            testInt = Integer.parseInt(tester);
        }

   
        int quantity = item.getQuantity();
          for (int i = 0; i < items.size(); i++)
            {
                LineItem lineItem = items.get(i);
                if (lineItem.getProduct().getCode().equals(code))
                {
                    if (!items.contains(code) && source2.equals("index")){
                         lineItem.setQuantity(lineItem.getQuantity() + testInt);
                     }else if (items.contains(code) && source2.equals("index")){
                         lineItem.setQuantity(testInt);
                     } else{
                         lineItem.setQuantity(quantity);
                    }
                    return;
                }
                
            }
            items.add(item);
    }
    
    public void removeItem(LineItem item)
    {
        String code = item.getProduct().getCode();
        for (int i = 0; i < items.size(); i++)
        {
            LineItem lineItem = items.get(i);
            if (lineItem.getProduct().getCode().equals(code))
            {
                items.remove(i);
                return;
            }
        }
    }
    
    public String getTotal()
    {
        NumberFormat nf = NumberFormat.getCurrencyInstance();
        String currencyTotal = "";
        double total = 0;
        for (int i = 0; i < items.size(); i++)
        {
           total += items.get(i).getTotal();
           
          currencyTotal = nf.format(total);
        }
        return currencyTotal;
    }
}