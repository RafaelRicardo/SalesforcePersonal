public class StringArrayTest {
    
    public static List<String> generateStringArray(Integer cant){
        List<String> cadena = new List<String>();
            
            for(Integer i=0; i < cant; i++){
                cadena.add('Test ' + i);
            }
        return cadena;
    }
}