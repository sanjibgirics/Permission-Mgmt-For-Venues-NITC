<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,in.ac.nitc.permission.dbconnection.DBConnection"%>
    <%@ page import="java.text.SimpleDateFormat,java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Lab Admin Home</title>
<link rel="stylesheet" href="/PermissionManagement/WebContent/css/studHomeStyle.css">
</head>
<body>
<%
	
	response.setHeader("Cache-control", "no-cache,no-store,must-revalidate");
	//response.setHeader("Pragma", "no-cache");
	//response.setHeader("Expires", "0");

	if(session.getAttribute("email")==null){
		response.sendRedirect("loginView.jsp");
	}
%>
<br/>
<br/>
<jsp:include page="header.jsp"></jsp:include>
<div style="padding: 5px;float:center">Raise New Permission Request
		<ul class="nav">
   			<li><a href="${pageContext.request.contextPath}/raisePermissionView.jsp">Raise New Permission Request</a></li>
   			<li><a href="${pageContext.request.contextPath}/studentRequestsView.jsp">View All Raised Permissions</a></li>
   			
		</ul>
	</div>
	
	<div style="padding: 5px;float:center">
		<p><b>Admin Responsibilities</b></p>
		<ul  class="nav">
			<li><a href="getAdmin?choice=lab_admin">Show Pending Permission Requests</a></li>
			<li><a href="getAdmin?choice=approved">Show All Approved Permissions</a>
		</ul>
		
	</div>
	<div id="workcontent" style="width:80%;
		margin-top:100px;
		margin-left:10%;
		margin-right:10%;
    height:200px;
    border: 5px solid blue;
    overflow-y: scroll;
    overflow-x: hidden;
    white-space: nowrap;">
    <h2 style="margin-left:10%;">Forth-coming Events</h2>

			 <table cellspacing="20" align="center">
			   <tr style="margin: 5px">
			    <th>Purpose</th>
			    <th>Booked Lab</th>
			    
			    <th>Start Date & Time</th>
			    <th>End Date & Time</th>
			    <th>No of Audience</th>
			  </tr>
			  <%
			    DBConnection dbCon=new DBConnection();
				Connection con=dbCon.getDBConnection();
				String query="";
				ResultSet rs;
				Date myDate = new Date();
               	String currDate=new SimpleDateFormat("yyyy-MM-dd").format(myDate);
               	currDate+=" 00:00:00";
				try {
					query="select * from  Permission where status='approved' and (start_datetime >= ? or end_datetime >= ?) order by start_datetime";
					PreparedStatement ps = con.prepareStatement(query);
					ps.setString(1,currDate);
					ps.setString(2,currDate);
					rs=ps.executeQuery();
					while(rs.next()) {
						int lab_id = rs.getInt("lab_id");
						PreparedStatement ps1;
						query="select lab_name from  Lab where lab_id=?";
						ps1=con.prepareStatement(query);
						ps1.setInt(1,lab_id);
						ResultSet rs1;
						rs1=ps1.executeQuery();
					    rs1.next();
					    String lab_name = rs1.getString("lab_name");
			  %>
			
			  <tr style="margin: 5px">
						    <td><%=rs.getString("purpose") %></td>
						    <td><%=lab_name %></td>
						    
						    <td><%=rs.getString("start_datetime") %></td>
						    <td><%=rs.getString("end_datetime") %></td>
						    <td><%=rs.getInt("max_audience") %></td>
			  </tr>
			  
			   <%
					      }	  
						  }catch(Exception e){
							  e.printStackTrace();
						  }
				          finally
				          {
				        	  dbCon.closeDBConnection();
				          }
			  %>
			
			</table>
		</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>