<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Welcome to SPARK Carpool Application</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=yes">
    <link rel='stylesheet prefetch' href='//fonts.googleapis.com/css?family=Open+Sans'>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet"	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  </head>
  <body>
  <span><img src="images/logo.png" style="position:absolute; align:center; margin:20;z-index:100"/></span>
    <div class="cont">
      <div class="demo">
        <div class="login">
		<div class="login__check"></div>
		  <div class="login__form">
			<form name="login" action="login" method="post">
				<div class="login__row">
				  <svg class="login__icon name svg-icon" viewBox="0 0 20 20">
					<path d="M0,20 a10,8 0 0,1 20,0z M10,0 a4,4 0 0,1 0,8 a4,4 0 0,1 0,-8" />
				  </svg>
				  <input id="userId" name="userId" type="text" class="login__input name" placeholder="Username" />
				</div>
				<div class="login__row">
				  <svg class="login__icon pass svg-icon" viewBox="0 0 20 20">
					<path d="M0,20 20,20 20,8 0,8z M10,13 10,16z M4,8 a6,8 0 0,1 12,0" />
				  </svg>
				  <input id="password" name="password" type="password" class="login__input pass" placeholder="Password" />
				</div>
				<c:choose>
					<c:when test="${result == false}">
						<span style="color:#F05656">Invalid User Id/Password</span>
					</c:when>
				</c:choose>
				<button type="submit" class="login__submit">Sign in</button>
				<p class="login__signup">Don't have an account? &nbsp;<a class="login__register">Register Here</a></p>
			</form>
          </div>
        </div>
        <div class="app">
          <div class="app__top">
            <p class="app__hello">Get Started!</p>
            <div class="login__row">
              <svg class="login__icon name svg-icon" viewBox="0 0 20 20">
                <path
                  d="M0,20 a10,8 0 0,1 20,0z M10,0 a4,4 0 0,1 0,8 a4,4 0 0,1 0,-8" />
              </svg>
              <input type="text" class="login__input name" placeholder="First Name" />
			</div>
			<div class="login__row">
              <svg class="login__icon name svg-icon" viewBox="0 0 20 20">
                <path d="M0,20 a10,8 0 0,1 20,0z M10,0 a4,4 0 0,1 0,8 a4,4 0 0,1 0,-8" />
              </svg>
              <input type="text" class="login__input name" placeholder="Last Name" />
			</div>
			<div class="login__row">
              <svg class="login__icon name svg-icon" viewBox="0 0 20 20">
                <path d="M0,20 a10,8 0 0,1 20,0z M10,0 a4,4 0 0,1 0,8 a4,4 0 0,1 0,-8" />
              </svg>
              <input type="email" class="login__input name" placeholder="Email Address" />
			</div>
			<div class="login__row">              
			  <svg class="login__icon name svg-icon" viewBox="0 0 20 20">
                <path d="M0,20 a10,8 0 0,1 20,0z M10,0 a4,4 0 0,1 0,8 a4,4 0 0,1 0,-8" />
              </svg>
              <input type="text" class="login__input name" placeholder="Username" />
			</div>
			<div class="login__row">             
			 <svg class="login__icon pass svg-icon" viewBox="0 0 20 20">
                <path d="M0,20 20,20 20,8 0,8z M10,13 10,16z M4,8 a6,8 0 0,1 12,0" />
              </svg>
              <input type="password" class="login__input pass" placeholder="Password" />
            </div>
			<div class="login__row">
			  <svg class="login__icon pass svg-icon" viewBox="0 0 20 20">
                <path d="M0,20 20,20 20,8 0,8z M10,13 10,16z M4,8 a6,8 0 0,1 12,0" />
              </svg>
              <input type="password" class="login__input pass" placeholder="Confirm Password" />
            </div>
			<div class="login__row">			
			  <svg class="login__icon name svg-icon" viewBox="0 0 20 20">
                <path d="M0,20 a10,8 0 0,1 20,0z M10,0 a4,4 0 0,1 0,8 a4,4 0 0,1 0,-8" />
              </svg>
              <input type="text" class="login__input name" placeholder="Phone Number" />
            </div>  
			  <button type="submit" class="login__submit">Register</button>
            </div>
          </div>
        </div>
      </div>
    <script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src="js/index.js"></script>
    <script	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  </body>
</html>