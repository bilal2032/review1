import searchSfProject from '@salesforce/apex/SFProjectCtrl.searchSfProject';
import { LightningElement } from 'lwc';

export default class ImperativeApex3 extends LightningElement {

    projects;
    error;

    searchHandler(event) {
        const searchWord = event.target.value;
        if (searchWord.length > 0) {
            searchSfProject({searchKey: searchWord})
            .then(result => {
                if (result.length > 0) {
                    this.projects = result;
                    this.error = undefined;                    
                } else {
                    this.projects = undefined;
                    this.error = 'There are no matching Project for the entered search. Please enter a valid search word';
                }                
            })
            .catch(error => {
                this.error = error.body.message;
            })            
        } else {
            this.projects = undefined;
            this.error = 'Please enter a search word in order to see mathcing Project Name';
        }        
    }
}