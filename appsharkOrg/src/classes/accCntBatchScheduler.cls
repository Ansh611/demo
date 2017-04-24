global class accCntBatchScheduler implements Schedulable {
    global void execute(SchedulableContext sc)
    {
        // Implement any logic to be scheduled
       
        // We now call the batch class to be scheduled
        accCntRoleMailBatch b = new accCntRoleMailBatch ();
       
        //Parameters of ExecuteBatch(context,BatchSize)
        database.executebatch(b,200);
    }
   
}