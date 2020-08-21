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
		String busid = request.getParameter("busid");
		String from = request.getParameter("from");
		String to = request.getParameter("to");
		String fare = request.getParameter("fare");
		String tseat = request.getParameter("tseat");
		String rseat = request.getParameter("rseat");
		Connection connect = null;
		Statement statement = null;
		PreparedStatement ps=null;
		ResultSet resultSet = null;

		try {

			// set path
			Class.forName("com.mysql.jdbc.Driver");

			connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/BUS_DATABASE?user=root&password=root&useSSL=false");
			statement = connect.createStatement();
			ps = connect.prepareStatement("insert into busdetails_table values(?,?,?,?,?,?)");
			
			ps.setInt(1,Integer.parseInt(busid));
            ps.setString(2,from);
            ps.setString(3,to);
            ps.setInt(4,Integer.parseInt(fare));
            ps.setInt(5,Integer.parseInt(tseat));
            ps.setInt(6,Integer.parseInt(rseat));
            ps.executeUpdate();
			
            String redirectURL = "admin.jsp";
			response.sendRedirect(redirectURL);
            
			statement.close();
			ps.close();
			connect.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
	%>
	
</body>
</html>