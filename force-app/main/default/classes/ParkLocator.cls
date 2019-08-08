public class ParkLocator {

    public static String[] country(String nombrePais){
        ParkService.ParksImplPort locator = new ParkService.ParksImplPort();
        return locator.byCountry(nombrePais);
    }
}