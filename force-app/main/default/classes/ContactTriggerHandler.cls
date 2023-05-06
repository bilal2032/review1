public with sharing class ContactTriggerHandler {
    public static void updateContactValidation1(List<Contact> conTriggerNew, List<Contact> conTriggerOld, Map<Id,Contact> conTriggerOldMap) {

        if (Trigger.isUpdate) {
            for (Contact eachCon : conTriggerNew) {
                Contact oldContact = conTriggerOldMap.get(eachCon.Id);
                if (oldContact.LeadSource == 'Partner Referral') {
                    eachCon.addError('You cannot update the record if the Lead Source is Partner Refferal');                
                }                        
            }            
        }                        
    }
    public static void updateContactValidation2(List<Contact> conTriggerNew, List<Contact> conTriggerOld, Map<Id,Contact> conTriggerOldMap) {
        if (Trigger.isUpdate) {
            for (Contact eachCon : conTriggerNew) {
                if (eachCon.LeadSource != conTriggerOldMap.get(eachCon.Id).LeadSource) {
                    eachCon.LeadSource.addError('Cannot update LEAD SOURCE');                
                }                        
            }            
        }         
    }
    public static void numberOfContacts(List<Contact> conTriggerNew, List<Contact> conTriggerOld, Map<Id, Contact> conTriggerNewMap, Map<Id, Contact> conTriggerOldMap) {

        Set<Id> accIds = new Set<Id>();

        for (Contact eachCnt : conTriggerNew) {
            if (eachCnt.AccountId != null) {
                accIds.add(eachCnt.AccountId);                
            }            
        }

        for (Contact eachCnt : conTriggerOld) {
            if (eachCnt.AccountId != null) {
                accIds.add(eachCnt.AccountId);                
            }            
        }

        if (!accIds.isEmpty()) {
            List<Account> accList = [SELECT Id, Number_of_Contacts__c, (SELECT Id FROM Contacts) FROM Account WHERE Id IN :accIds WITH SECURITY_ENFORCED];

            if (!accList.isEmpty()) {
                List<Account> updateAccList = new List<Account>();
                for (Account acc : accList) {                    
                    Account accObj = new Account();
                    accObj.Id = acc.Id;
                    accObj.Number_Of_Contacts__c = acc.Contacts.size();
                    updateAccList.add(accObj);                    
                }
                if (!updateAccList.isEmpty()) {
                    update updateAccList;                    
                }                
            }            
        }        
    }
}