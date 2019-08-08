public class MessengeMaker {

       
    public MessengeMaker(){
       
        System.debug('desde el construcctor');
    }
    {
        System.debug('desde llaves');
    }
    static{
        System.debug('desde static ');
    }
    public static String helloMessage(){
        HelloWorld.sayYou();
        new HelloWorld().sayMe();
        return ('you say "goodbey," I say "Hello."');
    }
}