public class TestVamsi {
    
    public Map<String, List<Map<String, Opportunity>>> mapAccConOpp{get;set;}
    public Map<Id, List<Opportunity>> mapAccOpp{get;set;}  //= new Map<Id, List<Opportunity>>();
    public Map<String, List<Opportunity>> mapConOpp{get;set;} // = new Map<String, List<Opportunity>>();
    public Map<Id, Account> mapAccs{get;set;}
    
    TestVamsi()
    {
        List<Contact> lstCons = [SELECT Id, AccountId, Account.Name, Name FROM Contact];
        List<Opportunity> lstOpps = [SELECT Id, AccountId, Name FROM Opportunity];
        mapAccs = new Map<Id,Account>([SELECT Id, Name from Account]);
        mapAccOpp = new Map<Id, List<Opportunity>>();
        mapConOpp = new Map<String, List<Opportunity>>();
        for(Opportunity opp : lstOpps)
        {
            if(mapAccOpp.get(opp.AccountId) == null)
            {
            	mapAccOpp.put(opp.AccountId, new List<Opportunity>());
            }
            mapAccOpp.get(opp.AccountId).add(opp);
        }
        for(Contact con : lstCons)
        {
            if(mapAccOpp.get(con.AccountId) != null)
            {
                mapConopp.put(con.Name, mapAccOpp.get(con.AccountId));
            }
        }
    }

}