public class Dashboard {
    @auraEnabled
    public static string getreport()
    {
        system.debug(JSON.serialize(Reports.ReportManager.runReport('00O28000007nMRu', true)));
        return(JSON.serialize(Reports.ReportManager.runReport('00O28000007nMRu', true)));
        
    }
}