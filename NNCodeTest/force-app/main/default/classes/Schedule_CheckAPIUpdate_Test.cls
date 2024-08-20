@isTest
public class Schedule_CheckAPIUpdate_Test {
    
    public static String CRON_EXPRESSION = '0 0 0 15 3 ? 2042';
    
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
        
        API_Country__c afghanistanDataTest = new API_Country__c();
        
        germanyDataTest.Name = 'Afghanistan';
        germanyDataTest.Alpha_2_Code__c = 'AF';
        germanyDataTest.Alpha_3_Code__c = 'AFG';
        germanyDataTest.Capital_City__c = 'Kabul';
        germanyDataTest.Region__c = 'Asia';
        germanyDataTest.Regional_Blocs__c = 'SAARC';
        
        insert afghanistanDataTest;
        
    }
    
    @IsTest
    static void testScheduledJob() {
        
        Test.setMock(HttpCalloutMock.class, new CheckAPIUpdate_Test_CalloutMock());
        
        Test.startTest();
        
        	Schedule_CheckAPIUpdate scheduleCheckAPIUpdate = new Schedule_CheckAPIUpdate();
        
            String jobId = System.schedule('Schedule Check API Update', CRON_EXPRESSION, scheduleCheckAPIUpdate);
        
        Test.stopTest();
        
        List<API_Country__c> apiCountryList = new List<API_Country__c>();
        apiCountryList = [SELECT Id, Name, Alpha_2_Code__c, Alpha_3_Code__c, Capital_City__c, Region__c, Regional_Blocs__c 
								  FROM API_Country__c];
        
        System.assertEquals(2, apiCountryList.size());
        
    }
}