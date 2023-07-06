import { getFieldDisplayValue, getFieldValue, getRecord } from 'lightning/uiRecordApi';
import { LightningElement, wire } from 'lwc';

import TICKET_FIELD from '@salesforce/schema/Salesforce_Ticket__c.Name';
import SP_FIELD from '@salesforce/schema/Salesforce_Ticket__c.Salesforce_Project__c';
import REQUESTER_FIELD from '@salesforce/schema/Salesforce_Ticket__c.Requester__c';
import SUBJECT_FIELD from '@salesforce/schema/Salesforce_Ticket__c.Subject__c';
import STATUS_FIELD from '@salesforce/schema/Salesforce_Ticket__c.Status__c';

export default class GetSFTicket extends LightningElement {

    recordId = 'a01B000000FLgD0IAL';
    tickectName;
    spName;
    requester;
    subject;
    status;

    @wire(getRecord, {recordId: '$recordId', layoutTypes: ['Full'], modes: ['View']})
    recordHandler({data, error}) {
        if (data) {
            console.log(data);
            //Aproach 1
            this.tickectName = data.fields.Name.value;
            this.spName = data.fields.Salesforce_Project__r.displayValue;
            this.requester = data.fields.Requester__r
            .displayValue;
            this.subject = data.fields.Subject__c.value;
            this.status = data.fields.Status__c.value;

            //Aproach 2
            // this.tickectName = getFieldValue(data, TICKET_FIELD);
            // this.spName = getFieldValue(data, SP_FIELD);
            // this.requester = getFieldValue(data, REQUESTER_FIELD);
            // this.subject = getFieldValue(data, SUBJECT_FIELD);
            // this.status = getFieldValue(data, STATUS_FIELD);
        }
        if (error) {
            console.error(error);
        }
    }
}