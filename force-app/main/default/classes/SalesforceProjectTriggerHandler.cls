public with sharing class SalesforceProjectTriggerHandler {
    public static void createDefaultTicket(List<Salesforce_Project__c> spTriggerNew) {
        List<Salesforce_Ticket__c> stList = new List<Salesforce_Ticket__c>();
        for (Salesforce_Project__c eachSp : spTriggerNew) {
            Salesforce_Ticket__c st = new Salesforce_Ticket__c();
            st.Subject__c = 'Default st'; 
            st.Salesforce_Project__c = eachSp.Id;
            stList.add(st);            
        }
        if (!stList.isEmpty()) {
            insert stList;            
        }        
    }
}