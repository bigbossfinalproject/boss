<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
         
    <script type="text/javascript">
        $(document).ready(function(){
            // 항목추가 버튼 클릭시
            $(".addBtn").click(function(){
                var clickedRow = $(this).parent().parent();
                var cls = clickedRow.attr("class");
 
                // tr 복사해서 마지막에 추가
                var newrow = clickedRow.clone();
                newrow.find("td:eq(0)").remove();
                newrow.insertAfter($("#example ."+cls+":last"));
 
                // rowspan 증가
                resizeRowspan(cls);
            });
             
             
            // 삭제버튼 클릭시
            $(".delBtn").live("click", function(){
                var clickedRow = $(this).parent().parent();
                var cls = clickedRow.attr("class");
                 
                // 각 항목의 첫번째 row를 삭제한 경우 다음 row에 td 하나를 추가해 준다.
                if( clickedRow.find("td:eq(0)").attr("rowspan") ){
                    if( clickedRow.next().hasClass(cls) ){
                        clickedRow.next().prepend(clickedRow.find("td:eq(0)"));
                    }
                }
 
                clickedRow.remove();
 
                resizeRowspan(cls);
            });
 
            // cls : rowspan 을 조정할 class ex) item1, item2, ...
            function resizeRowspan(cls){
                var rowspan = $("."+cls).length;
                $("."+cls+":first td:eq(0)").attr("rowspan", rowspan);
            }
        });
    </script>
</head>
 
<body>
<table id="example" border="1px">
        <tr>
            <th>옵션명</th>
            <th>항목명</th>
            <th>필수항목</th>
            <th>가격</th>
            <th>재고</th>
            <th>옵션추가</th>
        </tr>
        <tr class="item1">
            <td><input type="text" /><button class="addBtn">항목추가</button></td>
            <td><input type="text" /></td>
            <td><input type="checkbox" /></td>
            <td><input type="text" /></td>
            <td><input type="text" /></td>
            <td><button class="delBtn">삭제</button></td>
        </tr>
        <tr class="item2">
            <td><input type="text" /><button class="addBtn">항목추가</button></td>
            <td><input type="text" /></td>
            <td><input type="checkbox" /></td>
            <td><input type="text" /></td>
            <td><input type="text" /></td>
            <td><button class="delBtn">삭제</button></td>
        </tr>
        <tr class="item3">
            <td><input type="text" /><button class="addBtn">항목추가</button></td>
            <td><input type="text" /></td>
            <td><input type="checkbox" /></td>
            <td><input type="text" /></td>
            <td><input type="text" /></td>
            <td><button class="delBtn">삭제</button></td>
        </tr>
        <tr class="item4">
            <td><input type="text" /><button class="addBtn">항목추가</button></td>
            <td><input type="text" /></td>
            <td><input type="checkbox" /></td>
            <td><input type="text" /></td>
            <td><input type="text" /></td>
            <td><button class="delBtn">삭제</button></td>
        </tr>
</table>
</body>
</html>  