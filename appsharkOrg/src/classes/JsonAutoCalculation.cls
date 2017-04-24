/*
 * Author : Appshark Developer
 * Date : 13/09/2016
 * Description : Auto Calculation using Json with Remote Action
 * Modification History : ---
 **/
global class JsonAutoCalculation {
    
    public JsonAutoCalculation(ApexPages.StandardSetController controller){
        
    }   
    // The remoting method just update Account object and returns it
    @RemoteAction
    global static Product_list__c updatedproduct(String quantity,String price,String total){         
        try
        {	
            Product_list__c updatedproduct = new Product_list__c();
            updatedproduct = [ SELECT Quantity__c, price__c,Total__c,Grand_Total__c,Name FROM Product_list__c];
        /*	if (name != null) 
                updatedAccount.Name = name ;
        	if (phone != null)
                updatedAccount.Phone = phone ;*/
            
          	update updatedproduct;
          	return updatedproduct;  
        }
        catch(Exception e)
        {
           return null;  
        }       
    }
}