import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import submitReview from '@salesforce/apex/ReviewController.submitReview';
import USER_ID from '@salesforce/user/Id';

export default class ReviewSubmitter extends LightningElement {
    @api recordId; // Automatically gets the Application ID from the record page

    recommendation;
    comments;

    // Options for the picklist
    get recommendationOptions() {
        return [
            { label: 'Strongly Recommend for Acceptance', value: 'Strongly Recommend for Acceptance' },
            { label: 'Recommend for Acceptance', value: 'Recommend for Acceptance' },
            { label: 'Waitlist', value: 'Waitlist' },
            { label: 'Reject', value: 'Reject' },
        ];
    }

    handleChange(event) {
        if (event.target.name === 'recommendation') {
            this.recommendation = event.target.value;
        } else if (event.target.name === 'comments') {
            this.comments = event.target.value;
        }
    }

    handleSubmit() {
        if (!this.recommendation) {
            this.showToast('Error', 'Recommendation is a required field.', 'error');
            return;
        }

        submitReview({
            applicationId: this.recordId,
            recommendation: this.recommendation,
            comments: this.comments,
            reviewerId: USER_ID // Automatically assign the current user as the reviewer
        })
        .then(result => {
            this.showToast('Success', 'Review submitted successfully!', 'success');
            // Reset form fields
            this.recommendation = null;
            this.comments = '';
            // Refresh related list data
            eval("$A.get('e.force:refreshView').fire();");
        })
        .catch(error => {
            this.showToast('Error Submitting Review', error.body.message, 'error');
        });
    }

    showToast(title, message, variant) {
        const event = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant,
        });
        this.dispatchEvent(event);
    }
}