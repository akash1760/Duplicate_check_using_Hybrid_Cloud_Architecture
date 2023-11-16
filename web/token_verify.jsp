



<%@page import="java.util.ArrayList"%>
<%@page import="pack.MailUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="pack.Dbconnection"%>

<%
String token=request.getParameter("token");
HttpSession user=request.getSession();
String uname=user.getAttribute("username").toString();
int count=0;

 Connection con=Dbconnection.getConn();
 Statement st=con.createStatement();
 Statement st1=con.createStatement();

 ArrayList a=new ArrayList();
 ResultSet rt=st.executeQuery("select * from user_reg  where token_='"+token+"' and username='"+uname+"'");

 if(rt.next()){
     count=rt.getInt("count_");
     String m=rt.getString("mail");
     a.add(0, m);
    st1.executeUpdate("update user_reg set count_='0' where username='"+uname+"'");
    response.sendRedirect("user_page1.jsp");
    
 }
 else{
     count++;
     st1.executeUpdate("update user_reg set count_='"+count+"' where username='"+uname+"'");
     if(count>2){
          
          String mail[]=new String[]{a.get(0).toString()};
            new MailUtil().sendMail(mail, mail, "Account","Your Account blocked due to given token is invalid " );
          st1.executeUpdate("update user_reg set activate='no' where username='"+uname+"'");
          
          out.println("Your Account blocked due to given token is invalid ");
          
     }
         else{
           out.println("invalid token id...");
         }
   
 }

%>
 <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery.easing-sooper.js"></script>
        <script type="text/javascript" src="js/jquery.sooperfish.js"></script>
        <script type="text/javascript" src="js/image_fade.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                $('ul.sf-menu').sooperfish();
            });
        </script>