function validateForm() 
{
    var errorMsg ="";
    var email = document.forms[0]["email"].value;  
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
 
    if (re.test(email) == false){
        errorMsg+="Not a valid email \n";
    }
    
    var x=document.forms[0]["cardHolderName"].value;
    if (x==null || x=="")
      {
      errorMsg+="Card Holder Name must be filled out \n";    
      }  
      
   var x=document.forms[0]["cardNumber"].value;
    if (x==null || x=="" || !(x.length == 16))
      {
      errorMsg+="Not a valid Card Number \n";    
      } 
      
   var x=document.forms[0]["expirationMonth"].value;
    if (x==null || x=="" || !(x.length == 2))
      {
      errorMsg+="Not a valid Expiration Month \n";    
      }  
      
   var x=document.forms[0]["expirationYear"].value;
    if (x==null || x=="" || !(x.length == 4))
      {
      errorMsg+="Not a valid Expiration Year \n";    
      }  
      
   var x=document.forms[0]["secureCode"].value;
    if (x==null || x=="" || !(x.length == 4))
      {
      errorMsg+="Not a valid Secure Code \n";    
      }  
      
    if(errorMsg != ""){
      alert(errorMsg);
      return false;
    }
   
}

function isNumberKey(evt)
      {
         var charCode = (evt.which) ? evt.which : event.keyCode;
         if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;
      }

