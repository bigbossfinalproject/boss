/**
 * incomeBoard용 자바스크립트 파일
 */


document.write("<script type='text/javascript' src='./resources/js/incomeChart.js'><" + "/script>");



window.onload = function() {
	getIncomeBoard();

}

var income_option = "<option value ='i1'>주요소득</option><option value ='i2'>기타소득</option>";

function getOptions(option) {
	var test = new Array();
	$.ajax({
		url : './getOptions.io',
		type : 'GET',
		async : false,
		dataType : 'json',
		success : function(data) {
			console.log("옵션 불러오기 성공 함수");

			var jsonObj = data;
			var cash = jsonObj.cash;
			var account = jsonObj.account;

			if (option == '현금') {
				test = cash;
				console.log(test);
				
			} else {

				test = account;
				console.log(test);
				
			}


		},
		error : function() {
			console.log("에러");
		}
	})
	console.log('test = ' + test);
	return test;
}




// 페이지 로드시 실행되는 함수 (테이블 ajax로 그리기)
function getIncomeBoard() {
	console.log("얘 실행되냐");
	var table = document.getElementById("ajaxTable");
	table.innerHTML = "";
	$.ajax(
		{
			url : './list2.io',
			type : 'POST',
			dataType : 'text',
			success : function(data) {
				//받아온 데이터를 json형태로 변환
				var data_Json = JSON.parse(data);
				//result라는 이름의 데이터들을 가져옴
				var result = data_Json.result;
				//테이블에 추가할 html인 rowItem 초기화
				var rowItem = "";
				for (var i = 0; i < result.length; i++) {
					rowItem += "<tr>"
					for (var j = 0; j < result[i].length; j++) {
						if (j == 0) {
							rowItem += "<input type ='hidden' id='income_Id' value = " + result[i][j].value + " ></input>";
							continue;
						}



						if (j == 5) {
							rowItem += "<td class = 'text-right'>" + result[i][j].value + "</td>";
							continue;
						}
						rowItem += "<td>" + result[i][j].value + "</td>";
					}
					rowItem += "<td style='padding:0px'><button type='button'  id='row_remove' ><span class='glyphicon glyphicon-minus'></span></button></td></tr>";
				}
				$('#incomeTable').append(rowItem);

				drawChart();





			},
			error : function() {
				alert('통신실패!!');
			}
		})
}

// +버튼 눌렀을때 실행되는 함수 (행 추가)

$(document).on('click', '#add_row', function() {
	var now = new Date() // 현재 날짜
	var curr_date = now.getDate();
	if (curr_date < 10)
		curr_date = "0" + curr_date;
	var curr_month = now.getMonth() + 1; //Months are zero based
	if (curr_month < 10)
		curr_month = "0" + curr_month;
	var curr_year = now.getFullYear();
	var result = curr_year + "-" + curr_month + "-"
		+ curr_date;

	var rowItem = "<tr>"
	rowItem += "<td> <input type='date' class='form-control' value = '" + result + "'> </td>"
	rowItem += "<td> <select class='form-control' id = 'income_code'>" + income_option + "</select> </td>"
	rowItem += "<td> <select class='form-control' id = 'trade_code'><option value=''>선택</option></select> </td>"
	rowItem += "<td> <select class='form-control' id = 'asset_code'><option value=''>선택</option></select> </td>"
	rowItem += "<td> <input type='text' class='form-control text-right' placeholder='금액' > </td>"
	rowItem += "<td> <input type='text' class='form-control' placeholder='비고'> </td>"
	rowItem += "<td><button type='button' id='row_add' ><span class='glyphicon glyphicon-ok' ></span></button></td>"
	rowItem += "</tr>"
	$('#incomeTable').append(rowItem);

});




// 삭제 버튼 눌렀을때 수행하는 함수(행 삭제)
$(document).on("click", "#row_remove", function() {

	var tr = $(this).parent().parent();
	var result = tr.children().eq(0).val();
	var hidden = {
		"income_Id" : result
	}

	$.ajax({
		url : "./delIncomeList.io",
		type : "POST",
		data : hidden,
		success : function(data) {
			alert("삭제완료!");
			getIncomeBoard();
			drawChart();
		},
		error : function() {
			alert('삭제실패!!');
		}
	})


});

