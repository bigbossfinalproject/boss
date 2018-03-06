/**
 *  income Chart
 *  - 소득 테이블에 차트 뿌리는 용도.  
 */

function drawChart(){
	$.ajax({
		async : 'false',
		url : './list2.io',
		type : 'post',
		dataType : 'text',

		success : function(data) {
			var data_Json = JSON.parse(data);
			var result = data_Json.result;
			var line = new Array();

			for (var i = 0; i < result.length; i++) {
				var linepush = new Array();
				linepush.push(result[i][1].value, (Number)(result[i][5].value));
				line[i] = linepush;

			}
			console.log(line);
			$("#income_chart").html("");
			var plot1 = $.jqplot('income_chart', [ line ], {
				axes : {
					xaxis : {
						renderer : $.jqplot.DateAxisRenderer,
						tickOptions : {
							formatString : '%y-%m-%d'
						}
					}
				},
				series:[{lineWidth:4, markerOptions:{style:'square'}}]
			});
		},

		error : function(xhr, status) {
			alert(xhr + " : " + status);
		}
	});

};