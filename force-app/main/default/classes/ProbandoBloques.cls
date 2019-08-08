public class ProbandoBloques {
    
    public ProbandoBloques(){
        System.debug('constructor');//tercero en ejecucion
    }
    {
        System.debug('bloque 1'); //segundo en ejecucion
    }
    
    static{
        System.debug('bloque static');//primero se ejecuta
    }
}