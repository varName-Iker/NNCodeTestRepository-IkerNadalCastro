trigger Trigger_Lead_APICountryDetails on Lead (before insert, before update) {
    
    List<String> countryList = new List<String>();
    
    for (Lead actualLead : Trigger.new) {
        
        countryList.add(actualLead.Country);
        
    }
    
    List<API_Country__c> apiCountryList = [SELECT Name, Alpha_2_Code__c, Alpha_3_Code__c, Capital_City__c, Region__c, Regional_Blocs__c 
                                           FROM API_Country__c 
                                           WHERE Name IN :countryList OR Alpha_2_Code__c IN :countryList OR Alpha_3_Code__c IN :countryList];
    
    Map<String, API_Country__c> apiCountryMap = new Map<String, API_Country__c>();
    
    for (API_Country__c actualApiCountry : apiCountryList) {
        
        apiCountryMap.put(actualApiCountry.Name, actualApiCountry);
        apiCountryMap.put(actualApiCountry.Alpha_2_Code__c, actualApiCountry);
        apiCountryMap.put(actualApiCountry.Alpha_3_Code__c, actualApiCountry);
        
    }
    
    for (Lead actualLead : Trigger.new) {
        
        API_Country__c actualCountry = new API_Country__c();
        actualCountry = apiCountryMap.get(actualLead.Country);
        
        if (actualCountry == null) {
            
            actualLead.Country_Name__c = '';
            actualLead.Alpha_2_Code__c = '';
            actualLead.Alpha_3_Code__c = '';
            actualLead.Capital_City__c = '';
            actualLead.Region__c = '';
            actualLead.Regional_Blocs__c = '';
            
            continue;
            
        }
        
        actualLead.Country_Name__c = actualCountry.Name;
        actualLead.Alpha_2_Code__c = actualCountry.Alpha_2_Code__c;
        actualLead.Alpha_3_Code__c = actualCountry.Alpha_3_Code__c;
        actualLead.Capital_City__c = actualCountry.Capital_City__c;
        actualLead.Region__c = actualCountry.Region__c;
        actualLead.Regional_Blocs__c = actualCountry.Regional_Blocs__c;
        
    }

}