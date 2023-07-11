import { LightningElement, api } from 'lwc';

export default class ProgressBar extends LightningElement {

    @api progressValue;
    @api progressSize;
}