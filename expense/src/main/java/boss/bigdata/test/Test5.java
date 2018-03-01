package boss.bigdata.test;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.OutputStreamWriter;

import javax.servlet.http.HttpServletRequest;

import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Test5 {

	@RequestMapping("/test.do")
	//hello.do 를 사용하면 바로 밑에 있는 메서드를 호출하게끔 정해주는 어노테이션
	public ModelAndView test(){
		//System.out.println("hello() 호출...");
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("greeting", "Hello Spring");
		mav.setViewName("/bigdata/hello"); //지금 수행한 것들을 보여줄 jsp를 지정해줌
		
		return mav;
	}
	
	@RequestMapping("/test2.do")
    public ModelAndView test2(HttpServletRequest request) {
        String path = request.getRealPath("WEB-INF/views");
        System.out.println(path);
        String path1 = request.getSession().getServletContext().getRealPath("WEB-INF/views");
        System.out.println(path1);
        
        ModelAndView mav = new ModelAndView();
        RConnection connection = null;
        try {
            connection = new RConnection();
            connection.eval("library(devtools)");
            connection.eval("library(RCurl)");
            connection.eval("library(d3Network)");
            connection.eval(
                    "name <- c('한글','Jessica Lange','Winona Ryder','Michelle Pfeiffer','Whoopi Goldberg','Emma Thompson','Julia Roberts','Sharon Stone','Meryl Streep', 'Susan Sarandon','Nicole Kidman')");
            connection.eval(
                    "pemp <- c('한글','한글','Jessica Lange','Winona Ryder','Winona Ryder','Angela Bassett','Emma Thompson', 'Julia Roberts','Angela Bassett', 'Meryl Streep','Susan Sarandon')");
            connection.eval("emp <- data.frame(이름=name,상사이름=pemp)");
            connection.eval("d3SimpleNetwork(emp,width=600,height=600,file='C:/workspaces/test01.jsp')");
           
            //연동 확인
            connection.eval("aa <- '한글'");
            System.out.println(connection.eval("aa").asString());
            
            
            BufferedReader reader = new BufferedReader(
                    new FileReader("C:/workspaces/test01.jsp"));
            BufferedWriter writer = new BufferedWriter(
                    new OutputStreamWriter(new FileOutputStream(path + "/bigdata/test01.jsp"), "UTF-8"));
            String s;
            String str = "<%@ page contentType=\"text/html;charset=UTF-8\"%>";
            writer.write(str);
            while ((s = reader.readLine()) != null) {
                writer.write(s);
                writer.newLine();
            }
            FileCopyUtils.copy(reader, writer);
            //mav.addObject("viewPage", "test01.jsp");
            mav.setViewName("/bigdata/test01");
        } catch (Exception e) {
            // TODO: handle exception
            System.out.println(e);
        }finally{
        	connection.close();
        }
        return mav;
    }
	
}
