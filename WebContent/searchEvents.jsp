<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,in.ac.nitc.permission.dbconnection.DBConnection"%>
    <%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FACULTY INDEX</title>
<style type="text/css">
body {
  background-color: lightblue;
 text-align: center;
}

</style>
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
<br/>
<br/>

<h1>Welcome faculty index page</h1>
	<div>
		<ul style="list-style-type: none;">
			<li><a href="getAdmin?choice=faculty_incharge">Show Raised Permission</a></li>
			<li><a href="getAdmin?choice=pending">Show On-Hold Permission</a></li>
			<li><a href="getAdmin?choice=declined">Show Rejected Permission</a></li>
			<li><a href="getAdmin?choice=approved">Show Approved Permission</a></li>
		</ul>
	</div>
	
			
		<div id="workcontent" style="width:80%;
		margin-top:30px;
		margin-left:10%;
		margin-right:10%;
    height:200px;
    border: 2px solid blue;
    overflow-y: scroll;
    overflow-x: hidden;
    white-space: nowrap;">
    <h2 style="margin-left:10%;">Events within specified Interval</h2>

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
				
			  	
			  	
			  
				String eventStartDateTime=request.getAttribute("startDate")+" "+"00:00:00";
				String eventEndDateTime=request.getAttribute("endDate")+" "+"23:59:59";
				
				try {
					
					String query="select * from  Permission where status='approved' and start_datetime <= ? and end_datetime>=? order by start_datetime";
					PreparedStatement st;
					ResultSet rs;
						st=con.prepareStatement(query);
						st.setString(1, eventEndDateTime);
						st.setString(2, eventStartDateTime);
						rs=st.executeQuery();
						//check for user authentication
					while(rs.next()) {
			int lab_id = rs.getInt("lab_id");
			PreparedStatement ps;
			query="select lab_name from  Lab where lab_id=?";
			ps=con.prepareStatement(query);
			ps.setInt(1,lab_id);
			ResultSet rs1;
			rs1=ps.executeQuery();
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