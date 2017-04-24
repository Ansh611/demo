trigger Cont_update_status on Account (after update) {
    set<string> setStatus = new Set<string>();
    map<string,List<contact>> mapCon = new map<string,List<contact>>();
    map<id,Account> oldStatus = new map<id,Account>();
    map<string,string> compStat = new map<string,string>();
    for(Account accOld : Trigger.old)
    {
        oldStatus .put(accOld.id,accOld);
    }
    for(Account accOld : Trigger.new)
    {
        Account oldAcc = new Account();
        if(!oldStatus .isEmpty()){
            oldAcc = oldStatus.get(accOld.id);
        }
        if(accOld.AnshulAppshark__status__c != null && accOld.AnshulAppshark__status__c !='' && oldAcc.AnshulAppshark__status__c !=accOld.AnshulAppshark__status__c)
        {   
            setStatus.add(oldAcc.AnshulAppshark__status__c);
            compStat.put(accOld.AnshulAppshark__status__c,oldAcc.AnshulAppshark__status__c);
        }
    }
    list<contact> LstAtp1 =[select AnshulAppshark__status__c,id from contact where AnshulAppshark__status__c IN :setStatus];
    if(!LstAtp1.isEmpty())
    {
        for(contact atp:LstAtp1)
        {
            if(mapCon.containsKey(atp.AnshulAppshark__status__c))
            {
                list<contact> lstATP =mapCon.get(atp.AnshulAppshark__status__c); 
                lstATP.add(atp);
                mapCon.put(atp.AnshulAppshark__status__c,lstATP);
            }else{
                mapCon.put(atp.AnshulAppshark__status__c,new list<contact>{atp});
            }
        }
    }
    list<contact> contUpd = new list<contact>();
        list<contact> contLstUpd = new list<contact>();
    for(Account accOld : Trigger.new)
    {
        
        string oldStat='';
        if(!compStat.isEmpty())
        {
            oldStat=compStat.get(accOld.AnshulAppshark__Status__c); 
        }
        if(oldStat != '')
        {
            if(!mapCon.isEmpty())
            {
                contUpd=mapCon.get(oldStat);
            }
        }
        if(!contUpd.isempty())
        {
            for(contact atp:contUpd)
            {
                atp.status__c=accOld.AnshulAppshark__Status__c;
                contLstUpd.add(atp);   
            }      
        }
        
    }
    update contLstUpd;
}