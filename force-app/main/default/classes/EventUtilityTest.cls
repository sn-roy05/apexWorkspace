@isTest
public class EventUtilityTest {
    @isTest
    private static void method1(){
        String eventStatus='AUS';
        String eventPri= EventUtility.eventPriority(eventStatus);
        System.assertEquals(null,eventPri);
    }
    @isTest
    private static void method12(){
        String eventStatus='CA';
        String eventPri= EventUtility.eventPriority(eventStatus);
        System.assertEquals('High',eventPri);
    }
    @isTest
    private static void method3(){
        String eventStatus='AU';
        String eventPri= EventUtility.eventPriority(eventStatus);
        System.assertEquals('Medium',eventPri);
    }

}