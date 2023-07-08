import { getRecord, updateRecord } from 'lightning/uiRecordApi';
import { LightningElement, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import NAME_FIELD from '@salesforce/schema/Account.Name';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
import WEBSITE_FIELD from '@salesforce/schema/Account.Website';
import REVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';

const FIELDS = [NAME_FIELD, PHONE_FIELD, WEBSITE_FIELD, REVENUE_FIELD];

export default class UpdateRecordAcc extends LightningElement {

    recordId = '001B000001VWePOIA1';
    formdata = {};

    changeHandler(event) {
        const {name, value} = event.target;
        this.formdata[name] = value;
    }

    @wire(getRecord, {recordId: '$recordId', fields: FIELDS})
    acc;

    updateAccount() {
        this.formdata['id'] = this.recordId;
        const recordInput = {
            fields: this.formdata
        };
        updateRecord(recordInput)
            .then(result => {
                const successToast = new ShowToastEvent({
                    title: 'Success',
                    message: 'Account record has been updated successfully!',
                    variant: 'success'
                });
                this.dispatchEvent(successToast);
            })
            .catch(error => {
                console.error(error);
            })
    }
}