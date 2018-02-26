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
				rowItem += "<td> <input type='text' class='form-control' placeholder='거래코드'> </td>"
				rowItem += "<td> <input type='text' class='form-control' placeholder='금융사코드'> </td>"
				rowItem += "<td> <input type='text' class='form-control text-right' placeholder='금액' > </td>"
				rowItem += "<td> <input type='text' class='form-control' placeholder='비고'> </td>"
				rowItem += "<td><button type='button' id='row_add' ><span class='glyphicon glyphicon-ok' ></span></button></td>"
				rowItem += "</tr>"
				$('#incomeTable').append(rowItem);

			});





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



		// 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
		td.each(function(i) {
			tdArr.push(td.children().eq(i).val());

		});
		console.log("배열에 담긴 값 : " + tdArr);
		var tdArr2 = tdArr.slice(0, 6);
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
		console.log("income_id : " + result);
		console.log("---------------------");
		console.log(td.eq(0).val());
		console.log(td.eq(1).text());
		console.log(td.eq(2).text());
		console.log(td.eq(3).text());
		console.log(td.eq(4).text());
		console.log(td.eq(5).text());
		console.log(td.eq(6).children().val());
		console.log(td.eq(7).val());

		// 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
		td.each(function(i) {
			if (td.eq(i).text() != "") {

				tdArr.push(td.eq(i).text());
			} else {

				tdArr.push(td.eq(i).children().val());
			}
		});


		var tdArr2 = tdArr.slice(1, 7);
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

		if ($("input", this).length < 1) {
			var tr = $(this).parent();
			var td = tr.children();
			var tdIdx = tr.find("td").index(this);
			var trCell = td.length;
			//var curIndex = parseInt($("td").index($(this)) % trCell);
			console.log("지금 인덱스값 : " + tdIdx);
			var data = $(this).text();

			if (tdIdx < 6) {
				if (tdIdx === 0) {
					$(this).html("<input type='date' class='form-control' value = " + data + "></input>");
				} else {
					$(this).html("<input type='text' class='form-control' value = " + data + "></input>");
				}

				var update_button = tr.find(".glyphicon-pencil").length;
				if (update_button == 0) {
					tr.find("td").eq(6).css("padding : 0px");
					tr.find("td").eq(6).html("<button type='button' class='glyphicon glyphicon-pencil' id='row_modify' style='height:31px'></button>");
				}
			}
		}
	});







})