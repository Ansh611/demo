public class emailcontact
{
    //Holds lastname of contact.
    public String strLastName {set;get;}
    public list<Contact> lstCon {set;get;}
    public boolean flag {set;get;}
    public String body{set;get;}
    public String stremails;
    //Methods to search of Contacts based on given name .
    public void doSearchCon()
    {
        flag=true;
        String strQuery ='select LastName,Email,Phone,AccountId from Contact where email!=null AND LastName like \'%' + strLastName + '%\'';
        lstCon=Database.query(strQuery);
    }
    public void sendEmail()
    {
        for(Contact objemail:lstCon)
        {
            stremails=objemail.Email;
            Messaging.SingleEmailMessage conemail=new Messaging.SingleEmailMessage();
               String[] toadd=new String[]{stremails};
            String[] tocc=new String[]{};       
            conemail.settoaddresses(toadd);
            conemail.setccaddresses(tocc);
            conemail.setsubject('Test Mail');
            conemail.sethtmlbody(body);
            Messaging.Email[] emails=new Messaging.Email[]{conemail};
            Messaging.sendEmail(emails);
        }
    }
}