import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import ST_OBJECT from '@salesforce/schema/Salesforce_Ticket__c';
import REQUESTER_FIELD from '@salesforce/schema/Salesforce_Ticket__c.Requester__c';
import SP_FIELD from '@salesforce/schema/Salesforce_Ticket__c.Salesforce_Project__c';
import SUBJECT_FIELD from '@salesforce/schema/Salesforce_Ticket__c.Subject__c';
import STATUS_FIELD from '@salesforce/schema/Salesforce_Ticket__c.Status__c';
import PRIORITY_FIELD from '@salesforce/schema/Salesforce_Ticket__c.Priority__c';
import COMPLETEDDATE_FIELD from '@salesforce/schema/Salesforce_Ticket__c.Completed_Date__c';


export default class LightningRecordEditFormST extends LightningElement {

    objectName = ST_OBJECT;
    fields = {
        requester: REQUESTER_FIELD,
        spName: SP_FIELD,
        subject: SUBJECT_FIELD,
        status: STATUS_FIELD,
        priority: PRIORITY_FIELD,
        completedDate: COMPLETEDDATE_FIELD
    };

    successHandler() {
        const successToast = new ShowToastEvent({
            title: 'Success',
            message: 'Salesforce Ticket has been successfuly updated!',
            variant: 'success'
        });
        this.dispatchEvent(successToast);
    }
}