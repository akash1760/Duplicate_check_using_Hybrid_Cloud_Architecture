<%@page import="java.sql.Statement"%>
<%@page import="pack.Dbconnection"%>
<%@page import="java.sql.Connection"%>
<%
String id=request.getQueryString();

Connection con=Dbconnection.getConn();
Statement st1=con.createStatement();

int i=st1.executeUpdate("update user_request set viewed='yes' where iduser_request='"+id+"'");

if(i!=0){
     response.sendRedirect("user_request.jsp?");
}
else{
     response.sendRedirect("error....");
}
%>