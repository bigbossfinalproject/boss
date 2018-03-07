	function cofyFunction() {
		$.ajax(
			{
				url : './budget_copy.bg',
				type : 'POST',
				dataType : 'text',
				success : function(result) {
					selectFunction();
				},
				error : function() {
					alert('통신실패!!');
					
					
					
				}
			})

	}
	function excelFunction(){
		$("#excel3").html("");
		var firstDate=document.getElementById("excel1").value;
		var lastDate=document.getElementById("excel2").value;
		
		var date="<a href=./budget_excel.bg?firstDate="+firstDate+"&lastDate="+lastDate+" download='budget.xls'><button type=button class='btn btn-info'>" +
				"<span class='glyphicon glyphicon-save'></span></button></a>";
	
		console.log(date);
		$('#excel3').append(date);
	
	}
	


	function graphy(amount_residual, sum_amount_spent) {
		$("#graph").html("");
		$.jqplot('graph', [ [ [ '사용금액 : ' + sum_amount_spent, sum_amount_spent ], [ '남은금액 : ' + amount_residual, amount_residual ] ] ],
			{
				seriesDefaults : {
					//원형으로 렌더링
					renderer : $.jqplot.PieRenderer,

					//원형상단에 값보여주기(알아서 %형으로 변환)

					rendererOptions : {
						showDataLabels : true,
					}
				},
				//우측 색상별 타이틀 출력
				legend : {
					show : true,
					location : 'e'
				}
			}
		);

	}
	;
	function graph2(value1, value2, value3) {
		var s1 = value1;
		var s2 = value2;
		
		console.log(s1);
		console.log(s2);
		
		$("#chart5").html("");
		plot1 = $.jqplot("chart5", [ s1, s2 ], {
			// Turns on animatino for all series in this plot.
			animate : true,
			// Will animate plot on calls to plot1.replot({resetAxes:true})
			animateReplot : true,
			cursor : {
				show : true,
				zoom : true,
				looseZoom : true,
				showTooltip : false
			},
			series : [
				{
					pointLabels : {
						show : true
					},
					renderer : $.jqplot.BarRenderer,
					showHighlight : false,
					yaxis : 'y2axis',
					rendererOptions : {
						// Speed up the animation a little bit.
						// This is a number of milliseconds.  
						// Default for bar series is 3000.  
						animation : {
							speed : 2500
						},
						barWidth : 15,
						barPadding : -15,
						barMargin : 0,
						highlightMouseOver : false
					}
				},
				{
					rendererOptions : {
						// speed up the animation a little bit.
						// This is a number of milliseconds.
						// Default for a line series is 2500.
						animation : {
							speed : 2000
						}
					}
				},
				
			],
			axesDefaults : {
				pad : 0
			},
			axes : {
				// These options will set up the x axis like a category axis.
				xaxis : {
					renderer : $.jqplot.CategoryAxisRenderer,
					ticks : value3
				},
				yaxis : {
					tickOptions : {
						formatString : "%'d원"
					},
					rendererOptions : {
						forceTickAt0 : true
					}
				},
				y2axis : {
					tickOptions : {
						formatString : "%'d원"
					},
					rendererOptions : {
						// align the ticks on the y2 axis with the y axis.
						alignTicks : true,
						forceTickAt0 : true
					}
				}
			},
			highlighter : {
				show : true,
				showLabel : true,
				formatString : "%'s월",
				tooltipAxes : 'y',
				sizeAdjust : 7.5,
				tooltipLocation : 'ne'
			}
		});

	}
	function graph3(value1, value2, value3) {
		var s1 = value1;
		var s2 = value2;
		var ticks = value3;

		$("#chart6").html("");
		plot2 = $.jqplot('chart6', [ s1, s2 ], {
			seriesDefaults : {
				label : 'TEST11111',
				renderer : $.jqplot.BarRenderer,
				pointLabels : {
					show : true
				}
			},
			axes : {
				xaxis : {
					renderer : $.jqplot.CategoryAxisRenderer,
					ticks : ticks
				}
			},


			legend : {		
				show : true, 
				labels : ticks, 
				location : 'ne', 
				placement : 'insideGrid' ,
				labels:[ '남은금액','사용금액']
				}
				
			
			
		});

		$('#chart2').bind('jqplotDataHighlight',
			function(ev, seriesIndex, pointIndex, data) {
				$('#info2').html('series: ' + seriesIndex + ', point: ' + pointIndex + ', data: ' + data);
			}
		);

		$('#chart2').bind('jqplotDataUnhighlight',
			function(ev) {
				$('#info2').html('Nothing');
			}
		);
	}
	;


	$(document).ready(function() {
		$("input").mouseover(function() {
			$(this).css("background-color", "yellow");
		});

		$("input").mouseout(function() {
			$(this).css("background-color", "lightgray");
		});
	});

	var selectRequest = new XMLHttpRequest();
	var insertRequest = new XMLHttpRequest();

	function selectFunction() {
	
		selectRequest.open("Post", "./budget_list.bg?date=" + document.getElementById("cal").value, true);
		selectRequest.onreadystatechange = selectProcess;
		selectRequest.send(null);
		total_listFunction();
	}

	function selectProcess() {
		var table = document.getElementById("budgetTable");
		table.innerHTML = "";
		var sum_amount = 0;
		var sum_amount_spent = 0;

		if (selectRequest.readyState == 4 && selectRequest.status == 200) {
			var object = eval('(' + selectRequest.responseText + ')');
			var result = object.result;
			var row = "";

			var graph3Val1 = new Array();
			var graph3Val2 = new Array();
			var graph3Val3 = new Array();

			for (var i = 0; i < result.length; i++) {
				row += "<tr>"


				sum_amount += parseInt(result[i][1].value)
				sum_amount_spent += parseInt(result[i][3].value)
				
			
				
				
				row += "<input type=hidden class=aa id=update_item_code" + i + " value=" + result[i][0].value + ">"
				row += "<td>"+ result[i][0].value + "</td>"
				if(i!=result.length-1){
				row += "<td><input type=text class=aa id=update_amount" + i + " value=" + result[i][1].value + "></td>"
				}else{
					row+="<td>"+result[i][1].value+"</td>"
				}
				row += "<input type=hidden id=update_budget_code" + i + " value=" + result[i][2].value + ">"
				row += "<td>" + result[i][3].value +"</td>"
				row += "<td>" + ((result[i][1].value) - (result[i][3].value)) + "</td>"
				if(i!=result.length-1){
				row += "<td><input type=date id=update_date" + i + " value="+result[i][4].value+"></td>"
				row += "<td colspan=1><button class=btn btn-primary pull-right onclick=updateFunction(" + i + "); type=button >" + "수정" + "</button></td>"
				row += "<td colspan=1><button class=btn btn-primary pull-right onclick=deleteFunction(" + result[i][2].value + "); type=button >" + "삭제" + "</button></td>"
				row += "</tr>"
				}
				graph3Val1.push(parseInt(result[i][3].value));
				graph3Val2.push((result[i][1].value) - (result[i][3].value));
				graph3Val3.push(result[i][0].value);

			}



			$('#budgetTable').append(row);

			
			var amount_residual = sum_amount - sum_amount_spent

			console.log(typeof graph3Val1);
			console.log(typeof graph3Val2);
			console.log(typeof graph3Val3);


			
			
			if(result.length>0){
			graphy(amount_residual, sum_amount_spent);
			graph3(graph3Val1, graph3Val2, graph3Val3);
			
			}else{
				$("#graph").html("");
				$('#graph').append("데이터가 없습니다.");
				$("#chart6").html("");
				$('#chart6').append("데이터가 없습니다.");
				
				
			}

		}
	}

	function updateFunction(i) {
		$.ajax(
			{
				
				url : "./budget_modify.bg?budget_date=" + document.getElementById("update_date" + i).value + "&budget_amount=" + document.getElementById("update_amount" + i).value
					+ "&budget_code=" + document.getElementById("update_budget_code" + i).value +"&item_code=" + document.getElementById("update_item_code"+i).value,
				type : 'GET',
				success : function(result) {
					if (result == 1) {
						alert('이미 존재하는 예산입니다.')
					}else{
					selectFunction();
					}
				},
				error : function() {
					alert('통신실패!!');
				}
			}
		)
	}

	function item_list() {
		
		$.ajax(
			{
				url : './item_list.bg',
				type : 'GET',
				dataType : 'json',
				success : function(data) {
					var jsonObj = data;
					var result = jsonObj.item_list;
					
					var row="";
					for (var i = 0; i < result.length; i++) {
						row+="<option value="+result[i]+">"+result[i]+"</option>";
					}
					
					$("#item_code").html("");
					$('#item_code').append(row);

				},
				error : function() {
					alert('제이슨통신실패!!');
				}
			})
	}
	
	function total_listFunction() {
		var firstDate=document.getElementById("total_firstDate").value;
		var lastDate=document.getElementById("total_lastDate").value;
		
		$.ajax(
			{
				url : "./budget_list_total.bg?firstDate="+firstDate+"&lastDate="+lastDate,
				type : 'GET',
				dataType : 'text',
				success : function(data) {
					var jsonObj = JSON.parse(data);
					var result = jsonObj.result;
					var value1 = new Array();
					var value2 = new Array();
					var value3 = new Array();
					for (var i = 0; i < result.length; i++) {

						value1.push(parseInt(result[i][0].value));
						value2.push(parseInt(result[i][1].value));
						value3.push(result[i][2].value);

					}

					if(result.length>0){
					graph2(value1, value2,value3);
					
					}else{
						$("#chart5").html("");
						$('#chart5').append("데이터가 없습니다.");
					
					}
				},
				error : function() {
					alert('제이슨통신실패!!');
				}
			})
	}

	function deleteFunction(budget_code) {
		$.ajax(
			{
				url : './budget_delete.bg?budget_code=' + budget_code,
				type : 'POST',
				dataType : 'text',
				success : function(result) {
					selectFunction();
				},
				error : function() {
					alert('통신실패!!');
				}
			})

	}

	function insertFunction() {
		insertRequest.open("Post", "./budget_insert.bg?budget_amount=" + encodeURIComponent(document.getElementById("budget_amount").value) + 
		"&item_code=" + encodeURIComponent(document.getElementById("item_code").value)+"&budget_date=" + encodeURIComponent(document.getElementById("budget_date").value), true);
		insertRequest.onreadystatechange = insertProcess;
		insertRequest.send(null);
	}

	function insertProcess() {
		if (insertRequest.readyState == 4 && insertRequest.status == 200) {
			var result = insertRequest.responseText;
			if (result == 1) {
				alert('이미 존재하는 예산입니다.')
			}
		}else {
			var budget_amount = document.getElementById("budget_amount");
			var item_code = document.getElementById("item_code");
			budget_amount.value = "";
			item_code.value = "";
			selectFunction();
		}
	}

