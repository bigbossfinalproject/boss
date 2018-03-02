package boss.bigdata.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boss.bigdata.dao.IncomeAnalysisDao;

@Controller
public class Income_Age_AnalysisController {

	@Autowired
	IncomeAnalysisDao dao;
	
	@RequestMapping(value="/income_age.do", method=RequestMethod.GET)
	public ModelAndView income_age_form(HttpServletRequest request, HttpServletResponse response){
		System.out.println("gopgo");
		response.setCharacterEncoding("UTF-8");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/bigdata/total_analysis/age_income_form");
		return mav;
	}
	
	@RequestMapping(value="/age_income_edu.do")
	public ModelAndView age_income_edu(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("UTF-8");
		ModelAndView mav = new ModelAndView();
		RConnection connection = null;
		try {
            connection = new RConnection();
            connection.eval("library(foreign)");
            connection.eval("library(dplyr)");
            connection.eval("library(ggplot2)");
            connection.eval("library(plotly)");
            connection.eval("library(htmlwidgets)"); 
            connection.eval("library(readxl)"); 
            connection.eval("library(xlsx)"); 
            connection.eval("library(DBI)"); 
            connection.eval("library(RJDBC)"); 
            connection.eval("library(rJava)"); 
            connection.eval(
                    "raw_bigdata <- read.spss(file = \"C:/workspaces/R/finalproject/data/Koweps_h11_2016_beta1.sav\", to.data.frame = T, encoding = \"UTF-8\")");
            connection.eval("bigdata <- raw_bigdata");
            connection.eval("bigdata <- rename(bigdata,"
                  + "root_idn = h11_id," // 회원고유번호
                  + "root_gender = h1101_4," //성별
                  + "root_birth = h1101_5," //생년월일
                  + "root_edu = h1101_6," //교육수준
                  + "root_loc = h11_reg7," // 지역
                  + "root_marry = h1101_11," //혼인상태
                  + "root_job = h1103_8," //직업
                  + "food = h1107_3aq1," //식료품비
                  + "house = h1107_3aq3," //주거비
                  + "infra = h1107_3aq5," //광열수도비
                  + "fixtures = h1107_3aq6," //가구가사용품비
                  + "clothes = h1107_3aq7," //의류비
                  + "medical = h1107_3aq8," //의료비
                  + "education = h1107_3aq9," //교육비
                  + "culture = h1107_3aq11," //교양오락비
                  + "traffic = h1107_5aq3," //교통비
                  + "communication = h1107_5aq4," //통신비
                  + "etc_expense = h1107_3aq13," //기타소비지출비
                  + "tax = h1107_4," //세금
                  + "welfare = h1107_5," //사회보험금
                  + "insure = h1107_6aq12," //보험료
                  + "expense_total = h1107_9," //지출 합계(월별)
                  + "income_amount = h1108_114," //소득 금액(우리는 일별 여기 데이터는 연단위니까 1/365해줘야됨)
                  + "loan_cash = h1109_aq1" //보험료(데이터는 연단위)
                  + ")");
            connection.eval("");
            connection.eval("bigdata$food <- ifelse(is.na(bigdata$food), 0, bigdata$food)");
            connection.eval("bigdata$h1107_5aq1 <- ifelse(is.na(bigdata$h1107_5aq1), 0, bigdata$h1107_5aq1)");
            connection.eval("bigdata$food <- bigdata$food + bigdata$h1107_5aq1");
            connection.eval("bigdata$house <- ifelse(is.na(bigdata$house), 0, bigdata$house)");
            connection.eval("bigdata$h1107_3aq4 <- ifelse(is.na(bigdata$h1107_3aq4), 0, bigdata$h1107_3aq4)");
            connection.eval("bigdata$house <- bigdata$house + bigdata$h1107_3aq4");
            connection.eval("bigdata$infra <- ifelse(is.na(bigdata$infra), 0, bigdata$infra)");
            connection.eval("bigdata$h1107_6aq1 <- ifelse(is.na(bigdata$h1107_6aq1), 0, bigdata$h1107_6aq1)");
            connection.eval("bigdata$infra <- bigdata$infra + bigdata$h1107_6aq1");
            connection.eval("bigdata$fixtures <- ifelse(is.na(bigdata$fixtures), 0, bigdata$fixtures)");
            connection.eval("bigdata$h1107_5aq2 <- ifelse(is.na(bigdata$h1107_5aq2), 0, bigdata$h1107_5aq2)");
            connection.eval("bigdata$fixtures <- bigdata$fixtures + bigdata$h1107_5aq2");
            connection.eval("bigdata$education <- ifelse(is.na(bigdata$education), 0, bigdata$education)");
            connection.eval("bigdata$h1107_3aq10 <- ifelse(is.na(bigdata$h1107_3aq10), 0, bigdata$h1107_3aq10)");
            connection.eval("bigdata$education <- bigdata$education + bigdata$h1107_3aq10");
            connection.eval("bigdata$insure <- ifelse(is.na(bigdata$insure), 0, bigdata$insure)");
            connection.eval("bigdata$h1107_6aq13 <- ifelse(is.na(bigdata$h1107_6aq13), 0, bigdata$h1107_6aq13)");
            connection.eval("bigdata$insure <- bigdata$insure + bigdata$h1107_6aq13");
            connection.eval("bigdata$income_amount <- ifelse(is.na(bigdata$income_amount), 0, bigdata$income_amount)");
            connection.eval("bigdata$h1108_122 <- ifelse(is.na(bigdata$h1108_122), 0, bigdata$h1108_122)");
            connection.eval("bigdata$h1108_164 <- ifelse(is.na(bigdata$h1108_164), 0, bigdata$h1108_164)");
            connection.eval("bigdata$h1108_170 <- ifelse(is.na(bigdata$h1108_170), 0, bigdata$h1108_170)");
            connection.eval("bigdata$income_amount <- bigdata$income_amount"
            +" +bigdata$h1108_122"
            +" +bigdata$h1108_164"		
            +" +bigdata$h1108_170");
            connection.eval("bigdata$loan_cash <- ifelse(is.na(bigdata$loan_cash), 0, bigdata$loan_cash)");
            connection.eval("bigdata$h1109_aq2 <- ifelse(is.na(bigdata$h1109_aq2), 0, bigdata$h1109_aq2)");
            connection.eval("bigdata$h1109_aq3 <- ifelse(is.na(bigdata$h1109_aq3), 0, bigdata$h1109_aq3)");
            connection.eval("bigdata$h1109_aq4 <- ifelse(is.na(bigdata$h1109_aq4), 0, bigdata$h1109_aq4)");
            connection.eval("bigdata$h1109_aq5 <- ifelse(is.na(bigdata$h1109_aq5), 0, bigdata$h1109_aq5)");
            connection.eval("bigdata$h1109_aq6 <- ifelse(is.na(bigdata$h1109_aq6), 0, bigdata$h1109_aq6)");
            connection.eval("bigdata$h1109_aq7 <- ifelse(is.na(bigdata$h1109_aq7), 0, bigdata$h1109_aq7)");
            connection.eval("bigdata$h1109_aq8 <- ifelse(is.na(bigdata$h1109_aq8), 0, bigdata$h1109_aq8)");
            connection.eval("bigdata$loan_cash <- bigdata$loan_cash"
            +" +bigdata$h1109_aq2"
            +" +bigdata$h1109_aq3"
            +" +bigdata$h1109_aq4"
            +" +bigdata$h1109_aq5"
            +" +bigdata$h1109_aq6"
            +" +bigdata$h1109_aq7"
            +" +bigdata$h1109_aq8"); 
            connection.eval("bigdata$age <- 2016 - bigdata$root_birth + 1");
            connection.eval("");
            connection.eval("bigdata$root_edu <- ifelse(bigdata$root_edu < 6 , \"고졸\", "
            		+ "ifelse(bigdata$root_edu < 8, \"대졸\"," 
            		+ "ifelse(bigdata$root_edu < 9, \"석사\", \"박사\")");
            connection.eval("age_income <- bigdata %>% "
              + " filter(!is.na(income_amount)) %>% "
              + " group_by(age, root_edu) %>% "
              + " summarise(mean_income = mean(income_amount))");
            connection.eval("a <- ggplot(data=age_income, aes(x=age, y=mean_income, group=root_edu, colour = root_edu))"
              + "+geom_line()"
              + "+theme(legend.title = element_blank() ,legend.background = element_rect(fill=\"gainsboro\", color = \"black\")"		
              + "+ggtitle(\"분석 그래프\")"
              + "+xlab(\"나이\")"
              + "+ylab(\"소득\")");
            connection.eval("p <- ggplotly(a)");
            connection.eval("saveWidget(p, file=\"C:/workspaces/finalproject/boss/src/main/webapp/resources/bigdata_html/age_income_edu.html\")");
            connection.eval("dev.off()");
        } catch (Exception e) {
            // TODO: handle exception
            System.out.println(e);
        }finally{
        	connection.close();
        }
		mav.setViewName("/bigdata/total_analysis/age_income_edu_result");
		return mav;
	}
	
