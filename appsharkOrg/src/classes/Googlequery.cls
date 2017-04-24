public class Googlequery{
 
  
  /*public pagereference searchpage(){
    Pagereference pg=new pagereference('https://sdfgdgdgdg');//https://play.google.com/store/apps/details?id=com.facebook.katana
    pg.setRedirect(true);
    return pg;
  }*/
    Case thisCase = [select CreatedDate from
Case limit 1]; // gets the GMT date from database on a case
Datetime thisDT = thisCase.CreatedDate;
String myDate = thisDT.format('dd-MM-yyyy HH:mm', 'CST'); // using object.format maybe? Example for pacific standard time.
    
}