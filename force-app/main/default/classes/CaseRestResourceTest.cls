@isTest
public class CaseRestResourceTest {
   @TestSetup 
   static void makeData(){
    Case caseTest = new Case(Status='New', Origin='Phone', Subject='TestDeneme');
    insert caseTest;
   }
   @isTest static void testGetCase(){
    Test.startTest();
    Case caseTest= [SELECT Id, Subject FROM Case WHERE Subject='TestDeneme'];
    String recId = caseTest.Id;
    RestRequest caseRequest = new RestRequest();
    caseRequest.requestUri = 'https://ap5.salesforce.com/services/apexrest/CaseManagement/' + recId;
    caseRequest.httpMethod = 'GET';
    RestContext.request = caseRequest;
    Case returnedCases = CaseRestResource.doGet();
    System.assert(returnedCases != null);
    System.assertEquals('TestDeneme', returnedCases.Subject);
    Test.stopTest();
   }
}