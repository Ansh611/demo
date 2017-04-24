/*  Author : Appshark Developer
    Date : 13/9/2016
    Description : Auto calculation using Json with Remote action
    Modification History : --*/
Global  class Auto_calculation_controller {
    @RemoteAction
     global static List<Product_list__c> getProduct_list(){
         try{
             List<Product_list__c> lstProd = [SELECT Quantity__c, price__c,Total__c,Name,Grand_Total__c FROM Product_list__c];
             return lstProd;
         }
         catch(Exception excptn){
             ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Data Unavailable'));
             return null;
         }
    }
}