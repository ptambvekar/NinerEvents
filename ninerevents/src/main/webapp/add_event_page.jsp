<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="description" content="">
		<meta name="author" content="">
		<link rel="icon" href="https://getbootstrap.com/favicon.ico">
		<title>Niner Events - Add Event</title>
		<!-- Bootstrap core CSS -->
		<link href="https://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">
		<!-- Google Material Icon Pack -->
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		<!-- jQuery UI -->
		<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
		<!-- Time Picker -->
		<link rel="stylesheet" href="css/bootstrap-timepicker.min.css">
	</head>
	<style>
		/* Fix NavBar to the top */
		html {
		position: relative;
		min-height: 100%;
		}
		/* body {
		min-height: 75rem;
		padding-top: 4.5rem;
		} */
		body {
		/* Margin bottom by footer height */
		margin-bottom: 60px;
		}
		/* Size for Material Icons */
		.material-icons.md-18 { font-size: 18px; }
		/* Size of DatePicker */
		.ui-datepicker {
		font-size: 80%;
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
		margin-top:5%;
		}
	</style>
	<body>
		<!-- TODO - Find a Logo to display on the Nav Bar -->
		<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
			<a class="navbar-brand" href="#">Niner Events</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="nav navbar-nav ml-auto">
					<li class="nav-item">
						<a class="nav-link" href="#">
						<i class="material-icons md-18">home</i>
						Home
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">
						<i class="material-icons md-18">date_range</i>
						Events
						</a>
					</li>
				</ul>
			</div>
		</nav>
		<div class="container-fluid top-adjust">
		<h3>Add New Event</h3>
		<!-- Alert for successful event creation -->
		<hr>
		<div id= "alertId" class="alert alert-success alert-dismissible d-none" role="alert">
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			<span aria-hidden="true">&times;</span>
			</button>
			<strong>Event Added!</strong>
		</div>
		<!-- Alert for incomplete form submission -->
		<div id= "warningId" class="alert alert-danger alert-dismissible d-none" role="alert">
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			<span aria-hidden="true">&times;</span>
			</button>
			<strong>Please fill all event details!</strong>
		</div>
		<!-- Alert if event start time and event end time are sameStartEndTimeErrorId -->
		<div id= "sameStartEndTimeErrorId" class="alert alert-danger alert-dismissible d-none" role="alert">
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			<span aria-hidden="true">&times;</span>
			</button>
			<strong>Start and end time cant be same!</strong>
		</div>
		<!-- Alert if start time is after end time -->
		<div id= "startEndTimeOrderErrorId" class="alert alert-danger alert-dismissible d-none" role="alert">
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			<span aria-hidden="true">&times;</span>
			</button>
			<strong>Start time can not be after end time!</strong>
		</div>
		<!-- Event creation form -->
		<!-- Row 1 for Event Name and Event Category -->
		<div class = "row">
			<!-- Event Name -->
			<div class = "col">
				<form>
					<div class = "row align-items-center">
						<div class = "col-sm-12 col-md-4">
							<label for="eventName">Event Name</label>
						</div>
						<div class = "col-xs-12 col-md-8">
							<input type="text" class="form-control" placeholder="Add event name" id="eventName">
						</div>
					</div>
				</form>
			</div>
			<!-- Event Category -->
			<div class="col">
				<form>
					<div class = "row align-items-center">
						<div class = "col-sm-12 col-md-4">
							<label for="eventCategory">Category</label>
						</div>
						<div class = "col-sm-12 col-md-8">
							<select class="form-control" id="eventCategoryList">
								<option>Academic</option>
								<option>Social</option>
								<option>Recreational</option>
							</select>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- Row1 Ends -->
		<!-- Row 2 for Event Description and Event Venue-->
		<div class="row mt-2">
			<!-- Event Venue and Event Date -->
			<div class="col">
				<form>
					<div class = "row align-items-center">
						<div class = "col-md-2">
							<label for="eventVenue">Venue</label>
						</div>
						<div class = "col-sm-12 col-md-4">
							<select class="form-control" id="eventVenueList">
								<option>Student Union</option>
								<option>Woodward Hall</option>
								<option>Atkins Library</option>
							</select>
						</div>
					</div>
				</form>
            </div>
        </div>

        <div class="row mt-2">
        <!-- Event Date -->
			<div class="col-md-6">
				<form>
					<div class = "row align-items-center">
						<div class = "col-md-4">
							<label for="datepicker1">Event Start Date</label>
						</div>
						<div class="col-md-8">
							<input type="text" class="form-control" placeholder="Add Event Date" id="datepicker1">
						</div>
					</div>
				</form>
            </div>
            
            <div class="col-md-6">
				<form>
					<div class = "row align-items-center">
						<div class = "col-md-4">
							<label for="datepicker2">Event End Date</label>
						</div>
						<div class="col-md-8">
							<input type="text" class="form-control" placeholder="Add Event Date" id="datepicker2">
						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- Row2 ends -->
		<!-- Row3 for Event Start Time and Event End Time -->
		<div class="row mt-2">
			<!-- Event Start Time -->
			<div class="col">
				<form>
					<div class = "row align-items-center">
						<div class = "col-md-4">
							<label for="startTime">Start Time</label>
						</div>
						<div class = "col-md-8 input-group bootstrap-timepicker timepicker" style="z-index:0">
							<input id="startTime" type="text" class="form-control" value="00:00:00">
							<span class="input-group-addon"><i class="material-icons md-18">access_time</i></span>
						</div>
					</div>
				</form>
			</div>
			<!-- Event End Time -->
			<div class = "col">
				<form>
					<div class = "row align-items-center">
						<div class = "col-md-4">
							<label for="endTime">End Time</label>
						</div>
						<div class = "col-md-8 input-group bootstrap-timepicker timepicker" style="z-index:0">
							<input id="endTime" type="text" class="form-control" value="01:00:00">
							<span class="input-group-addon"><i class="material-icons md-18">access_time</i></span>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- Row 3 Ends -->
		<!-- Row 4 for Event Description -->
		<div class="row mt-2">
			<!-- Event Description -->
			<div class="col">
				<form>
					<div class = "row align-items-center">
						<div class = "col-md-2">
							<label for="eventDescription">Description</label>
						</div>
						<div class="col-md-10">
							<textarea rows="4" class="form-control" placeholder="Add Event Description" id="eventDescription"></textarea>
						</div>
					</div>
				</form>
			</div>
		</div>
        <!-- Row 4 Ends -->
        <hr/>
		<!-- Row 5 for Add Event Button -->
		<div class="row mt-4">
			<div class="col">
			</div>
			<div class="col">
				<form>
					<a id="createButton" class="btn btn-primary btn-block" role = "button" href="#" onclick="addEventFunction()">Create</a>
				</form>
			</div>
			<div class="col">
			</div>
		</div>
		<!-- Row 5 Ends -->
		<br>
		<!-- Footer BEGIN -->
		<footer class="footer">
			<div class="container">
				<span class="text-muted">&copy; University of North Carolina at Charlotte</span>
			</div>
		</footer>
		<!-- Footer END -->
		<!-- Bootstrap core JavaScript
			================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
		<script>window.jQuery || document.write('<script src="../../../../assets/js/vendor/jquery.min.js"><\/script>')</script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
		<script src="https://getbootstrap.com/assets/js/vendor/popper.min.js"></script>
		<script src="https://getbootstrap.com/dist/js/bootstrap.min.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script src="../js/bootstrap-timepicker-customized.js"></script>
		<!-- Date Picker -->
		<script>
			$(function(){
			if ( $('[type="date"]').prop('type') != 'date' ) {
			$('[type="date"]').datepicker();
			}
			  $( "#datepicker" ).datepicker();
			});
		</script>
		<!-- Time Picker -->
		<script>
			$(function(){
			$('#startTime').timepicker({showMeridian:false});
			$('#endTime').timepicker({showMeridian:false});
			});
		</script>
		<!-- TODO Handle error for multiple clicks -->
		<script>
			function addEventFunction(){
			  var name = 	 $("#eventName").val();
			  var category = $("#eventCategoryList").val();
			  var venue =  	 $("#eventVenueList").val();
			  var date = 	 $("#datepicker").val();
			  var starttime =$("#startTime").val();
			  var endtime =	 $("#endTime").val();
			  var description = $("#eventDescription").val();
			
			  document.getElementById('warningId').setAttribute("class","alert alert-danger alert-dismissible d-none");
			    if(name == "" || venue=="" || date=="" || description=="")
			    {
			        $("#alertId").addClass("d-none");
			      $("#warningId").removeClass("d-none");
			    }
			    else if(starttime==endtime)
			    {
			      $("#alertId").addClass("d-none");
			      $("#sameStartEndTimeErrorId").removeClass("d-none");
			    }
			    else if(starttime>endtime)
			    {
			      $("#alertId").addClass("d-none");
			      $("#startEndTimeOrderErrorId").removeClass("d-none");
			    }
			    else{
			
			     var datastring =  {
			       "eventName":name,
			       "venue_name":venue,
			       "eventCategory":category,
			       "event_date":date,
			       "start_time":starttime,
			       "end_time":endtime,
			       "eventDescription":description
			     };
			     $.ajax({
			       type:"POST",
			    //   <!-- TODO add url -->
			       url:"/ninerevents/webapi/event/addEvent",
			       contentType: "application/json",
			       data: JSON.stringify(datastring),
			       dataType:'json',
			       success: function(){
			         $("#warningId").addClass("d-none");
			         $("#sameStartEndTimeErrorId").addClass("d-none");
			         $("#startEndTimeOrderErrorId").addClass("d-none");
			         $("#alertId").removeClass("d-none");
			      }
			  })
			    }
			}
		</script>
	</body>
</html>