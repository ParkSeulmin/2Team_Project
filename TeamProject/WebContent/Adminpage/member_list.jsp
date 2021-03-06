<%@page import="Login.DTO.Member"%>
 
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
// session
      Member user = null;
      String id = null;
      if(session.getAttribute("user") != null){         
         user = (Member)session.getAttribute("user");
         id = user.getId();
      }      
      
      System.out.println("session id check: "+ id);
      
      
   List MemberList=(List)request.getAttribute("memberlist");
   int membercount=0;
   if(request.getAttribute("membercount") != null){
      membercount = ((Integer)request.getAttribute("membercount")).intValue();
   }
    
   int nowpage=((Integer)request.getAttribute("mpage")).intValue();
   int maxpage=((Integer)request.getAttribute("mmaxpage")).intValue();
   int startpage=((Integer)request.getAttribute("mstartpage")).intValue();
   int endpage=((Integer)request.getAttribute("mendpage")).intValue();
     
   System.out.println("memberlist 뽑기 page: "+nowpage);
   
   
    
%>

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

<script src="<%=request.getContextPath()%>/assets/js/chart-master/Chart.js"></script>

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
  <c:import url="/Include/Header.jsp"/>
  <c:set var="listcount" value="<%=membercount%>"></c:set>
  <c:set var="page" value="<%=nowpage%>"/>
 <section id="main-content">
          <section class="wrapper">
 
   
      
      <div class="row mt">
                  <div class="col-md-12">
                      <div class="content-panel">
                          <table class="table table-striped table-advance table-hover">
                               <h4><i class="fa fa-angle-right"></i> Member List Table (Admin)</h4>
                               <div>
                        <font size=2>&nbsp;&nbsp; TOTAL : ${listcount}
                                 &nbsp;&nbsp;|&nbsp;&nbsp; ${page} 페이지   
                        </font>
                       
                        </div>
                               
                               <hr>
                               
                              <thead>
                              <tr>
                                  <th><i class=" "></i> PROFILE PIC</th>
                                  <th class=" "> </i>ID</th>
                                  <th><i class="fa fa-bookmark"></i> NAME</th>
                                  <th><i class="fa fa-bookmark"></i> NICNAME</th>
                                  <th><i class=" fa fa-edit"></i> GENDER</th>
                                  <th><i class=" fa fa-edit"></i> AGE</th>
                                  <th><i class=" fa fa-edit"></i> EMAIL</th>
                                  <th><i class=" fa fa-edit"></i> ADDR</th>
                                  <th><i class=" fa fa-edit"></i> JOIN-DATE</th>
                                  <th><i class=" fa fa-edit"></i> DELETE</th>
                              </tr>
                              </thead>
                              <tbody>
                              <tr>
                                <%
                        for(int i=0;i<MemberList.size();i++){
                           Member ml=(Member)MemberList.get(i);
                                        
                        %>
                         <c:set var="gender" value="<%=ml.getGender()%>"/>
                            <tr class="" align="center" valign="middle" bordercolor="#333333"
                              onmouseover="this.style.backgroundColor='#FFEBFF'"
                              onmouseout="this.style.backgroundColor=''">
                           <td>
                              <c:set var="pimg" value="<%=ml.getU_mypicture()%>"/>
                              <c:choose>
                                 <c:when test="${pimg != null}">
                                    <img alt="<%=ml.getId()%>님 프로필사진" 
                                    src="<%=request.getContextPath()+"/boardupload/"+ml.getU_mypicture()%>"
                                    width="103px" height="132px">
                                 </c:when>
                                 <c:otherwise>
                                       <c:choose>
                                          <c:when test="${gender == 1}">
                                                <img alt="default_male" 
                                                src="<%=request.getContextPath()%>/Images/defaultimg/default_male.png"
                                                width="103px" height="132px">
                                             </c:when>
                                             <c:when test="${gender == 2}">
                                                <img alt="default_female" 
                                                src="<%=request.getContextPath()%>/Images/defaultimg/default_female.PNG"
                                                width="103px" height="132px">
                                             </c:when>
                                       </c:choose>
                                 </c:otherwise>
                              </c:choose>
                              
                           </td>   
                              <td class="td_num"> <%=ml.getId()%> </td>
                              <td class="td_subject"><%=ml.getName()%></td>
                              <td class="td_name sv_use"><span class="sv_member"><%=ml.getNick()%></span></td>
                              
                              <c:choose>
                                 <c:when test="${gender == 1}">
                                    <c:set var="u_gender" value="남자"/>
                                 </c:when>
                                 <c:when test="${gender == 2}">
                                    <c:set var="u_gender" value="여자"/>
                                 </c:when>
                                 <c:otherwise>
                                    <c:set var="u_gender" value="-"/>
                                 </c:otherwise>
                              </c:choose>
                              <td class="td_num">${u_gender}</td>
                              <td class="td_num"><%=ml.getAge() %></td>
                              <td class="td_num"><%=ml.getPhone() %></td>
                              <td class="td_num"><%=ml.getEmail() %></td>
                              <td class="td_num"><%=ml.getAddress() %></td>
                              <td class="td_date"><%=ml.getU_joindate()%></td>
                             
                             
                             
                                  <td>
                                      
                                      <button class="btn btn-danger btn-xs"
                                            onclick="location.href='./AdminPwdCheckPageMember.admin?u_id=<%=ml.getId()%>'">   
                                      <i class="fa fa-trash-o "></i></button>
                                  </td>
                              </tr>
                             
                              <%      } 
                        
                     %>
                              <tr align=center height=20>
                        <td colspan=11 style=font-family:Tahoma;font-size:10pt;>
                           <%if(nowpage<=1){ %>
                           [이전]&nbsp;
                           <%}else{ %>
                           <a href="./MemberList.admin?mpage=<%=nowpage-1 %>">[이전]</a>&nbsp;
                           <%} %>
                           
                           <%for(int a=startpage;a<=endpage;a++){
                              if(a==nowpage){%>
                              [<%=a %>]
                              <%}else{ %>
                              <a href="./MemberList.admin?mpage=<%=a %>">[<%=a %>]</a>
                              &nbsp;
                              <%} %>
                           <%} %>
                           
                           <%if(nowpage>=maxpage){ %>
                           [다음]
                           <%}else{ %>
                           <a href="./MemberList.admin?mpage=<%=nowpage+1 %>">[다음]</a>
                           <%} %>
                        </td>
                     </tr>
                             
                              </tbody>
                          </table>
                      </div><!-- /content-panel -->
                  </div><!-- /col-md-12 -->
              </div><!-- /row -->
   
   
    
       </section><!--/wrapper -->
      </section><!-- /MAIN CONTENT -->
    
    
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