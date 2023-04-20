trigger AccountTrigger on Account (before insert, before update, after insert, after update) {

    List<Account> accTriggerNew = trigger.new;
    List<Account> accTriggerOld = trigger.old;
    Map<Id, Account> accTriggerNewMap = trigger.newMap;
    Map<Id, Account> accTriggerOldMap = trigger.oldMap;

    if (Trigger.isAfter) {
        if (Trigger.isUpdate) {
            Set<Id> accIds = accTriggerNewMap.keySet();

            for (Id eachId : accIds) {
                System.debug('eachId --> ' + eachId);

                Account newAccount = accTriggerNewMap.get(eachId);
                System.debug('newAccount name -> ' + newAccount.Name);
                String newWebsite = newAccount.Website;

                Account oldAccount = accTriggerOldMap.get(eachId);
                System.debug('oldAccount name -> ' + oldAccount.Name);
                String oldWebsite = oldAccount.Website; 
                
                if (newWebsite != oldWebsite) {
                    System.debug('Account name is ' + newAccount.Name + ' and new Website is ' + newWebsite);
                    
                }
            }                       
        }
    }

    /*

    Map<Id, Account> accTriggerNewMap = trigger.newMap;
    Map<Id, Account> accTriggerOldMap = trigger.oldMap;

    if (Trigger.isBefore) {
        if (Trigger.isInsert) {
            System.debug('before insert trigger newMap  is ' + accTriggerNewMap);            
            System.debug('before insert trigger oldMap is ' + accTriggerOldMap);            
        }
        if (Trigger.isUpdate) {
            System.debug('before update trigger newMap  is ' + accTriggerNewMap);            
            System.debug('before update trigger oldMap is ' + accTriggerOldMap);            
        }
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            System.debug('after insert trigger newMap  is ' + accTriggerNewMap);            
            System.debug('after insert trigger oldMap is ' + accTriggerOldMap);            
        }
        if (Trigger.isUpdate) {
            System.debug('after update trigger newMap  is ' + accTriggerNewMap);            
            System.debug('after update trigger oldMap is ' + accTriggerOldMap);            
        }
    }

    if (Trigger.isAfter) {
        if (Trigger.isUpdate) {
            List<Account> accTriggerOld = trigger.old;
            for (Account oldAcc : accTriggerOld) {
                System.debug('old acc id ' + oldAcc.Id + ', old acc name: ' + oldAcc.Name);                
            }

            List<Account> accTriggerNew = trigger.new;
            for (Account newAcc : accTriggerNew) {
                System.debug('new acc id ' + newAcc.Id + ', new acc name: ' + newAcc.Name);                
            }                        
        }
    }

    if (Trigger.isBefore) {
        if (Trigger.isInsert) {
            System.debug('before insert trigger.old is ' + trigger.old);            
        }
        if (Trigger.isUpdate) {
            System.debug('before update trigger.old is ' + trigger.old);            
        }
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            System.debug('after insert trigger.old is ' + trigger.old);            
        }
        if (Trigger.isUpdate) {
            System.debug('after update trigger.old is ' + trigger.old);            
        }
    }

    List<Account> accTriggerNew = trigger.new;
    if (Trigger.isBefore) {
        if (Trigger.isInsert) {
            System.debug('BEFORE record in before insert ' + accTriggerNew);
            System.debug('BEFORE number of records inserted: ' + accTriggerNew.size());
            for (Account eachAcc : accTriggerNew) {
                System.debug('BEFORE acc id is ' + eachAcc.Id + ' acc name is ' + eachAcc.Name);                
            }        
        }
        if (Trigger.isUpdate) {
            System.debug('BEFORE record in before update ' + accTriggerNew);
            System.debug('BEFORE number of records updated: ' + accTriggerNew.size());
            for (Account eachAcc : accTriggerNew) {
                System.debug('BEFORE acc id is ' + eachAcc.Id + ' acc name is ' + eachAcc.Name);                
            }        
        }
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            System.debug('AFTER record in after insert' + accTriggerNew);
            System.debug('AFTER number of records inserted: ' + accTriggerNew.size());
            for (Account eachAcc : accTriggerNew) {
                System.debug('AFTER acc id is ' + eachAcc.Id + ' acc name is ' + eachAcc.Name);                
            }        
        }
        if (Trigger.isUpdate) {
            System.debug('AFTER record in after update' + accTriggerNew);
            System.debug('AFTER number of records updated: ' + accTriggerNew.size());
            for (Account eachAcc : accTriggerNew) {
                System.debug('AFTER acc id is ' + eachAcc.Id + ' acc name is ' + eachAcc.Name);                
            }        
        }
    }


    
    if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            System.debug('record in after insert' + trigger.new);        
        }
    }

    
    if (Trigger.isBefore) {
        System.debug('we are in BEFORE trigger');
        if (Trigger.isInsert) {
            System.debug('account before insert trigger is called');        
        }
        if (Trigger.isUpdate) {
            System.debug('account before update trigger is called'); 
        }        
    }
    if (Trigger.isAfter) {
        System.debug('we are in AFTER trigger');
        if (Trigger.isInsert) {
            System.debug('account after insert trigger is called');        
        }
        if (Trigger.isUpdate) {
            System.debug('account after update trigger is called'); 
        }        
    }

    


    
    if (Trigger.isBefore) {
        System.debug('account before insert trigger is called');        
    }
    if (Trigger.isAfter) {
        System.debug('account after insert trigger is called');        
    }*/    
}