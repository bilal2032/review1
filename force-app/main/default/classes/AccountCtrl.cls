public with sharing class AccountCtrl {

    @AuraEnabled(cacheable=true)
    public static List<Account> getTopAccs() {
        return [SELECT Id, Name, Type, Industry, AnnualRevenue 
                FROM Account
                WHERE AnnualRevenue != null
                WITH SECURITY_ENFORCED
                ORDER BY AnnualRevenue DESC
                LIMIT 5];        
    }

    @AuraEnabled
    public static List<Account> getAccountByIndustry(String industry){
        return [SELECT Id, Name, Industry, AnnualRevenue 
                FROM Account
                WHERE industry = :industry
                WITH SECURITY_ENFORCED
                ORDER BY AnnualREvenue DESC];        
    }
}