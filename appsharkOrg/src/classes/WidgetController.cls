@RestResource(urlMapping='/Widgets/*')
global class WidgetController {

    @HttpGet
    global static List<AnshulAppshark__Widges__c> getWidgets() {
        List<AnshulAppshark__Widges__c> widgets = [SELECT Name from AnshulAppshark__Widges__c];
        return widgets;
    }

    @HttpPost 
    global static String createNewWidget(String Name) {
        AnshulAppshark__Widges__c w = new AnshulAppshark__Widges__c();
        w.Name = Name;
        insert w;

        return 'Done';
   }

    @HttpDelete
    global static String deleteWidgetById() {
        String Id = RestContext.request.params.get('Id');
        List<AnshulAppshark__Widges__c> w = [ Select ID from AnshulAppshark__Widges__c where Id= :Id];

        delete w;

        return 'Deleted Widget';
    }

    @HttpPut
    global static String updateWidget(String Id, String NewName) {
        AnshulAppshark__Widges__c w = [ Select ID, Name from AnshulAppshark__Widges__c where Id= :Id];

        w.Name = NewName;
        update w;

        return 'Widget Updated';
    }
}