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
		<script src="js/jquery-2.1.1.min.js"></script>
		<script src="js/jquery-ui-1.10.3.min.js"></script>		
		<script src="js/app.config.seed.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/app.seed.js"></script>
	</head>
	<body id="login" style="height:300px;">
		
		<div id="main" role="main">
			<div id="content" class="container">

				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-15 col-lg-15">
						<div class="well no-padding">

							<form action="VerifyTest" id="verify" class="smart-form client-form" method="post">
								<header style="font-weight: bold;">
									Welcome <c:out value="${name}"/> in Quiz Application
								</header>
								<c:set var="questionCnt" value="1" scope="page" />
								<fieldset class="demo-switcher-1">
									<c:forEach items="${multipleQue}" var="result">
										<section>
											<div class="col-md-10">
												<span style="font-weight: bold;"><c:out value="${questionCnt}"/>. <c:out value="${result.question}" escapeXml='false'/></span>
												<div class="radio">
													<label>
														<input type="radio" name="<c:out value="${questionCnt}"/>" value="1" class="radiobox style-0" required="required">
														<span><c:out value="${result.correctAnswer}" escapeXml='false'/></span> 
													</label>
												</div>
												<c:forEach items="${result.incorrectAnswers}" var="incorrectAns">
													<div class="radio">
														<label>
															<input type="radio" name="<c:out value="${questionCnt}"/>" value="0" class="radiobox style-0">
															<span><c:out value="${incorrectAns}" escapeXml='false'/></span> 
														</label>
													</div>
												</c:forEach>
											</div>
										</section>
										<c:set var="questionCnt" value="${questionCnt + 1}" scope="page"/>
									</c:forEach>
									<c:forEach items="${booleanQue}" var="result">
										<section>
											<div class="col-md-10">
												<span style="font-weight: bold;"><c:out value="${questionCnt}"/>. <c:out value="${result.question}" escapeXml='false'/></span>	
												<div class="radio">
													<label>
														<input type="radio" name="<c:out value="${questionCnt}"/>" value="1" class="radiobox style-0" required="required">
														<span><c:out value="${result.correctAnswer}" escapeXml='false'/></span> 
													</label>
												</div>
												<c:forEach items="${result.incorrectAnswers}" var="incorrectAns">
												<div class="radio">
													<label>
														<input type="radio" name="<c:out value="${questionCnt}"/>" value="0" class="radiobox style-0">
														<span><c:out value="${incorrectAns}" escapeXml='false'/></span> 
													</label>
												</div>
												</c:forEach>
											</div>
										</section>
										<c:set var="questionCnt" value="${questionCnt + 1}" scope="page"/>	
									</c:forEach>
								</fieldset>
								<input type="hidden" name="totalQuestion" value="<c:out value="${questionCnt-1}"/>" />
								<input type="hidden" name="username" value="<c:out value="${name}"/>" />
								<input type="hidden" name="category" value="<c:out value="${category}"/>" />
								<input type="hidden" name="difficulty" value="<c:out value="${difficulty}"/>" />
								
								<footer>
									<a href="index.jsp">
										<button type="button" class="btn btn-primary">
											Cancel Test
										</button>
									</a>
									<button type="reset" class="btn btn-primary">
										Reset Test
									</button>
									<input type="submit" value="Submit Test" name="test" class="btn btn-primary">
								</footer>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>