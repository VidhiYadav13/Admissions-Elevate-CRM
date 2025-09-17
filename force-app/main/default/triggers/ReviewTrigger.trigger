trigger ReviewTrigger on Review__c (before insert) {
    if (Trigger.isBefore && Trigger.isInsert) {
        ReviewTriggerHandler.beforeInsert(Trigger.new);
    }
}