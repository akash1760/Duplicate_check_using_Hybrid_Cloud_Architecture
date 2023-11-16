


<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="pack.Dbconnection"%>
<%@page import="java.sql.Connection"%>
<%
String s=request.getQueryString();

String[] ss=s.split(",");

String id=ss[0];
String req=ss[1];
String uname=ss[2];

Connection con=Dbconnection.getConn();
Statement st=con.createStatement();
Statement st1=con.createStatement();

st.executeUpdate("update user_request set viewed='yes' where iduser_request='"+id+"'");

String query="update rights set "+req+"_ ='yes' where username_='"+uname+"'";

System.out.println(query);

int i=st.executeUpdate(query);
if(i!=0){
    //out.println("sucess...");
    response.sendRedirect("user_request.jsp?req='sent'");
}
else{
    out.println("failed...");
}


%>
