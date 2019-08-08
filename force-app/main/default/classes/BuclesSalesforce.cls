public class BuclesSalesforce {
    
    Integer cuenta=0;
    
    public void bucleDoWhile(){
        do{
            System.debug('Numero: '+ cuenta++);
        }while(cuenta < 11);
    }

    public void bucleFor(){
        for(Integer n=0; n < 11; n++){
            System.debug('For: '+ n);
        }
    }
    
    public void loopArray(){
        Integer[] enteros = new Integer[]{11,12,13,14,15,16,17,18,19};
            for(Integer j : enteros){
                System.debug('Array y for: '+ j);
            }
    }
    
    public void listaSet(){
        Set<String> cad = new Set<String>();
        Set<String> datos = new Set<String>{'letra','numero','booleano','double'};
            for(String cadena: datos){
                System.debug('String '+ cadena);
            }
        cad.add('int');
        cad.add('float');
       
        for(String str: cad){
            System.debug('set: '+str);
        }
    }
}