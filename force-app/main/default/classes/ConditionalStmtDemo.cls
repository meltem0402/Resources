public class ConditionalStmtDemo {
    
    public static void logicalOperationDemo(){
        
        Integer num1 = 600, num2 = 110;
        
        if(num1>50 && num2> 100){
            System.debug('true');
        }else{
            system.debug('false');
        }
    }
    
    public static void IfDemoWithoutNested(Integer Num){
        
        if(num>0){
            System.debug('Number is positive');
        }else if(num == 0){
            System.debug('Number is zero');
        }else{
            system.debug('Number is negative');
        }
    }
    public static void IfDemoWithNested(Integer Num){
        
        if(num>=0){
            if(num> 0){
            System.debug('Number is positive');
        }else{
            system.debug('Number is zero');
        }
        }else{
            system.debug('Number is negative');
        }
    }
    
    public static void max(Integer num1, Integer num2){
       
        Integer result;
        result = num1>num2 ? num1 : num2;
            System.debug('Maximum = ' + result);
        
        /*if(num1>num2){
            System.debug('Num1 is max as compared to Num2');
            
        }else{
            System.debug('Num2 is max as compared to Num1');
        }*/
    }
    public static void checkEligibility(Integer age){
        if(age>=18){
            System.debug('You are eligible to vote');
        }else{
            System.debug('You are not eligible to vote ');
        }
    }
    public static void checkEvenOdd(Integer num){
        
        if(Math.mod(num,2) == 0){
            System.debug('Number is Even');
            
        }else{
            System.debug('Number is Odd');
        }
        
    }

}