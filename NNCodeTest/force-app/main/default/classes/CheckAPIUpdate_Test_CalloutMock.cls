@isTest
public class CheckAPIUpdate_Test_CalloutMock implements HttpCalloutMock {
    
    public HttpResponse respond(HttpRequest req) {
        
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('[{"name": "Germany", "alpha2Code": "DE", "alpha3Code": "DEU", "capital": "Berlin", "region": "Europe", "regionalBlocs": "EU"},' +
                    '{"name": "Afghanistan", "alpha2Code": "AF", "alpha3Code": "AFG", "capital": "Kabul", "region": "Asia", "regionalBlocs": "SAARC"}]');
        res.setStatusCode(200);
        
        return res;
        
    }

}