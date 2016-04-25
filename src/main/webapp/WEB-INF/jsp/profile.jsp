<!DOCTYPE HTML>
<html>
	<head>
		<title>User Profile</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="css/main.css" />
		<link rel="shortcut icon" href="//d15dxvojnvxp1x.cloudfront.net/assets/favicon.ico">
       <link rel="icon" href="//d15dxvojnvxp1x.cloudfront.net/assets/favicon.ico">
       <link rel="stylesheet" href="css/ninja-slider.css" />
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	</head>
	<body>
	<%
   if(session.getAttribute("user") == null)
      response.sendRedirect("/");
%>
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
								<li><a href="#cart" id="cart-link" class="skel-layers-ignoreHref"><span class="icon fa-shopping-cart">View Cart (${fn:length(usercart)})</span></a></li>
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
						<div id="ninja-slider">
							<div class="slider-inner">
							<ul>
								<li>
									<h2 class="alt">Hi! <strong id="fname">${user.firstName}</strong>,</h2> 
									<p>Welcome to SPARK Carpool</p>
									<p>Last Login at : ${user.lastLogin},  Incorrect Login Attempts : ${user.loginAttempts}</p> 
								</li>
								<li>
									<a href="#myrides"><img src="images/view.jpg"></a>
									<center><div class="caption">View Ride</div></center>
								</li>
								<li>
									<a href="#search"><img src="images/Search.png"></a>
									<center><div class="caption">Search Ride</div></center>
								</li>
								<li>
									<a href="#postride"><img src="images/PostRide.png"></a>
									<center><div class="caption">Post Ride</div></center>
								</li>
							</ul>
							</div>
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
              <div class="row">
            	<c:choose>
					<c:when test="${fn:length(uride)==0}">
						<br>
						<p>You have not taken any rides till Now.</p>	
					</c:when>
				<c:otherwise>	
                  <table id="keywords1">
                    <thead>
                        <tr>
                          <th>Ride Id</th>
                          <th>Start Location</th>
                          <th>End Location</th>
                          <th>Time</th>
                          <th>Stars</th>
                          <th>Your Review</th>
                      </tr>
                      </thead>
                      <tbody>
		                  <c:forEach items="${uride}" var="view" >
        		          <tr>
                	        <td width="20%" id="rId" > <c:out value="${view.rideId}" /></td>
                    	    <td width="20%" id="startLocation" > <c:out value="${view.rideStartLocation}" /></td>
                        	<td width="20%" id="endLocation" ><c:out value="${view.rideEndLocation}" /></td>
                        	<td width="20%" id="ridetime" ><c:out value="${view.rideTime}" /></td>
                        	<td width="20%" id="ridestart" ><c:out value="${view.stars}" /></td>
                        	<td width="10%">
                        		<select class="selectreview" id="${view.rideId}">
                        			<option style="display:none;" selected disabled value="">Select</option>
                        			<option>1</option>
                        			<option>2</option>
                        			<option>3</option>
                        			<option>4</option>
                        			<option>5</option>
                        		</select>
                        	</td>
                      	</tr>
                  		</c:forEach>
                  	</tbody>
                  </table>
                  <p style="color:green" id="cartmsg"></p>
                  </c:otherwise>
                  </c:choose>
                 </div>
            </div>
          </section>

        <!-- Search Ride -->
        
        <section id="search" class="four">
          <div class="container">
            <header>
              <h2>Search Rides</h2>
            </header>
            <form action="search" method="get">
              <span class="spanhead">Search by Date </span><span class="spanhead"><input type="date" name="ridedate"></span><span class="spanhead"><input type="submit" value="Search"></span>
            </form>
            <br/>
                  <table id="keywords">
                    <thead>
                        <tr>
                          <th >Start Location</th>
                          <th >End Location</th>
                          <th >Vacancy</th>
                          <th >Time</th>
                      </tr>
                      </thead>
                      <tbody>

                  <c:forEach items="${rides}" var="ride" >
                     <tr>
                        <td id="startLocation" > <c:out value="${ride.rideStartLocation}" /></td>
                        <td id="endLocation" ><c:out value="${ride.rideEndLocation}" /></td>
                        <td id="vacancy" ><c:out value="${ride.vacancy}" /></td>
                        <td id="ridetime" ><c:out value="${ride.rideTime}" /></td>
                        <td id="addtocart" ><button name="${ride.rideId}">Add to cart</button></td>
                      </tr>
                  </c:forEach>
                </tbody> 
                </table>  
                <p style="color:green" id="searchmsg"></p>
              </div>
        </section>				

				<!-- Post Ride -->
				<section id="postride" class=five>
					<div class="container">
						<header>
							<h2>Post a ride!</h2>
						</header>
							<form id="addRide" ><!-- method="POST" action="addRide" -->
								<div class="row">
									<div class="6u 12u$(mobile)"><input type="date" id="rideDate" name="rideDate" placeholder="Ride date" required/></div>
									<div class="6u$ 12u$(mobile)"><input type="time" id="rideTime" name="rideTime" placeholder="Ride Time" required/></div>
									<div class="6u 12u$(mobile)"><input type="text" id="rsl" name="rideStartLocation" placeholder="Going from" required/></div>
									<div class="6u$ 12u$(mobile)"><input type="text" id="rel" name="rideEndLocation" placeholder="Going to" required/></div>
									<div class="6u 12u$(mobile)"><input type="text" name="vacancy" id="vacancy" placeholder="Vacancy" required/></div>
									<div class="6u 12u$(mobile)"><input type="submit" id="sendbutton" value="Post ride" /></div>
									<p style="color:green" id="rideposted"></p>
								</div>
							</form>
					</div>
				</section>
			
				<!-- Cart -->
				
				<section id="cart" class="six">
					<div class="container">
						<header>
							<h2>Your Cart</h2>
						</header>
						<c:choose>
							<c:when test="${fn:length(usercart)==0}">
								<br>
								<p>Your Cart is Empty. Search rides and add it to the cart.</p>	
							</c:when>
							<c:otherwise>
								<table id="keywords2">
									<thead>
										<tr>
											<th>No.</th>
											<th>Start Location</th>
											<th>End Location</th>
											<th>Ride Time</th>
											<th>Ride Date</th>
											<th>Riders</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${usercart}" var="cart" varStatus="cartIndex">
											<tr id="${cart.rideId}">
												<td><c:out value="${cartIndex.index+1}" /></td>
												<td><c:out value="${cart.rideStartLocation}" /></td>
												<td><c:out value="${cart.rideEndLocation}" /></td>
												<td><c:out value="${cart.rideTime}" /></td>
												<td><c:out value="${cart.rideDate}" /></td>
												<td><button name="${cart.rideId}">Remove</button></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								Riders for each ride : 1 <input id="ran" type="range" min="1" max="3" value="${riders}"/> 3
								<button id="update">Update</button>
								<p style="color:green" id="cartmsg"></p>
								<input type="button" id="checkOut" value="Check Out" />
							</c:otherwise>
						</c:choose>
						
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
            <script type="text/javascript" src="js/jquery.tablesorter.min.js"></script>
			<script src="js/jquery.scrollzer.min.js"></script>
			<script src="js/jquery.scrolly.min.js"></script>
			<script src="js/skel.min.js"></script>
			<script src="js/util.js"></script>
			<script src="js/main.js"></script>
			<script src="js/ninja-slider.js" type="text/javascript"></script>
			<script type="text/javascript">
			$(document).ready(function() {
				$('#keywords').tablesorter();
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
        		
        		$('#keywords2 button').click(function(event) {
                    var rideId = $(this).attr('name');
                    $.get('removeFromCart', {
                            rideId : rideId
                    }, function(response) {
                            $('#cartmsg').text(response);
                            location.reload(true);
                    	});
            	});
        		
        		$('#update').click(function(event) {
                    alert($("#ran").val());
        		$.get('updateCart', {
                    qty : $("#ran").val()
          		  }, function(response) {
                    $('#cartmsg').text(response);
                    location.reload(true);
            	});
            });
        		
        		$('#checkOut').click(function(event) {
                    $.get('checkOut', function(response) {
                            $('#cartmsg').text(response);
                            location.reload(true);
                    	});
            	});
        		
        		$('#keywords button').click(function(event) {
                    var rideId = $(this).attr('name');
                    $.get('addToCart', {
                            rideId : rideId
                    }, function(response) {
                            $('#searchmsg').text(response);
                            location.reload(true);
                    	});
            	});
        		
        		$('.selectreview').change(function(event) {
                    var rideId = $(this).attr('id');
                    var stars = $(this).val();
                    alert(rideId + "  " + stars);
                    $.get('addReview', {
                            rideId : rideId,
                            stars : stars
                    }, function(response) {
                    	$('#reviewMsg').text(response);
                            location.reload(true);
                    	});
            	});
        		
        		$('#sendbutton').click(function(event) {
        			var rideDate = $("#rideDate").val();
                    var rideTime = $('#rideTime').val();
                    var rideStartLocation = $('#rsl').val();
                    var rideEndLocation = $('#rel').val();
                    var vacancy = $('#vacancy').val();
                    var json = {"rideDate":rideDate,"rideTime":rideTime,"rideStartLocation":rideStartLocation,
                    		"rideEndLocation":rideEndLocation,"vacancy":vacancy
                    		}
                    $.ajax($('#rsl').text())
                    $.ajax({
        		    		type: "POST",
        		            url: "addRide",
        		            contentType: "application/json; charset=utf-8",
        		            dataType: "text",
        		            data: JSON.stringify(json),
        		            success:function(result){
        		     			 $("#rideposted").text("Ride Posted.");
        		            }
        		    });
                    event.preventDefault();
        		});
        		
			});
	</script>
	</body>
</html>