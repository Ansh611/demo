/*  Author : Appshark Developer
    Date : 20/10/2016
    Description : If Checkbox checked, save user name and count to custom setting.
    Modification History : --*/
public class HelperSetUserToCS
{
public static void SetUserToCS(list<user> usr)
{
    integer cnt;
    cnt=0;
     string UsrName; 
    user_record__c cs = new user_record__c(); //custom setting object
    for(user usr1 : usr)
    {
        if(usr1.Assign__c==true)   //if checkbox is check in user
        {
            cs.Name = usr1.FirstName;    //store data in custom setting
            cs.count__c = 0;
            cs.user_name__c = usr1.Name;
            cnt=1;
        }
    }
    if(cnt==1)
    {
     insert cs;
    }
    if(cnt==0)
    {
     for(user usr2 :usr)
      {
    if(usr2.Assign__c==false)
    {
         UsrName = usr2.FirstName;
        system.debug('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'+UsrName);
    }
      }
      
    list<Account> LstAcc = [select name,id from Account where user__c =:UsrName];
    if(LstAcc.size()>0)
    {
    user_record__c CSusrDel = user_record__c.getInstance(UsrName);
        
    delete CSusrDel;
            string CSname;      //store minimum count user name 
        List<user_record__c> mcs = user_record__c.getall().values(); //get all values from CS
        Decimal MinCount=mcs[0].count__c;  //store first digit
        for (Integer c = 1 ; c < mcs.size()-1; c++ )  //loop to find minimum count
        {
            if ( mcs[c].count__c < MinCount ) 
            {
                MinCount = mcs[c].count__c;
            }
        }
        for(user_record__c usr1 : [select name from user_record__c where count__c =:MinCount])
        {
            CSname= usr1.name;   //get name of minimum count record
        }
         user_record__c CSusr = user_record__c.getInstance(CSname);
        list<Account> ObjAccFinal = new list <Account>();
         for(Account objacc : LstAcc)  // insert user name in Account record
            {
                objacc.user__c= CSname;
                ObjAccFinal.add(objacc);
                CSusr.count__c = CSusr.count__c + 1; //increment count
            }
        update ObjAccFinal;
        update CSusr;
    }
    }
}
}