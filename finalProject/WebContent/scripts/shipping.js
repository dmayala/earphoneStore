function validateForm()
    {
    var errorMsg = "";    
    var x=document.forms[0]["firstName"].value;
    if (x==null || x=="")
      {
      errorMsg+="First name must be filled out \n";
      }
      
    var x=document.forms[0]["lastName"].value;
    if (x==null || x=="")
      {
      errorMsg+="Last name must be filled out \n";    
      }  
   
    var x=document.forms[0]["street"].value;
    if (x==null || x=="")
      {
      errorMsg+="Street must be filled out \n";    
      }    
      
    var x=document.forms[0]["city"].value;
    if (x==null || x=="")
      {
      errorMsg+="City must be filled out \n";    
      }   
      
    var x=document.forms[0]["state"].value;
    if (x==null || x=="")
      {
      errorMsg+="State must be filled out \n";    
      }      
      
    var x=document.forms[0]["zip"].value;
    if (x==null | x=="")
      {
      errorMsg+="Zip must be filled out \n";    
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