public class ControladorVisualforceOne{
    public  ControladorVisualforceOne(){
    
    }

    public pageReference metodo(){
    PageReference pagina = new PageReference('/apex/VisualForceThree');
    pagina.setRedirect(false);
    return pagina;
    }
}