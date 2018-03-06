/**
 *  income Chart
 *  - 소득 테이블에 차트 뿌리는 용도.  
 */

function drawChart() {
	$.ajax({
		async : 'false',
		url : './list2.io',
		type : 'post',
		dataType : 'text',

		success : function(data) {
			var data_Json = JSON.parse(data);
			var result = data_Json.result;
			var line = new Array();
			var x = new Array();
			for (var i = 0; i < result.length; i++) {

				x[i] = result[i][1].value;
				line[i] = (Number)(result[i][5].value);



			}
			console.log(line);
			$("#income_chart").html("");

			if (result.length > 0) {
				var plot1 = $.jqplot('income_chart', [ line ], {
					// Only animate if we're not using excanvas (not in IE 7 or IE 8)..
					animate : !$.jqplot.use_excanvas,
					seriesDefaults : {
						renderer : $.jqplot.BarRenderer,
						pointLabels : {
							show : true
						}
					},
					axes : {
						xaxis : {
							renderer : $.jqplot.CategoryAxisRenderer,
							ticks : x
						}
					},
					highlighter : {
						show : false
					},
					legend : {
						show : true,
						location : 'e',
						placement : 'outside'
					}
				});
			} else {
				$('#income_chart').append("데이터가 없습니다.");
			}
		},

		error : function(xhr, status) {
			alert(xhr + " : " + status);
		}
	});

}
;