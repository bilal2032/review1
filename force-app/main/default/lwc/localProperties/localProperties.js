import { LightningElement } from 'lwc';

export default class LocalProperties extends LightningElement {
    name; //undefined
    age = 45;
    fullName = 'Bilal Ozturk';
    location = {
        city: 'Fort Worth',
        country: 'USA',
        postalCode: '76123'
    };
    fruits = ['Orange', 'Apple', 'Lemon', 'Cherry'];

}