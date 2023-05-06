trigger ContactTrigger on Contact (before update, after insert, after update, after delete, after undelete) {

        ContactTriggerHandler.updateContactValidation1(Trigger.New, Trigger.Old, Trigger.OldMap);          
        ContactTriggerHandler.updateContactValidation2(Trigger.New, Trigger.Old, Trigger.OldMap);
        
        if (Trigger.isAfter) {
            if (Trigger.isInsert) {
                ContactTriggerHandler.numberOfContacts(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);                
            }
            if (Trigger.isUpdate) {
                ContactTriggerHandler.numberOfContacts(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);                
            }
            if (Trigger.isDelete) {
                ContactTriggerHandler.numberOfContacts(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);                
            }
            if (Trigger.isUndelete) {
                ContactTriggerHandler.numberOfContacts(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);                
            }             
        }

    /*
    if (Trigger.isAfter) {
        if (Trigger.isUpdate) {

            Set<Id> setId = trigger.newMap.keySet();
            for (Id eachId : setId) {

                String newPhone = trigger.newMap.get(eachId).Phone;              
                               
                String oldPhone = trigger.oldMap.get(eachId).Phone;              
                
                if (newPhone != oldPhone) {
                    System.debug('Contact name is ' + trigger.newMap.get(eachId).FirstName + ' ' + trigger.newMap.get(eachId).LastName + ', and new phone number is ' + newPhone);                    
                }                
            }            
        }        
    }*/
}