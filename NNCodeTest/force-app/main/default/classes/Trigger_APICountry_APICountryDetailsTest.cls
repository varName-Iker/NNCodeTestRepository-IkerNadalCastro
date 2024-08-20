@isTest
public class Trigger_APICountry_APICountryDetailsTest {
    
    @testSetup 
    static void setup() {
        
        Lead leadToInsert = new Lead(
            FirstName='Laura',
            LastName='Rogers',
            Company='Germany Company',
            Country='Germany'
        );
        
        insert leadToInsert;
        
        API_Country__c germanyDataTest = new API_Country__c();
          
        germanyDataTest.Name = 'Germany';
        germanyDataTest.Alpha_2_Code__c = 'DE';
        germanyDataTest.Alpha_3_Code__c = 'DEU';
        germanyDataTest.Capital_City__c = 'Moscow';
        germanyDataTest.Region__c = 'Europe';
        germanyDataTest.Regional_Blocs__c = 'EU';
          	
        insert germanyDataTest;
        
    }
    
    @isTest
      static void testInsertLead() {
          
          API_Country__c germanyTest = [SELECT Name, Alpha_2_Code__c, Alpha_3_Code__c, Capital_City__c, Region__c, Regional_Blocs__c
                                        FROM API_Country__c
                                        WHERE Name = 'Germany'];
          
          germanyTest.Capital_City__c = 'Berlin';
          
          Test.startTest();
          	update germanyTest;
          Test.stopTest();
          
          API_Country__c germanyTestUpdated = [SELECT Name, Alpha_2_Code__c, Alpha_3_Code__c, Capital_City__c, Region__c, Regional_Blocs__c
                                               FROM API_Country__c
                                               WHERE Name = 'Germany'];
          
          Lead updatedLead = [SELECT FirstName, Country_Name__c, Alpha_2_Code__c, Alpha_3_Code__c, Capital_City__c, Region__c, Regional_Blocs__c
                              FROM Lead
                              WHERE FirstName = 'Laura'];
                 
          System.assertEquals('Germany', germanyTestUpdated.Name);
          System.assertEquals('DE', germanyTestUpdated.Alpha_2_Code__c);
          System.assertEquals('DEU', germanyTestUpdated.Alpha_3_Code__c);
          System.assertEquals('Berlin', germanyTestUpdated.Capital_City__c);
          System.assertEquals('Europe', germanyTestUpdated.Region__c);
          System.assertEquals('EU', germanyTestUpdated.Regional_Blocs__c);
          
          System.assertEquals('Laura', updatedLead.FirstName);        
          System.assertEquals('Germany', updatedLead.Country_Name__c);
          System.assertEquals('DE', updatedLead.Alpha_2_Code__c);
          System.assertEquals('DEU', updatedLead.Alpha_3_Code__c);
          System.assertEquals('Berlin', updatedLead.Capital_City__c);
          System.assertEquals('Europe', updatedLead.Region__c);
          System.assertEquals('EU', updatedLead.Regional_Blocs__c);
          
      }

}