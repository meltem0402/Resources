public class QueueableExample implements Queueable {
    public void execute(QueueableContext context){
      Account acc = new Account();
      acc.Name = 'Clarusway';
      insert acc;
    }
}