import getTopOpps from '@salesforce/apex/OpportunityCtrl.getTopOpps';
import { LightningElement } from 'lwc';

const COLUMNS = [
    {label:'Opp Name', fieldName: 'Name', type:'text'},
    {label:'Opp Type', fieldName: 'Type', type:'text'},
    {label:'Amount', fieldName: 'Amount', type:'currency'},
    {label:'Close Date', fieldName: 'CloseDate', type:'date'}
]

export default class ImperativeApex1 extends LightningElement {

    stageName = 'Closed Lost';
    opps;
    error;
    columns = COLUMNS;

    fetchLostOpps() {
        getTopOpps({stage: this.stageName})
            .then(result => {
                this.opps = result;
            })
            .catch(error => {
                this.error = error;
            })

    }
}