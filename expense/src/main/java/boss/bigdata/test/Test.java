package boss.bigdata.test;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;

public class Test {

	public static void main(String[] args) throws RserveException, REXPMismatchException { 
        // TODO Auto-generated method stub 
 
        RConnection c = new RConnection(); 
        REXP rst=c.eval("sessionInfo()$platform"); 
     String kk=null; 
        kk=rst.asString(); 
        System.out.println(kk); 
        c.close(); 
 
    }

}
