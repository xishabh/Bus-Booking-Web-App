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
		String name = request.getParameter("name");
		String date = request.getParameter("date");
		String to = request.getParameter("to");
		String from = request.getParameter("from");
		String busid1 = request.getParameter("busid");
		int busid = Integer.parseInt(busid1);
		String ntickets2 = request.getParameter("ntickets");
		int ntickets = Integer.parseInt(ntickets2);
		Connection connect = null;
		Statement statement = null;
		PreparedStatement ps=null;
		PreparedStatement ps1=null;
		ResultSet resultSet = null;

		try {

			// set path
			Class.forName("com.mysql.jdbc.Driver");

			connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/BUS_DATABASE?user=root&password=root&useSSL=false");
			statement = connect.createStatement();
			//String userName = (String) session.getAttribute("uName");
			String sql = "select * from busdetails_table where BusID = " + busid ;
			resultSet = statement.executeQuery(sql);
			resultSet.next();
			String n = resultSet.getString(6);
			String n11 = resultSet.getString(5);
			int nn = Integer.parseInt( n );
			int nn11 = Integer.parseInt(n11);
				
			
			if(nn + ntickets <= nn11){
			
			ntickets = nn + ntickets;
			statement.executeUpdate(" update busdetails_table set Rseat = " + ntickets +" where BusID = " + busid );			
			 
			ps = connect.prepareStatement("insert into passenger_table values(?,?,?,?,?)");
			ntickets = ntickets - nn;
			ps.setString(1,name);
            ps.setString(2,date);
            ps.setString(3,to);
            ps.setInt(4,busid);
            ps.setInt(5,ntickets);
            ps.executeUpdate();
			out.print("TICKET BOOKED");
			String redirectURL = "admin.jsp";
			response.sendRedirect(redirectURL);

			}
			else {
				
				out.print("ERROR: NO MORE SEATS");
				
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