$(document).on("click", "#row_add", function() {

	var objTable = document.getElementById("incomeTable");

	var tdArr = new Array(); // 배열 선언
	// 현재 클릭된 Row(<tr>)
	var tr = $(this).parent().parent();
	var td = tr.children();

	td.each(function(i) {
		if (td.eq(i).children().val != null) {
			console.log(td.eq(i).text);
			tdArr.push(td.eq(i).children().val());
			console.log('text 존재' + i);
		} else {

		}
	});
	console.log("배열에 담긴 값 : " + tdArr);
	var tdArr2 = tdArr.slice(0, 6);
	console.log("tdArr2 :" + tdArr2)
	var allArray = {
		"arrData" : tdArr2
	};

	$.ajax({
		url : "./addIncomeList.io",
		type : "POST",
		data : allArray,
		success : function(data) {
			alert("입력완료!");
			getIncomeBoard();

		},
		error : function() {
			alert('입력실패!!(AJAX 오류)');
		}
	})
});

$(document).on("click", "#row_modify", function() {
	var tdArr = new Array(); // 배열 선언
	// 현재 클릭된 Row(<tr>)
	var tr = $(this).parent().parent();
	var td = tr.children();
	var result = td.eq(0).val();
	console.log(td.eq(2).children().val());
	// 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
	td.each(function(i) {

		if (td.eq(i).children().val() != null) {
			tdArr.push(td.eq(i).children().val());
		} else if (td.eq(i).text() != "") {
			tdArr.push(td.eq(i).text());
		}


	});
	var tdArr2 = tdArr.slice(0, 6);
	console.log(tdArr2);


	var allArray = {
		"arrData" : tdArr2,
		"income_Id" : result
	};

	$.ajax({
		url : "./modifyIncomeList.io",
		type : "POST",
		data : allArray,
		success : function(data) {
			alert("수정완료!");
			getIncomeBoard();
		},
		error : function(request, status, error) {
			alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);

		}
	})
});


$(document).on('click', 'td', function() {

	if ($(".form-control", this).length < 1) {
		console.log($(".form-control", this).length);
		var tr = $(this).parent();
		var td = tr.children();
		var tdIdx = tr.find("td").index(this);
		var trCell = td.length;
		//var curIndex = parseInt($("td").index($(this)) % trCell);
		var data = $(this).text();

		if (tdIdx < 6) {
			if (tdIdx === 0) {
				$(this).html("<input type='date' class='form-control' value = " + data + "></input>");
			} else if (tdIdx === 1) {
				$(this).html("<select class='form-control' id = 'income_code'>" + income_option + "</option></select>")
			} else if (tdIdx === 2) {
				var otherData;
				data == '현금' ? otherData = '통장' : otherData = '현금';
				$(this).html("<select class='form-control' id = 'trade_code'><option value='" + data + "'>" + data + "</option><option value='" + otherData + "'>" + otherData + "</option></select>")

			} else if (tdIdx === 3) {
				console.log($('#trade_code option:selected').val());
				var ad = $('#trade_code option:selected').val();
				var a = new Array();
				a = getOptions(ad);

				var b = "";
				$(this).html("");
				b += "<select class='form-control' id = 'asset_code'>";
				for (var i = 0; i < a.length; i++) {
					b += "<option value = " + a[i] + ">" + a[i] + "</option> ";
				}
				b += "</select>";

				$(this).append(b);

			} else {
				$(this).html("<input type='text' class='form-control text-right' value = " + data + "></input>");
			}

			var update_button = tr.find(".glyphicon-pencil").length;
			if (update_button == 0) {
				tr.find("td").eq(6).css("padding : 0px");
				tr.find("td").eq(6).html("<button type='button' class='glyphicon glyphicon-pencil' id='row_modify' style='height:31px'></button>");
			}
		}
	}
});

$(document).on('blur', 'input', function() {
	var tr = $(this).parent().parent();
	var checker = tr.find(".glyphicon-pencil").length;

	if (checker === 1) {
		var txt = $(this).val();
		var pa = $(this).parent()
		$(this).remove();
		pa.append(txt);
	}

})