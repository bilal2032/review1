import { LightningElement, wire } from 'lwc';

import ACC_OBJECT from '@salesforce/schema/Account';
import { getObjectInfo, getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';

export default class GetPicklistValuesByRecordTypeAcc extends LightningElement {

    defaultRtId;
    industryOptions = [];
    typeOptions = [];
    selectedType;
    selectedIndustry;

    @wire(getObjectInfo, {objectApiName: ACC_OBJECT})
    objectInfoHandler({data, error}) {
        if (data) {
            this.defaultRtId = data.defaultRecordTypeId;
        }
        if (error) {
            console.error(error);
        }
    }


    @wire(getPicklistValuesByRecordType, {objectApiName: ACC_OBJECT, recordTypeId: '$defaultRtId'})
    picklistHandler({data, error}) {
        if (data) {
            console.log(data);
            this.industryOptions = data.picklistFieldValues.Industry.values;
            this.typeOptions = data.picklistFieldValues.Type.values;
        }
        if (error) {
            console.error(error);
        }
    }

    changeHandler(event) {
        if (event.target.name === 'Type') {
            this.selectedType = event.target.value;            
        } else {
            this.selectedIndustry = event.target.value;
        }
    }
}