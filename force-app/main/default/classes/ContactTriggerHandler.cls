public with sharing class ContactTriggerHandler {
    public static void updateContactValidation1(List<Contact> conTriggerNew, List<Contact> conTriggerOld) {

        if (Trigger.isUpdate) {
            for (Contact eachCon : conTriggerNew) {
                if (eachCon.LeadSource == 'Partner Referral') {
                    eachCon.addError('You cannot update the record if the Lead Source is Partner Refferal');                
                }                        
            }            
        }                        
    }
}