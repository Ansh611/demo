public with sharing class conClass {
    ApexPages.StandardSetController controller;    
   public conClass(ApexPages.StandardSetController controller) {
        this.controller = controller;        
    controller.setPageSize(controller.getResultSize());
    }

}