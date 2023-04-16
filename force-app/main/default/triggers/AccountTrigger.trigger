trigger AccountTrigger on Account (before insert, before update, after insert, after update) {

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


    /*
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