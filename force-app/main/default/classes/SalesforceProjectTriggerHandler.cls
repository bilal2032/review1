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

    public static void validateSPComplete(List<Salesforce_Project__c> spTriggerNew, List<Salesforce_Project__c> spTriggerOld, Map<Id, Salesforce_Project__c> spTriggerNewMap, Map<Id, Salesforce_Project__c> spTriggerOldMap) {
        Set<Id> setCompletedProjectIds = new Set<Id>();
        for(Salesforce_Project__c eachSP : spTriggerNew) {
            if (eachSP.Status__c != spTriggerOldMap.get(eachSP.Id).Status__c && eachSP.Status__c == 'Completed') {
                setCompletedProjectIds.add(eachSp.Id);                
            }            
        }

        List<Salesforce_Ticket__c> stList = [SELECT Id, Salesforce_Project__c, Status__c FROM Salesforce_Ticket__c WHERE Salesforce_Project__c in :setCompletedProjectIds AND Status__c != 'Completed' WITH SECURITY_ENFORCED];
        for (Salesforce_Ticket__c eachST : stList) {
            if (setCompletedProjectIds.contains(eachST.Salesforce_Project__c)) {
                Salesforce_Project__c sp = spTriggerNewMap.get(eachST.Salesforce_Project__c);
                sp.Status__c.addError('Cannot complete project because all its ticket are not completed.');                
            }            
        }        
    }
}