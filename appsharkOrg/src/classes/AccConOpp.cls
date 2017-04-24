public class AccConOpp {
 public List<Account> acct {get;set;}
    set<ID> accIds = new set<ID>();
    set<ID> cntIds = new set<ID>();
    public Map<string,List<contact>> MapAccCnt {get;set;}
    public Map<String, List<OpportunityContactRole>> mapCntOpp{get;set;}
    public AccConOpp()
    {
        MapAccCnt = new Map<string,List<Contact>>();
        mapCntOpp = new Map<String, List<OpportunityContactRole>>();
        acct = new list<Account>();
        acct = [SELECT Name,id FROM Account limit 10];
        for(account a:acct)
        {
            accIds.add(a.ID);
        }
        system.debug('@@@@@@@@@@accIds'+accIds);
        for(Contact Objcon :[SELECT Id, Name, Account.name FROM Contact WHERE Contact.AccountId IN :accIds ])
        {
            List<Contact> lstcon = MapAccCnt.get(Objcon.Account.name);
            if(lstcon == null)
            {
                lstcon = new List<Contact>();
            }
            lstcon.add(Objcon);
            cntIds.add(Objcon.Id); // Add contact id for related cnt opportunity
            MapAccCnt.put(Objcon.Account.name,lstcon);
        }
        for(account a:acct) {
            if(MapAccCnt.get(a.name) == null) {
                MapAccCnt.put(a.name, new List<Contact>());
            }
        }
        System.debug('MapAccCnt    '+MapAccCnt);
        for(OpportunityContactRole objOcr : [select OpportunityId,ContactId,contact.name, Opportunity.Name from OpportunityContactRole where ContactId IN :cntIds])
        {
             List<OpportunityContactRole> lstcon = mapCntOpp.get(objOcr.contact.name);
             if(lstcon == null)
             {
                 lstcon = new List<OpportunityContactRole>();
             }
            lstcon.add(objOcr);
             mapCntOpp.put(objOcr.contact.name,lstcon);
        }
        for(List<contact> lstCont : MapAccCnt.values()) {
            for(Contact c:lstCont){
                if(mapCntOpp.get(c.name) == null) {
                    mapCntOpp.put(c.name, new List<OpportunityContactRole>());
                }
            }
        }
    }    
}