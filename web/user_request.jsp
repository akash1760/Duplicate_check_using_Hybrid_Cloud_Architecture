<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="pack.Dbconnection"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE HTML>
<html>

    <head>
        <title>Supporting Authorized Duplicate Check in a Hybrid Cloud Architecture</title>
        <meta name="description" content="website description" />
        <meta name="keywords" content="website keywords, website keywords" />
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
        <link rel="shortcut icon" type="image/x-icon" href="images/brainstorming_alternative.png"/>
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <!-- modernizr enables HTML5 elements and feature detects -->
        <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
        <style>
            table,td,tr{
                border-collapse: collapse;
                border-style: solid;
            }
            table{
                position: relative;
                left: 100px;
                width: 680px;
            }
            td{
                text-align: center;
            }
            tr{ 
                background-color: #D9D5CF;
                height: 25px;
            }
        </style>
    </head>

    <body style="background: radial-gradient(118.29% 283.09% at 106.71% 0%,#3f1e9d 0%,#000000 100%)">
        <%
            if (request.getParameter("req") != null) {
                out.println("<script>alert('Request Accepted')</script>");
            }


        %>
        <div id="main">
            <header>
                <div id="logo">
                    <div id="logo_text">
                        <!-- class="logo_colour", allows you to change the colour of the text -->
                        <!--<pre> <h1><a href="index.html">Supporting Authorized Duplicate Check </a></h1>
          <h2 style="font-size: 22px">in a Hybrid Cloud Architecture</h2>-->
                        <!--</pre>-->
                    </div>
                </div>
                <nav>
                    <ul class="sf-menu" id="nav">

                        <li><a href="users.jsp" style="color:white">Users</a></li>

                        <li><a href="user_request.jsp" style="color:white">User Request</a></li>
                        <li><a href="index.html" style="color:white">Logout</a></li>

                        <!--          <li><a href="#">User</a>
                                    <ul>
                                        <li><a href="user.jsp">Login</a></li>
                                        <li><a href="register.jsp">Register</a></li>
                                     
                                    </ul>-->
                        <!--</li>-->
                        <li><a href="">Contact Us</a></li>
                    </ul>
                </nav>
            </header>
            <div id="site_content">
                <!--      <div id="sidebar_container">
                        <div class="gallery">
                          <ul class="images">
                            <li class="show"><img width="450" height="450" src="images/c1.jpg" alt="photo_one" /></li>
                            <li><img width="450" height="450" src="images/c2.jpg" alt="photo_two" /></li>
                            <li><img width="450" height="450" src="images/c3.jpg" alt="photo_three" /></li>
                            <li><img width="450" height="450" src="images/c4.jpg" alt="photo_four" /></li>
                            <li><img width="450" height="450" src="images/c5.jpg" alt="photo_five" /></li>
                          </ul>
                        </div>
                      </div>-->
                <%
                    Connection con = Dbconnection.getConn();
                    Statement st1 = con.createStatement();
                    ResultSet rt1 = st1.executeQuery("select * from user_request where viewed='no'");
                %>
                <div id="content">
                    <h1>Welcome ! Private Cloud</h1>
                    <table>
                        <caption><font style="font-size: 20px;color: #999999">USER REQUEST</font></caption>

                        <tr>
                            <td>USERNAME</td><td>REQUEST</td><td>TIME</td><td>ACCEPT</td><td>DENY</td>
                        </tr>
                        <%
                            while (rt1.next()) {
                                String id = rt1.getString("iduser_request");
                                String req = rt1.getString("request");
                                String uname = rt1.getString("username");
                        %>

                        <tr>
                            <td><%=uname%></td><td><%=req%></td><td><%=rt1.getString("time")%></td>
                            <td><a href="accept.jsp?<%=id + "," + req + "," + uname%>">Accept</a></td><td><a href="deny.jsp?<%=id%>">Deny</a></td>
                        </tr>
                        <%
                            }
                        %>
                    </table>

                </div>
            </div>
            <footer>
                <p>&copy;</p>
            </footer>
        </div>
        <p>&nbsp;</p>
        <!-- javascript at the bottom for fast page loading -->
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery.easing-sooper.js"></script>
        <script type="text/javascript" src="js/jquery.sooperfish.js"></script>
        <script type="text/javascript" src="js/image_fade.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                $('ul.sf-menu').sooperfish();
            });
        </script>
    </body>
</html>
