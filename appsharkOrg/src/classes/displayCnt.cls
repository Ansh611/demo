public class displayCnt {
    
    @auraEnabled
    public static string getCnt(string selected)
    {
        system.debug('str'+selected);
         string query = 'select lastName from Contact where '+ selected+'__c'+'='+true;
        system.debug('query'+query);
         system.debug('queryResult'+Database.query(query));
//        return (Database.query(query));
        string strCntResult;  
            strCntResult = JSON.serialize(Database.query(query));
            return strCntResult;
    }
}