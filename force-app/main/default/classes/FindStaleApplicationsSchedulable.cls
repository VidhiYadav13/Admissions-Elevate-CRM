public class FindStaleApplicationsSchedulable implements Schedulable {
    public void execute(SchedulableContext sc) {
        // Define the date 7 days ago
        Date sevenDaysAgo = Date.today().addDays(-7);

        // Find all applications that have been "Under Review" for more than 7 days
        List<Application__c> staleApplications = [
            SELECT Id, Requires_Follow_up__c
            FROM Application__c
            WHERE Status__c = 'Under Review' AND LastModifiedDate <= :sevenDaysAgo
        ];

        // Loop through the stale applications and check the follow-up box
        for (Application__c app : staleApplications) {
            app.Requires_Follow_up__c = true;
        }

        // Perform the database update
        if (!staleApplications.isEmpty()) {
            update staleApplications;
        }
    }
}