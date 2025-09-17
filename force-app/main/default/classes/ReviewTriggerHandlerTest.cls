@isTest
private class ReviewTriggerHandlerTest {
    @isTest
    static void testReviewOnCorrectStatus() {
        // Create test data
        Contact applicant = new Contact(LastName = 'Test');
        insert applicant;
        Application__c app = new Application__c(
            Applicant__c = applicant.Id,
            Status__c = 'Under Review' // Correct status
        );
        insert app;

        // Start the test
        Test.startTest();
        // This should succeed without error
        Review__c validReview = new Review__c(Application__c = app.Id, Recommendation__c = 'Waitlist');
        insert validReview;
        Test.stopTest();

        // Verify the record was inserted
        List<Review__c> reviews = [SELECT Id FROM Review__c];
        System.assertEquals(1, reviews.size(), 'The valid review should have been inserted.');
    }

    @isTest
    static void testReviewOnIncorrectStatus() {
        // Create test data
        Contact applicant = new Contact(LastName = 'Test');
        insert applicant;
        Application__c app = new Application__c(
            Applicant__c = applicant.Id,
            Status__c = 'Accepted' // Incorrect status
        );
        insert app;

        // Start the test
        Test.startTest();
        // Attempt to insert a review, expecting an error
        Review__c invalidReview = new Review__c(Application__c = app.Id, Recommendation__c = 'Waitlist');
        try {
            insert invalidReview;
            System.assert(false, 'The trigger should have prevented the insert on an Accepted application.');
        } catch (DmlException e) {
            // Assert that our specific error message was thrown
            System.assert(e.getMessage().contains('You can only submit a review for an application that is currently "Under Review".'),
                'The expected error message was not found.');
        }
        Test.stopTest();
    }
}