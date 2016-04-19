<!DOCTYPE HTML>
<html>
	<head>
		<title>User Profile</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="css/main.css" />
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	</head>
	<body>
	<input type="hidden" id="uid" value="${user.userId }" />
	<!-- Header -->
			<div id="header">
				<div class="top">
					<!-- Logo -->
						<div id="logo">
							<span class="image avatar48"><img src="images/avatar.jpg" alt="" /></span>
							<h1 id="title">${user.firstName} ${user.lastName}</h1>
						</div>
					<!-- Nav -->
						<nav id="nav">
							<ul>
								<li><a href="#intro" id="intro-link" class="skel-layers-ignoreHref"><span class="icon fa-home">Intro</span></a></li>
								<li><a href="#profile" id="profile-link" class="skel-layers-ignoreHref"><span class="icon fa-user">My Profile</span></a></li>
								<li><a href="#myrides" id="myrides-link" class="skel-layers-ignoreHref"><span class="icon fa-car">View Rides</span></a></li>
								<li><a href="#search" id="search-link" class="skel-layers-ignoreHref"><span class="icon fa-search">Search Rides</span></a></li>
								<li><a href="#postride" id="postride-link" class="skel-layers-ignoreHref"><span class="icon fa-bookmark">Post Ride</span></a></li>
								<li><a href="#cart" id="cart-link" class="skel-layers-ignoreHref"><span class="fa-shopping-cart">View Cart</span></a></li>
								<li><a href="#contact" id="contact-link" class="skel-layers-ignoreHref"><span class="icon fa-envelope">Contact Support Team</span></a></li>
								<li><a href="<c:url value='logout' />" id="logout-link" class="skel-layers-ignoreHref"><span class="icon fa-sign-out">Log Out</span></a></li>
							</ul>
						</nav>
				</div>
			</div>

		<!-- Main -->
			<div id="main">
				<!-- Intro -->
					<section id="intro" class="one dark cover">
						<div class="container">
							<header>
								<h2 class="alt">Hi! <strong id="fname">${user.firstName}</strong>,</h2> 
								<p>Welcome to SPARK Carpool</p>
							</header>
						</div>
					</section>
					
					<!-- Profile -->
					<section id="profile" class="two">
						<div class="container">
							<header>
								<h2>Profile</h2>
							</header>
						<form id="updateForm">
								<div class="row">
									<div class="12u$ 12u$(mobile)">
										<span class="spanhead">First Name : </span><span class="spancontent" id="ufirstName" contenteditable="true">${user.firstName}</span>
									</div>
									<div class="12u$ 12u$(mobile)">
										<span class="spanhead">Last Name : </span><span id="ulastName" class="spancontent" contenteditable="true">${user.lastName}</span>
									</div>
									<div class="12u$ 12u$(mobile)">
										<span class="spanhead">Email ID : </span><span class="spancontent" id="uemailId" contenteditable="true">${user.emailId}</span>	
									</div>
									<div class="12u$ 12u$(mobile)">
										<span class="spanhead">Phone No : </span><span id="uphoneNo" class="spancontent" contenteditable="true">${user.phoneNo}</span>
									</div>
									<div class="12u$">
										<input type="button" id="updateBtn" value="Update Profile" />
										<p style="color:green" id="prof"></p>
									</div>
								</div>
							</form>
						</div>
					</section>

				<!-- My Rides -->
					<section id="myrides" class="three">
						<div class="container">
							<header>
								<h2>Your Rides</h2>
							</header>

							<p>Vitae natoque dictum etiam semper magnis enim feugiat convallis convallis
							egestas rhoncus ridiculus in quis risus amet curabitur tempor orci penatibus.
							Tellus erat mauris ipsum fermentum etiam vivamus eget. Nunc nibh morbi quis
							fusce hendrerit lacus ridiculus.</p>

							<div class="row">
								<div class="4u 12u$(mobile)">
									<article class="item">
										<a href="#" class="image fit"><img src="images/pic02.jpg" alt="" /></a>
										<header>
											<h3>Ipsum Feugiat</h3>
										</header>
									</article>
									<article class="item">
										<a href="#" class="image fit"><img src="images/pic03.jpg" alt="" /></a>
										<header>
											<h3>Rhoncus Semper</h3>
										</header>
									</article>
								</div>
								<div class="4u 12u$(mobile)">
									<article class="item">
										<a href="#" class="image fit"><img src="images/pic04.jpg" alt="" /></a>
										<header>
											<h3>Magna Nullam</h3>
										</header>
									</article>
									<article class="item">
										<a href="#" class="image fit"><img src="images/pic05.jpg" alt="" /></a>
										<header>
											<h3>Natoque Vitae</h3>
										</header>
									</article>
								</div>
								<div class="4u$ 12u$(mobile)">
									<article class="item">
										<a href="#" class="image fit"><img src="images/pic06.jpg" alt="" /></a>
										<header>
											<h3>Dolor Penatibus</h3>
										</header>
									</article>
									<article class="item">
										<a href="#" class="image fit"><img src="images/pic07.jpg" alt="" /></a>
										<header>
											<h3>Orci Convallis</h3>
										</header>
									</article>
								</div>
							</div>

						</div>
					</section>

				<!-- Search Ride -->
				
				<section id="search" class="four">
					<div class="container">
						<header>
							<h2>Contact</h2>
						</header>
					</div>
				</section>
				
				<!-- Post Ride -->
				
				<section id="postride" class=five>
					<div class="container">
						<header>
							<h2>Contact</h2>
						</header>
					</div>
				</section>
			
				<!-- Cart -->
				
				<section id="cart" class="six">
					<div class="container">
						<header>
							<h2>Contact</h2>
						</header>
					</div>
				</section>
				
				<!-- Contact -->
					<section id="contact" class="seven">
						<div class="container">

							<header>
								<h2>Contact</h2>
							</header>

							<p>Please provide details below and we will be glad to help you as soon as possible.</p>

							<form>
								<div class="row">
									<div class="6u 12u$(mobile)"><input type="text" name="name" placeholder="Name" required/></div>
									<div class="6u$ 12u$(mobile)"><input type="email" id="emailId" name="emailId" placeholder="Email" required/></div>
									<div class="12u$">
										<textarea name="message" placeholder="Message" required></textarea>
									</div>
									<div class="12u$">
										<input type="button" id="sendBtn" value="Send Message" />
										<p style="color:green" id="msg"></p>
									</div>
								</div>
							</form>
						</div>
					</section>

			</div>

		<!-- Footer -->
			<div id="footer">

				<!-- Copyright -->
					<ul class="copyright">
						<li>&copy; SPARK. All rights reserved.</li>
					</ul>
			</div>

		<!-- Scripts -->
			<script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
			<script src="js/jquery.scrollzer.min.js"></script>
			<script src="js/jquery.scrolly.min.js"></script>
			<script src="js/skel.min.js"></script>
			<script src="js/util.js"></script>
			<script src="js/main.js"></script>
			<script type="text/javascript">
			$(document).ready(function() {
        		$('#sendBtn').click(function(event) {
                var emailId = $('#emailId').val();
                $.get('sendEmail', {
                        emailId : emailId
                }, function(response) {
                        $('#msg').text(response);
                	});
        		});
        		
        		$('#updateBtn').click(function(event) {
        			var userId = $("#uid").val();
                    var firstName = $('#ufirstName').text();
                    var lastName = $('#ulastName').text();
                    var emailId = $('#uemailId').text();
                    var phoneNo = $('#uphoneNo').text();
                    var json = {"userId":userId,"firstName":firstName,"lastName":lastName,
                    		"emailId":emailId,"phoneNo":phoneNo}
        			$.ajax({
        		    		type: "POST",
        		            url: "updateProfile",
        		            contentType: "application/json; charset=utf-8",
        		            dataType: "text",
        		            data: JSON.stringify(json),
        		            success:function(result){
        		      $("#prof").text(result);
        		            }
        		    });
                    event.preventDefault();
        		});
			});
	</script>
	</body>
</html>