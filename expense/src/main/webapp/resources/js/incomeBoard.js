/**
 * incomeBoard용 자바스크립트 파일
 */

window.onload = function() {

	getIncomeBoard();
}

function getIncomeBoard() {
	var table = document.getElementById("ajaxTable");
	table.innerHTML = "";
	$.ajax(
		{
			url : './list2.io',
			type : 'POST',
			dataType : 'text',
			success : function(data) {
				var data_Json = JSON.parse(data);
				var result = data_Json.result;
				var rowItem = "";
				for (var i = 0; i < result.length; i++) {
					rowItem += "<tr>"
					for (var j = 0; j < result[i].length; j++) {
						if (j == 0) {
							rowItem += "<input type ='hidden' id='income_Code' value = " + result[i][j].value + " ></input>";
							console.log(result[i][j].value);
							continue;
						}

						if (j == 5) {
							rowItem += "<td class = 'text-right'>" + result[i][j].value + "</td>";
							continue;
						}
						rowItem += "<td>" + result[i][j].value + "</td>";
					}
					rowItem += "<td><button type='button' class='glyphicon glyphicon-minus' id='row_remove'></button></td></tr>";
				}
				$('#incomeTable').append(rowItem);
			},
			error : function() {
				alert('통신실패!!');
			}
		})
}


$(function() {
	$('#add_row')
		.click(
			function() {
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
				rowItem += "<td> <input type='text' class='form-control' placeholder='소득구분' > </td>"
				rowItem += "<td> <input type='email' class='form-control' placeholder='거래코드'> </td>"
				rowItem += "<td> <input type='text' class='form-control' placeholder='금융사코드'> </td>"
				rowItem += "<td> <input type='text' class='form-control text-right' placeholder='금액' > </td>"
				rowItem += "<td> <input type='text' class='form-control' placeholder='비고'> </td>"
				rowItem += "<td><button type='button' class='glyphicon glyphicon-ok' id='row_add'></button></td>"
				rowItem += "</tr>"
				$('#incomeTable').append(rowItem);

			});

	$(document).on('click', 'td', function() {
		var txt = $(this).children().val();
		console.log(txt);
	});

	$(document).on("click", "#row_remove", function() {

		$(this).parent().parent().remove();
	});

	$(document).on("click", "#row_add", function() {

		var objTable = document.getElementById("incomeTable");

		var tdArr = new Array(); // 배열 선언
		// 현재 클릭된 Row(<tr>)
		var tr = $(this).parent().parent();
		var td = tr.children();
		var content = td.children();


		// 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
		td.each(function(i) {
			tdArr.push(td.children().eq(i).val());
		});
		var tdArr2 = tdArr.slice(0, 6);
		var allArray = {
			"arrData" : tdArr2
		};

		$.ajax({
			url : "./addIncomeList.io",
			type : "POST",
			data : allArray,
			success : function(data) {
				alert("완료!");
				getIncomeBoard();
			},
			error : function() {
				alert('통신실패!!');
			}
		})
	});

})