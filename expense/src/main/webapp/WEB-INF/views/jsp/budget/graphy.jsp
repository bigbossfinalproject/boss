<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- <link class="include" rel="stylesheet" type="text/css" href="./resources/dist/jquery.jqplot.min.css" />
<script type="text/javascript" src="./resources/dist/plugins/jqplot.categoryAxisRenderer.min.js"></script>

<script type="text/javascript" src="./resources/dist/jquery.jqplot.min.js"></script>
<script type="text/javascript" src="./resources/dist/plugins/jqplot.pieRenderer.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="./resources/dist/plugins/jqplot.barRenderer.min.js"></script>
   
 -->


 

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="./resources/dist/jquery.jqplot.js"></script>
<script type="text/javascript" src="./resources/dist/plugins/jqplot.barRenderer.js"></script>
<script type="text/javascript" src="./resources/dist/plugins/jqplot.pieRenderer.js"></script>
<script type="text/javascript" src="./resources/dist/plugins/jqplot.categoryAxisRenderer.js"></script>
<script type="text/javascript" src="./resources/dist/plugins/jqplot.pointLabels.js"></script>
<link rel="stylesheet" type="text/css" href="./resources/dist/jquery.jqplot.css" />

<script type="text/javascript">
  $(function(){
   $.jqplot ('graph', [[['첫번째', 50], ['두번째', 22], ['세번째', 38], ['네번째', 30]]],
           {
             seriesDefaults: {
               //원형으로 렌더링
               renderer: $.jqplot.PieRenderer,
               //원형상단에 값보여주기(알아서 %형으로 변환)
               rendererOptions: {
                 showDataLabels: true,
                 dataLabels: 'value'
                 
               }
             },
             //우측 색상별 타이틀 출력
             legend: { show:true, location: 'e' }
           }
   );   
});
 
  $(document).ready(function () {
       var s1 = [[2002, 112000], [2003, 122000], [2004, 104000], [2005, 99000], [2006, 121000], 
       [2007, 148000], [2008, 114000], [2009, 133000], [2010, 161000], [2011, 173000]];
       var s2 = [[2002, 10200], [2003, 10800], [2004, 11200], [2005, 11800], [2006, 12400], 
       [2007, 12800], [2008, 13200], [2009, 12600], [2010, 13100]];
    
       plot1 = $.jqplot("chart5", [s2, s1], {
           // Turns on animatino for all series in this plot.
           animate: true,
           // Will animate plot on calls to plot1.replot({resetAxes:true})
           animateReplot: true,
           cursor: {
               show: true,
               zoom: true,
               looseZoom: true,
               showTooltip: false
           },
           series:[
               {
                   pointLabels: {
                       show: true
                   },
                   renderer: $.jqplot.BarRenderer,
                   showHighlight: false,
                   yaxis: 'y2axis',
                   rendererOptions: {
                       // Speed up the animation a little bit.
                       // This is a number of milliseconds.  
                       // Default for bar series is 3000.  
                       animation: {
                           speed: 2500
                       },
                       barWidth: 15,
                       barPadding: -15,
                       barMargin: 0,
                       highlightMouseOver: false
                   }
               }, 
               {
                   rendererOptions: {
                       // speed up the animation a little bit.
                       // This is a number of milliseconds.
                       // Default for a line series is 2500.
                       animation: {
                           speed: 2000
                       }
                   }
               }
           ],
           axesDefaults: {
               pad: 0
           },
           axes: {
               // These options will set up the x axis like a category axis.
               xaxis: {
                   tickInterval: 1,
                   drawMajorGridlines: false,
                   drawMinorGridlines: true,
                   drawMajorTickMarks: false,
                   rendererOptions: {
                   tickInset: 0.5,
                   minorTicks: 1
               }
               },
               yaxis: {
                   tickOptions: {
                       formatString: "$%'d"
                   },
                   rendererOptions: {
                       forceTickAt0: true
                   }
               },
               y2axis: {
                   tickOptions: {
                       formatString: "$%'d"
                   },
                   rendererOptions: {
                       // align the ticks on the y2 axis with the y axis.
                       alignTicks: true,
                       forceTickAt0: true
                   }
               }
           },
           highlighter: {
               show: true, 
               showLabel: true, 
               tooltipAxes: 'y',
               sizeAdjust: 7.5 , tooltipLocation : 'ne'
           }
       });
      
   });
</script>

<title>Insert title here</title>
</head>
<body>

   <div id="graph" style="width: 700px; height: 304px;"></div>
   
   <br>
   <div id="chart5" style="width: 700px; height: 304px;"></div>
   <br>
   <div id="chart6" style="width: 700px; height: 304px;"></div>
   
   



</body>
</html>