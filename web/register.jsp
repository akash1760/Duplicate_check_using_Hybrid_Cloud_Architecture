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
                var uname=document.ureg.username.value;
                var pass=document.ureg.password.value;
                var cpass=document.ureg.cpassword.value;
                var mail=document.ureg.mail.value;
                var name=documenat.ureg.name.value;
                var ph=document.ureg.mobile.value;
        
                if(name==0){
                    alert("Enter name");
                    document.ureg.name.focus();
                    return false;
                }
                if(uname==0){
                    alert("Enter username");
                    document.ureg.username.focus();
                    return false;
                }
                if(pass==0){
                    alert("Enter password");
                    document.ureg.password.focus();
                    return false;
                }
                if(cpass!=pass){
                    alert("Incorrect password");
                    document.ureg.cpassword.focus();
                    return false;
                }
        
        
                if(mail==0){
                    alert("Enter mailid");
                    document.ureg.mail.focus();
                    return false;
                }
                if(ph==0){
                    alert("Enter your mobile no");
                    document.ureg.mobile.focus();
                    return false;
                }
                if(isNaN(ph)){
                    alert("Invalid phoneno");
                    document.ureg.mobile.focus();
                    return  false;
                }
            }
        </script>
        <style>
            input{
/*                width: 200px;
                height: 25px;
                background-color: #D5D5D5;*/
                            border-radius: 25px;
                            border: 2px solid #609;
                            padding: 10px; 
                            width: 200px;
                            height: 10px;
                            display: inline;
            }
            #but{
                width: 75px;
                height: 25px;
            }
            #l1{
                display: inline-block;
                width:100px;
                margin-left: -50px;
                
            }
        </style>
    </head>

    <body style="background: radial-gradient(118.29% 283.09% at 106.71% 0%,#3f1e9d 0%,#000000 100%)">
           <%
            if (request.getParameter("status") != null) {
                out.println("<script>alert('Registered')</script>");
            }

        %>
        <div style="background-color:black;color:white;height: 30px;margin-bottom: -50px"><marquee style="height:15px;margin-bottom: -20px;font-family: lucida console">Welcome to our cloud service.... Store your files on to this.....</marquee>
                </div>

        <div id="main">
            <header>
                <div id="logo">
                    <div id="logo_text">
                        <!-- class="logo_colour", allows you to change the colour of the text 

                        </pre>-->
                    </div>
                </div>
<!--                <nav>
                    <ul class="sf-menu" id="nav">
                        <li class="selected"><a href="index.html">HOME</a></li>
                        <li><a href="admin.jsp">ADMIN</a></li>
                        <li><a href="p_cloud.jsp">PRIVATE CLOUD</a></li>

                        <li><a href="#">USER</a>
                            <ul>
                                <li><a href="user.jsp">Login</a></li>
                                <li><a href="register.jsp">Register</a></li>

                            </ul>
                        </li>
                        <li><a href="contact.jsp">CONTACT US</a></li>
                    </ul>
                </nav>-->

<nav>
                    <!--<ul class="sf-menu navbar-dark bg-primary" id="nav" style="background-image: linear-gradient(to right,lightgreen,lightcyan);width:1482px;margin-left: -280px;margin-top: -65px;height: 70px">-->
                        
                    <!--<ul class="sf-menu navbar-dark bg-primary" id="nav" style="background: rgba(255,255,255,0.15) ;width:1482px;margin-left: -280px;margin-top: -65px;height: 70px">-->
                    <ul class="sf-menu navbar-dark bg-primary" id="nav" style="background: rgba(255,255,255,0.15) ;width:1482px;margin-left: -280px;margin-top: -65px;height: 70px">
                    <li class="selected" style="width:250px;margin-left: 50px;margin-top: 15px;font-family: monospace;text-decoration: none;
                            
    color:white;
    font-style: 'Open Sans',sans-serif;
    font-weight: 400;
    font-size: 1.2vw;"><a href="index.html"><b>HOME</b></a></li>
                        <li class="li"><a href="admin.jsp" style="width:250px;margin-top: 15px;font-family: courier;text-decoration: none;
    color:white;
    font-style: 'Open Sans',sans-serif;
    font-weight: 400;
    font-size: 1.2vw;"><b>ADMIN</b></a></li>
                        <li class="li"><a href="p_cloud.jsp"style="width:250px;margin-top: 15px;font-family: courier;text-decoration: none;
    color:white;
    font-style: 'Open Sans',sans-serif;
    font-weight: 400;
    font-size: 1.2vw;"><b>PRIVATE CLOUD</b></a></li>

