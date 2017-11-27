<!doctype html>

<html lang="en">
    <head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="description" content="">
		<meta name="author" content="">
		<link rel="icon" href="https://getbootstrap.com/favicon.ico">
		<title>Niner Events - Event Detail</title>
		
		<!-- Bootstrap core CSS -->
		<link href="https://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">

		<!-- Google Material Icon Pack -->
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

		<!-- jQuery UI -->
		<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
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
            margin-top:5%;
        }
    </style>
    
    <body>
        <!-- Navigation Bar BEGIN -->
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
        <!-- Navigation Bar END -->

        <!-- Main Content BEGIN -->
        <main role="main" class="container-fluid bg-light text-center top-adjust">
        
        	<div class="row d-none" id="alert">
        		<div class="col-md-10 offset-md-2">
        			<div class="alert alert-warning alert-dismissible fade show"
								role="alert">
						<span id="alertMessage"></span>
					</div>
        		</div>	
        	</div>
        	<div class="row d-none" id="successAlert">
        		<div class="col-md-10 offset-md-2">
	        		<div class="alert alert-success alert-dismissible fade show" role="alert">
						<span id="successMessage"></span>
					</div>
				</div>
        	</div>
            
            <div class="row">

                <!-- Event Image BEGIN -->
                <div class = "col-xs-12 col-md-2 col-lg-2 align-self-center">
                    <figure class = "figure">
                        <img src="https://avatars0.githubusercontent.com/u/1342004?s=400&v=4" class="figure-img img-fluid rounded" alt="Event Image"/>
                    </figure>

                    <br/>

                    <a href="browseEvents.jsp" class="btn btn-outline-primary btn-primary btn-lg" role="button">
                        Browse All Events
                    </a>
                    <!-- Browse All Events Button - END -->
                </div>
                <!-- Event Image END -->

                <!-- Event Details Section BEGIN -->
                <div class = "col xs-12 col-md-10 col-lg-10 align-self-center">
					<div class = "card text-center" style= "margin: 2%" id="eventDetail">
                        
                    </div>
                </div>
                <!-- Event Details Section END -->
            </div>
			
			<div class="modal fade" id="register-modal" tabindex="-1" role="dialog"
				aria-labelledby="register-modal" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Register</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<form id='registerForm'>
							<div class="modal-body">
								<div class="container-fluid">
									<div class="form-group row">
										<label for="input-email" class="col-sm-2 col-form-label">Email</label>
										<div class="col-sm-10">
											<div class="input-group">
												<input type="email" class="form-control" id="input-email"
													placeholder="example@email.com" name='email' required="required"/>
												<div class="input-group-addon">
													<i class="material-icons">email</i>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="reset" class="btn btn-outline-secondary"
									data-dismiss="modal">Close</button>
								<button type="submit" class="btn btn-outline-primary">Register</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			 </main>
        <!-- Main Content END -->

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
		<script src= "https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.19.1/moment.min.js"></script>
		 <!-- <script src="/ninerevents/js/ninerEvents.js"> </script> -->
		 
		 <script>
		 
		 var eventDetailSuccess= function(event,status){	
			 	var errorAlert=$('#alert');
				var errorAlertSpan=$('#alertMessage');
				var successAlert=$('#successAlert');
				var successAlertSpan=$('#successMessage');
				
				if (!event) {

	 				
	 				successAlert && successAlert.addClass('d-none');
	 				errorAlertSpan && errorAlertSpan.text('No Event Details found.');
					errorAlert && errorAlert.removeClass('d-none');
					
					return;
				}
				
				successAlert && successAlert.addClass('d-none');
				errorAlert && errorAlert.addClass('d-none');
				
					var sResult = ' ';
						sResult += ' <div class = "card-header"> <h3>'+event.eventName+'</h3> </div>' + 
						'<div class = "card-body">'+
		                '<div class = "row-ml-2"> <h6>'+event.eventDescription+' </h6></div> <hr> <div class = "row"> <div class = "col-xs-12 col-md-6"> <h5>Venue</h5><div>'+
		                 event.venue_name+' </div></div><div class = "col-xs-12 col-md-6"><h5> Event Date and Time </h5><div> '+moment(event.startDateTime).format('DD MMM YYYY')+                         
		                '</div><div> '+moment(event.startDateTime).format('hh:mm A')+' </div></div></div> <br/> <div class = "row justify-content-center"><div class = "col-*-12"><h5>Contact Information</h5></div></div>'+
		                '<div class = "row justify-content-center"><div class = "col-*-12"><div>'+event.first_name+' '+event.last_name+
		                '</div><div> '+event.phone_no+' </div> <div> '+event.email_address+' </div></div></div></div>'+
		                '<div class = "card-footer" id="registerButton"> <a  href="#register-modal" class="btn btn-outline-success btn-success btn-lg" role="button" data-toggle="modal" data-target="#register-modal"> Register </a></div>'+
		                '<div class = "card-footer d-none"" id="homeButton"> <a id="goHomeButton" class="btn btn-outline-success btn-success btn-block" role = "button" href="/ninerevents/">Home</a></div>';
		                
		                /* '<a href="#register-modal" class="btn btn-outline-success btn-success btn-lg" role="button" data-toggle="modal" data-target="#register-modal">'+
		                'Register </a></div><div class="modal fade" id="register-modal" tabindex="-1" role="dialog" aria-labelledby="register-modal" aria-hidden="true"><div class="modal-dialog" role="document"><div class="modal-content"><div class="modal-header"><h5 class="modal-title" id="exampleModalLabel">Register</h5><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button></div><form><div class="modal-body"><div class="container-fluid"><div class="form-group row"><label for="input-email" class="col-sm-2 col-form-label">Email</label><div class="col-sm-10"><div class="input-group"><input type="text" class="form-control" id="input-email" placeholder="example@email.com"/><div class="input-group-addon"><i class="material-icons">email</i></div></div></div></div></div></div><div class="modal-footer"><button type="reset" class="btn btn-outline-secondary" data-dismiss="modal">Close</button><button type="button" class="btn btn-outline-primary">Register</button></div></form></div></div></div>'
		                 */
					$('#eventDetail').append(sResult);
			}
		 	var search=window.location.search?window.location.search:"";
 	  		var eventId=search.split('?event=')[1] ? search.split('?event=')[1] : null;
 	  		if(!eventId){
 	  			var errorAlert=$('#alert');
				var errorAlertSpan=$('#alertMessage');
				var successAlert=$('#successAlert');
				var successAlertSpan=$('#successMessage');
				
 	  			console.error('wrong event id in the url ',window.location.search);
				successAlert && successAlert.addClass('d-none');
 				errorAlertSpan && errorAlertSpan.text('No Event id specified to fetch details for.');
				errorAlert && errorAlert.removeClass('d-none');
 	  			//return;
 	  		}
			$.ajax({
				  url: '/ninerevents/webapi/event/eventDetail?event='+eventId,
				  success: eventDetailSuccess,
				  error:function(resp){
					  console && console.log('Error in geting event:',resp);
				  },
				  dataType: 'json'
				});

		 
		 </script>
		 <script>
		$(function() {
			
			var errorAlert=$('#alert');
			var errorAlertSpan=$('#alertMessage');
			var successAlert=$('#successAlert');
			var successAlertSpan=$('#successMessage');
			
			$('#registerForm').on('submit',function(e){
				e.preventDefault();
				var datatosend={};
				var form=$(this)
				datatosend['eventId']=window.location.search.split('?event=')[1];
				datatosend['email_address']= $("#input-email").val();
				datatosend;
				$.ajax({
					url:'/ninerevents/webapi/event/registerEvent',
					dataType:'json',
					 contentType: "application/json",
					data:JSON.stringify(datatosend),
					success:function(response){
						if(response==-1){
							var resetButton= $('#registerForm .modal-footer button[type="reset"]');
							resetButton.click();
							errorAlert && errorAlert.removeClass('d-none');
							errorAlertSpan && errorAlertSpan.text('You have already registered for this event.');
							successAlert && successAlert.addClass('d-none');
						}
						else if(response==0 ){//redirect to register user page
							var resetButton= $('#registerForm .modal-footer button[type="reset"]');
							resetButton.click();
							var url= window.location.origin+'/ninerevents/jsp/register-page.jsp'+window.location.search+"&id="+datatosend['email_address']+"&task=register";
							window.location.href=url;	
						}
						else if(response==-2){ //user is already registered.
							var resetButton= $('#registerForm .modal-footer button[type="reset"]');
							resetButton.click();
							errorAlert && errorAlert.removeClass('d-none');
							errorAlertSpan && errorAlertSpan.text('Oops... Something Went Wrong !');
							successAlert && successAlert.addClass('d-none');
						}
						else{ //else the user is registered for the event, show success message directly.
							var resetButton= $('#registerForm .modal-footer button[type="reset"]');
							resetButton.click();
							successAlert && successAlert.removeClass('d-none');
							successAlertSpan && successAlertSpan.text('Successfully Registered to the event.');
							errorAlert && errorAlert.addClass('d-none');
						}
						
					},
					type:'POST'
				});
			})
				
				

		});
	</script>
    </body>
</html>