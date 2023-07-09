import { LightningElement } from 'lwc';

export default class QuerySelectorsDemo extends LightningElement {

    fruits = ['Orange', 'Apple', 'Banana', 'Grape'];

    clickHandler() {
        //querySelector demo
        const headerElement = this.template.querySelector('h1');
        console.log(headerElement.innerText);
        headerElement.style.color = 'blue';
        headerElement.style.backgroundColor = 'yellow';
        headerElement.style.border = '2px solid green';

        const paragraphElement = this.template.querySelector('p');
        console.log(paragraphElement.innerText);
        paragraphElement.style.color = '#AA2D2D';
        paragraphElement.style.background = '#3CB8C7';
        paragraphElement.style.border = '3px #E9D83E';
        
        //querySelectors demo
        const divElement = this.template.querySelectorAll('div.child');
        divElement.forEach(item => {
            console.log(item.innerText);
            item.setAttribute('class', 'slds-align_absolute-center');
        });
    }
}