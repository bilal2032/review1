public with sharing class AccountTriggerHandler {
    public static void updateAccountDescription(List<Account> accTriggerNew, Map<Id, Account> accTriggerNewMap, Map<Id, Account> accTriggerOldMap) {

        if (Trigger.isInsert) {

            for (Account eachAcc : accTriggerNew) {
                if(eachAcc.Active__c == 'Yes'){
                    eachAcc.Description = 'Your account is active. Enjoy!'; 
                }                
            }            
        }
        if (Trigger.isUpdate) {

            for (Account eachAcc : accTriggerNew) {
                Account oldAcc = accTriggerOldMap.get(eachAcc.Id);
                Account newAcc = accTriggerNewMap.get(eachAcc.Id);
                if (eachAcc.Active__c == 'Yes' && oldAcc.Active__c != newAcc.Active__c) {
                    eachAcc.Description = 'Your account is active. Enjoy!';                    
                }                
            }            
        }                            
    }
    public static void updateVIPforContacts(List<Account> accTriggerNew, List<Account> accTriggerOld, Map<Id, Account> accTriggerNewMap, Map<Id, Account> accTriggerOldMap) {

        Set<Id> accIds = new Set<Id>();

        for (Account eachAcc : accTriggerNew) {
            if(eachAcc.VIP__c != accTriggerOldMap.get(eachAcc.Id).VIP__c){
                accIds.add(eachAcc.Id);
            }            
        }

        List<Contact> listCnt = [SELECT id, vip__c, accountId FROM Contact WHERE AccountId in :accIds WITH SECURITY_ENFORCED];

        if (!listCnt.isEmpty()) {
            for (Contact eachContact : listCnt) {
                // Account newAcc = accTriggerNewMap.get(eachContact.AccountId);
                // Boolean accVIP = newAcc.VIP__c;
                
                eachContact.VIP__c = accTriggerNewMap.get(eachContact.AccountId).VIP__c;                
            }
            update listCnt;            
        }        
    }
}