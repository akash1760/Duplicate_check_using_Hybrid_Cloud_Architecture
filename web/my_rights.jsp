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
        <script>
            function validation(){
                if(document.name.token.value===0){
                    alert('Enter your token');
                    document.name.token.focus();
                    return false;
                }
            }
        </script>

        <style>
            form,h1{
                position: relative;
                left: 350px;

            }

            #id{
                width: 200px;
                height: 25px;
                background-color: #D5D5D5;
            }
            #but{
                width: 60px;
                height: 25px;
            }
        </style>
        <style>
            table,td,tr{
                border-collapse: collapse;
                border-style: solid;
            }
            table{
                position: relative;
                left: 200px;
                width: 500px;
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

    <body>
        <%
            if (request.getParameter("no") != null) {
                out.println("<script>alert('your not having permission to update files...')</script>");
            }

        %>
        <div id="main">
            <header>
                <div id="logo">
                    
                        <!-- class="logo_colour", allows you to change the colour of the text -->
                        <pre> <h1><a href="index.html">Supporting Authorized Duplicate Check </a></h1>
          <h2 style="font-size: 22px">in a Hybrid Cloud Architecture</h2>
                        </pre>
                    
                </div>
                <nav>
                    <ul class="sf-menu" id="nav">
                        <li ><a href="update.jsp">Update</a></li>
                        <li><a href="upload.jsp">Upload</a></li>
                        <li><a href="download.jsp">Download</a></li>

                        <li><a href="#"><img width="40" height="40" src="images/user.png" alt="photo_two" /></a>
                            <ul>
                                <li><a href="index.html">Logout</a></li>
                                <li><a href="">My Rights</a></li>

                            </ul>
                        </li>

                    </ul>
                </nav>
            </header>
            <div id="site_content">

                <div id="content">
                    <%
                        HttpSession user = request.getSession();
                        String uname = user.getAttribute("username").toString();
                        String name = user.getAttribute("name").toString();

                        Connection con = Dbconnection.getConn();
                        Statement st1 = con.createStatement();
                        ResultSet rt1 = st1.executeQuery("select * from rights where username_='" + uname + "'");
                        if (rt1.next()) {
                            String up = rt1.getString("update_");

                    %>
                    <h1>Welcome ! <font style="color: tomato"> <%=name%></font></h1>
                    <table>
                        <caption><font style="font-size: 20px;color: #999999">My Rights</font></caption>
                        <tr style="font-size: 20px; color: cadetblue">
                            <td>ACTION</td><td>RIGHTS</td><td>REQUEST</td>
                        </tr>
                        <tr>
                            <td>UPLOAD </td><td><%=rt1.getString("upload_")%></td><td><a href="request?upload">request</a></td>
                        </tr>
                        <tr>
                            <td>UPDATE </td><td><%=rt1.getString("update_")%></td><td><a href="request?update">request</a></td>
                        </tr>
                        <tr>
                            <td>DOWNLOAD </td><td><%=rt1.getString("download_")%></td><td><a href="request?download">request</a></td>
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
