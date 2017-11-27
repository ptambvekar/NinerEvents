@@ -1,231 +0,0 @@
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="description" content="">
		<meta name="author" content="">
		<link rel="icon" href="https://getbootstrap.com/favicon.ico">
		<title>Niner Events - Register</title>
		<!-- Bootstrap core CSS -->
		<link href="https://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">
		<!-- Google Material Icon Pack -->
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		<!-- jQuery UI -->
		<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
		<!-- Bootstrap Form Helpers -->
		<link href="../css/bootstrap-formhelpers.min.css" rel="stylesheet" media="screen">
	</head>

	<style>
		/* Fix NavBar to the top */
		html {
		position: relative;
		min-height: 100%;
		}
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
		<!-- HEADER - BEGIN -->
		<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
			<a class="navbar-brand" href="/ninerevents/">Niner Events</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="nav navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="/ninerevents/">
                            <i class="material-icons md-18">home</i>
                            Home
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="browseEvents.jsp">
                            <i class="material-icons md-18">date_range</i>
                            Events
                        </a>
                    </li>
                </ul>	
			</div>
		</nav>
		<!-- HEADER - END -->
		<main role="main" class="container-fluid bg-light text-center top-adjust">
			<div class="row d-none" id="alert">
        		<div class="col-md-8 offset-md-2">
        			<div class="alert alert-warning alert-dismissible fade show"
								role="alert">
						<span id="alertMessage"></span>
					</div>
        		</div>	
        	</div>
        	<div class="row d-none" id="successAlert">
        		<div class="col-md-8 offset-md-2">
	        		<div class="alert alert-success alert-dismissible fade show" role="alert">
						<span id="successMessage"></span>
					</div>
				</div>
        	</div>
			<form id="registerForm" class= "pt-2 pb-2" style="text-align:left">
				<div class = "row">
					<div class="col-sm-12">
						<h2>
							Registration
						</h2>
					</div>
				</div>
				<hr/>
				<div class="form-group row">
					<label for="inputEmail" class="col-sm-2 col-form-label">Email</label>

					<div class="form-group col-sm-4">
						<input type="email" class="form-control" id="inputEmail" placeholder="Email" readonly="readonly">
					</div>
				</div>

				<div class="form-group row">
					<label for="firstname" class="col-sm-2 col-form-label">First Name</label>
				
					<div class="col-sm-4">
						<input type="text" class="form-control" id="firstname" placeholder="John" required/>
					</div>
				</div>

				<div class="form-group row">
					<label for="lastname" class="col-sm-2 col-form-label">Last Name</label>
					
					<div class="col-sm-4">
						<input type="text" class="form-control" id="lastname" placeholder="Doe" required/>
					</div>
				</div>

				<div class="form-group row">
					<label for="inputAddress" class="col-sm-2 col-form-label">Address</label>

					<div class="col-sm-10">
						<input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St" required>
					</div>
				</div>

				<div class="form-group row">
					<label for="inputAddress2" class="col-sm-2 col-form-label">Address 2</label>

					<div class="col-sm-10">
						<input type="text" class="form-control" id="inputAddress2" placeholder="Apartment, studio, or floor">
					</div>
				</div>

				<div class="form-group row">
					<label for="inputCity" class="col-sm-2 col-form-label">City</label>

					<div class="form-group col-md-4">
						<input type="text" class="form-control" id="inputCity" required>
					</div>
				</div>

				<div class="form-group row">
					<label for="inputZip" class="col-sm-2 col-form-label">Zip</label>

					<div class="form-group col-md-4">
						<input type="number" class="form-control" id="inputZip" required>
					</div>
				</div>

				<div class="form-group row">
					<label for="inputState" class="col-sm-2 col-form-label">State</label>
					
					<div class="form-group col-md-4">
						<select class="form-control bfh-states" data-country="US" id="inputState" required></select>
					</div>
				</div>

				<div class="form-group row">
					<label for="inputCountry" class="col-sm-2 col-form-label">Country</label>
					<div class="form-group col-md-4">
						<fieldset disabled>
							<select class="form-control" id="inputCountry">
								<option>
									United States
								</option>
							</select>
						</fieldset>
					</div>
				</div>

				<hr/>

				<div class="form-group row">
					<div class="col-xs-12 col-sm-1">
						<button type="reset" class="btn btn-outline-secondary btn-block">Clear</button>
					</div>

					<div class="col-sm-4 offset-md-1">
						<button type="submit" class="btn btn-outline-success btn-block">Register</button>
					</div>
				</div>
			</form>
		</main>
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
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
		<script src="https://getbootstrap.com/assets/js/vendor/popper.min.js"></script>
		<script src="https://getbootstrap.com/dist/js/bootstrap.min.js"></script>
		<!-- Bootstrap Form Helpers -->
		<script src="../js/bootstrap-formhelpers.min.js"></script>
		
		<script>
		
		$(function(){
			
			
				$('#registerForm').on('submit',function(e){
					e.preventDefault();
					registerEvent();
				});
				
				var errorAlert=$('#alert');
				var errorAlertSpan=$('#alertMessage');
				var successAlert=$('#successAlert');
				var successAlertSpan=$('#successMessage');
				successAlert && successAlert.addClass('d-none');
				var params=window.location.search.split('&');
				var email=params[1].split('=')[1]
				var evId=params[0].split('?event=')[1];
				$("#inputEmail").val(email);
				
				function registerEvent() {
				
				var errorAlert=$('#alert');
				var errorAlertSpan=$('#alertMessage');
				var successAlert=$('#successAlert');
				var successAlertSpan=$('#successMessage');
		
				errorAlert && errorAlert.removeClass('d-none');
				successAlert && successAlert.removeClass('d-none');
				
				var email_address = email;
				var first_name = $("#firstname").val();
				var last_name = $("#lastname").val();
				var line1 = $("#inputAddress").val();
				var line2 = $("#inputAddress2").val();
				var city = $("#inputCity").val();
				var state = $("#inputState").val();
				var zip = $("#inputZip").val();

				var dataString = {
					"eventId":evId,
					"email_address":email_address,
					"first_name":first_name,
					"last_name":last_name,
					"line1":line1,
					"line2":line2,
					"city":city,
					"state":state,
					"zip":zip//,
					//"country":"United States"
				};

				$.ajax({
					type:"POST",
					url:"/ninerevents/webapi/event/registerPerson",
					contentType: "application/json",
			       	data: JSON.stringify(dataString),
			       	dataType:"json",
					success:function(response){
						if(response==-3){ //error in creating the person
							successAlert.addClass('d-none');
							errorAlert && errorAlert.removeClass('d-none');
							errorAlertSpan && errorAlertSpan.text('Failed to create user with these details');
							return;
						}
						if(response==-2){ //error in creating the person
							successAlert.addClass('d-none');
							errorAlert && errorAlert.removeClass('d-none');
							errorAlertSpan && errorAlertSpan.text('A user with this email address already has registered for this event');
							return;
						}
						else if(response==-1){// error in registering the person to the event.
							successAlert.addClass('d-none');
							errorAlert && errorAlert.removeClass('d-none');
							errorAlertSpan && errorAlertSpan.text('Oops... Something went wrong !');
							return;
						}
						else if(response>0){ //person registered successfully
							errorAlert.addClass('d-none');
							successAlert && successAlert.removeClass('d-none');
							successAlertSpan && successAlertSpan.text('Registered successfully.');
							return;
						}
						
					},
					error:function(response){
						successAlert.addClass('d-none');
						errorAlert && errorAlert.removeClass('d-none');
						errorAlertSpan && errorAlertSpan.text('Oops... Something went wrong !');
					}
				});

				console.log(dataString);
			}
			
		});
		</script>

		
	</body>
</html>