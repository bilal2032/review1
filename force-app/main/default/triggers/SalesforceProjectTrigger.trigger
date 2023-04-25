trigger SalesforceProjectTrigger on Salesforce_Project__c (before insert, after insert) {
    if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            SalesforceProjectTriggerHandler.createDefaultTicket(Trigger.New);            
        }        
    }
}