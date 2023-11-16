<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="pack.Dbconnection"%>
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
            if (request.getParameter("rights") != null) {
                out.println("<script>alert('Updated...')</script>");
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
                        <li><a href="" style="color:white">Contact Us</a></li>
                    </ul>
                </nav>
            </header>
            <div id="site_content">

                <%
                    Connection con = Dbconnection.getConn();
                    Statement st = con.createStatement();
                    ResultSet rt = st.executeQuery("select * from user_reg order by activate asc");


                %>
                <div id="content">
                    <h1>Welcome ! Private Cloud</h1>
                    <center>

                        <form action="" method="get">
                            <table style="border-style: solid">
                                <caption> <h2 style="color: coral"> USERS</h2></caption>
                                <tr STYLE="background-color: yellowgreen;font-size: 15px;">                                
                                    <td>NAME</td> <td>USERNAME</td><td>PASSWORD</td><td style="text-align: center">MAIL</td><td>STATUS</td><td>ACTION</td>
                                </tr>
                                <%
                                    while (rt.next()) {
                                        String name = rt.getString("name");
                                        String uname = rt.getString("username");
                                        String pass = rt.getString("password");
                                        String mail = rt.getString("mail");
                                        String status = rt.getString("activate");
                                %>
                                <TR>
                                    <td><%=name%></td> <td><%=uname%></td> <td style="text-align: center">****</td> <td><%=mail%></td><td style="text-align: center"><%=status%></td>
                                    <%
                                        if (status.equalsIgnoreCase("no")) {
                                    %>
                                    <td><a href="activate.jsp?<%=uname%>" >Activate</a></td>
                                    <%
                                    } else {
                                    %>

                                    <td><a href="deativate.jsp?<%=uname%>" >Deactivate</a></td>
                                    <%
                                        }
                                    %>

                                </TR>    
                                <%
                                    }
                                %>
                            </table>
                        </form>
                    </center> 

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
