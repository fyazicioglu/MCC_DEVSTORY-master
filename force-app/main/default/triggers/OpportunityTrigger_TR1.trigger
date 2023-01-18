trigger OpportunityTrigger_TR1 on Opportunity (after update) {
    if(Trigger.isAfter &&  Trigger.isUpdate){
        OpportunityHandler_TR1.checkOpportunity(Trigger.new, Trigger.oldMap); 
 }

}