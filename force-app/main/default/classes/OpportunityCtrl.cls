public with sharing class OpportunityCtrl {

    @AuraEnabled(cacheable=true)
    public static List<opportunity> getTopOpps(String stage) {
        return [SELECT Id, Name, Type, Amount, CLoseDate, StageName 
                FROM Opportunity
                WHERE StageName =: stage
                AND Amount != null
                WITH SECURITY_ENFORCED
                ORDER BY Amount DESC
                LIMIT 5];        
    }
}