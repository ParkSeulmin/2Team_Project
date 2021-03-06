
<%@page import="Board.DTO.Board"%>
<%@page import="Login.DTO.Member"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%

// session
		Member user = null;
		String id = "";
		if(session.getAttribute("user") != null){
			user = (Member)session.getAttribute("user");
			id = user.getId();
		}		
		
		System.out.println("session id check: "+ id);

	/* int boardtype = Integer.parseInt(request.getParameter("boardtype"));
	System.out.println("write boardtype: "+boardtype); */
	
	Board board = (Board)request.getAttribute("boarddata");
	System.out.println(board.getBo_no());
%>

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
<link href="<%=request.getContextPath()%>/assets/css/bootstrap.css" rel="stylesheet">
<!--external css-->
<link href="<%=request.getContextPath()%>/assets/font-awesome/css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/css/zabuto_calendar.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/js/gritter/css/jquery.gritter.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/lineicons/style.css">

<!-- Custom styles for this template -->
<link href="<%=request.getContextPath()%>/assets/css/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/assets/css/style-responsive.css" rel="stylesheet">

<script src="assets/js/chart-master/Chart.js"></script>

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

		<script type="text/javascript" 
	src="<%=request.getContextPath()%>/Board/ckeditor/ckeditor.js">
	</script>
	 
	
	<script type="text/javascript">
	function modifyboard(){
		
		if (!modifyform.BOARD_SUBJECT.value) {
			alert("제목을 입력하세요");
			modifyform.BOARD_SUBJECT.focus();
			return false;
		}
		
		var ckeditor = CKEDITOR.instances['BOARD_CONTENT']; //객체가져오기
        if (ckeditor.getData()=="") {//null값은 안옴 = 빈문자열
             alert("글 내용을 입력하세요");
             ckeditor.focus();
             return false;
        }
		
		
		modifyform.submit();
	}
	
	</script>
</head>
<body style>	
	

 
<c:import url="/Include/Header.jsp" />


	<section id="main-content">
          <section class="wrapper">
           <div class="row">
           	
           	<h3><i class="fa fa-angle-right"></i>BOARD VIEW</h3>
          	<div class="row mt">
          		<div class="col-lg-12">
          		<p>게시판 보기</p>
          		</div>
          	</div>
	                <hr>
           	
				 <div  class="col-lg-9 main-chart" align="center">

		<!-- 게시판 수정 -->
		<form action="BoardModifyAction.bo" method="post" name="modifyform">
		<input type="hidden" name="BOARD_NUM" value="<%=board.getBo_no() %>">
		<input type="hidden" name="BOARD_ID" value="<%=user.getId()%>">
		<div class="content-panel">
		<div class="alert alert-info"><b>BOARD MODIFIY</b></div>
		<table cellpadding="0" cellspacing="0" width="100%">
			 
			<tr>
				<td height="16" style="font-family:돋음; font-size:12">
					<div align="center"><b>&nbsp;제 목&nbsp;</b></div>
				</td>
				<td>
					 
					<input name="BOARD_SUBJECT" type="text" value="<%=board.getBo_title()%>" class="form-control">
				</td>
			</tr>
			<tr>
				<td style="font-family:돋음; font-size:12">
					<div align="center"><b>&nbsp;내 용&nbsp;</b></div>
				</td>
				<td>
					<textarea name="BOARD_CONTENT" cols="80" rows="15"><%=board.getBo_content() %></textarea>
					 <script type="text/javascript">
						 CKEDITOR.replace('BOARD_CONTENT',{
					            toolbar: 'Full'
					        }
					    );
					 </script>
				</td>
			</tr>
			<%if(!(board.getBo_file()==null)){ %>
			<tr>
				<td style="font-family:돋음; font-size:12">
					<div align="center"><b>파일첨부</b></div>
				</td>
				<td>
					&nbsp;&nbsp;<%=board.getBo_file() %>
				</td>
			</tr>
			<%} %>
			
			<tr bgcolor="cccccc">
				<td colspan="2" style="height:1px;">
				</td>
			</tr>
			<tr><td colspan="2">&nbsp;</td></tr>
			
			<tr align="center" valign="middle">
				<td colspan="5">
					<font size=2>
					<a href="javascript:modifyboard()">
						<button type="button" class="btn btn-success">&nbsp;수 정&nbsp;</button>  </a>&nbsp;&nbsp;
					<a href="./BoardList.bo?boardtype=<%=board.getBo_id() %>">
					<button type="button" class="btn btn-danger">&nbsp;뒤로&nbsp;</button></a>&nbsp;&nbsp;
					</font>
				</td>
			</tr>
		</table>
		</div>
		</form>
		</div>
		
			<div class="col-lg-3 ds">
					 <!-- CALENDAR-->
                        <div id="calendar" class="mb">
                            <div class="panel green-panel no-margin">
                                <div class="panel-body">
                                    <div id="date-popover" class="popover top" style="cursor: pointer; disadding: block; margin-left: 33%; margin-top: -50px; width: 175px;">
                                        <div class="arrow"></div>
                                        <h3 class="popover-title" style="disadding: none;"></h3>
                                        <div id="date-popover-content" class="popover-content"></div>
                                    </div>
                                    <div id="my-calendar"></div>
                                </div>
                            </div>
                        </div> 
                  </div>
           	 
           	 
           	</div>
          </section>
    </section>
           	 






 <%-- <section id="main-content">
          <section class="wrapper">
			<h3><i class="fa fa-angle-right"></i>게시글 쓰기</h3>
          		<div class="row mt">
          		<div class="col-lg-12">
          		<p>글쓰기</p>
          		</div>
          	</div>
		 
	</section><!--/wrapper -->
      </section><!-- /MAIN CONTENT --> --%>
	 
 <!-- js placed at the end of the document so the pages load faster -->
	<script src="<%=request.getContextPath()%>/assets/js/jquery.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/jquery-1.8.3.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/bootstrap.min.js"></script>
	<script class="include" type="text/javascript"
		src="<%=request.getContextPath()%>/assets/js/jquery.dcjqaccordion.2.7.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/jquery.scrollTo.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/jquery.nicescroll.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/assets/js/jquery.sparkline.js"></script>


	<!--common script for all pages-->
	<script src="<%=request.getContextPath()%>/assets/js/common-scripts.js"></script>

	<script type="text/javascript"
		src="<%=request.getContextPath()%>/assets/js/gritter/js/jquery.gritter.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/gritter-conf.js"></script>

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



</body>
</html>	 
