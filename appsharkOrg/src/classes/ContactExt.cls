public with sharing class ContactExt {
    private Contact c;
    public String contactJson {get;set;}
    public ContactExt(ApexPages.StandardController controller) {
        c = (Contact) controller.getRecord();
        contactJson = JSON.serializePretty(c);
    }
    public void save()
    {
        c = (Contact)JSON.deserialize(contactJson, Contact.class);
        upsert c;
    }
}