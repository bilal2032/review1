import { LightningElement } from 'lwc';

export default class ChilpComposition extends LightningElement {

    clickHandler() {
        console.log('User has clicked the button, about to create an event!');
        const showEvent = new CustomEvent('show', {bubbles: true, composed: true});
        this.dispatchEvent(showEvent);
        console.log('show event has been dispatched from the child component!');
    }
}