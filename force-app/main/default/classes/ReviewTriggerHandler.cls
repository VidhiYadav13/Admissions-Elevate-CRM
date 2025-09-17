public class ReviewTriggerHandler {
    public static void beforeInsert(List<Review__c> newReviews) {
        // Create a Set to hold the IDs of the parent Application records
        Set<Id> applicationIds = new Set<Id>();
        for (Review__c review : newReviews) {
            applicationIds.add(review.Application__c);
        }

        // Query the parent applications to check their status
        Map<Id, Application__c> applicationMap = new Map<Id, Application__c>(
            [SELECT Id, Status__c FROM Application__c WHERE Id IN :applicationIds]
        );

        // Loop through the new reviews being created
        for (Review__c review : newReviews) {
            // Get the parent application from the map
            Application__c parentApplication = applicationMap.get(review.Application__c);

            // If the parent application's status is not 'Under Review', add an error
            if (parentApplication != null && parentApplication.Status__c != 'Under Review') {
                review.addError('You can only submit a review for an application that is currently "Under Review".');
            }
        }
    }
}