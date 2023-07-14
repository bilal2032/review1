import { LightningElement } from 'lwc';

export default class ParentComponent extends LightningElement {

    showHandler1(event) {
        console.log('show event has reached the parent component: c-child-component');
        console.log(event.target.nodeName);
        console.log(event.currentTarget.nodeName);
    }

    showHandler2(event) {
        console.log('show event has bubbled up from c-child-component to div');
        console.log(event.target.nodeName);
        console.log(event.currentTarget.nodeName);

    }
}