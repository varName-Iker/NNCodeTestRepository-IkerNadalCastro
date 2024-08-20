@isTest
public class CheckAPIUpdate_Test {
    
    @testSetup
    static void setup() {
        
        API_Country__c germanyDataTest = new API_Country__c();
        
        germanyDataTest.Name = 'Germany';
        germanyDataTest.Alpha_2_Code__c = 'DE';
        germanyDataTest.Alpha_3_Code__c = 'DEU';
        germanyDataTest.Capital_City__c = 'Madrid'; //This is to test that bad data is updated when compared to the API
        germanyDataTest.Region__c = 'Europe';
        germanyDataTest.Regional_Blocs__c = 'EU';
        
        insert germanyDataTest;
        
    }
    
    @IsTest
    private static void testCheckAPICountry() {
        
        Test.setMock(HttpCalloutMock.class, new CheckAPIUpdate_Test_CalloutMock());
        
        Test.startTest();
        CheckAPIUpdate.checkAPIDataUpdates();
        Test.stopTest();
        
        List<API_Country__c> apiCountryList = [SELECT Id, Name, Alpha_2_Code__c, Alpha_3_Code__c, Capital_City__c, Region__c, Regional_Blocs__c 
                                               FROM API_Country__c];
        
        API_Country__c germanyApiCountry = [SELECT Id, Name, Alpha_2_Code__c, Alpha_3_Code__c, Capital_City__c, Region__c, Regional_Blocs__c 
                                            FROM API_Country__c
                                            WHERE Name = 'Germany'];
        
        System.assertEquals(2, apiCountryList.size());
        System.assertEquals('Berlin', germanyApiCountry.Capital_City__c);
        
    }

}