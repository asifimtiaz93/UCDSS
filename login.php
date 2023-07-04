<!DOCTYPE html>
<html>
<head>
  <title>Login Page</title>
  <link rel="stylesheet" href="log.css">
</head>
<body>
<div id="header">
	<div id="menu">
		<ul>
			<li class="active"><a href="index.php">Homepage</a></li>

			<li><a href="login.php">Log In</a></li>
		</ul>
	</div>
	<!-- end #menu -->
	<div id="logo">
		<h1><a href="#">UCDSS</a></h1>
		<h2>Unit Commander's Decision Support System</h2>
	</div>
	
</div>
  <div class="container">
    <h1>Login</h1>
    <form action="logins.php" method="post">
      <input type="text" name="user" placeholder="Username">
      <input type="password" name="password" placeholder="Password">
      <input type="submit" value="Login">
    </form>
    <a href="register.php">Register</a>
  </div>
</body>
</html>

 