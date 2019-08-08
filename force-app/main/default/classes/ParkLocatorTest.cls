@isTest
public class ParkLocatorTest {
	
    @isTest static void testCallout(){
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        //String[] arString = new String[]{'Park_1','Park_2','Park_3'};
        String pais = 'Germany';
        String[] resultado = ParkLocator.country(pais);
    }
}