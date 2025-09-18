@isTest
private class UniversityVerificationServiceTest {
    @isTest
    static void testVerificationSuccess() {
        // Create a test contact with an email from a known university domain
        Contact testApplicant = new Contact(
            LastName = 'Test',
            Email = 'student@testuniversity.edu'
        );
        insert testApplicant;

        // Set up the mock response that simulates the API call
        Test.setMock(HttpCalloutMock.class, new MockUniversityCallout(true));

        // Start the test
        Test.startTest();
        // Call the future method
        UniversityVerificationService.verifyUniversityEmail(testApplicant.Id);
        Test.stopTest();

        // Verify that the contact's checkbox was updated to true
        Contact updatedApplicant = [SELECT Id, University_Email_Verified__c FROM Contact WHERE Id = :testApplicant.Id];
        System.assertEquals(true, updatedApplicant.University_Email_Verified__c, 'The email should be verified as a university email.');
    }

    // This is the mock class that generates a fake response
    public class MockUniversityCallout implements HttpCalloutMock {
        private boolean sendSuccessResponse;

        // Constructor to control whether the mock should return a success or empty response
        public MockUniversityCallout(boolean success) {
            this.sendSuccessResponse = success;
        }

        public HttpResponse respond(HttpRequest req) {
            // Create a fake response
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');
            
            if (sendSuccessResponse) {
                // This is a sample JSON body that mimics the real API finding a university
                res.setBody('[{"name": "Test University", "domains": ["testuniversity.edu"]}]');
            } else {
                // This mimics the API finding no match
                res.setBody('[]');
            }
            
            res.setStatusCode(200);
            return res;
        }
    }
}