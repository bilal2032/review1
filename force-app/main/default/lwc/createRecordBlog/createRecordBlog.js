import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import TICKET_OBJECT from '@salesforce/schema/Salesforce_Ticket__c';
import { createRecord } from 'lightning/uiRecordApi';

export default class CreateRecordBlog extends LightningElement {
    formdata = {};

    changeHandler(event) {
        const {name, value} = event.target;
        this.formdata[name] = value;           
    }

    saveTicket() {
        //Prepare recordInput
        const recordInput = {
            apiName:TICKET_OBJECT.objectApiName,
            fields: this.formdata
        }
        //Create record
        createRecord(recordInput)
        .then(result => {
            //Show Success Toast(via ShowToastEvent)
            const successToast = new ShowToastEvent({
                title: 'Success',
                message: 'Salesforce Ticket record has been created succesfully!',
                variant: 'success'
            });
            this.dispatchEvent(successToast);
        })
        .catch(error => {
            console.error(error);
        })
    }

    cancelTicket() {
        this.template.querySelector('form.ticketform').reset();
    }

}