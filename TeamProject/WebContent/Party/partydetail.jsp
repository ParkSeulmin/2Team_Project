<%@page import="Login.DTO.Member"%>
<%@page import="Meeting.DTO.Party_DTO"%>
<%@page import="java.util.List"%>
<%@page import="Meeting.DTO.Party_DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	List detaillist = (List) request.getAttribute("detail");
	Member user = (Member) session.getAttribute("user");
	if (session.getAttribute("user") != null) {
		user = (Member) session.getAttribute("user");
	}
	String partyid = request.getParameter("partyid");//party_idx
	System.out.println("partydetail.jsp " + partyid);
	int count =(Integer)request.getAttribute("count");
%>
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
</style>
</head>
<body style>
	<c:import url="/Include/Header.jsp" />

	<form action="./Partydetailinsert.ps">
		<section id="main-content"> <input type="hidden"
			name="user" id="user" value="<%=user.getId()%>"> <input
			type="hidden" name="partyid" id="partyid" value="<%=partyid%>">
		<section class="wrapper site-min-height">
		<div class="content-panel">
			<h4>
				<i class="fa fa-angle-right"></i> Party 상세정보
			</h4>
			<hr>
			<table class="table table-striped table-advance table-hover">
				<thead>
					<tr>
						<th><i class="fa fa-bullhorn"></i>제목</th>
						<th class="hidden-phone"><i class="fa fa-question-circle"></i>일정</th>
						<th><i class="fa fa-bookmark"></i>장소</th>
						<th><i class=" fa fa-edit"></i> 최대인원</th>
						<th><i class=" fa fa-edit"></i> 상태</th>
						<th><i class=" fa fa-edit"></i> 신청</th>
					</tr>
				</thead>
				<tbody>
					<%
								for (int i = 0; i < detaillist.size(); i++) {
									Party_DTO list = (Party_DTO) detaillist.get(i);
							%>
					<tr>
						<td><a href=""><%=list.getP_TITLE() %></a></td>
						<td class="hidden-phone"><%=list.getP_DATE() %></td>
						<td><%=list.getP_AREA() %></td>
						<td><%=count %>/<%=list.getP_MAXPEOPLE() %></td>
						
					<%
						if(count<list.getP_MAXPEOPLE()){
					%>	
						<td id="status"><%=list.getP_STATUS() %></td>
							<td><input type="submit" class="btn btn-danger" value="파티신청"></td>
					<%
						}else{
					%>
						<td id="status">마감</td>
						<td><label class="btn btn-danger">신청마감</label></td>
					<%
						}
					%>
					
					</tr>
					<%
								}
                              %>
				</tbody>

			</table>
			<div align="center">
				<a href="./Partylist.party">
					<button type="button" class="btn btn-theme04">
						<i class="fa fa-heart"></i>목록
					</button>
				</a>
			</div>
		</div>



		</section> </section>
	</form>
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
	<script
		src="<%=request.getContextPath()%>/assets/js/sparkline-chart.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/js/zabuto_calendar.js"></script>



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
	<script type="text/javascript">
		$(function() {
			//    fancybox
			jQuery(".fancybox").fancybox();
		});
	</script>
	<script>
		//custom select box

		$(function() {
			$("select.styled").customSelect();
		});
	</script>
</body>