<!--                        <li class="li"><a href="#" style="width:50px;margin-top: 15px;font-family: courier;text-decoration: none;
    color:white;
    font-style: 'Open Sans',sans-serif;
    font-weight: 400;
    font-size: 1.2vw;width: 100px "><b>USER</b></a>
                            <ul>
                                <li class="li"><a href="user.jsp" style=";font-family: courier;text-decoration: none;
    color:white;
    font-style: 'Open Sans',sans-serif;
    font-weight: 400;
    font-size: 1.2vw;
    background: rgba(255,255,255,0.15)"><b>LOGIN</b></a></li>
                                <li class="li"><a href="register.jsp" style=";font-family: courier;text-decoration: none;
    color:white;
    font-style: 'Open Sans',sans-serif;
    font-weight: 400;
    font-size: 1.2vw;background: rgba(255,255,255,0.15)"><b>REGISTER</b></a></li>

                            </ul>
                        </li>-->
                        <li class="li"><a href="contact.jsp" style="width:250px;margin-top: 15px;font-family: courier;text-decoration: none;
    color:white;
    font-style: 'Open Sans',sans-serif;
    font-weight: 400;
    font-size: 1.2vw;"><b>CONTACT US</b></a></li>
                    </ul>
                </nav>
            </header>
            <div id="site_content">
                <div id="sidebar_container">
                    <div class="gallery">
                        <ul class="images">
                            <li class="show"><img width="450" height="450" src="images/c1.jpg" alt="photo_one" /></li>
                            <li><img width="450" height="450" src="images/c2.jpg" alt="photo_two" /></li>
                            <li><img width="450" height="450" src="images/c3.jpg" alt="photo_three" /></li>
                            <li><img width="450" height="450" src="images/c4.jpg" alt="photo_four" /></li>
                            <li><img width="450" height="450" src="images/c5.jpg" alt="photo_five" /></li>
                        </ul>
                    </div>
                </div>
                <div id="content">
                    <fieldset style="background-color: wheat;margin-top: 30px">
                        <center>
                            <h2 class="title" style="color: black;font-family: optima">USER REGISTRATION </h2>
                        </center>

                        <form action="registration" name="ureg" style="position: relative;left: 110px;" method="get" onsubmit="return validation()"> 
                            <!--                  USERNAME:<br>-->

                            <label id="l1">NAME:</label>
                            <input type="text" name="name" placeholder="Enter your name" ><br></br>
                            <label id="l1">USERNAME:</label>
                            <input type="text" name="username" placeholder="Enter username"><br></br>
                            <!--                  PASSWORD:<br>-->
                            <label id="l1">PASSWORD:</label>
                            <input type="password" name="password" placeholder="Enter password"><br></br>
                            <label id="l1">RE-ENTER PASSWORD:</label>
                            <input type="password" name="cpassword" placeholder="confirm your password"><br></br>
                            <label id="l1">EMAIL:</label>
                            <input type="email" name="mail" placeholder="Enter your email"><br></br>
                            <label id="l1">PHONE NO:</label>
                            <input type="text" name="mobile" placeholder="Enter your mobile no" maxlength="10"><br></br>
                            &nbsp;
                                <input type="submit" id="but" value="Login" style="background-color: yellowgreen;color: #ffffff;font-family:optima;font-size: 15px"/>
                            &nbsp;&nbsp; 
                            <input type="reset" id="but" value="Reset" style="background-color: #AA3300;color: #ffffff;font-family:optima;font-size: 15px"/>
                            <br></br>



                        </form>


                    </fieldset>
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
