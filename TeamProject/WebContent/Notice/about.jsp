<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Dashboard">
<meta name="keyword"
	content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

<title>DASHGUM - FREE Bootstrap Admin Template</title>

<!-- Bootstrap core CSS -->
<link href="<%=request.getContextPath()%>/assets/css/bootstrap.css"
	rel="stylesheet">

<!--external css-->
<link
	href="<%=request.getContextPath()%>/assets/font-awesome/css/font-awesome.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/css/zabuto_calendar.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/js/gritter/css/jquery.gritter.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/lineicons/style.css">

<!-- Custom styles for this template -->
<link href="<%=request.getContextPath()%>/assets/css/style.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/assets/css/style-responsive.css"
	rel="stylesheet">

<script
	src="<%=request.getContextPath()%>/assets/js/chart-master/Chart.js"></script>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style type="text/css">
.jqstooltip {
	position: absolute;
	left: 0px;
	top: 0px;
	display: block;
	visibility: hidden;
	background: rgb(0, 0, 0) transparent;
	background-color: rgba(0, 0, 0, 0.6);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000,
		endColorstr=#99000000);
	-ms-filter:
		"progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";
	color: white;
	font: 10px arial, san serif;
	text-align: left;
	white-space: nowrap;
	border: 1px solid white;
	z-index: 10000;
}

.jqsfield {
	color: white;
	padding: 5px 5px 8px 5px;
	font: 10px arial, san serif;
	text-align: left;
}

span.black_bg {
	background-color: black;
	color: #e3c069;
	font-weight: bold;
	font-size: 16px;
	padding: 1px 4px 1px 4px;
}

pan.black_bg2 em {
	background-color: black;
	color: #e3c069;
	font-weight: bold;
	font-size: 13px;
	padding: 2px 2px 2px 2px;
}
</style>

 <!--위대한 style  -->
<!-- <style type="text/css">
.cont01 {
	height: 182px;
	background: #c1454a;
	margin: 0;
	padding: 0;
	background: url(../image/sub/sub01_01_img02.jpg) bottom center no-repeat
}

.cont01 h1 {
	color: #fff;
	font-size: 32px;
	line-height: 28px;
	padding: 40px 0 0 317px
}

.cont01 span {
	color: #e1b2b4;
	font-family: 'Source Sans Pro', serif;
	font-weight: 600;
	font-size: 12px;
	letter-spacing: 1.5px;
	padding: 0 0 0 320px
}

.cont01 p {
	color: #fff;
	font-size: 15px;
	padding: 5px 30px 0 320px;
	line-height: 18px
}

.cont02 {
	height: 191px;
	background: #c1454a;
	margin: 0;
	padding: 0;
	background: url(../image/sub/sub01_01_img03.jpg) bottom center no-repeat
}

.cont02 h1 {
	color: #fff;
	font-size: 32px;
	line-height: 28px;
	padding: 50px 0 0 317px
}

.cont02 span {
	color: #f1c2a3;
	font-family: 'Source Sans Pro', serif;
	font-weight: 600;
	font-size: 12px;
	letter-spacing: 1.5px;
	padding: 0 0 0 320px
}

.cont02 p {
	color: #fff;
	font-size: 15px;
	padding: 5px 30px 0 320px;
	line-height: 18px
}

.cont03 {
	height: 191px;
	background: #c1454a;
	margin: 0;
	padding: 0;
	background: url(../image/sub/sub01_01_img04.jpg) bottom center no-repeat
}

.cont03 h1 {
	color: #fff;
	font-size: 32px;
	line-height: 28px;
	padding: 45px 0 0 317px
}

.cont03 span {
	color: #86888a;
	font-family: 'Source Sans Pro', serif;
	font-weight: 600;
	font-size: 12px;
	letter-spacing: 1.5px;
	padding: 0 0 0 320px
}

.cont03 p {
	color: #fff;
	font-size: 15px;
	padding: 5px 30px 0 320px;
	line-height: 18px
}

.cont04 {
	height: 191px;
	background: #c1454a;
	margin: 0;
	padding: 0;
	background: url(../image/sub/sub01_01_img05.jpg) bottom center no-repeat
}

.cont04 h1 {
	color: #fff;
	font-size: 32px;
	line-height: 28px;
	padding: 45px 0 0 317px
}

.cont04 span {
	color: #e1b2b4;
	font-family: 'Source Sans Pro', serif;
	font-weight: 600;
	font-size: 12px;
	letter-spacing: 1.5px;
	padding: 0 0 0 320px
}

.cont04 p {
	color: #fff;
	font-size: 15px;
	padding: 5px 30px 0 320px;
	line-height: 18px
}


</style> -->
</head>
<body style>
	<c:import url="/Include/Header.jsp" />
	<section id="main-content"> <section
		class="wrapper site-min-height">

	<h3>
		<i class="fa fa-angle-right"></i> About Us
	</h3>
	<!-- 글소개 -->
	<div class="content-panel">
		<div class="great_date">
			<img src="<%=request.getContextPath()%>/Images/qqqqqq.JPG">
		</div>
	</div>


	<h3>
		<i class="fa fa-angle-right"></i> WHAT?
	</h3>
	
	<div class="showback">
		<img src="<%=request.getContextPath()%>/Images/ssss.png">
	</div>

	<div style="padding: 5px;" align="center"></div>

	</section> </section>

</body>
<!--section 끝 스크립트  -->
<!-- js placed at the end of the document so the pages load faster -->
<script src="<%=request.getContextPath()%>/assets/js/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/assets/js/jquery-1.8.3.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/bootstrap.min.js"></script>
<script class="include" type="text/javascript"
	src="<%=request.getContextPath()%>/assets/js/jquery.dcjqaccordion.2.7.js"></script>
<script
	src="<%=request.getContextPath()%>/assets/js/jquery.scrollTo.min.js"></script>
<script
	src="<%=request.getContextPath()%>/assets/js/jquery.nicescroll.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/assets/js/jquery.sparkline.js"></script>


<!--common script for all pages-->
<script src="<%=request.getContextPath()%>/assets/js/common-scripts.js"></script>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/assets/js/gritter/js/jquery.gritter.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/assets/js/gritter-conf.js"></script>

<!--script for this page-->
<script src="<%=request.getContextPath()%>/assets/js/sparkline-chart.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/zabuto_calendar.js"></script>


<script type="application/javascript">
	
	
	
	
        $(document).ready(function () {
            $("#date-popover").popover({html: true, trigger: "manual"});
            $("#date-popover").hide();
            $("#date-popover").click(function (e) {
                $(this).hide();
            });
        
            $("#my-calendar").zabuto_calendar({
                action: function () {
                    return myDateFunction(this.id, false);
                },
                action_nav: function () {
                    return myNavFunction(this.id);
                },
                ajax: {
                    url: "show_data.php?action=1",
                    modal: true
                },
                legend: [
                    {type: "text", label: "Special event", badge: "00"},
                    {type: "block", label: "Regular event", }
                ]
            });
        });
        
        function myNavFunction(id) {
            $("#date-popover").hide();
            var nav = $("#" + id).data("navigation");
            var to = $("#" + id).data("to");
            console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
        }
	



</script>

<script>
	//custom select box

	$(function() {
		$('select.styled').customSelect();
	});
</script>