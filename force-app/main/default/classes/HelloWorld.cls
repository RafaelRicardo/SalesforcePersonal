public class HelloWorld {

    public static void sayYou(){
        System.debug('You');
    }
    
    public void sayMe(){
        System.debug('Me');
    }
    
    public enum Season {WINTER, SPRING, SUMMER, FALL}
    Season estacion = Season.WINTER;
    public void pruebaEnume(){
        System.debug('Estacion: '+estacion);
    }
}