import { LightningElement } from 'lwc';
import SFPROJECT_OBJECT from '@salesforce/schema/Salesforce_Project__c';

export default class ModalChild extends LightningElement {

    objectName = SFPROJECT_OBJECT;

    clickHandler() {

        /** Simple Event 
        const closeEvent = new CustomEvent('close');
        this.dispatchEvent(closeEvent);
        */
        /**Event Primitives data 
         let message = 'User wants the child to be closed, hence closed!';
        const closeEvent = new CustomEvent('close', {detail: message});
        this.dispatchEvent(closeEvent);
        */
        /**Event Non-Primitives data*/
        let message = {
            Id: 1,
            Name: 'Bill Oz',
            Company: 'Oz Store',
            Position: 'Salesforce Developer'
        }

        const closeEvent = new CustomEvent('close', {detail: message});
        this.dispatchEvent(closeEvent);
        


    }

}