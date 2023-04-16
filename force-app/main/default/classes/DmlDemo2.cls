public with sharing class DmlDemo2 {
    public static void dmlBulkInsertWithForLoop() {
        List<Account> accList = new List<Account>();
        for (Integer i = 1; i < 4; i++) {
            Account acc = new Account();
            acc.name = 'Test Account ' + i;
            accList.add(acc);            
        }
        if (!accList.isEmpty()) {
            insert accList;            
        }                     
    }
}