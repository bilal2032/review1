import getTopAccs from '@salesforce/apex/AccountCtrl.getTopAccs';
import { LightningElement, wire } from 'lwc';

const COLUMNS = [
    {label: 'Account Name', fieldName: 'Name', type: 'text'},
    {label: 'Account Type', fieldName: 'Type', type: 'text'},
    {label: 'Industry', fieldName: 'Industry', type: 'ext'},
    {label: 'Annual Revenue', fieldName: 'AnnualRevenue', type: 'currency'}    
];

export default class WiredApex1 extends LightningElement {

    columns = COLUMNS;

    @wire(getTopAccs)
    accs;

}