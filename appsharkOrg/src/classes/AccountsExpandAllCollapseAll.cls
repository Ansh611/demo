public class AccountsExpandAllCollapseAll 
{
    public list<Account> listAccResult{get;set;}//Holds all accounts
    public map<id,list<account>> mapChildToParentAcc{get;set;}//Holds Child accounts with their parent
    /*public AccountsExpandAllCollapseAll()
    {
          listAccResult = new list<Account>();       
    }*/
    public void getAccountHierarchy()//Retrieving accounts with their child accounts
    {
        mapChildToParentAcc = new map<id,list<account>>();
        listAccResult = [SELECT Id,name,(Select id,name,Parent.name from ChildAccounts ) from Account ORDER BY Name ASC];
        set<id> accIds = new set<id>();
        for(Account acc :listAccResult )//Adding child accounts into set
        {
            for(Account childAcc: acc.ChildAccounts)
            {
                accIds.add(childAcc.id);
            }
        }
        map<id,List<account>> childtoParentMap = new map<id,List<account>>();//Checks whether child and grand child accounts is parent to another account and adding to childtoParentMap
        for(Account objAcc: [SELECT Id,name,parentID from Account where parentId In:accIds])
        {
            if(childtoParentMap.containsKey(objAcc.parentID))
            {
                childtoParentMap.get(objAcc.parentID).add(objAcc);
            }
            else 
            { 
                childtoParentMap.put(objAcc.parentID,new list<Account>{objAcc});
            }
        }   
        for(id  childAccId: accIds)
        {
            if(childtoParentMap.containsKey(childAccId))
            {
                mapChildToParentAcc.put(childAccId,childtoParentMap.get(childAccId));
            }
            else 
            { 
                mapChildToParentAcc.put(childAccId,new list<Account>{});
            }           
        }
    }           
}