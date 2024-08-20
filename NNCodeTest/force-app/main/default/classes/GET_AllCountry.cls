public class GET_AllCountry {
    
    public static List<API_CountryCustom> GetAllCountryCallout() {
        
        // Obtain the admin profile id because the api key is stored in a protected profile custom setting 
        Profile adminProfile = [SELECT Id FROM Profile WHERE Name = 'System Administrator' LIMIT 1];
        
        // Obtaining the api key to correctly authorize the query
        API_KEY__c api_key = API_KEY__c.getInstance(adminProfile.Id);
        
        List<API_CountryCustom> resultsList = new List<API_CountryCustom>();
        
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.countrylayer.com/v2/all?access_key=' + api_key.Key__c);
        request.setMethod('GET');
        
        Http http = new Http();     
        HttpResponse response = http.send(request);
        
        if(response.getStatusCode() == 200) {
            
            List<Object> apiCountryList = (List<Object>) JSON.deserializeUntyped(response.getBody());
            
            for (Object apiCountry : apiCountryList) {
                
                Map<String, Object> mappedCountry = (Map<String, Object>) apiCountry;
                
                API_CountryCustom customCountry = new API_CountryCustom();
                customCountry.name = (String) mappedCountry.get('name');
                customCountry.alpha2Code = (String) mappedCountry.get('alpha2Code');
                customCountry.alpha3Code = (String) mappedCountry.get('alpha3Code');
                customCountry.capitalCity = (String) mappedCountry.get('capital');
                customCountry.region = (String) mappedCountry.get('region');
                customCountry.regionalBlocs = (String) mappedCountry.get('regionalBlocs');
                
                resultsList.add(customCountry);
                
            }
            
        }
        
        return resultsList;
        
    }

    // Custom Object for the Country fields
    public class API_CountryCustom {
        
        public String name;
        public String alpha2Code;
        public String alpha3Code;
        public String capitalCity;
        public String region;
        public String regionalBlocs;
        
	}
    
}