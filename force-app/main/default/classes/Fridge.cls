public class Fridge implements KitchenUtility{
		
    public String modelNumber;
    public Integer numero;
    public static Integer numberInStock = 30;
    public static Integer stock = 16;
    public Integer ecoRating{
        get{return ecoRating;}
        set{ecorating = value; if(ecoRating < 0) ecoRating = 0;}
    }
    
    public Fridge(){ }
    public Fridge(String cad, Integer num){
        modelNumber = cad;
        numero = num;
    }
    
    public static void updateStock(Integer justSold){
        Fridge objeto = new Fridge(); 
        numberInStock = numberInStock - justSold;
        System.debug('numero '+numberInStock);
        System.debug('numero2 '+ stock);
        System.debug('modelo: '+ objeto.modelNumber);
    }
    
     public String getModelNumber(){
        return 'F'+ modelNumber;
    }
}