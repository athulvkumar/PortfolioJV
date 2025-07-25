<%@ page import="java.sql.*" %>
<%@ page import="com.portfolio.util.DBConnection" %>

<%
   String name = request.getParameter("name");
   String email = request.getParameter("email");
   String message = request.getParameter("message");

   try(Connection con = DBConnection.getConnection()) {
      String query = "insert into messages (name, email, message) values (?, ?, ?)";
      PreparedStatement ps = con.prepareStatement(query);
      ps.setString(1, name);
      ps.setString(2, email);
      ps.setString(3, message);
      ps.executeUpdate();

   } catch (Exception e) {
      e.printStackTrace();
   }

   response.sendRedirect("index.jsp?submitted=true");
%>