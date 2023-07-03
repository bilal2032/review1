import { LightningElement } from 'lwc';

export default class TwoWayDataBinding extends LightningElement {

    fullName = 'Bilal Ozturk';
    title = 'Salesforce Developer';

    changeHandler(event) {
        this.title = event.target.value;

    }
}