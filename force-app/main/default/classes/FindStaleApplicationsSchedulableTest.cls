@isTest
private class FindStaleApplicationsSchedulableTest {
    @isTest
    static void testScheduledJob() {
        // Create test data: an application that was last modified 8 days ago
        Contact applicant = new Contact(LastName = 'Test');
        insert applicant;
        Application__c staleApp = new Application__c(
            Applicant__c = applicant.Id,
            Status__c = 'Under Review',
            Requires_Follow_up__c = false
        );
        insert staleApp;

        // Manually set the LastModifiedDate in the past for testing
        Test.setCreatedDate(staleApp.Id, DateTime.now().addDays(-8));

        // Start the test
        Test.startTest();
        // Schedule the job to run
        String cronExp = '0 0 1 * * ?'; // Runs at 1 AM
        System.schedule('Test Stale App Job', cronExp, new FindStaleApplicationsSchedulable());
        Test.stopTest();

        // Verify the results
        Application__c updatedApp = [SELECT Id, Requires_Follow_up__c FROM Application__c WHERE Id = :staleApp.Id];
        System.assertEquals(true, updatedApp.Requires_Follow_up__c, 'The Requires Follow-up checkbox should be true.');
    }
}