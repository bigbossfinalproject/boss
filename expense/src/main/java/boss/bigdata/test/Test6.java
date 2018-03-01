package boss.bigdata.test;

import javax.servlet.http.HttpServletRequest;

import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

public class Test6 {
	@RequestMapping("/data-income.do")
	public ModelAndView dataincome(HttpServletRequest request){
		String path = request.getSession().getServletContext().getRealPath("WEB-INF/views");
        ModelAndView mav = new ModelAndView();
        RConnection connection = null;
        try {
            connection = new RConnection();
            connection.eval("library(devtools)");
            connection.eval("library(RCurl)");
            connection.eval("library(foreign)");
            connection.eval("library(dplyr)");
            connection.eval("library(ggplot2)");
            connection.eval("library(d3Network)");
            connection.eval("library(plotly)");
            connection.eval("library(htmlwidgets)"); 
            
            connection.eval(
                    "raw_bigdata <- read.spss(file = \"C:/workspaces/R/data/Koweps_hpc10_2015_beta1.sav\", to.data.frame = T)");
            connection.eval("bigdata <- raw_bigdata");
            connection.eval("bigdata <- rename(bigdata,"
                  + "sex = h10_g3," // 성별
                  + "birth = h10_g4," //생년월일
                  + "marriage = h10_g10," //혼인상태
                  + "religion = h10_g11," //종교
                  + "code_job = h10_eco9," //직종코드
                  + "income = p1002_8aq1," //월급
                  + "code_region = h10_reg7" //지역코드
                  + ")");
            connection.eval("bigdata$income <- ifelse(bigdata$income %in% c(0, 9999), NA, bigdata$income)");
            connection.eval("sex_income <- bigdata %>% "
            	+ "filter(!is.na(bigdata$income)) %>% "
            	+ "group_by(sex) %>% "
            	+ "summarise(mean_income = mean(income))");
            connection.eval(" interplot <- ggplot(data=sex_income, aes(x=sex, y=mean_income)) + geom_col()");
            connection.eval("p <- ggplotly(interplot)");
            //connection.eval("ggsave(file=\"C:/workspaces/finalproject/boss/src/main/webapp/resources/image/test02.jpg\")");
            connection.eval("saveWidget(p, file=\"C:/workspaces/finalproject/boss/src/main/webapp/resources/bigdata_html/test02.html\")");
            //connection.eval("saveWidget(p, file=\"ad.html\")");
            connection.eval("dev.off()");
            connection.eval("");

           
            //연동 확인
            connection.eval("aa <- '한글'");
            System.out.println(connection.eval("aa").asString());
            
            
            /*BufferedReader reader = new BufferedReader(
                    new FileReader("C:/workspace/test01.jsp"));
            BufferedWriter writer = new BufferedWriter(
                    new OutputStreamWriter(new FileOutputStream(path + "/bigdata/test01.jsp"), "UTF-8"));
            String s;
            String str = "<%@ page contentType=\"text/html;charset=UTF-8\"%>";
            writer.write(str);
            while ((s = reader.readLine()) != null) {
                writer.write(s);
                writer.newLine();
            }
            FileCopyUtils.copy(reader, writer);*/
            //mav.addObject("viewPage", "test01.jsp");
            mav.setViewName("/bigdata/test02");
        } catch (Exception e) {
            // TODO: handle exception
            System.out.println(e);
        }finally{
        	connection.close();
        }
        return mav;
	}
}
