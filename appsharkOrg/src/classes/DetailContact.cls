/*     Author:- Anshul Deshmukh
       Date  :- 22/07/2016
       Task  :- button on account detail page to create related contact   */

public class DetailContact 
  {
    public final Account objAcc;
    public DetailContact(ApexPages.StandardController stdController) 
      {                                                                                                           //// Constructor
        this.objAcc= (Account)stdController.getRecord();
      }

    
    public PageReference contactPage()
       {

        String accId = ApexPages.currentPage().getParameters().get('id');
        if (accId == null) 
         {
         return null;                                                                                          // Display the Visualforce page's content if no Id
            
         }
        Contact objCon = new Contact();
        
        for (Account objAccnt:[select id, name,phone from Account where id =:accId]) 
         {
            objCon.LastName = objAccnt.name;
            objCon.AccountId = objAccnt.Id;
            objCon.phone = objAccnt.phone;
            
         }
        insert objCon;
        PageReference pageRef = new PageReference('/' + objCon.Id);                                            //// Redirect to original page
        pageRef.setRedirect(true);
        return pageRef;

       }
   }