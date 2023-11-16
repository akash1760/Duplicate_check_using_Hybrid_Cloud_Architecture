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
                if(document.name.token.value==0){
                    alert('Enter your token');
                    document.name.token.focus();
                    return false;
                }
            }
        </script>

        <style>
         
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
            if (request.getParameter("updated") != null) {
                out.println("<script>alert('updated....')</script>");
            }

        %>
        <div id="main">
            <header>
                <div id="logo">
                    <div id="logo_text">
                        <!-- class="logo_colour", allows you to change the colour of the text
                        <pre> <h1><a href="index.html">Supporting Authorized Duplicate Check </a></h1>
          <h2 style="font-size: 22px">in a Hybrid Cloud Architecture</h2>
                        </pre>
                        </pre> -->
                    </div>
                </div>
                <nav>
                    <ul class="sf-menu" id="nav">
                        <li ><a href="update.jsp" style="width:50px;margin-left: 50px;margin-top: 15px;font-family: monospace;text-decoration: none;
                            
    color:white;
    font-style: 'Open Sans',sans-serif;
    font-weight: 400;
    font-size: 1.2vw;">Update</a></li>
                        <li><a href="upload.jsp" style="width:50px;margin-left: 50px;margin-top: 15px;font-family: monospace;text-decoration: none;
                            
    color:white;
    font-style: 'Open Sans',sans-serif;
    font-weight: 400;
    font-size: 1.2vw;">Upload</a></li>
                        <li><a href="download.jsp" style="width:100px;margin-left: 50px;margin-top: 15px;font-family: monospace;text-decoration: none;
                            
    color:white;
    font-style: 'Open Sans',sans-serif;
    font-weight: 400;
    font-size: 1.2vw;">Download</a></li>

                        <li><a href="#"><img width="40" height="40" src="images/user.png" alt="photo_two" /></a>
                            <ul>
                                <li><a href="index.html" style="width:50px;margin-left: 50px;margin-top: 15px;font-family: monospace;text-decoration: none;
                            
    color:white;
    font-style: 'Open Sans',sans-serif;
    font-weight: 400;
    font-size: 1.2vw;">Logout</a></li>
                                <!--                <li><a href="register.jsp">Register</a></li>-->

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
                        Statement st = con.createStatement();
                        ResultSet rt = st.executeQuery("select * from files");
                    %>
                    <h1>Welocme ! <font style="color: tomato"> <%=name%></font></h1>

                    <center>
                        <table style="border-style: solid">
                            <caption> <h2 style="color: coral"> FILES</h2></caption>
                            <tr STYLE="background-color: #999999;font-size: 15px;">                                
                                <td>FILE NAME</td> <td>OWNER NAME</td><td>UPLOAD TIME</td><td style="text-align: center">SIZE</td><td>DOWNLOAD</td>
                            </tr>
                            <%
                                while (rt.next()) {
                                    String id = rt.getString("idfiles");
                            %>
                            <TR>
                                <td><%=rt.getString("filename")%></td>
                                <td><%=rt.getString("owner_name")%></td>
                                <td><%=rt.getString("upload_time")%></td>
                                <td><%=rt.getString("size")%></td>
                                <td align="center"><a href="download?<%=id%>">Download</a></td>
                            </TR>
                            <%}%>
                        </table>
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
