/*-- Author:-Appshark Developer,
 * Date:-14/09/16,
 * Description:- Displaying Account and Contacts as treeview with edit and delete functionality for contacts.
 * Modification History:*/

public class AccAndConWithTreeView 
{
    public String ParamDelete{set;get;}//Holds Contact record id 
    public String paramLastName{set;get;}//Holds Contact lastname to update
    public String paramPhone{set;get;}//Holds Contact Phone No to update
    public List<Account> getaccsAndContact()//Build the data of Account Related Contacts
    {
        List<Account> lstaccounts = [Select Id,(Select id,LastName,Phone,AccountId From Contacts), Name from Account where  id In (Select AccountId from Contact)];
        return lstaccounts;
    }
    public void contactDelete()//Delete functionality to delete record
    {
        Delete[select id from Contact where id=:ParamDelete];
    }
    public void saveRecord()//Save Functionality to update the changes
    {
        Contact objCon=[select id,LastName,Phone from Contact where id=:ParamDelete];
        objCon.LastName=paramLastName;
        objCon.Phone=paramPhone;
        update objCon;        
    }
}