	@RequestMapping(value="/age_income_gender.do")
	public ModelAndView age_income_gender(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("UTF-8");
		ModelAndView mav = new ModelAndView();
//		RConnection connection = null;
//		try {
//            connection = new RConnection();
//            connection.eval("library(foreign)");
//            connection.eval("library(dplyr)");
//            connection.eval("library(ggplot2)");
//            connection.eval("library(plotly)");
//            connection.eval("library(htmlwidgets)"); 
//            connection.eval("library(readxl)"); 
//            connection.eval("library(xlsx)"); 
//            connection.eval("library(DBI)"); 
//            connection.eval("library(RJDBC)"); 
//            connection.eval("library(rJava)"); 
//            connection.eval(
//                    "raw_bigdata <- read.spss(file = \"C:/workspaces/R/finalproject/data/Koweps_h11_2016_beta1.sav\", to.data.frame = T, encoding = \"UTF-8\")");
//            connection.eval("bigdata <- raw_bigdata");
//            connection.eval("bigdata <- rename(bigdata,"
//                  + "root_idn = h11_id," // 회원고유번호
//                  + "root_gender = h1101_4," //성별
//                  + "root_birth = h1101_5," //생년월일
//                  + "root_edu = h1101_6," //교육수준
//                  + "root_loc = h11_reg7," // 지역
//                  + "root_marry = h1101_11," //혼인상태
//                  + "root_job = h1103_8," //직업
//                  + "food = h1107_3aq1," //식료품비
//                  + "house = h1107_3aq3," //주거비
//                  + "infra = h1107_3aq5," //광열수도비
//                  + "fixtures = h1107_3aq6," //가구가사용품비
//                  + "clothes = h1107_3aq7," //의류비
//                  + "medical = h1107_3aq8," //의료비
//                  + "education = h1107_3aq9," //교육비
//                  + "culture = h1107_3aq11," //교양오락비
//                  + "traffic = h1107_5aq3," //교통비
//                  + "communication = h1107_5aq4," //통신비
//                  + "etc_expense = h1107_3aq13," //기타소비지출비
//                  + "tax = h1107_4," //세금
//                  + "welfare = h1107_5," //사회보험금
//                  + "insure = h1107_6aq12," //보험료
//                  + "expense_total = h1107_9," //지출 합계(월별)
//                  + "income_amount = h1108_114," //소득 금액(우리는 일별 여기 데이터는 연단위니까 1/365해줘야됨)
//                  + "loan_cash = h1109_aq1" //보험료(데이터는 연단위)
//                  + ")");
//            connection.eval("bigdata$food <- ifelse(is.na(bigdata$food), 0, bigdata$food)");
//            connection.eval("bigdata$h1107_5aq1 <- ifelse(is.na(bigdata$h1107_5aq1), 0, bigdata$h1107_5aq1)");
//            connection.eval("bigdata$food <- bigdata$food + bigdata$h1107_5aq1");
//            connection.eval("bigdata$house <- ifelse(is.na(bigdata$house), 0, bigdata$house)");
//            connection.eval("bigdata$h1107_3aq4 <- ifelse(is.na(bigdata$h1107_3aq4), 0, bigdata$h1107_3aq4)");
//            connection.eval("bigdata$house <- bigdata$house + bigdata$h1107_3aq4");
//            connection.eval("bigdata$infra <- ifelse(is.na(bigdata$infra), 0, bigdata$infra)");
//            connection.eval("bigdata$h1107_6aq1 <- ifelse(is.na(bigdata$h1107_6aq1), 0, bigdata$h1107_6aq1)");
//            connection.eval("bigdata$infra <- bigdata$infra + bigdata$h1107_6aq1");
//            connection.eval("bigdata$fixtures <- ifelse(is.na(bigdata$fixtures), 0, bigdata$fixtures)");
//            connection.eval("bigdata$h1107_5aq2 <- ifelse(is.na(bigdata$h1107_5aq2), 0, bigdata$h1107_5aq2)");
//            connection.eval("bigdata$fixtures <- bigdata$fixtures + bigdata$h1107_5aq2");
//            connection.eval("bigdata$education <- ifelse(is.na(bigdata$education), 0, bigdata$education)");
//            connection.eval("bigdata$h1107_3aq10 <- ifelse(is.na(bigdata$h1107_3aq10), 0, bigdata$h1107_3aq10)");
//            connection.eval("bigdata$education <- bigdata$education + bigdata$h1107_3aq10");
//            connection.eval("bigdata$insure <- ifelse(is.na(bigdata$insure), 0, bigdata$insure)");
//            connection.eval("bigdata$h1107_6aq13 <- ifelse(is.na(bigdata$h1107_6aq13), 0, bigdata$h1107_6aq13)");
//            connection.eval("bigdata$insure <- bigdata$insure + bigdata$h1107_6aq13");
//            connection.eval("bigdata$income_amount <- ifelse(is.na(bigdata$income_amount), 0, bigdata$income_amount)");
//            connection.eval("bigdata$h1108_122 <- ifelse(is.na(bigdata$h1108_122), 0, bigdata$h1108_122)");
//            connection.eval("bigdata$h1108_164 <- ifelse(is.na(bigdata$h1108_164), 0, bigdata$h1108_164)");
//            connection.eval("bigdata$h1108_170 <- ifelse(is.na(bigdata$h1108_170), 0, bigdata$h1108_170)");
//            connection.eval("bigdata$income_amount <- bigdata$income_amount"
//            +" +bigdata$h1108_122"
//            +" +bigdata$h1108_164"		
//            +" +bigdata$h1108_170");
//            connection.eval("bigdata$loan_cash <- ifelse(is.na(bigdata$loan_cash), 0, bigdata$loan_cash)");
//            connection.eval("bigdata$h1109_aq2 <- ifelse(is.na(bigdata$h1109_aq2), 0, bigdata$h1109_aq2)");
//            connection.eval("bigdata$h1109_aq3 <- ifelse(is.na(bigdata$h1109_aq3), 0, bigdata$h1109_aq3)");
//            connection.eval("bigdata$h1109_aq4 <- ifelse(is.na(bigdata$h1109_aq4), 0, bigdata$h1109_aq4)");
//            connection.eval("bigdata$h1109_aq5 <- ifelse(is.na(bigdata$h1109_aq5), 0, bigdata$h1109_aq5)");
//            connection.eval("bigdata$h1109_aq6 <- ifelse(is.na(bigdata$h1109_aq6), 0, bigdata$h1109_aq6)");
//            connection.eval("bigdata$h1109_aq7 <- ifelse(is.na(bigdata$h1109_aq7), 0, bigdata$h1109_aq7)");
//            connection.eval("bigdata$h1109_aq8 <- ifelse(is.na(bigdata$h1109_aq8), 0, bigdata$h1109_aq8)");
//            connection.eval("bigdata$loan_cash <- bigdata$loan_cash"
//            +" +bigdata$h1109_aq2"
//            +" +bigdata$h1109_aq3"
//            +" +bigdata$h1109_aq4"
//            +" +bigdata$h1109_aq5"
//            +" +bigdata$h1109_aq6"
//            +" +bigdata$h1109_aq7"
//            +" +bigdata$h1109_aq8"); 
//            connection.eval("bigdata$age <- 2016 - bigdata$root_birth + 1");
//            connection.eval("bigdata$root_gender <- ifelse(bigdata$root_gender == 1, \"male\", \"female\")");
//            connection.eval("age_income <- bigdata %>% "
//              + " filter(!is.na(income_amount)) %>% "
//              + " group_by(age, root_gender) %>% "
//              + " summarise(mean_income = mean(income_amount))");
//            connection.eval("a <- ggplot(data=age_income, aes(x=age, y=mean_income, group=root_gender, colour = root_gender))"
//              + "+geom_line()"
//              + "+theme(legend.title = element_blank() ,legend.background = element_rect(fill=\"gainsboro\", color = \"black\")"		
//              + "+ggtitle(\"분석 그래프\")"
//              + "+xlab(\"나이\")"
//              + "+ylab(\"소득\")");
//            connection.eval("p <- ggplotly(a)");
//            connection.eval("saveWidget(p, file=\"C:/workspaces/finalproject/boss/src/main/webapp/resources/bigdata_html/age_income_gender.html\")");
//            connection.eval("dev.off()");
//
//        } catch (Exception e) {
//            // TODO: handle exception
//            System.out.println(e);
//        }finally{
//        	connection.close();
//        }
		mav.setViewName("/bigdata/total_analysis/age_income_gender_result");
		return mav;
	}
	
