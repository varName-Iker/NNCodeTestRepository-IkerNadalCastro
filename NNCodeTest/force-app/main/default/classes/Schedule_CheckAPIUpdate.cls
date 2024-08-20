public class Schedule_CheckAPIUpdate implements Schedulable {
    
    public void execute(SchedulableContext ctx) {
        
        CheckAPIUpdate.checkAPIDataUpdates();
        
    }

}