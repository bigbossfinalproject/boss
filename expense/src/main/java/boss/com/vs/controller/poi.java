package boss.com.vs.controller;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

import boss.com.vs.model.BudgetBean;
 
public class poi {
 
    public void poiExecute(List<BudgetBean> list,HttpServletResponse response) throws IOException {
         System.out.println("포이실행");
        // Workbook 생성
        Workbook xlsWb = new HSSFWorkbook(); // Excel 2007 이전 버전
 
        // *** Sheet-------------------------------------------------
        // Sheet 생성
        Sheet sheet1 = xlsWb.createSheet("firstSheet");
 
        // 컬럼 너비 설정
        sheet1.setColumnWidth(0, 10000);
        sheet1.setColumnWidth(9, 10000);
        // ----------------------------------------------------------
         
        // *** Style--------------------------------------------------
        // Cell 스타일 생성
        CellStyle cellStyle = xlsWb.createCellStyle();
         
        // 줄 바꿈
        cellStyle.setWrapText(true);
         
        // Cell 색깔, 무늬 채우기
        cellStyle.setFillForegroundColor(HSSFColor.LIME.index);
        cellStyle.setFillPattern(CellStyle.BIG_SPOTS);
         
        Row row = null;
        Cell cell = null;
        //----------------------------------------------------------
         
        // 첫 번째 줄
        row = sheet1.createRow(0);
         
        // 첫 번째 줄에 Cell 설정하기-------------
        cell = row.createCell(0);
        cell.setCellValue("분류");
        
        cell = row.createCell(1);
        cell.setCellValue("예산");
      
        cell = row.createCell(2);
        cell.setCellValue("사용금액");
        
        cell = row.createCell(3);
        cell.setCellValue("남은금액");
        
        cell = row.createCell(4);
        cell.setCellValue("예산등록일");
        
          
        //---------------------------------
         
        // 두 번째 줄
         
        // 두 번째 줄에 Cell 설정하기-------------
        
        for (int i = 0; i < list.size(); i++) {
        	BudgetBean bean=null;
        	bean=list.get(i);
            row = sheet1.createRow(i+1);
        	
        cell = row.createCell(0);
        cell.setCellValue(bean.getItem_code());
        cell = row.createCell(1);
        cell.setCellValue(bean.getBudget_amount());
        cell = row.createCell(2);
        cell.setCellValue(bean.getBudget_amount_spent());
        cell = row.createCell(3);
        cell.setCellValue(bean.getBudget_amount()-bean.getBudget_amount_spent());
        cell = row.createCell(4);
        cell.setCellValue(bean.getBudget_date());
        
        }
        //---------------------------------
 
        // excel 파일 저장
       
        try {
            
            OutputStream fileOut = null;
            
            fileOut=response.getOutputStream();
            
            xlsWb.write(fileOut);
            xlsWb.close();
            fileOut.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        
    }
 
}