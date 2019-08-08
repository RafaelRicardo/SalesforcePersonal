@isTest
public class TestVerifyDate {

    @isTest static void testCheckDates(){
        Date fecha1 = date.newInstance(2017, 02, 20);
        Date fecha2 = date.newInstance(2017, 01, 10);
    	VerifyDate.CheckDates(fecha1,fecha2);
    }
    
     @isTest static void testCheckDates2(){
        Date fecha1 = date.newInstance(2017, 02, 20);
        Date fecha2 = date.newInstance(2017, 01, 10);
    	VerifyDate.CheckDates(fecha2,fecha1);
    }
    
    @isTest static void testCheckDates3(){
        Date fecha1 = date.newInstance(2017, 02, 20);
        Date fecha2 = date.newInstance(2017, 03, 10);
    	VerifyDate.CheckDates(fecha1,fecha2);
    }
}