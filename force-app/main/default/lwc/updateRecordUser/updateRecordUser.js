import { LightningElement, wire } from 'lwc';

import COMPANY_FIELD from '@salesforce/schema/User.CompanyName';
import DEPARTMENT_FIELD from '@salesforce/schema/User.Department';
import { getRecord, updateRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

const FIELDS = [COMPANY_FIELD, DEPARTMENT_FIELD];

export default class UpdateRecordUser extends LightningElement {

    userId = '2F005B0000009lkL2';
    formdata = {};
    
    @wire(getRecord, {recordId: '$userId', fields: FIELDS})
    user;

    changeHandler(event) {
        const {name, value} = event.target;
        this.formdata[name] = value;
    }

    updateUser() {
        this.formdata['Id'] = this.userId;
        const recordInput = {
            fields: this.formdata
        };

        updateRecord(recordInput)
            .then(result => {
                this.dispatchEvent(new ShowToastEvent({
                    title: 'Success',
                    message: 'User record has been updated successfully',
                    variant: 'success'
                }));
            })
            .catch(error => {
                this.dispatchEvent(new ShowToastEvent({
                    title: 'Error',
                    message: error.body.message,
                    variant: 'error'
                }));
            })
    }
}