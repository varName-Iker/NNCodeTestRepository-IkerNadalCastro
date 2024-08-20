@isTest
public class GET_AllCountry_Test {
    
    @isTest
    static void GetAllCountryCalloutTest() {
        
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('StaticResource_Get_AllCountry_Test');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        
        Test.setMock(HttpCalloutMock.class, mock);
        List<GET_AllCountry.API_CountryCustom> resultsList = GET_AllCountry.GetAllCountryCallout();

        Assert.areEqual(2, resultsList.size());
        Assert.areEqual('Germany', resultsList[0].name);
        Assert.areEqual('Afghanistan', resultsList[1].name);
        
    }

}