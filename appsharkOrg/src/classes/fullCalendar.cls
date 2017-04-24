public class fullCalendar {
   public list<calEvent> events {get;set;}
    static String dtFormat = 'EEE, d MMM yyyy HH:mm:ss z';
    public fullCalendar(){
       events = new list<calEvent>();
            for(Event evnt: [select Id, Subject, isAllDayEvent, StartDateTime, EndDateTime from Event where OwnerID = :UserInfo.getUserId() limit : 500]){
            system.debug('evnt'+evnt);
            DateTime startDT = evnt.StartDateTime;
            DateTime endDT = evnt.EndDateTime;

            calEvent myEvent = new calEvent();
            myEvent.title = evnt.Subject;
            myEvent.allDay = evnt.isAllDayEvent;
            myEvent.startString = startDT.format(dtFormat);
            myEvent.endString = endDT.format(dtFormat);
            myEvent.url = '/' + evnt.Id;
            myEvent.className = 'event-personal';
            events.add(myEvent);
        }
       
    }

    // Class to hold calendar event data
    public class calEvent {
        public String title {get;set;}
        public Boolean allDay {get;set;}
        public String startString {get;set;}
        public String endString {get;set;}
        public String url {get;set;}
        public String className {get;set;}
    }
}