trigger accountTrigger_TR1 on Account (after insert, after update) {
    
    if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)){
         AccountHandler_TR1.createOPP(Trigger.new); 
  }
}