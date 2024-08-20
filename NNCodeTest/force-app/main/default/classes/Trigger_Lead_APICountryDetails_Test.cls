@isTest
public class Trigger_Lead_APICountryDetails_Test {
    
    @testSetup 
    static void setup() {
        
        API_Country__c germanyDataTest = new API_Country__c();
        
        germanyDataTest.Name = 'Germany';
        germanyDataTest.Alpha_2_Code__c = 'DE';
        germanyDataTest.Alpha_3_Code__c = 'DEU';
        germanyDataTest.Capital_City__c = 'Berlin';
        germanyDataTest.Region__c = 'Europe';
        germanyDataTest.Regional_Blocs__c = 'EU';
        
        insert germanyDataTest;
        
    }
    
    @isTest
      static void testInsertLead() {
          
          Lead leadToInsert = new Lead(
              FirstName='Laura',
              LastName='Rogers',
              Company='Germany Company',
              Country='Germany'
          );
          
          Test.startTest();
          	insert leadToInsert;
          Test.stopTest();
          
          Lead updatedLead = [SELECT FirstName, Country_Name__c, Alpha_2_Code__c, Alpha_3_Code__c, Capital_City__c, Region__c, Regional_Blocs__c
                              FROM Lead
                              WHERE FirstName = 'Laura'];
          
          System.assertEquals('Laura', updatedLead.FirstName);        
          System.assertEquals('Germany', updatedLead.Country_Name__c);
          System.assertEquals('DE', updatedLead.Alpha_2_Code__c);
          System.assertEquals('DEU', updatedLead.Alpha_3_Code__c);
          System.assertEquals('Berlin', updatedLead.Capital_City__c);
          System.assertEquals('Europe', updatedLead.Region__c);
          System.assertEquals('EU', updatedLead.Regional_Blocs__c);
          
          
      }

}