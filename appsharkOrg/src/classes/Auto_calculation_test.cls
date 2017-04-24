/*  Author : Appshark Developer
    Date : 13/9/2016
    Description : Auto calculation using Json with Remote action test class
    Modification History : --*/
@istest
private class Auto_calculation_test 
{
    private testmethod static void calculation_method(){
        
       list<Product_list__c> lstprod = new  list<Product_list__c>();
        Product_list__c objprod=new Product_list__c();
        objprod.price__c=23;
        objprod.Quantity__c=9;
        lstprod.add(objprod);
        insert lstprod;
        
      // Auto_calculation_controller.getProduct_list();
        
     /*   catch(Exception excptn)
        {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Data Unavailable'));
           //  return null; 
        }*/
      Auto_calculation_controller.getProduct_list();
       
    }
}