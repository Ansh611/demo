/*  Author : Appshark Developer
Date : 02/08/2017
Description : Global search functionaloity
Modification History : --*/
public class globalSearch {
// public string myNotes { get; set; }
    @RemoteAction public static List<List<sObject>> searchQuery(string entity) {
        system.debug('entity'+entity);
        //Get all Object Name in org
        map<string,Schema.SObjectType > objMap = Schema.getGlobalDescribe();
         List<String> strQuery1 = new List<String>();
        String strQuery = '';
        String query = '';
        for(string obj : objMap.keySet())
        {
            Schema.SObjectType f = objMap.get(obj);
            if(f.getdescribe().issearchable() && f.getdescribe().isQueryable() && f.getdescribe().isAccessible()&& f.getdescribe().isUpdateable())       
                strQuery1.add(obj);         
        }
        for(String str: strQuery1)
        {
            //system.debug('obj@@@@@@@@@@@@'+str);
            If( objMap.containsKey(str) && objMap.get(str).getDescribe().fields.getMap().keySet().contains('name'))
            {
                strQuery+= objMap.get(str).getDescribe().getName();
                strQuery += '(id,name),';
            }
           // System.debug(strQuery);
        }
        String strQuery2 = strQuery.substringBeforeLast(','); 
    query = 'FIND \'' + String.escapeSingleQuotes(entity) + '*\' IN ALL FIELDS RETURNING  ' + strQuery2 ;
       // system.debug('lstRst'+lstRst);
      //list<sobject> lstRst;
      List<List<sobject>> lstr = new List<List<sobject>>();
      for(List<sobject> lstObj : search.query(query))
      {   
          if(!lstObj.isEmpty()){
          		lstr.add(lstObj);
          }
       }
     return lstr;
    }
}