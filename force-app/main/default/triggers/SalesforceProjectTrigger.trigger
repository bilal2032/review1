trigger SalesforceProjectTrigger on Salesforce_Project__c (before insert, after insert, before update) {
    if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            SalesforceProjectTriggerHandler.createDefaultTicket(Trigger.New);            
        }        
    }
    if (Trigger.isBefore) {
        if (Trigger.isUpdate) {
            SalesforceProjectTriggerHandler.validateSPComplete(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);            
        }        
    }
}