	@RequestMapping(value="/age_income_marry.do")
	public ModelAndView age_income_marry(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("UTF-8");
		ModelAndView mav = new ModelAndView();
		RConnection connection = null;
		try {
            connection = new RConnection();
            connection.eval("library(foreign)");
            connection.eval("library(dplyr)");
            connection.eval("library(ggplot2)");
            connection.eval("library(plotly)");
            connection.eval("library(htmlwidgets)"); 
            connection.eval("library(readxl)"); 
            connection.eval("library(xlsx)"); 
            connection.eval("library(DBI)"); 
            connection.eval("library(RJDBC)"); 
            connection.eval("library(rJava)"); 
            connection.eval(
                    "raw_bigdata <- read.spss(file = \"C:/workspaces/R/finalproject/data/Koweps_h11_2016_beta1.sav\", to.data.frame = T, encoding = \"UTF-8\")");
            connection.eval("bigdata <- raw_bigdata");
            connection.eval("bigdata <- rename(bigdata,"
                  + "root_idn = h11_id," // 회원고유번호
                  + "root_gender = h1101_4," //성별
                  + "root_birth = h1101_5," //생년월일
                  + "root_edu = h1101_6," //교육수준
                  + "root_loc = h11_reg7," // 지역
                  + "root_marry = h1101_11," //혼인상태
                  + "root_job = h1103_8," //직업
                  + "food = h1107_3aq1," //식료품비
                  + "house = h1107_3aq3," //주거비
                  + "infra = h1107_3aq5," //광열수도비
                  + "fixtures = h1107_3aq6," //가구가사용품비
                  + "clothes = h1107_3aq7," //의류비
                  + "medical = h1107_3aq8," //의료비
                  + "education = h1107_3aq9," //교육비
                  + "culture = h1107_3aq11," //교양오락비
                  + "traffic = h1107_5aq3," //교통비
                  + "communication = h1107_5aq4," //통신비
                  + "etc_expense = h1107_3aq13," //기타소비지출비
                  + "tax = h1107_4," //세금
                  + "welfare = h1107_5," //사회보험금
                  + "insure = h1107_6aq12," //보험료
                  + "expense_total = h1107_9," //지출 합계(월별)
                  + "income_amount = h1108_114," //소득 금액(우리는 일별 여기 데이터는 연단위니까 1/365해줘야됨)
                  + "loan_cash = h1109_aq1" //보험료(데이터는 연단위)
                  + ")");
            connection.eval("bigdata$food <- ifelse(is.na(bigdata$food), 0, bigdata$food)");
            connection.eval("bigdata$h1107_5aq1 <- ifelse(is.na(bigdata$h1107_5aq1), 0, bigdata$h1107_5aq1)");
            connection.eval("bigdata$food <- bigdata$food + bigdata$h1107_5aq1");
            connection.eval("bigdata$house <- ifelse(is.na(bigdata$house), 0, bigdata$house)");
            connection.eval("bigdata$h1107_3aq4 <- ifelse(is.na(bigdata$h1107_3aq4), 0, bigdata$h1107_3aq4)");
            connection.eval("bigdata$house <- bigdata$house + bigdata$h1107_3aq4");
            connection.eval("bigdata$infra <- ifelse(is.na(bigdata$infra), 0, bigdata$infra)");
            connection.eval("bigdata$h1107_6aq1 <- ifelse(is.na(bigdata$h1107_6aq1), 0, bigdata$h1107_6aq1)");
            connection.eval("bigdata$infra <- bigdata$infra + bigdata$h1107_6aq1");
            connection.eval("bigdata$fixtures <- ifelse(is.na(bigdata$fixtures), 0, bigdata$fixtures)");
            connection.eval("bigdata$h1107_5aq2 <- ifelse(is.na(bigdata$h1107_5aq2), 0, bigdata$h1107_5aq2)");
            connection.eval("bigdata$fixtures <- bigdata$fixtures + bigdata$h1107_5aq2");
            connection.eval("bigdata$education <- ifelse(is.na(bigdata$education), 0, bigdata$education)");
            connection.eval("bigdata$h1107_3aq10 <- ifelse(is.na(bigdata$h1107_3aq10), 0, bigdata$h1107_3aq10)");
            connection.eval("bigdata$education <- bigdata$education + bigdata$h1107_3aq10");
            connection.eval("bigdata$insure <- ifelse(is.na(bigdata$insure), 0, bigdata$insure)");
            connection.eval("bigdata$h1107_6aq13 <- ifelse(is.na(bigdata$h1107_6aq13), 0, bigdata$h1107_6aq13)");
            connection.eval("bigdata$insure <- bigdata$insure + bigdata$h1107_6aq13");
            connection.eval("bigdata$income_amount <- ifelse(is.na(bigdata$income_amount), 0, bigdata$income_amount)");
            connection.eval("bigdata$h1108_122 <- ifelse(is.na(bigdata$h1108_122), 0, bigdata$h1108_122)");
            connection.eval("bigdata$h1108_164 <- ifelse(is.na(bigdata$h1108_164), 0, bigdata$h1108_164)");
            connection.eval("bigdata$h1108_170 <- ifelse(is.na(bigdata$h1108_170), 0, bigdata$h1108_170)");
            connection.eval("bigdata$income_amount <- bigdata$income_amount"
            +" +bigdata$h1108_122"
            +" +bigdata$h1108_164"		
            +" +bigdata$h1108_170");
            connection.eval("bigdata$loan_cash <- ifelse(is.na(bigdata$loan_cash), 0, bigdata$loan_cash)");
            connection.eval("bigdata$h1109_aq2 <- ifelse(is.na(bigdata$h1109_aq2), 0, bigdata$h1109_aq2)");
            connection.eval("bigdata$h1109_aq3 <- ifelse(is.na(bigdata$h1109_aq3), 0, bigdata$h1109_aq3)");
            connection.eval("bigdata$h1109_aq4 <- ifelse(is.na(bigdata$h1109_aq4), 0, bigdata$h1109_aq4)");
            connection.eval("bigdata$h1109_aq5 <- ifelse(is.na(bigdata$h1109_aq5), 0, bigdata$h1109_aq5)");
            connection.eval("bigdata$h1109_aq6 <- ifelse(is.na(bigdata$h1109_aq6), 0, bigdata$h1109_aq6)");
            connection.eval("bigdata$h1109_aq7 <- ifelse(is.na(bigdata$h1109_aq7), 0, bigdata$h1109_aq7)");
            connection.eval("bigdata$h1109_aq8 <- ifelse(is.na(bigdata$h1109_aq8), 0, bigdata$h1109_aq8)");
            connection.eval("bigdata$loan_cash <- bigdata$loan_cash"
            +" +bigdata$h1109_aq2"
            +" +bigdata$h1109_aq3"
            +" +bigdata$h1109_aq4"
            +" +bigdata$h1109_aq5"
            +" +bigdata$h1109_aq6"
            +" +bigdata$h1109_aq7"
            +" +bigdata$h1109_aq8"); 
            connection.eval("bigdata$age <- 2016 - bigdata$root_birth + 1");
            connection.eval("bigdata$root_marry <- ifelse(bigdata$root_marry == 1, \"결혼\", \"미혼\")");
            connection.eval("age_income <- bigdata %>% "
              + " filter(!is.na(income_amount)) %>% "
              + " group_by(age, root_marry) %>% "
              + " summarise(mean_income = mean(income_amount))");
            connection.eval("a <- ggplot(data=age_income, aes(x=age, y=mean_income, group=root_marry, colour = root_marry))"
              + "+geom_line()"
              + "+theme(legend.title = element_blank() ,legend.background = element_rect(fill=\"gainsboro\", color = \"black\")"		
              + "+ggtitle(\"분석 그래프\")"
              + "+xlab(\"나이\")"
              + "+ylab(\"소득\")");
            connection.eval("p <- ggplotly(a)");
            connection.eval("saveWidget(p, file=\"C:/workspaces/finalproject/boss/src/main/webapp/resources/bigdata_html/age_income_marry.html\")");
            connection.eval("dev.off()");
            connection.eval("");
        } catch (Exception e) {
            // TODO: handle exception
            System.out.println(e);
        }finally{
        	connection.close();
        }
		mav.setViewName("/bigdata/total_analysis/age_income_marry_result");
		return mav;
	}
	
