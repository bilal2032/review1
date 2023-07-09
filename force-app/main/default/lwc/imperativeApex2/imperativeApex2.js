import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';

import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry'
import getAccountByIndustry from '@salesforce/apex/AccountCtrl.getAccountByIndustry';

const COLUMNS = [
    {label: 'Account Name', fieldName: 'Name', type:'text'},
    {label: 'Account Type', fieldName: 'Type', type:'text'},
    {label: 'Industry', fieldName: 'Industry', type:'text'},
    {label: 'Annual Revenue', fieldName: 'AnnualRevenue', type:'currency'},
]

export default class ImperativeApex2 extends LightningElement {

    industryOptions = [];
    accs;
    columns = COLUMNS;
    

    @wire(getObjectInfo, {objectApiName: ACCOUNT_OBJECT})
    accInfo;

    @wire(getPicklistValues, {fieldApiName: INDUSTRY_FIELD, recordTypeId: '$accInfo.data.defaultRecordTypeId'})
    picklistHandler({data, error}) {
        if (data) {
            this.industryOptions = data.values;
        }
        if (error) {
            console.error(error);
        }
    }

    changeHandler(event) {
        const selectedIndustry = event.target.value;
        getAccountByIndustry({industry: selectedIndustry})
            .then(result => {
                this.accs = result;
            })
            .catch(error => {
                console.error(error);
            })
    }
}