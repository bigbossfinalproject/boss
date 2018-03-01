	function cofyFunction() {
		$.ajax(
			{
				url : './budget_copy',
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
		$.ajax(
				{
					url : './budget_excel',
					type : 'POST',
					dataType : 'text',
					success : function(result) {
						console.log(result);
						
						alert('통신성공임!!');	
									
					},
					error : function() {
						alert('통신실패!!');
						
						
						
					}
				})
		
		
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
	function graphy2(value1, value2) {
		var s1 = value1;
		var s2 = value2;
		$("#chart5").html("");
		plot1 = $.jqplot("chart5", [ s2, s1 ], {
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
					tickOptions : {
						formatString : "%'d월"
					},
					tickInterval : 1,
					drawMajorGridlines : false,
					drawMinorGridlines : true,
					drawMajorTickMarks : false,
					rendererOptions : {
						tickInset : 0.5,
						minorTicks : 1
					}
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
				location : 'e', 
				placement : 'outsideGrid' ,
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
		console.log(document.getElementById("cal").value);
		selectRequest.open("Post", "./budget_list?date=" + document.getElementById("cal").value, true);
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

				for (var j = 0; j < result[i].length; j++) {

					if (j == 1) {
						sum_amount += parseInt(result[i][1].value)
					}
					if (j == 3) {
						sum_amount_spent += parseInt(result[i][3].value)
					}
					if (j == 2) {
						row += "<input type=hidden id=budget_Id" + i + j + " value=" + result[i][j].value + ">"
					}else if(j==0){
						row += "<td>" +result[i][0].value + "</td>"
					}else{
						row += "<td><input type=text class=aa id=budget_Id" + i + j + " value=" + result[i][j].value + "></td>"
					}
				}

				row += "<td>" + ((result[i][1].value) - (result[i][3].value)) + "</td>"
				row += "<td colspan=1><button class=btn btn-primary pull-right onclick=updateFunction(" + i + "); type=button >" + "수정" + "</button></td>"
				row += "<td colspan=1><button class=btn btn-primary pull-right onclick=deleteFunction(" + result[i][2].value + "); type=button >" + "삭제" + "</button></td>"
				row += "</tr>"


				graph3Val1.push(parseInt(result[i][3].value));
				graph3Val2.push((result[i][1].value) - (result[i][3].value));
				graph3Val3.push(result[i][0].value);

			}



			$('#budgetTable').append(row);

			var amount_residual = sum_amount - sum_amount_spent


			graphy(amount_residual, sum_amount_spent);
			graph3(graph3Val1, graph3Val2, graph3Val3);


		}
	}

	function updateFunction(i) {
		$.ajax(
			{
				url : "./budget_modify?item_code=" + document.getElementById("budget_Id" + i + 0).value + "&budget_amount=" + document.getElementById("budget_Id" + i + 1).value
					+ "&budget_code=" + document.getElementById("budget_Id" + i + 2).value + "&budget_amount_spent=" + document.getElementById("budget_Id" + i + 3).value,
				type : 'GET',
				success : function(result) {
					selectFunction();
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
				url : './item_list',
				type : 'GET',
				dataType : 'json',
				success : function(data) {
					var jsonObj = data;
					var result = jsonObj.item_list;
					
					var row="";
					for (var i = 0; i < result.length; i++) {
						row+="<option value="+result[i]+">"+result[i]+"</option>";
					}
					console.log(row);
					

					$('#item_code').append(row);

				},
				error : function() {
					alert('제이슨통신실패!!');
				}
			})
	}
	
	function total_listFunction() {
		$.ajax(
			{
				url : './budget_list_total',
				type : 'GET',
				dataType : 'text',
				success : function(data) {
					var jsonObj = JSON.parse(data);
					var result = jsonObj.result;
					var value1 = new Array();
					var value2 = new Array();
					for (var i = 0; i < result.length; i++) {
						var value3 = new Array();
						var value4 = new Array();

						value3.push(parseInt(result[i][2].value), parseInt(result[i][0].value));
						value4.push(parseInt(result[i][2].value), parseInt(result[i][1].value));

						value1.push(value3);
						value2.push(value4);
					}

					console.log(value1);
					console.log(value2);

					graphy2(value2, value1)


				},
				error : function() {
					alert('제이슨통신실패!!');
				}
			})
	}

	function deleteFunction(budget_code) {
		$.ajax(
			{
				url : './budget_delete?budget_code=' + budget_code,
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
		insertRequest.open("Post", "./budget_insert?budget_amount=" + encodeURIComponent(document.getElementById("budget_amount").value) + "&item_code=" + encodeURIComponent(document.getElementById("item_code").value), true);
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
