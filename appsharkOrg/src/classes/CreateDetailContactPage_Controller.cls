public class CreateDetailContactPage_Controller {
// Constructor - this only really matters if the autoRun function
    public final Account objAcc;
    public CreateDetailContactPage_Controller(ApexPages.StandardController
stdController) {
        this.objAcc= (Account)stdController.getRecord();
    }

    // Code we will invoke on page load.
    public PageReference contactPage() {

        String accId = ApexPages.currentPage().getParameters().get('id');

        if (accId == null) {
            // Display the Visualforce page's content if no Id is passed over
            return null;
        }
  Contact objCon = new Contact();
        for (Account objAccnt:[select id, name,phone from Account
where id =:accId]) {
            // Do all the dirty work we need the code to do
            objCon.LastName = objAccnt.name;
            objCon.AccountId = objAccnt.Id;
            objCon.phone = objAccnt.phone;
        }
        insert objCon;

        // Redirect the user back to the original page
        PageReference pageRef = new PageReference('/' + objCon.Id);
        pageRef.setRedirect(true);
        return pageRef;

    }
}