<%@ taglib prefix="s" uri="/struts-tags" %> 

<%@ page import="java.io.*" %> 


<script>


var subid1=12;
//alert(subid1);    
//var jsonPieChartData = $.ajax({
      url: "/var/www/price_simulator/getpiechartdata.php",
     data: "q="+subid1,
      dataType:"json",
      async: false
    }).responseText;

//alert(jsonPieChartData);
</script>

<html>
  <head>

<style>
#container {
    position: absolute;
    margin: 0px;
    padding: 0px;
    width: 160%;
    height: 70%;
    top:44%;	
     
}

.box {
    position: absolute;
    width: 100%;
    height: 300px;
    line-height: 300px;
    font-size: 50px;
    text-align: center;
    border: 2px solid black;
    left: 100%;
    top: -1px;
    margin-left:-1px;
}

#box1 {
   
    left: 0%;
}

#box2 {
   
}

#box3 {
    background-color: red;
}
#mask{
   
    position: absolute;
    width: 50%;
    height: 300px;
    overflow:hidden;
}
#box4 {
    background-color: orange;
}

#box5 {
    background-color: blue;
}




.myButton11 {
	background-color:#44c767;
	-moz-border-radius:28px;
	-webkit-border-radius:28px;
	border-radius:28px;
	border:1px solid #18ab29;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Courier New;
	font-size:17px;
	padding:11px 27px;
	text-decoration:none;
	text-shadow:0px 1px 0px #2f6627;
}
.myButton11:hover {
	background-color:#5cbf2a;
}
.myButton11:active {
	position:relative;
	top:1px;}
</style>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Company', 'Share'],
          ['FlipKart',     11],
          ['Snapdeal',      2],
          ['Amazon',  2],
          ['Jabong', 2]






        ]);

        var options  = 
	

	{
         
          chartArea:{top:"1%",width:"100%",height:"80%",left:"1%"},	width:"2px",backgroundColor:"#E1E1EF",title: 'Best Price Popularity',
       legend:'bottom',is3D:'True' };
        var options1 = 
	

	{
         title: 'Best Price Count',pieSliceText: 'label'+'label1',
	
          chartArea:{top:"17%",width:"100%",height:"60%",left:"2%"},is3D:'True',	width:"2px",backgroundColor:"#E1E1EF",legend:'bottom'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));
        chart.draw(data, options);
 var chart1 = new google.visualization.ColumnChart(document.getElementById('barchart'));
        chart1.draw(data, options1);

var chart2 = new google.visualization.PieChart(document.getElementById('piechart1'));
        chart2.draw(data, options);

var chart3 = new google.visualization.PieChart(document.getElementById('piechart1a'));
        chart3.draw(data, options);

var chart4 = new google.visualization.ColumnChart(document.getElementById('barchart1a'));
        chart4.draw(data, options1);

var chart5 = new google.visualization.PieChart(document.getElementById('piechart1b'));
        chart5.draw(data, options);





$("#container").css("display", "none");
      }
    </script>
  </head>
  <body>
    <div id="piechart" style="width: 300px; height: 200px;fill=#E1E1EF,
border-width: 10px;
border-style: solid;
position: absolute;

top: 8%;
border-color: rgb(71, 60, 60);
border-bottom-color: #8D8686;
border-right-color: #8D8686;
border-top-color: #8D8686;
border-left-color: #8D8686;
border-radius: 3px;
-moz-border-radius: 3px;
-webkit-border-radius: 3px"></div>

 <div id="piechart1" style="width: 300px; height: 200px;fill=#E1E1EF,
border-width: 10px;
position: absolute;

left: 63%;
top:8%;
border-style: solid;
border-color: rgb(71, 60, 60);
border-bottom-color: #8D8686;
border-right-color: #8D8686;
border-top-color: #8D8686;
border-left-color: #8D8686;
border-radius: 3px;
-moz-border-radius: 3px;
-webkit-border-radius: 3px"></div>

<div id="morecharts" 
  style="position: absolute;left: 86%;top:15%;">
<div class="myButton11">+</div>




</div>


<div id="barchart" style="width: 300px; height: 200px; position: absolute;
top:8%;
left: 39%; fill=#E1E1EF,
border-width: 10px;
border-style: solid;
border-bottom-color: #8D8686;
border-right-color: #8D8686;
border-top-color: #8D8686;
border-left-color: #8D8686;
border-radius: 3px;
-moz-border-radius: 3px;
-webkit-border-radius: 3px;
box-shadow: 5px 5px 50px #41363A;"></div>

<div id="container">
    <div id="mask" >
    <div id="box1" class="box">

<div id="piechart1a" style="width: 300px; height: 200px;fill=#E1E1EF,
border-width: 10px;
border-style: solid;
position: absolute;

top: 8%;
border-color: rgb(71, 60, 60);
border-bottom-color: #8D8686;
border-right-color: #8D8686;
border-top-color: #8D8686;
border-left-color: #8D8686;
border-radius: 3px;
-moz-border-radius: 3px;
-webkit-border-radius: 3px"></div>

<div id="barchart1a" style="width: 300px; height: 200px; position: absolute;
top:8%;
left: 30%; fill=#E1E1EF,
border-width: 10px;
border-style: solid;
border-bottom-color: #8D8686;
border-right-color: #8D8686;
border-top-color: #8D8686;
border-left-color: #8D8686;
border-radius: 3px;
-moz-border-radius: 3px;
-webkit-border-radius: 3px;
box-shadow: 5px 5px 50px #41363A;"></div>



<div id="piechart1b" style="width: 300px; height: 200px;fill=#E1E1EF,
border-width: 10px;
position: absolute;

left: 63%;
top:8%;
border-style: solid;
border-color: rgb(71, 60, 60);
border-bottom-color: #8D8686;
border-right-color: #8D8686;
border-top-color: #8D8686;
border-left-color: #8D8686;
border-radius: 3px;
-moz-border-radius: 3px;
-webkit-border-radius: 3px"></div>
</div>


   
   
	 
    </div>
</div>

<script>
var ck=0;
$('.myButton11').click(function() {

if(ck%2==0)
{
$('#container').fadeIn('slow', function() {  
        $(this).fadeTo("slow", 1);  
        $('#container').fadeTo("fast", 1);
        $('.numbers').delay(1000).fadeIn({duration:5000, queue:false}).animate({'margin-left':  '100px'}, {duration:1500, queue:false});
    });  
$("#container").css("display", "block");
 

}
else
{
$("#container").css("display", "none");
}
ck=ck+1;

});
/*
$('.box').click(function() {

    $(this).animate({
        left: '-100%'
    }, 500, function() {
        $(this).css('left', '150%');
        $(this).appendTo('#container');
    });

    $(this).next().animate({
        left: '0%'
    }, 500);

$(this).next().animate({
        right: '0%'
    }, 500);

});*/





$(document).ready( function() {
$('#piechart').hover(
    function() {
        $(this).animate({ 'zoom': 1.5 }, 400);
    },
    function() {
        $(this).animate({ 'zoom': 1 }, 200);
    });
});
$(document).ready( function() {
$('#piechart1').hover(
    function() {
        $(this).animate({ 'zoom': 1.5 }, 400);
    },
    function() {
        $(this).animate({ 'zoom': 1 }, 200);
    });
});

$(document).ready( function() {
$('#barchart').hover(
    function() {
        $(this).animate({ 'zoom': 1.5 }, 400);
    },
    function() {
        $(this).animate({ 'zoom': 1 }, 200);
    });
});
</script>

  </body>
</html>