	@RequestMapping(value="/age_income_loc.do")
	public ModelAndView age_income_loc(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("UTF-8");
		ModelAndView mav = new ModelAndView();
		RConnection connection = null;
		try {
            connection = new RConnection();
            connection.eval("library(foreign)");
            connection.eval("library(dplyr)");
            connection.eval("library(ggplot2)");
            connection.eval("library(plotly)");
            connection.eval("library(htmlwidgets)"); 
            connection.eval("library(readxl)"); 
            connection.eval("library(xlsx)"); 
            connection.eval("library(DBI)"); 
            connection.eval("library(RJDBC)"); 
            connection.eval("library(rJava)"); 
            connection.eval(
                    "raw_bigdata <- read.spss(file = \"C:/workspaces/R/finalproject/data/Koweps_h11_2016_beta1.sav\", to.data.frame = T, encoding = \"UTF-8\")");
            connection.eval("bigdata <- raw_bigdata");
            connection.eval("bigdata <- rename(bigdata,"
                  + "root_idn = h11_id," // 회원고유번호
                  + "root_gender = h1101_4," //성별
                  + "root_birth = h1101_5," //생년월일
                  + "root_edu = h1101_6," //교육수준
                  + "root_loc = h11_reg7," // 지역
                  + "root_marry = h1101_11," //혼인상태
                  + "root_job = h1103_8," //직업
                  + "food = h1107_3aq1," //식료품비
                  + "house = h1107_3aq3," //주거비
                  + "infra = h1107_3aq5," //광열수도비
                  + "fixtures = h1107_3aq6," //가구가사용품비
                  + "clothes = h1107_3aq7," //의류비
                  + "medical = h1107_3aq8," //의료비
                  + "education = h1107_3aq9," //교육비
                  + "culture = h1107_3aq11," //교양오락비
                  + "traffic = h1107_5aq3," //교통비
                  + "communication = h1107_5aq4," //통신비
                  + "etc_expense = h1107_3aq13," //기타소비지출비
                  + "tax = h1107_4," //세금
                  + "welfare = h1107_5," //사회보험금
                  + "insure = h1107_6aq12," //보험료
                  + "expense_total = h1107_9," //지출 합계(월별)
                  + "income_amount = h1108_114," //소득 금액(우리는 일별 여기 데이터는 연단위니까 1/365해줘야됨)
                  + "loan_cash = h1109_aq1" //보험료(데이터는 연단위)
                  + ")");
            connection.eval("bigdata$food <- ifelse(is.na(bigdata$food), 0, bigdata$food)");
            connection.eval("bigdata$h1107_5aq1 <- ifelse(is.na(bigdata$h1107_5aq1), 0, bigdata$h1107_5aq1)");
            connection.eval("bigdata$food <- bigdata$food + bigdata$h1107_5aq1");
            connection.eval("bigdata$house <- ifelse(is.na(bigdata$house), 0, bigdata$house)");
            connection.eval("bigdata$h1107_3aq4 <- ifelse(is.na(bigdata$h1107_3aq4), 0, bigdata$h1107_3aq4)");
            connection.eval("bigdata$house <- bigdata$house + bigdata$h1107_3aq4");
            connection.eval("bigdata$infra <- ifelse(is.na(bigdata$infra), 0, bigdata$infra)");
            connection.eval("bigdata$h1107_6aq1 <- ifelse(is.na(bigdata$h1107_6aq1), 0, bigdata$h1107_6aq1)");
            connection.eval("bigdata$infra <- bigdata$infra + bigdata$h1107_6aq1");
            connection.eval("bigdata$fixtures <- ifelse(is.na(bigdata$fixtures), 0, bigdata$fixtures)");
            connection.eval("bigdata$h1107_5aq2 <- ifelse(is.na(bigdata$h1107_5aq2), 0, bigdata$h1107_5aq2)");
            connection.eval("bigdata$fixtures <- bigdata$fixtures + bigdata$h1107_5aq2");
            connection.eval("bigdata$education <- ifelse(is.na(bigdata$education), 0, bigdata$education)");
            connection.eval("bigdata$h1107_3aq10 <- ifelse(is.na(bigdata$h1107_3aq10), 0, bigdata$h1107_3aq10)");
            connection.eval("bigdata$education <- bigdata$education + bigdata$h1107_3aq10");
            connection.eval("bigdata$insure <- ifelse(is.na(bigdata$insure), 0, bigdata$insure)");
            connection.eval("bigdata$h1107_6aq13 <- ifelse(is.na(bigdata$h1107_6aq13), 0, bigdata$h1107_6aq13)");
            connection.eval("bigdata$insure <- bigdata$insure + bigdata$h1107_6aq13");
            connection.eval("bigdata$income_amount <- ifelse(is.na(bigdata$income_amount), 0, bigdata$income_amount)");
            connection.eval("bigdata$h1108_122 <- ifelse(is.na(bigdata$h1108_122), 0, bigdata$h1108_122)");
            connection.eval("bigdata$h1108_164 <- ifelse(is.na(bigdata$h1108_164), 0, bigdata$h1108_164)");
            connection.eval("bigdata$h1108_170 <- ifelse(is.na(bigdata$h1108_170), 0, bigdata$h1108_170)");
            connection.eval("bigdata$income_amount <- bigdata$income_amount"
            +" +bigdata$h1108_122"
            +" +bigdata$h1108_164"		
            +" +bigdata$h1108_170");
            connection.eval("bigdata$loan_cash <- ifelse(is.na(bigdata$loan_cash), 0, bigdata$loan_cash)");
            connection.eval("bigdata$h1109_aq2 <- ifelse(is.na(bigdata$h1109_aq2), 0, bigdata$h1109_aq2)");
            connection.eval("bigdata$h1109_aq3 <- ifelse(is.na(bigdata$h1109_aq3), 0, bigdata$h1109_aq3)");
            connection.eval("bigdata$h1109_aq4 <- ifelse(is.na(bigdata$h1109_aq4), 0, bigdata$h1109_aq4)");
            connection.eval("bigdata$h1109_aq5 <- ifelse(is.na(bigdata$h1109_aq5), 0, bigdata$h1109_aq5)");
            connection.eval("bigdata$h1109_aq6 <- ifelse(is.na(bigdata$h1109_aq6), 0, bigdata$h1109_aq6)");
            connection.eval("bigdata$h1109_aq7 <- ifelse(is.na(bigdata$h1109_aq7), 0, bigdata$h1109_aq7)");
            connection.eval("bigdata$h1109_aq8 <- ifelse(is.na(bigdata$h1109_aq8), 0, bigdata$h1109_aq8)");
            connection.eval("bigdata$loan_cash <- bigdata$loan_cash"
            +" +bigdata$h1109_aq2"
            +" +bigdata$h1109_aq3"
            +" +bigdata$h1109_aq4"
            +" +bigdata$h1109_aq5"
            +" +bigdata$h1109_aq6"
            +" +bigdata$h1109_aq7"
            +" +bigdata$h1109_aq8"); 
            connection.eval("bigdata$age <- 2016 - bigdata$root_birth + 1");
            connection.eval("bigdata$root_loc <- ifelse(bigdata$root_loc == 1, \"서울\", "
            +" ifelse(bigdata$root_loc == 2, \"수도권(인천/경기)\", "
            +" ifelse(bigdata$root_loc == 3, \"부산/경남/울산\", "
            +" ifelse(bigdata$root_loc == 4, \"대구/경북\", "
            +" ifelse(bigdata$root_loc == 5, \"대전/충남\", "
            +" ifelse(bigdata$root_loc == 6, \"강원/충북\", \"광주/전남/전북/제주도\"))))))");
            connection.eval("age_income <- bigdata %>% "
              + " filter(!is.na(income_amount)) %>% "
              + " group_by(age, root_loc) %>% "
              + " summarise(mean_income = mean(income_amount))");
            connection.eval("a <- ggplot(data=age_income, aes(x=age, y=mean_income, group=root_loc, colour = root_loc))"
              + "+geom_line()"
              + "+theme(legend.title = element_blank() ,legend.background = element_rect(fill=\"gainsboro\", color = \"black\")"		
              + "+ggtitle(\"분석 그래프\")"
              + "+xlab(\"나이\")"
              + "+ylab(\"소득\")");
            connection.eval("p <- ggplotly(a)");
            connection.eval("saveWidget(p, file=\"C:/workspaces/finalproject/boss/src/main/webapp/resources/bigdata_html/age_income_loc.html\")");
            connection.eval("dev.off()");
            connection.eval("");
        } catch (Exception e) {
            // TODO: handle exception
            System.out.println(e);
        }finally{
        	connection.close();
        }
		mav.setViewName("/bigdata/total_analysis/age_income_loc_result");
		return mav;
	}
	
