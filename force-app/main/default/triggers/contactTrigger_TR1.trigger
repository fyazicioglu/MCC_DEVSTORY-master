trigger contactTrigger_TR1 on Contact (after insert, after update, after delete, after undelete) {
    if(Trigger.isAfter&&(Trigger.isInsert||Trigger.isUpdate||Trigger.isUndelete)){
        ContactHandler_TR1.CountContacts(Trigger.new);

    }
    if(Trigger.isAfter&&(Trigger.isDelete)){
        ContactHandler_TR1.CountContacts(Trigger.old);

    }


}