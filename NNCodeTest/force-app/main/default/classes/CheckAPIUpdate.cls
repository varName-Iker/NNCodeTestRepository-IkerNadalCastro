public class CheckAPIUpdate {
    
    @future(callout=true)
    public static void checkAPIDataUpdates () {
        
        List<API_Country__c> apiCountryObjectList = new List<API_Country__c>();
        apiCountryObjectList = [SELECT Id, Name, Alpha_2_Code__c, Alpha_3_Code__c, Capital_City__c, Region__c, Regional_Blocs__c FROM API_Country__c];
        
        Map<String, API_Country__c> apiCountryObjectMap = new Map<String, API_Country__c>();
        
        for (API_Country__c actualApiCountry : apiCountryObjectList) {
            
            apiCountryObjectMap.put(actualApiCountry.Name, actualApiCountry);
            
        }
        
        List<GET_AllCountry.API_CountryCustom> apiCountryCustomList = new List<GET_AllCountry.API_CountryCustom>();
        apiCountryCustomList = GET_AllCountry.GetAllCountryCallout();
        
        List<API_Country__c> apiCountryToUpsert = new List<API_Country__c>();
        
        for (GET_AllCountry.API_CountryCustom actualApiCountryCustom : apiCountryCustomList) {
            
            if (apiCountryObjectMap.get(actualApiCountryCustom.name) == null) {
                
                API_Country__c actualApiCountryObject = new API_Country__c();
                
                actualApiCountryObject.Name = actualApiCountryCustom.name;
                actualApiCountryObject.Alpha_2_Code__c = actualApiCountryCustom.alpha2Code;
                actualApiCountryObject.Alpha_3_Code__c = actualApiCountryCustom.alpha3Code;
                actualApiCountryObject.Capital_City__c = actualApiCountryCustom.capitalCity;
                actualApiCountryObject.Region__c = actualApiCountryCustom.region;
                actualApiCountryObject.Regional_Blocs__c = actualApiCountryCustom.regionalBlocs;
                
                apiCountryToUpsert.add(actualApiCountryObject);
                
            } else {
                
                API_Country__c actualApiCountryObject = apiCountryObjectMap.get(actualApiCountryCustom.name);
                
                actualApiCountryObject.Alpha_2_Code__c = actualApiCountryObject.Alpha_2_Code__c.equals(actualApiCountryCustom.alpha2Code) ? actualApiCountryObject.Alpha_2_Code__c : actualApiCountryCustom.alpha2Code;
                actualApiCountryObject.Alpha_3_Code__c = actualApiCountryObject.Alpha_3_Code__c.equals(actualApiCountryCustom.alpha3Code) ? actualApiCountryObject.Alpha_3_Code__c : actualApiCountryCustom.alpha3Code;
                actualApiCountryObject.Capital_City__c = actualApiCountryObject.Capital_City__c.equals(actualApiCountryCustom.capitalCity) ? actualApiCountryObject.Capital_City__c : actualApiCountryCustom.capitalCity;
                actualApiCountryObject.Region__c = actualApiCountryObject.Region__c.equals(actualApiCountryCustom.region) ? actualApiCountryObject.Region__c : actualApiCountryCustom.region;
                actualApiCountryObject.Regional_Blocs__c = actualApiCountryObject.Regional_Blocs__c.equals(actualApiCountryCustom.regionalBlocs) ? actualApiCountryObject.Regional_Blocs__c : actualApiCountryCustom.regionalBlocs;
                
                apiCountryToUpsert.add(actualApiCountryObject);
                
            }
            
        }
        
        upsert apiCountryToUpsert;
        
    }

}