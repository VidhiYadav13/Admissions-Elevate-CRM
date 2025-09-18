public class UniversityVerificationService {

    // This method will be called to start the verification process
    @future(callout=true)
    public static void verifyUniversityEmail(Id contactId) {
        // Find the contact record to get their email
        Contact applicant = [SELECT Id, Email FROM Contact WHERE Id = :contactId LIMIT 1];

        if (String.isBlank(applicant.Email)) {
            System.debug('Contact has no email address.');
            return;
        }

        // Extract the domain from the email address
        String emailDomain = applicant.Email.substringAfter('@');
        
        // Prepare the HTTP request
        HttpRequest request = new HttpRequest();
        // This is the endpoint for the free university API
        request.setEndpoint('http://universities.hipolabs.com/search?domain=' + emailDomain);
        request.setMethod('GET');

        try {
            // Send the request
            Http http = new Http();
            HttpResponse response = http.send(request);

            // Check if the call was successful (status code 200)
            if (response.getStatusCode() == 200) {
                // The API returns a list of universities. If the list is not empty, a match was found.
                List<Object> results = (List<Object>) JSON.deserializeUntyped(response.getBody());
                
                if (!results.isEmpty()) {
                    // If a university was found, update the contact record
                    applicant.University_Email_Verified__c = true;
                    update applicant;
                }
            }
        } catch (Exception e) {
            // In a real project, you would implement more robust error handling
            System.debug('University API callout failed: ' + e.getMessage());
        }
    }
}