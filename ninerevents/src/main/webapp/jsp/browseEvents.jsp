<!doctype html>

<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="https://getbootstrap.com/favicon.ico">
<title>Niner Events - Browse Events</title>

<!-- Bootstrap core CSS -->
<link href="https://getbootstrap.com/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Google Material Icon Pack -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<!-- jQuery UI -->
<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">

<!-- DatePicker CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/css/bootstrap-datepicker.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.6.2/fullcalendar.min.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.6.2/fullcalendar.print.css"
	media="print">
</head>

<style>
html {
	position: relative;
	min-height: 100%;
}

body {
	/* Margin bottom by footer height */
	margin-bottom: 60px;
}

.footer {
	position: absolute;
	bottom: 0;
	width: 100%;
	/* Set the fixed height of the footer here */
	height: 60px;
	line-height: 60px; /* Vertically center the text there */
	background-color: #f5f5f5;
}

.top-adjust {
	margin-top: 80px;
}

.fc-today {
	background: aliceblue !important;
	border-color: #ddd !important;
}
</style>

<body>
	<!-- Navigation Bar BEGIN -->
	<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
		<a class="navbar-brand" href="#">Niner Events</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarCollapse" aria-controls="navbarCollapse"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarCollapse">
			<ul class="nav navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="#"> <i
						class="material-icons md-18">home</i> Home
				</a></li>
				<li class="nav-item active"><a class="nav-link" href="#"> <i
						class="material-icons md-18">date_range</i> Events
				</a></li>
			</ul>
		</div>
	</nav>
	<!-- Navigation Bar END -->

	<main role="main"
		class="container-fluid bg-light text-center top-adjust"> <br />

	<div class="row container-adjust">
		<div class="col">
			<form class="form">
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<div class="input-group">
								<input class="form-control" type="text"
									placeholder="Enter search keyword" />
								<div class="input-group-addon">
									<i class="material-icons">search</i>
								</div>
							</div>
						</div>
					</div>



					<div class="col-md-2">
						<div class="form-group">
							<select id="input-event" class="form-control">
								<option>Event Type</option>
								<option>Type1</option>
								<option>Type2</option>
							</select>
						</div>
					</div>

					<div class="col-md-2">
						<div class="form-group">
							<select id="input-venue" class="form-control">
								<option>Event Venue</option>
								<option>Venue1</option>
								<option>Venue2</option>
							</select>
						</div>
					</div>

					<div class="col-md-1">
						<button type="submit" class="btn btn-primary btn-block">Search</button>
					</div>

					<div class="col-md-1">
						<button type="reset" class="btn btn-secondary btn-block">Reset</button>
					</div>
				</div>

				<div class="row">
					<div class="col-md-2"></div>

					<div class="col-md-8">
						<div class="card text-center border-primary">
							<div class="card-body">
								<div id="fullCalendar"></div>
							</div>
						</div>
					</div>

					<div class="col-md-2"></div>
				</div>

			</form>
		</div>
	</div>

	<br />
	</main>

	<!-- Footer BEGIN -->
	<footer class="footer">
		<div class="container">
			<span class="text-muted">&copy; University of North Carolina
				at Charlotte</span>
		</div>
	</footer>
	<!-- Footer END -->

	<!-- Bootstrap core JavaScript
			================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script>window.jQuery || document.write('<script src="../../../../assets/js/vendor/jquery.min.js"><\/script>')</script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
	<script src="https://getbootstrap.com/assets/js/vendor/popper.min.js"></script>
	<script src="https://getbootstrap.com/dist/js/bootstrap.min.js"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.19.1/moment.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.6.2/fullcalendar.min.js"></script>

	<script>
            $(function() {
            
            	var getEvents=function(){
            		
            	}
			$("#fullCalendar").fullCalendar({
				themeSystem : 'standard',
				allDayDefault:false,
				aspectRatio:1.7,
				cache:true,
				eventBackgroundColor:'lightblue',
				fixedWeekCount:false, 
				header : {
					left : 'prev',
					center : 'title',
					right : 'today ,next',
					backgroundColor:'lightblue'
				},
				events:function(start,end,timezone,callback){
					// Check if the default start date is 1st of the month or not. 
					if (1!=start.get('date')){// if not, that means the calendar shows some days from previous month in the calendar.
						start.add('1','months') //hence go to next month first, and then LATER, calculate start date and end date of that month
					}
					var today=$("#fullCalendar").fullCalendar('getDate')
					
					dataToSend={//we want to load only future events and hence set start date as current date if the 'start' is in current month.
						startDate:today.isSame(start,'month') ? today.format("YYYY-MM-DD HH:mm:ss").toString() :start.startOf('month').format("YYYY-MM-DD HH:mm:ss").toString(),
						endDate:start.endOf('month').format("YYYY-MM-DD HH:mm:ss").toString()
					}
					
					$.post({
						url:'/ninerevents/webapi/event/monthlyEvents',
						data:JSON.stringify(dataToSend),
						dataType:'json',
						contentType:'application/json',
						success:function(resp){
							callback(resp);
						}
					});
					
				}
			});

		});
        </script>
</body>
</html>