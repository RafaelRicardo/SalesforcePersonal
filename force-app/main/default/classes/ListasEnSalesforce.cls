public class ListasEnSalesforce {

    List<Integer> lista = new List<Integer>();
    Integer[] miLista = new List<Integer>();
    List<String> miString = new List<String>{'Uno','Dos','Tres'};
    
    public void tamanioLista(){
        lista.add(115);
        miLista.add(21);
        lista.add(0, 116);
        System.debug('Tamaño: '+lista.size());
        System.debug('Tamaño: '+miLista.size());
        System.debug('Tamaño: '+miString.get(1));
    }
    
    public void verLista(){
        Integer j = 0;
        for(Integer i = 0; i < lista.size(); i++){
            System.debug('Lista posicion '+ j++ +' : ' +lista.get(i));
        }
    }
    
    public void verListaString(){
        Integer j = 0;
        for(Integer i=0; i < miString.size(); i++){
           System.debug('Lista string posicion '+ j++ +' : ' +miString.get(i)); 
        }
    }
}