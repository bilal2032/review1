import { LightningElement } from 'lwc';

export default class ModalParent extends LightningElement {

    showModal = false;
    message;

    createTicket() {
        this.showModal= true;
    }

    closeHandler(event) {
        console.log(JSON.stringify(event));
        this.message = event.detail;        
        this.showModal = false;
    }
}