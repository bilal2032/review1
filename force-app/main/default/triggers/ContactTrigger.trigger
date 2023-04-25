trigger ContactTrigger on Contact (before update) {

        ContactTriggerHandler.updateContactValidation1(Trigger.New, Trigger.Old, Trigger.OldMap);          
        ContactTriggerHandler.updateContactValidation2(Trigger.New, Trigger.Old, Trigger.OldMap);          

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