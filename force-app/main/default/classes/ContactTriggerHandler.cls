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
}