public with sharing class AccountTriggerHandler {
    public static void updateAccountDescription(List<Account> accTriggerNew, Map<Id, Account> accTriggerNewMap, Map<Id, Account> accTriggerOldMap) {
        if (Trigger.isBefore) {
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
    }
}