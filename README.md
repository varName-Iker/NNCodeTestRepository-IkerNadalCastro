List of components used for the code test:


ValidationRule:
  - Lead.Edit_Lead_Owner 
 
Layout:
  - Lead-Lead %28Marketing%29 Layout 
  - Lead-Lead %28Sales%29 Layout 
  - Lead-Lead %28Support%29 Layout 
  - Lead-Lead Layout 
 
CustomField:
  - Lead.Owner_Since__c
  - Lead.Country_Name__c
  - Lead.Alpha_2_Code__c 
  - Lead.Alpha_3_Code__c 
  - Lead.Capital_City__c 
  - Lead.Region__c 
  - Lead.Regional_Blocs__c 
 
Flow:
  - Lead_Owner_Since_Tracker 
 
RemoteSiteSetting:
  - country_api 
 
CustomObject:
  - API_KEY__c 
  - API_Country__c 
 
ApexClass:
  - GET_AllCountry 
  - GET_AllCountry_Test 
  - CheckAPIUpdate 
  - CheckAPIUpdate_Test 
  - CheckAPIUpdate_Test_CalloutMock 
  - Schedule_CheckAPIUpdate 
  - Schedule_CheckAPIUpdate_Test 
  - Trigger_Lead_APICountryDetails_Test 
  - Trigger_APICountry_APICountryDetailsTest 
 
ApexTrigger:
  - Trigger_Lead_APICountryDetails 
  - Trigger_APICountry_APICountryDetails 
 
StaticResource:
  - StaticResource_Get_AllCountry_Test
