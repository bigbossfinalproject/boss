package boss.bigdata.test;

import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;

public class Test2 {

public static void main(String[] args) {
        
        RConnection connection = null;
        
        try {
 
            connection = new RConnection();
 
            String vector = "c(1,2,3,4)";
            connection.eval("meanVal=mean(" + vector + ")");
            double mean = connection.eval("meanVal").asDouble();
            System.out.println("The mean of given vector is=" + mean);
            connection.eval("aa <- '한글'");
            System.out.println(connection.eval("aa").asString());
 
            
        } catch (RserveException e) {
            e.printStackTrace();
        } catch (REXPMismatchException e) {
            e.printStackTrace();
        }
 
        
    }

}
