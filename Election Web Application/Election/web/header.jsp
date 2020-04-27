<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/header.css">
    </head>
<body>

<% 
    session = request.getSession(true);
    if((String)session.getAttribute("userid")==null)
    {%>
        <div class="header" id="navbar">
        <a href="#default" class="logo"><img src="images/logo.jpg" alt="Election System" width="25%" height="10%"/></a>
        <div class="header-right" id="myDIV">
            <a class="btn active" href="home.jsp">Home</a>
            <a class="btn" href="#contact">Contact</a>
            <a class="btn" href="about.jsp">About </a>
            <a class="btn" href="login.jsp" name="logout">SignIn</a>
        </div>
        </div>
        <!--response.sendRedirect("login.jsp");-->
    <%}
    else
    {%>
    <div class="header" id="navbar">
        <a href="#default" class="logo"><img src="images/logo.jpg" alt="Election System" width="25%" height="10%"/></a>
        <div class="header-right" id="myDIV">
            <a class="btn active" href="home.jsp">Home</a>
            <a class="btn" href="ProfilePage.jsp">Profile</a>
            <a class="btn" href="about.jsp">About</a>
            <a class="btn" href="invalidationServlet" name="logout">SignOut</a>
        </div>
    </div>
    <%}%>    
    
    <script>
        var header = document.getElementById("myDIV");
        var btns = header.getElementsByClassName("btn");
        for (var i = 0; i < btns.length; i++) {
          btns[i].addEventListener("click", function() {
          var current = document.getElementsByClassName("active");
          if (current.length > 0) { 
            current[0].className = current[0].className.replace(" active", "");
          }
          this.className += " active";
          });
        }
    </script>

</body>
</html>