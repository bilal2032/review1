public with sharing class SFProjectCtrl {

    @AuraEnabled
    public static List<Salesforce_Project__c> searchSfProject(String searchKey){
        searchKey = '%' + searchKey + '%';
        return [SELECT Project_Name__c, Status__c, Description__c 
                FROM Salesforce_Project__c
                WHERE Project_Name__c LIKE :searchKey
                WITH SECURITY_ENFORCED];        
    }
}