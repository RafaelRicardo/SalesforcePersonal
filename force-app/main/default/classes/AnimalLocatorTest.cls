@isTest
public class AnimalLocatorTest {

    @isTest static void testLocatormethod(){
        
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        AnimalLocator.getAnimalNameById(1);
    }
}