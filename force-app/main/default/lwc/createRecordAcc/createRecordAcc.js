import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import ACC_OBJECT from '@salesforce/schema/Account';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import { createRecord } from 'lightning/uiRecordApi';

export default class CreateRecordAcc extends LightningElement {

    industryOptions = [];
    formdata = {};

   
    @wire(getObjectInfo, {objectApiName: ACC_OBJECT})
    accInfo;

    @wire(getPicklistValues, {fieldApiName: INDUSTRY_FIELD, recordTypeId: '$accInfo.data.defaultRecordTypeId'})
    picklistHandler({data, error}){
        if (data) {
            this.industryOptions = data.values;            
        }
        if (error) {
            console.error(error);
        }
    }

    cancelAccount() {
        this.template.querySelector('form.accountform').reset();
        this.template.querySelector('lightning-combobox').value = undefined;
    }

    saveAccount () {
        //prepare recordInput
        const recordInput = {
            apiName: ACC_OBJECT.objectApiName,
            fields: this.formdata
        }
        //call createRecord
        createRecord(recordInput)
            .then(result => {
                //show success toast (ShowToastEvent)
                const successToast = new ShowToastEvent({
                        title: 'Success',
                        message: 'Account record has been created successfully!',
                        variant: 'success'
                });
                this.dispatchEvent(successToast);
            })
            .catch(error =>{
                console.error(error);
            }) 
    }

    changeHandler(event) {
        // const name = event.target.name;
        // const value = event.target.value;
        const {name, value} = event.target;
        this.formdata[name] = value; // formdata = {Name: 'My Account', Industry: 'Biotech', AnnualRevenue: '100000000.00}
        console.log(JSON.stringify(this.formdata));
    }
}