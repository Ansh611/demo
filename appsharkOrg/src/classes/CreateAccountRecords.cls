/* 
       Description : Rest Service class to get all the Accounts from the Source Org
*/
@RestResource(urlMapping='/CreateAccountRecords/*')
global with sharing class CreateAccountRecords{
    @HttpPost
    global static list<Account> Accountdetails(){
         RestRequest request = RestContext.request;   //Returns the RestRequest object for our Apex REST method.  
         RestResponse response = RestContext.response;   //Returns the RestResponse for our Apex REST method. 
         String jSONRequestBody=request.requestBody.toString().trim();   //Access the request body with input data coming in the JSON format  
         list<Account> lstacc = (List<Account>)Json.deserializeStrict(jSONRequestBody,List<Account>.class); 
         return lstacc;
       }  
}