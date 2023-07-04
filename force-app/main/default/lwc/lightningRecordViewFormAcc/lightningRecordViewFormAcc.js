import { LightningElement } from 'lwc';

import ACC_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import REVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';


export default class LightningRecordViewFormAcc extends LightningElement {

    objectName = ACC_OBJECT;
    recordId = '001B000001UBwqrIAD';

    fields = {
        name: NAME_FIELD,
        type: TYPE_FIELD,
        industry: INDUSTRY_FIELD,
        annualRevenue: REVENUE_FIELD,
        phone: PHONE_FIELD
    };
}