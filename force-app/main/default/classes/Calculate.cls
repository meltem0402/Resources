public class Calculate {
   public Integer sum(Integer x, Integer y) {
        Integer result = x+y;
        return result;
    }
    public Integer sub(Integer x, Integer y){
        return x-y;
    }
    public Integer mul(Integer x, Integer y){
        return x*y;
    }
    public Decimal div(Integer x, Integer y){
        
        Decimal result;
        try{
            result = Decimal.valueOf(x)/ Decimal.valueOf(y);
        }catch(Exception e){// throw exception
            System.debug('Error  : '+ e.getMessage() );
        }
        
        
        return result;
}
}