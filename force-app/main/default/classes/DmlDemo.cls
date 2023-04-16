public class DmlDemo {
    public static void dmlInsertMultiple() {
        List<Account> listAcc = new List<Account>();

        Account acc1 = new Account();
        acc1.Name = 'acc bulk 13';
        listAcc.add(acc1);

        Account acc2 = new Account();
        acc2.Name = 'acc bulk 14';
        listAcc.add(acc2);

        Account acc3 = new Account();
        acc3.Name = 'acc bulk 15';
        listAcc.add(acc3);

        insert listAcc;
    }
}