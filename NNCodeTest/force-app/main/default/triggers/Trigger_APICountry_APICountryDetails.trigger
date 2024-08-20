trigger Trigger_APICountry_APICountryDetails on API_Country__c (after insert, after update) {
    
    Map<String, API_Country__c> apiCountryMap = new Map<String, API_Country__c>();
    
    for (API_Country__c actualApiCountry : Trigger.new) {
        
        apiCountryMap.put(actualApiCountry.Name, actualApiCountry);
        apiCountryMap.put(actualApiCountry.Alpha_2_Code__c, actualApiCountry);
        apiCountryMap.put(actualApiCountry.Alpha_3_Code__c, actualApiCountry);
        
    }

    Set<String> apiCountryMapKeySet = apiCountryMap.keySet();
    
    List<Lead> leadList = [SELECT Id, Country_Name__c, Alpha_2_Code__c, Alpha_3_Code__c, Capital_City__c, Region__c, Regional_Blocs__c 
						   FROM Lead 
						   WHERE Country IN :apiCountryMapKeySet];
    
    update leadList;

}