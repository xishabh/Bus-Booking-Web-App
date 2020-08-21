<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="java.sql.*, java.io.*"%>
	
	<%
	// TODO Auto-generated method stub
		// get request parameters for userID and password
		String option = request.getParameter("adminOption");
		int opt = Integer.parseInt(option);
		Connection connect = null;
		Statement statement = null;
		ResultSet resultSet = null;

		try {

			// set path
			Class.forName("com.mysql.jdbc.Driver");

			connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/BUS_DATABASE?user=root&password=root&useSSL=false");
			statement = connect.createStatement();
			
			// prepare query for first result
			resultSet = statement.executeQuery("select * from busdetails_table");
			//resultSet.next();
			if(opt == 1){
				out.println( "BUSID " + "-- From --" +"-- To --" +"-- fare --" + "-- total seat --" + "-- reserved seat --" );
				out.println("<br>");
				while(resultSet.next()){
					String busid = resultSet.getString(1);
					String from = resultSet.getString(2);
					String to = resultSet.getString(3);
					String fare = resultSet.getString(4);
					String tseat = resultSet.getString(5);
					String rseat = resultSet.getString(6);

					out.println( busid + " -- " + from +" -- " + to + " -- " + "Rs. "+fare + " -- " + tseat + " -- " + rseat );			
					out.println("<br>");
				}
			}
			else if(opt==2){
				
				String redirectURL = "adminchangeform.jsp";
				response.sendRedirect(redirectURL);
				
			}
			statement.close();
			connect.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
	%>
	
</body>
</html>