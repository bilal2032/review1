import getTopOpps from '@salesforce/apex/OpportunityCtrl.getTopOpps';
import { LightningElement, wire } from 'lwc';

export default class WiredApex2 extends LightningElement {

    stageName = 'Closed Won';

    @wire(getTopOpps, {stage: '$stageName'})
    opps;
}