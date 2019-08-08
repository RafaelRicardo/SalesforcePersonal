public class MyHelloWorld {

   
    public static void applyDiscount(Book__c[] books){
         Integer cant = 0;
        List<Book__c> lista = new List<Book__c>();
        for(Book__c b: books){
            b.Price__c *= 2;
            lista.add(b);
            cant++;
        }
        update lista;
        System.debug('caantidad '+ cant);
    }
}