<%@ page import="java.sql.*" %>
<%@ page import="com.portfolio.util.DBConnection" %>

<%
   String name = request.getParameter("name");
   String email = request.getParameter("email");
   String message = request.getParameter("message");

   boolean isInvalid = false;

   if (name != null && name.toLowerCase().contains("<script")) isInvalid = true;
   if (email != null && email.toLowerCase().contains("<script")) isInvalid = true;
   if (message != null && message.toLowerCase().contains("<script")) isInvalid = true;
   if (message != null && message.toLowerCase().contains("javascript:")) isInvalid = true;

   if (isInvalid) {
       response.sendRedirect("index.jsp?error=invalid_message#contact");
       return;
   }

   try (Connection con = DBConnection.getConnection()) {
       String query = "INSERT INTO messages (name, email, message) VALUES (?, ?, ?)";
       PreparedStatement ps = con.prepareStatement(query);
       ps.setString(1, name);
       ps.setString(2, email);
       ps.setString(3, message);
       ps.executeUpdate();

       response.sendRedirect("index.jsp?submitted=true#contact");
   } catch (SQLDataException | SQLIntegrityConstraintViolationException e) {
       response.sendRedirect("index.jsp?error=data_too_long#contact");
   } catch (Exception e) {
   e.printStackTrace();
       response.sendRedirect("index.jsp?error=unknown#contact");
   }
%>
