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
    </head>

    <body style="background: radial-gradient(118.29% 283.09% at 106.71% 0%,#3f1e9d 0%,#000000 100%)">
        <%
            if (request.getParameter("no") != null) {
                out.println("<script>alert('your not having permission to do this...')</script>");
            }
            if (request.getParameter("status") != null) {
                out.println("<script>alert('Your request sent to private cloud')</script>");
            }

        %>
        <div id="main">
            <header>
                <div id="logo">
                    <div id="logo_text">
                        <!-- class="logo_colour", allows you to change the colour of the text -->
                        <pre> <h1><a href="index.html">Supporting Authorized Duplicate Check </a></h1>
          <h2 style="font-size: 22px">in a Hybrid Cloud Architecture</h2>
                        </pre>
                    </div>
                </div>
                <nav>
                    <ul class="sf-menu" id="nav">
                        <li ><a href="update.jsp" style="color:white">Update</a></li>
                        <li><a href="upload.jsp" style="color:white">Upload</a></li>
                        <li><a href="download.jsp" style="color:white">Download</a></li>

                        <li><a href="#"><img width="40" height="40" src="images/user.png" alt="photo_two" /></a>
                            <ul>
                                <li><a href="index.html" style="color:white">Logout</a></li>
                                <li><a href="my_rights.jsp" style="color:white">My Rights</a></li>

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
                    %>
                    <h1>Welcome ! <font style="color: tomato"> <%=name%></font></h1>
                    <div style="position: relative;left: 200px;">
                        <img src="images/hybrid.png" width="500" height="400" ></img>
                    </div>


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
