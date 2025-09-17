public with sharing class ReviewController {
    @AuraEnabled
    public static Review__c submitReview(Id applicationId, String recommendation, String comments, Id reviewerId) {
        try {
            // Check if the application is in the correct status for a review
            Application__c app = [SELECT Id, Status__c FROM Application__c WHERE Id = :applicationId];
            if (app.Status__c != 'Under Review') {
                throw new AuraHandledException('You can only submit a review for an application that is currently "Under Review".');
            }

            Review__c newReview = new Review__c(
                Application__c = applicationId,
                Recommendation__c = recommendation,
                Reviewer_Comments__c = comments,
                Reviewer__c = reviewerId
            );
            insert newReview;
            return newReview;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}