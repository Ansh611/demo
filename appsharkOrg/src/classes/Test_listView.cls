public with sharing class Test_listView {
    // account and selection set/variables
    private list<AccountWrapper> AccountList {get; set;}
    private set<Id> AccountSelectedSet;
    // selection and filter 
    public list<String> AlphaList {get; set;}
    public String AlphaFilter {get; set;}
    private String QueryAccount;
    // display sort and number
    public String RecPerPage {get; set;}
    public list<SelectOption> RecPerPageOption {get; set;}  
    public String SortFieldSave;
    // TableExampleController - Constructor initialization
    public Test_listView(){
        AccountList = new list<AccountWrapper>();
        AccountSelectedSet = new set<Id>();
        //records for page initialization
        RecPerPageOption = new list<SelectOption>();
        RecPerPageOption.add(new SelectOption('10','10'));
        RecPerPageOption.add(new SelectOption('25','25'));
        RecPerPageOption.add(new SelectOption('50','50'));
        RecPerPageOption.add(new SelectOption('100','100'));
        RecPerPageOption.add(new SelectOption('200','200'));
        RecPerPage = '10'; //default records per page
        // initialization alpha list
        AlphaList = new list<String> {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'Other', 'All'};
            SortFieldSave = SortField;
        // alpha filter, use page parameter or set default to all
        if (apexpages.currentpage().getparameters().get('alpha') == null) 
        {
            AlphaFilter = 'All';
        } 
        else 
        {
            AlphaFilter = apexpages.currentpage().getparameters().get('alpha');
        }
        // list generation
        BuildQuery();  
    }
    //StdSetControllerAccount - paging through the Account list
    public ApexPages.StandardSetController StdSetControllerAccount 
    {
        get {
            if(StdSetControllerAccount == null) 
            {
                StdSetControllerAccount = new ApexPages.StandardSetController(Database.getQueryLocator(QueryAccount));
                // sets the number of records in each page set
                StdSetControllerAccount.setPageSize(Integer.valueOf(RecPerPage));
            }
            return StdSetControllerAccount;
        }
        set;
    }
    //getCurrentAccountList - return an Account list for the table
    public list<AccountWrapper> getCurrentAccountList() 
    {
        AccountList = new list<AccountWrapper>();
        for (Account a : (list<Account>)StdSetControllerAccount.getRecords()) 
        {
            AccountList.add(new AccountWrapper(a));
        }
        return AccountList;
    }
    //ClearAccountSelectedSet - remove selected accounts and initialize counter
    public PageReference ClearAll()
    {
        AccountList.clear();
        AlphaFilter = 'All';
        BuildQuery();
        return null;
    }
    // BuildQuery - build query command for list selection change
    public void BuildQuery() 
    {
        StdSetControllerAccount = null;
        String QueryWhere = '';
        
        if (AlphaFilter == null || AlphaFilter.trim().length() == 0)
        {
            AlphaFilter = 'All';
        }
        QueryAccount = 'SELECT Id, Name, Site, Type, ownerid, BillingState, Phone ' + ' FROM Account'; 
        if (AlphaFilter == 'Other') 
        {
            QueryWhere = BuildWhere(QueryWhere, '(' + String.escapeSingleQuotes(SortField) + ' < \'A\' OR ' + 
                                    String.escapeSingleQuotes(SortField) + ' > \'Z\') AND (NOT ' + 
                                    String.escapeSingleQuotes(SortField) + ' LIKE \'Z%\') ');
        } 
        else if (AlphaFilter != 'All') 
        {
            QueryWhere = BuildWhere(QueryWhere, '(' + String.escapeSingleQuotes(SortField) + ' LIKE \'' + String.escapeSingleQuotes(AlphaFilter) + '%\')' );
        }
        QueryAccount += QueryWhere;
        QueryAccount += ' ORDER BY ' + String.escapeSingleQuotes(SortField) + ' ' + String.escapeSingleQuotes(SortDirection) + ' LIMIT 10000';
        //system.debug('QueryAccount:' + QueryAccount);
    }
    //BuildWhere - build soql string for where criteria 
    public String BuildWhere(String QW, String Cond) 
    {
        if (QW == '') 
        {
            return ' WHERE ' + Cond;
        } 
        else 
        {
            return QW + ' AND ' + Cond;
        }
    } 
    // SortDirection - return sort direction. Default ascending(asc)
    public String SortDirection 
    {
        get 
        { 
            if (SortDirection == null) 
            {  
                SortDirection = 'asc'; 
            } 
            return SortDirection;  
        }
        set;
    }
    // SortField - return sort by field. Default to Name
    public String SortField 
    {
        get
        { 
            if (SortField == null) 
            {
                SortField = 'Name'; 
            } 
            return SortField;  
        }
        set; 
    } 
    // SortToggle - toggles the sorting of query from asc<-->desc
    public void SortToggle() 
    {
        SortDirection = SortDirection.equals('asc') ? 'desc NULLS LAST' : 'asc';
        // reset alpha filter and sort sequence when sorted field is changed
        if (SortFieldSave != SortField) 
        {
            SortDirection = 'asc';
            AlphaFilter = 'All';
            SortFieldSave = SortField;
        }
        // run the query again
        BuildQuery();
    }
    public class AccountWrapper
    {
        public Account aAccount {get;set;}
        // sub-class initialization
        public AccountWrapper(Account a)
        {
            aAccount = a;
        }
    }
}