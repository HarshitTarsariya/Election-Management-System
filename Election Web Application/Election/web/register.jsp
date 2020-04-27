<%@ include file = "header.jsp" %>
<html>
	<head>
		<meta charset="utf-8">
		<title>RegistrationForm</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		<!-- MATERIAL DESIGN ICONIC FONT -->
		<link rel="stylesheet" href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">

		<!-- STYLE CSS -->
		<link rel="stylesheet" href="css/style.css">
	</head>

	<body>
        <div class="wrapper" style="background-image: url('images/registration-background.jpg');">
             <div class="inner">
            <div class="image-holder">
                <img src="images/registration-front.jpg" alt="Registration">
            </div>
                  <% if(request.getParameter("submit")==null)
                  {%> 
                    <form action="#" method="POST">
                            <h3>Registration</h3>
                            <div class="form-group">
                                <input type="text" placeholder="First Name" name="fname" class="form-control" required>
                                    <input type="text" placeholder="Last Name" name="lname" class="form-control" required>
                            </div>
                            <div class="form-wrapper">
                                    <input type="email" placeholder="Email Address" name="email" class="form-control" required>
                                    <i class="zmdi zmdi-email"></i>
                            </div>
                            <div class="form-wrapper">
                                    <select name="gender" id="" class="form-control" required>
                                            <option value="" disabled selected>Gender</option>
                                            <option value="male">Male</option>
                                            <option value="female">Female</option>
                                            <option value="other">Other</option>
                                    </select>
                                    <i class="zmdi zmdi-caret-down" style="font-size: 20px"></i>
                            </div>
                            <div class="form-wrapper">
                                <input type="password" placeholder="Password" name="password" class="form-control" minlength="6" maxlength="12" required>
                                    <i class="zmdi zmdi-lock"></i>
                            </div>

                            <div class="form-wrapper">
                                <input type="text" placeholder="Mobile" name="mobile" maxlength="10"  pattern="[0-9]{10}" class="form-control" required>
                            </div>
                            
                            <div class="form-wrapper">
                                    <input type="date"  name="birthdate" class="form-control" max="2005-01-01" required>
                            </div>
                            <div class="form-wrapper">
                                    <input type="text"  name="address" placeholder="Home Address" class="form-control" required>
                            </div>
                            <button type="submit" name="submit" value="submit">Register
                                    <i class="zmdi zmdi-arrow-right"></i>
                            </button>
                    </form>
                <% } 
                  else
                   {%>
                    <%@page import="bean.RegisterDAO,bean.Mailer" %>
                    <jsp:useBean id="obj" class="bean.RegisterBean"/>
                    <jsp:setProperty  property="*"  name="obj" />

                    <%
                       response.setHeader("Cache-Control","no-cache, no-store, must-revalidate ");
                        boolean status = RegisterDAO.registerUser(obj);

                        if(status == true)
                        {%>
                        <h2>You are Registered Successfully..</h2><br>
                        
                        <!--<h2><%out.println(obj.getUserid());%></h2>-->
                            <h2>UserId is sent on registered EmailId...Login using that..</h2>
                            <h1><% Mailer.send(request.getParameter("email"),obj.getUserid());%></h1>
                            <form action="login.jsp" method="POST">
                                <button type="submit" name="re-submit" value="resubmit">Go to Home Page
                                                 <i class="zmdi zmdi-arrow-right"></i>
                                </button>
                             </form>   
                        <%}
                        else
                        {%>
                            <h1>Problem in Registration... </h1>
                            <h1>Try Again... </h1>
                            <form action="register.jsp" method="POST">
                                <button type="submit" name="re-submit" value="resubmit">Go to Home Page
                                                <i class="zmdi zmdi-arrow-right"></i>
                                </button>
                            </form> 
                         <%}
                         }%>
             </div>
       </div>
    </body>
</html>

<%@ include file = "footer.html" %>