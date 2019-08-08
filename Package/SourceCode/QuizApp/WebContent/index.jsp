<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en-us" id="extr-page">
	<head>
		<meta charset="utf-8">
		<title> Quiz App</title>
		<meta name="description" content="">
		<meta name="author" content="">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<link rel="stylesheet" type="text/css" media="screen" href="css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-production.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-skins.min.css">
		<link rel="shortcut icon" href="img/favicon/favicon.ico" type="image/x-icon">
		<link rel="icon" href="img/favicon/favicon.ico" type="image/x-icon">
		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">
		<link rel="apple-touch-icon" href="img/splash/sptouch-icon-iphone.png">
		<link rel="apple-touch-icon" sizes="76x76" href="img/splash/touch-icon-ipad.png">
		<link rel="apple-touch-icon" sizes="120x120" href="img/splash/touch-icon-iphone-retina.png">
		<link rel="apple-touch-icon" sizes="152x152" href="img/splash/touch-icon-ipad-retina.png">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<link rel="apple-touch-startup-image" href="img/splash/ipad-landscape.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
		<link rel="apple-touch-startup-image" href="img/splash/ipad-portrait.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
		<link rel="apple-touch-startup-image" href="img/splash/iphone.png" media="screen and (max-device-width: 320px)">
		
		<script type="text/javascript">
			function startTest()
			{
				if(document.getElementById('name').value == "")
				{
					alert("Plz, Enter your name");
				} 
				else if(document.getElementById('category').value == "any") 
				{
					alert("Plz, Select any category");
				}
				else if(document.getElementById('difficulty').value == "any")
				{
					alert("Plz, Select any difficulty");
				}
				else
				{
					document.getElementById('smart-form-register').action = "StartTest";
				    document.getElementById('smart-form-register').submit();
				}
			}
			
			function viewScoreCard()
			{
				if(document.getElementById('name').value != "")
				{
					document.getElementById('smart-form-register').action = "ViewScoreCards";
				    document.getElementById('smart-form-register').submit();
				} else {
					alert("Plz, Enter your name");
				}
			}
		</script>

	</head>
	<body id="login" style="height:300px;">
		
		<div id="main" role="main">
			<div id="content" class="container">

				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-5 col-lg-5">
						<div class="well no-padding">

							<form action="#" id="smart-form-register" class="smart-form client-form" method="post">
								<header>
									Quiz Application
								</header>

								<fieldset>
									<section>
										<label class="input"> <i class="icon-append fa fa-user"></i>
											<input type="text" name="name" id="name" placeholder="Username" required="required">
											<b class="tooltip tooltip-bottom-right">Enter your name</b> </label>
									</section>
									
									<section>
										<label class="select">
											<select name="category" id="category" required="required">  
												<option value="any" selected="selected">Any Category</option>
												<option value="9">General Knowledge</option>
												<option value="10">Entertainment: Books</option>
												<option value="11">Entertainment: Film</option>
												<option value="12">Entertainment: Music</option>
												<option value="13">Entertainment: Musicals &amp; Theatres</option>
												<option value="14">Entertainment: Television</option>
												<option value="15">Entertainment: Video Games</option>
												<option value="16">Entertainment: Board Games</option>
												<option value="17">Science &amp; Nature</option>
												<option value="18">Science: Computers</option>
												<option value="19">Science: Mathematics</option>
												<option value="20">Mythology</option>
												<option value="21">Sports</option>
												<option value="22">Geography</option>
												<option value="23">History</option>
												<option value="24">Politics</option>
												<option value="25">Art</option>
												<option value="26">Celebrities</option>
												<option value="27">Animals</option>
												<option value="28">Vehicles</option>
												<option value="29">Entertainment: Comics</option>
												<option value="30">Science: Gadgets</option>
												<option value="31">Entertainment: Japanese Anime &amp; Manga</option>
												<option value="32">Entertainment: Cartoon &amp; Animations</option>
											</select> <i></i> </label>
									</section>
									
									<section>
										<label class="select">
											<select name="difficulty" id="difficulty" required="required"> 
												<option value="any" selected="selected">Any Difficulty</option>
												<option value="easy">Easy</option>
												<option value="medium">Medium</option>
												<option value="hard">Hard</option>
											</select> <i></i> </label>
									</section>
									<section>
										<label class="input">
											<c:if test="${not empty message}">
											    <c:out value="${message}"/>
											</c:if>
										</label>
									</section>
								</fieldset>
								<footer>
									<button type="submit" class="btn btn-primary" onclick="startTest()">
										Start Test
									</button>
									<button type="submit" class="btn btn-primary" onclick="viewScoreCard()">
										View Score Scard
									</button>
								</footer>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script src="js/jquery-2.1.1.min.js"></script>
		<script src="js/jquery-ui-1.10.3.min.js"></script>		
		<script src="js/app.config.seed.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/app.seed.js"></script>

	</body>
</html>