	@RequestMapping(value="/age_income_job.do")
	public ModelAndView age_income_job(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("UTF-8");
		ModelAndView mav = new ModelAndView();
		RConnection connection = null;
		try {
            connection = new RConnection();
            connection.eval("library(foreign)");
            connection.eval("library(dplyr)");
            connection.eval("library(ggplot2)");
            connection.eval("library(plotly)");
            connection.eval("library(htmlwidgets)"); 
            connection.eval("library(readxl)"); 
            connection.eval("library(xlsx)"); 
            connection.eval("library(DBI)"); 
            connection.eval("library(RJDBC)"); 
            connection.eval("library(rJava)"); 
            connection.eval(
                    "raw_bigdata <- read.spss(file = \"C:/workspaces/R/finalproject/data/Koweps_h11_2016_beta1.sav\", to.data.frame = T, encoding = \"UTF-8\")");
            connection.eval("bigdata <- raw_bigdata");
            connection.eval("bigdata <- rename(bigdata,"
                  + "root_idn = h11_id," // 회원고유번호
                  + "root_gender = h1101_4," //성별
                  + "root_birth = h1101_5," //생년월일
                  + "root_edu = h1101_6," //교육수준
                  + "root_loc = h11_reg7," // 지역
                  + "root_marry = h1101_11," //혼인상태
                  + "root_job = h1103_7," //직업
                  + "food = h1107_3aq1," //식료품비
                  + "house = h1107_3aq3," //주거비
                  + "infra = h1107_3aq5," //광열수도비
                  + "fixtures = h1107_3aq6," //가구가사용품비
                  + "clothes = h1107_3aq7," //의류비
                  + "medical = h1107_3aq8," //의료비
                  + "education = h1107_3aq9," //교육비
                  + "culture = h1107_3aq11," //교양오락비
                  + "traffic = h1107_5aq3," //교통비
                  + "communication = h1107_5aq4," //통신비
                  + "etc_expense = h1107_3aq13," //기타소비지출비
                  + "tax = h1107_4," //세금
                  + "welfare = h1107_5," //사회보험금
                  + "insure = h1107_6aq12," //보험료
                  + "expense_total = h1107_9," //지출 합계(월별)
                  + "income_amount = h1108_114," //소득 금액(우리는 일별 여기 데이터는 연단위니까 1/365해줘야됨)
                  + "loan_cash = h1109_aq1" //보험료(데이터는 연단위)
                  + ")");
            connection.eval("bigdata$food <- ifelse(is.na(bigdata$food), 0, bigdata$food)");
            connection.eval("bigdata$h1107_5aq1 <- ifelse(is.na(bigdata$h1107_5aq1), 0, bigdata$h1107_5aq1)");
            connection.eval("bigdata$food <- bigdata$food + bigdata$h1107_5aq1");
            connection.eval("bigdata$house <- ifelse(is.na(bigdata$house), 0, bigdata$house)");
            connection.eval("bigdata$h1107_3aq4 <- ifelse(is.na(bigdata$h1107_3aq4), 0, bigdata$h1107_3aq4)");
            connection.eval("bigdata$house <- bigdata$house + bigdata$h1107_3aq4");
            connection.eval("bigdata$infra <- ifelse(is.na(bigdata$infra), 0, bigdata$infra)");
            connection.eval("bigdata$h1107_6aq1 <- ifelse(is.na(bigdata$h1107_6aq1), 0, bigdata$h1107_6aq1)");
            connection.eval("bigdata$infra <- bigdata$infra + bigdata$h1107_6aq1");
            connection.eval("bigdata$fixtures <- ifelse(is.na(bigdata$fixtures), 0, bigdata$fixtures)");
            connection.eval("bigdata$h1107_5aq2 <- ifelse(is.na(bigdata$h1107_5aq2), 0, bigdata$h1107_5aq2)");
            connection.eval("bigdata$fixtures <- bigdata$fixtures + bigdata$h1107_5aq2");
            connection.eval("bigdata$education <- ifelse(is.na(bigdata$education), 0, bigdata$education)");
            connection.eval("bigdata$h1107_3aq10 <- ifelse(is.na(bigdata$h1107_3aq10), 0, bigdata$h1107_3aq10)");
            connection.eval("bigdata$education <- bigdata$education + bigdata$h1107_3aq10");
            connection.eval("bigdata$insure <- ifelse(is.na(bigdata$insure), 0, bigdata$insure)");
            connection.eval("bigdata$h1107_6aq13 <- ifelse(is.na(bigdata$h1107_6aq13), 0, bigdata$h1107_6aq13)");
            connection.eval("bigdata$insure <- bigdata$insure + bigdata$h1107_6aq13");
            connection.eval("bigdata$income_amount <- ifelse(is.na(bigdata$income_amount), 0, bigdata$income_amount)");
            connection.eval("bigdata$h1108_122 <- ifelse(is.na(bigdata$h1108_122), 0, bigdata$h1108_122)");
            connection.eval("bigdata$h1108_164 <- ifelse(is.na(bigdata$h1108_164), 0, bigdata$h1108_164)");
            connection.eval("bigdata$h1108_170 <- ifelse(is.na(bigdata$h1108_170), 0, bigdata$h1108_170)");
            connection.eval("bigdata$income_amount <- bigdata$income_amount"
            +" +bigdata$h1108_122"
            +" +bigdata$h1108_164"		
            +" +bigdata$h1108_170");
            connection.eval("bigdata$loan_cash <- ifelse(is.na(bigdata$loan_cash), 0, bigdata$loan_cash)");
            connection.eval("bigdata$h1109_aq2 <- ifelse(is.na(bigdata$h1109_aq2), 0, bigdata$h1109_aq2)");
            connection.eval("bigdata$h1109_aq3 <- ifelse(is.na(bigdata$h1109_aq3), 0, bigdata$h1109_aq3)");
            connection.eval("bigdata$h1109_aq4 <- ifelse(is.na(bigdata$h1109_aq4), 0, bigdata$h1109_aq4)");
            connection.eval("bigdata$h1109_aq5 <- ifelse(is.na(bigdata$h1109_aq5), 0, bigdata$h1109_aq5)");
            connection.eval("bigdata$h1109_aq6 <- ifelse(is.na(bigdata$h1109_aq6), 0, bigdata$h1109_aq6)");
            connection.eval("bigdata$h1109_aq7 <- ifelse(is.na(bigdata$h1109_aq7), 0, bigdata$h1109_aq7)");
            connection.eval("bigdata$h1109_aq8 <- ifelse(is.na(bigdata$h1109_aq8), 0, bigdata$h1109_aq8)");
            connection.eval("bigdata$loan_cash <- bigdata$loan_cash"
            +" +bigdata$h1109_aq2"
            +" +bigdata$h1109_aq3"
            +" +bigdata$h1109_aq4"
            +" +bigdata$h1109_aq5"
            +" +bigdata$h1109_aq6"
            +" +bigdata$h1109_aq7"
            +" +bigdata$h1109_aq8"); 
            connection.eval("bigdata$age <- 2016 - bigdata$root_birth + 1");
            
          /*  connection.eval("bigdata$root_job <- ifelse(bigdata$root_job < 4, \"어업\", "
            +" ifelse(bigdata$root_job < 9, \"광업\", "
            +" ifelse(bigdata$root_job < 34, \"제조업\", "
            +" ifelse(bigdata$root_job < 37, \"전기, 가스, 수도업\", "
            +" ifelse(bigdata$root_job < 40, \"환경업\", "
            +" ifelse(bigdata$root_job < 43, \"건설업\", "
            +" ifelse(bigdata$root_job < 48, \"도&소매업\", "
            +" ifelse(bigdata$root_job < 53, \"운수업\", "
            +" ifelse(bigdata$root_job < 57, \"숙박&음식업\", "
            +" ifelse(bigdata$root_job < 64, \"출판,방송통신&정보서비스업\", "
            +" ifelse(bigdata$root_job < 67, \"금융&보험업\", "
            +" ifelse(bigdata$root_job < 70, \"부동산&임대업\", "
            +" ifelse(bigdata$root_job < 74, \"전문, 과학 및 기술 서비스업\", "
            +" ifelse(bigdata$root_job < 76, \"사업시설관리 및 사업지원서비스\", "
            +" ifelse(bigdata$root_job < 85, \"공공행정, 국방 및 사회보장 행정\", "
            +" ifelse(bigdata$root_job < 88, \"보건 및 사회복지 사업\", "
            +" ifelse(bigdata$root_job < 92, \"예술, 스포츠 여가관련 서비스업", "개인 서비스업\")))))))))))))))))");*/
            
            connection.eval("age_income <- bigdata %>% "
              + " filter(!is.na(income_amount)) %>% "
              + " group_by(age, root_job) %>% "
              + " summarise(mean_income = mean(income_amount))");
            connection.eval("a <- ggplot(data=age_income, aes(x=age, y=mean_income, group=root_job, colour = root_job))"
              + "+geom_line()"
              + "+theme(legend.title = element_blank() ,legend.background = element_rect(fill=\"gainsboro\", color = \"black\")"		
              + "+ggtitle(\"분석 그래프\")"
              + "+xlab(\"나이\")"
              + "+ylab(\"소득\")");
            connection.eval("p <- ggplotly(a)");
            connection.eval("saveWidget(p, file=\"C:/workspaces/finalproject/boss/src/main/webapp/resources/bigdata_html/age_income_job.html\")");
            connection.eval("dev.off()");
            connection.eval("");
        } catch (Exception e) {
            // TODO: handle exception
            System.out.println(e);
        }finally{
        	connection.close();
        }
		mav.setViewName("/bigdata/total_analysis/age_income_job_result");
		return mav;
	}
	
	
	
	
/*
	@RequestMapping("/income_sex.do")
	public ModelAndView income_sex(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("UTF-8");
		ModelAndView mav = new ModelAndView();
		RConnection connection = null;
		String agegen = "연령";
		if(dao == agegen){
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
	            
	            
	            BufferedReader reader = new BufferedReader(
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
	            FileCopyUtils.copy(reader, writer);
	            //mav.addObject("viewPage", "test01.jsp");
	            mav.setViewName("/bigdata/test02");
	        } catch (Exception e) {
	            // TODO: handle exception
	            System.out.println(e);
	        }finally{
	        	connection.close();
	        }
			
			return mav;
		}else if(){
			
		}
		
		
		
	}
	
	
	@RequestMapping(value="/age_income_edu.do")
	public ModelAndView age_income_edu(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("UTF-8");
		ModelAndView mav = new ModelAndView();
		RConnection connection = null;
		try {
            connection = new RConnection();
            connection.eval("library(foreign)");
            connection.eval("library(dplyr)");
            connection.eval("library(ggplot2)");
            connection.eval("library(plotly)");
            connection.eval("library(htmlwidgets)"); 
            connection.eval("library(readxl)"); 
            connection.eval("library(xlsx)"); 
            connection.eval("library(DBI)"); 
            connection.eval("library(RJDBC)"); 
            connection.eval("library(rJava)"); 
            connection.eval("drv <- JDBC(\"oracle.jdbc.driver.OracleDriver\", "
                    + " \"C:/oraclexe/app/oracle/product/11.2.0/server/jdbc/lib/ojdbc6.jar\")"); 
            connection.eval("conn <- dbConnect(drv, "
                    + " \"jdbc:oracle:thin:@//localhost:1521/xe\", "
                    + " \"scott\", "
                    + " \"tiger\")"); 
            connection.eval("Sys.setenv(JAVA_HOME=\"C:/Program Files/Java/jre1.8.0_144\")");
            connection.eval("query <- \"select * from test\""); 
            connection.eval("bigdata <- dbGetQuery(conn, query)");
           // connection.eval("bigdata$ROOT_GENDER <- ifelse(bigdata$ROOT_GENDER == 1, \"male\", \"female\")"); 
           //connection.eval("a <- qplot(bigdata$ROOT_GENDER)"); 
           //connection.eval(" interplot <- ggplot(data=sex_income, aes(x=sex, y=mean_income)) + geom_col()");
           //connection.eval("p <- ggplotly(a)");

            // 엑셀데이터 불러와서 분석하기
            connection.eval(
                    "raw_bigdata <- read.spss(file = \"C:/workspaces/R/finalproject/data/Koweps_h11_2016_beta1.sav\", to.data.frame = T, encoding = \"UTF-8\")");
            //connection.eval("raw_bigdata2 <-read.csv(\"C:/workspaces/R/finalproject/data/Koweps_p11_2016_beta1.csv\", header = T, encoding = \"UTF-8\")");
            connection.eval("bigdata <- raw_bigdata");
           //connection.eval("bigdata2 <- raw_bigdata2");
            connection.eval("bigdata <- rename(bigdata,"
                  + "root_idn = h11_id," // 회원고유번호
                  + "root_gender = h1101_4," //성별
                  + "root_birth = h1101_5," //생년월일
                  + "root_edu = h1101_6," //교육수준
                  + "root_loc = h11_reg7," // 지역
                  + "root_marry = h1101_11," //혼인상태
                  + "root_job = h1103_7," //직업
                  + "food = h1107_3aq1," //식료품비
                  + "house = h1107_3aq3," //주거비
                  + "infra = h1107_3aq5," //광열수도비
                  + "fixtures = h1107_3aq6," //가구가사용품비
                  + "clothes = h1107_3aq7," //의류비
                  + "medical = h1107_3aq8," //의료비
                  + "education = h1107_3aq9," //교육비
                  + "culture = h1107_3aq11," //교양오락비
                  + "traffic = h1107_5aq3," //교통비
                  + "communication = h1107_5aq4," //통신비
                  + "etc_expense = h1107_3aq13," //기타소비지출비
                  + "tax = h1107_4," //세금
                  + "welfare = h1107_5," //사회보험금
                  + "insure = h1107_6aq12," //보험료
                  + "expense_total = h1107_9," //지출 합계(월별)
                  + "income_amount = h1108_114," //소득 금액(우리는 일별 여기 데이터는 연단위니까 1/365해줘야됨)
                  + "loan_cash = h1109_aq1" //보험료(데이터는 연단위)
                  + ")");
            connection.eval("");
            connection.eval("bigdata$food <- ifelse(is.na(bigdata$food), 0, bigdata$food)");
            connection.eval("bigdata$h1107_5aq1 <- ifelse(is.na(bigdata$h1107_5aq1), 0, bigdata$h1107_5aq1)");
            connection.eval("bigdata$food <- bigdata$food + bigdata$h1107_5aq1");
            connection.eval("bigdata$house <- ifelse(is.na(bigdata$house), 0, bigdata$house)");
            connection.eval("bigdata$h1107_3aq4 <- ifelse(is.na(bigdata$h1107_3aq4), 0, bigdata$h1107_3aq4)");
            connection.eval("bigdata$house <- bigdata$house + bigdata$h1107_3aq4");
            connection.eval("bigdata$infra <- ifelse(is.na(bigdata$infra), 0, bigdata$infra)");
            connection.eval("bigdata$h1107_6aq1 <- ifelse(is.na(bigdata$h1107_6aq1), 0, bigdata$h1107_6aq1)");
            connection.eval("bigdata$infra <- bigdata$infra + bigdata$h1107_6aq1");
            connection.eval("bigdata$fixtures <- ifelse(is.na(bigdata$fixtures), 0, bigdata$fixtures)");
            connection.eval("bigdata$h1107_5aq2 <- ifelse(is.na(bigdata$h1107_5aq2), 0, bigdata$h1107_5aq2)");
            connection.eval("bigdata$fixtures <- bigdata$fixtures + bigdata$h1107_5aq2");
            connection.eval("bigdata$education <- ifelse(is.na(bigdata$education), 0, bigdata$education)");
            connection.eval("bigdata$h1107_3aq10 <- ifelse(is.na(bigdata$h1107_3aq10), 0, bigdata$h1107_3aq10)");
            connection.eval("bigdata$education <- bigdata$education + bigdata$h1107_3aq10");
            connection.eval("bigdata$insure <- ifelse(is.na(bigdata$insure), 0, bigdata$insure)");
            connection.eval("bigdata$h1107_6aq13 <- ifelse(is.na(bigdata$h1107_6aq13), 0, bigdata$h1107_6aq13)");
            connection.eval("bigdata$insure <- bigdata$insure + bigdata$h1107_6aq13");
            connection.eval("bigdata$income_amount <- ifelse(is.na(bigdata$income_amount), 0, bigdata$income_amount)");
            connection.eval("bigdata$h1108_122 <- ifelse(is.na(bigdata$h1108_122), 0, bigdata$h1108_122)");
            connection.eval("bigdata$h1108_164 <- ifelse(is.na(bigdata$h1108_164), 0, bigdata$h1108_164)");
            connection.eval("bigdata$h1108_170 <- ifelse(is.na(bigdata$h1108_170), 0, bigdata$h1108_170)");
            connection.eval("bigdata$income_amount <- bigdata$income_amount"
            +" +bigdata$h1108_122"
            +" +bigdata$h1108_164"		
            +" +bigdata$h1108_170");
            connection.eval("bigdata$loan_cash <- ifelse(is.na(bigdata$loan_cash), 0, bigdata$loan_cash)");
            connection.eval("bigdata$h1109_aq2 <- ifelse(is.na(bigdata$h1109_aq2), 0, bigdata$h1109_aq2)");
            connection.eval("bigdata$h1109_aq3 <- ifelse(is.na(bigdata$h1109_aq3), 0, bigdata$h1109_aq3)");
            connection.eval("bigdata$h1109_aq4 <- ifelse(is.na(bigdata$h1109_aq4), 0, bigdata$h1109_aq4)");
            connection.eval("bigdata$h1109_aq5 <- ifelse(is.na(bigdata$h1109_aq5), 0, bigdata$h1109_aq5)");
            connection.eval("bigdata$h1109_aq6 <- ifelse(is.na(bigdata$h1109_aq6), 0, bigdata$h1109_aq6)");
            connection.eval("bigdata$h1109_aq7 <- ifelse(is.na(bigdata$h1109_aq7), 0, bigdata$h1109_aq7)");
            connection.eval("bigdata$h1109_aq8 <- ifelse(is.na(bigdata$h1109_aq8), 0, bigdata$h1109_aq8)");
            connection.eval("bigdata$loan_cash <- bigdata$loan_cash"
            +" +bigdata$h1109_aq2"
            +" +bigdata$h1109_aq3"
            +" +bigdata$h1109_aq4"
            +" +bigdata$h1109_aq5"
            +" +bigdata$h1109_aq6"
            +" +bigdata$h1109_aq7"
            +" +bigdata$h1109_aq8"); 
            //connection.eval("bigdata$root_gender <- ifelse(bigdata$root_gender == 1, \"male\", \"female\")");          
            //connection.eval("bigdata$income_amount <- ifelse(bigdata$income_amount %in% c(0, 9999), NA, bigdata$income_amount)");
            //connection.eval("bigdata$INCOME_AMOUNT <- ifelse(bigdata$INCOME_AMOUNT == \" \", NA, bigdata$INCOME_AMOUNT)");
            //connection.eval("bigdata$INCOME_AMOUNT <- as.numeric(bigdata$INCOME_AMOUNT)");
            connection.eval("result <- bigdata2 %>% "
            +"group_by(X.U.FEFF.h11_id) %>% "
            +"summarise(income_amount = mean(p1102_8aq1))");
            connection.eval("result <- rename(result,"
            +"root_idn = X.U.FEFF.h11_id)");
            connection.eval("bigdata <- left_join(result, bigdata, by=\"root_idn\")");
            connection.eval("bigdata <- rename(bigdata,"
             +"income=income_amount.x)");
            connection.eval("bigdata$income <- ifelse(is.na(bigdata$income), 0, bigdata$income)");
            
            connection.eval("bigdata$age <- 2016 - bigdata$root_birth + 1");
            connection.eval("");
            connection.eval("bigdata$root_edu <- ifelse(bigdata$root_edu < 6 , \"고졸\", "
            		+ "ifelse(bigdata$root_edu < 8, \"대졸\"," 
            		+ "ifelse(bigdata$root_edu < 9, \"석사\", \"박사\")");
            connection.eval("age_income <- bigdata %>% "
              + " filter(!is.na(income_amount)) %>% "
              + " group_by(age, root_edu) %>% "
              + " summarise(mean_income = mean(income_amount))");
            connection.eval("a <- ggplot(data=age_income, aes(x=age, y=mean_income, group=root_edu, colour = root_edu))"
              + "+geom_line()"
              + "+theme(legend.title = element_blank() ,legend.background = element_rect(fill=\"gainsboro\", color = \"black\")"		
              + "+ggtitle(\"분석 그래프\")"
              + "+xlab(\"나이\")"
              + "+ylab(\"소득\")");
            connection.eval("p <- ggplotly(a)");
            //connection.eval("ggsave(file=\"C:/workspaces/finalproject/boss/src/main/webapp/resources/image/test02.jpg\")");
            connection.eval("saveWidget(p, file=\"C:/workspaces/finalproject/boss/src/main/webapp/resources/bigdata_html/age_income_edu.html\")");
            connection.eval("dev.off()");
            
            
           
            //연동 확인
            connection.eval("aa <- 왔어");
            System.out.println(connection.eval("aa").asString());
            
            
            //mav.addObject("viewPage", "test01.jsp");
            //mav.setViewName("/bigdata/test02");
        } catch (Exception e) {
            // TODO: handle exception
            System.out.println(e);
        }finally{
        	connection.close();
        }
		mav.setViewName("/bigdata/total_analysis/age_income_edu_result");
		return mav;
	}
*/
}
