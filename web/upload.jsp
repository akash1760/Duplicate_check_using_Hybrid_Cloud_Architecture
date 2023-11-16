<%@page import="java.io.IOException"%>

<!DOCTYPE HTML>

<html>
    <head>
        <title>Supporting Authorized Duplicate Check in a Hybrid Cloud Architecture</title>
        <meta name="description" content="website description" />
        <meta name="keywords" content="website keywords, website keywords" />
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
        <link rel="shortcut icon" type="image/x-icon" href="images/brainstorming_alternative.png"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>

        <link rel="stylesheet" type="text/css" href="css/style.css" />
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
           

            #id{
                width: 300px;
                height: 20px;
                background-color: #D5D5D5;
            }
            #but{
                width: 100px;
                height: 50px;
            }
        </style>
      
  
      
    </head>

    
    
    <body style="background: radial-gradient(118.29% 283.09% at 106.71% 0%,#3f1e9d 0%,#000000 100%)">
         <%
            if (request.getParameter("status") != null) {
                out.println("<script>alert('Uploaded...')</script>");
            }
            if (request.getParameter("failed") != null) {
                out.println("<script>alert('file already exist...')</script>");
            }
        %>
        
        
        <div id="main">
            <header>
              
                <nav >
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
                    %>
                    <h1>Welocme ! <font style="color: darkblue;font-family:cursive"> <%=name%></font></h1><br/><br/><br/>

                    <form action="upload" name="name" method="post" ENCTYPE="multipart/form-data" >
                        <div style="margin-left:20px;width:400px">
                            <input type="file" name="file" class="text-primary" height="50px" style="background-color:lightblue" ><br></br><br/><br/>
                        <pre>
    <input type="submit" id="but" class="btn btn-success" value="Upload">  <input type="reset" id="but" class="btn btn-danger" value="Reset">
                        </pre>
                        </div>
                    </form>



                </div>
            </div>
            <footer>
                <p>&copy;</p>
            </footer>
        
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
