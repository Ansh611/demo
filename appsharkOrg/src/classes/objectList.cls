public  class objectList{
    //here we are declaring properties
    public List<List<SObject>> myNotes { get; set; }
    public String getQueryString { get; set; }
    public String inputText1{get;set;} 
    List<Schema.SObjectType> gd{get;set;}
    public list<sObject> Querylist{get; set;}
    //it redirects the data to the visualforce page
    public pageReference QueryString()
    {
        myNotes=QueryString2(); 
        return null; 
    }    
    //this is the method we search data using sosl query
    public List<List<SObject>> QueryString2()
    {
        Querylist= New List<sObject>();
            System.debug('you reached here');
            myNotes = new List<List<SObject>>();
            List<String> strQuery1 = new List<String>();
            String strQuery = '';
            String query = '';
            map<string,Schema.SObjectType > objMap = Schema.getGlobalDescribe();
            for(string obj : objMap.keySet())
            {
                Schema.SObjectType f = objMap.get(obj);
                if(f.getdescribe().issearchable() && f.getdescribe().isQueryable() && f.getdescribe().isAccessible()&& f.getdescribe().isUpdateable())       
                    strQuery1.add(obj);         
            }
            for(String str: strQuery1)
            {
                If( objMap.containsKey(str) && objMap.get(str).getDescribe().fields.getMap().keySet().contains('name'))
                {
                    strQuery+= objMap.get(str).getDescribe().getName();
                    strQuery += '(id,name),';
                }
                System.debug(strQuery);
            }
            String strQuery2 = strQuery.substringBeforeLast(','); 
            query = 'FIND \'' + String.escapeSingleQuotes(inputText1) + '*\' IN ALL FIELDS RETURNING  ' + strQuery2 ;
            // Querylist= ((List<SObject>)Querylist[0]);
		     System.debug(query);
            myNotes = search.query(query);
        return myNotes ;   
    } 
}