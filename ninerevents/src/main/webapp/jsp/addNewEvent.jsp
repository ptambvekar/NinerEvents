w<!DOCTYPE html>
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
        <link rel="stylesheet" href="../css/bootstrap-timepicker.min.css">
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
            <a class="navbar-brand" href="/ninerevents/">Niner Events</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="nav navbar-nav ml-auto">
                        <li class="nav-item active">
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
            <strong>Please Provide ALL Event Details!</strong>
        </div>
        <!-- Alert if event start time and event end time are sameStartEndTimeErrorId -->
        <div id= "sameStartEndTimeErrorId" class="alert alert-danger alert-dismissible d-none" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
            <strong>Start and End Time Cannot Be The Same!</strong>
        </div>
        <!-- Alert if start time is after end time -->
        <div id= "startEndTimeOrderErrorId" class="alert alert-danger alert-dismissible d-none" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
            <strong>Start Time Cannot Be After End Time!</strong>
        </div>
         <!-- Alert if start date is after end date-->
        <div id= "startEndDateOrderErrorId" class="alert alert-danger alert-dismissible d-none" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
            <strong>Start Date Cannot Be After End Date!</strong>
        </div>
        <!-- Event creation form -->
        <!-- Row 1 for Event Name and Event Category -->
        <form>
	        <div class = "row">
	            <!-- Event Name -->
	            <div class = "col">
	                    <div class = "row align-items-center">
	                        <div class = "col-sm-12 col-md-4">
	                            <label for="eventName">Event Name</label>
	                        </div>
	                        <div class = "col-xs-12 col-md-8">
	                            <input type="text" class="form-control" placeholder="Add event name" id="eventName" maxlength="64">
	                        </div>
	                    </div>
	            </div>
	            <!-- Event Category -->
	            <div class="col">
	                    <div class = "row align-items-center">
	                        <div class = "col-sm-12 col-md-4">
	                            <label for="eventCategory">Category</label>
	                        </div>
	                        <div class = "col-sm-12 col-md-8">
	                            <select class="form-control" id="eventCategoryList" required>
	                            
	                            </select>
	                        </div>
	                    </div>
	            </div>
	        </div>
	        <!-- Row1 Ends -->
	        <!-- Row 2 for Event Description and Event Venue-->
	        <div class="row mt-2">
	            <!-- Event Venue and Event Date -->
	            <div class="col">
	                    <div class = "row align-items-center">
	                        <div class = "col-md-2">
	                            <label for="eventVenue">Venue</label>
	                        </div>
	                        <div class = "col-sm-12 col-md-4">
	                            <select class="form-control" id="eventVenueList" required>
	                               

	                            </select>
	                        </div>
	                        
	                        <div class = "col-md-2">
	                            <label for="email">Email</label>
	                        </div>
	                        <div class = "col-sm-12 col-md-4">
								<input type="email" class="form-control" placeholder="Email">
	                        </div>
	                    </div>
	            </div>
	        </div>
	
	        <div class="row mt-2">
	        <!-- Event Date -->
	            <div class="col-md-6">
	                    <div class = "row align-items-center">
	                        <div class = "col-md-4">
	                            <label for="datepicker1">Event Start Date</label>
	                        </div>
	                        <div class="col-md-8">
	                            <input type="text" class="form-control" placeholder="Add Event Date" id="datepicker1">
	                        </div>
	                    </div>
	            </div>
	            
	            <div class="col-md-6">
	                    <div class = "row align-items-center">
	                        <div class = "col-md-4">
	                            <label for="datepicker2">Event End Date</label>
	                        </div>
	                        <div class="col-md-8">
	                            <input type="text" class="form-control" placeholder="Add Event Date" id="datepicker2">
	                        </div>
	                    </div>
	            </div>
	        </div>
	        <!-- Row2 ends -->
	        <!-- Row3 for Event Start Time and Event End Time -->
	        <div class="row mt-2">
	            <!-- Event Start Time -->
	            <div class="col">
	                    <div class = "row align-items-center">
	                        <div class = "col-md-4">
	                            <label for="startTime">Start Time</label>
	                        </div>
	                        <div class = "col-md-8 input-group bootstrap-timepicker timepicker" style="z-index:0">
	                            <input id="startTime" type="text" class="form-control" value="00:00:00">
	                            <span class="input-group-addon"><i class="material-icons md-18">access_time</i></span>
	                        </div>
	                    </div>
	            </div>
	            <!-- Event End Time -->
	            <div class = "col">
	                    <div class = "row align-items-center">
	                        <div class = "col-md-4">
	                            <label for="endTime">End Time</label>
	                        </div>
	                        <div class = "col-md-8 input-group bootstrap-timepicker timepicker" style="z-index:0">
	                            <input id="endTime" type="text" class="form-control" value="01:00:00">
	                            <span class="input-group-addon"><i class="material-icons md-18">access_time</i></span>
	                        </div>
	                    </div>
	            </div>
	        </div>
	        <!-- Row 3 Ends -->
	        <!-- Row 4 for Event Description -->
	        <div class="row mt-2">
	            <!-- Event Description -->
	            <div class="col">
	                    <div class = "row align-items-center">
	                        <div class = "col-md-2">
	                            <label for="eventDescription">Description</label>
	                        </div>
	                        <div class="col-md-10">
	                            <textarea rows="4" class="form-control" placeholder="Add Event Description" id="eventDescription" maxlength="2000"></textarea>
	                        </div>
	                    </div>
	            </div>
	        </div>
	        <!-- Row 4 Ends -->
	        <hr/>
	        <!-- Row 5 for Add Event Button -->
	        <div class="row mt-4" id="createButtonRow">
	            <div class="col-md-3 offset-md-3">
                    <a id="createButton" class="btn btn-primary btn-block" role = "button" href="#" onclick="addEventFunction()">Create</a>
	            </div>
	            <div class="col-md-3">
	            	<button id="createButton" type="reset" class="btn btn-outline-secondary btn-block">Reset</button>
	            </div>
	        </div>
	        
	        <div class="row mt-4 d-none" id="homeButton">
	            <div class="col-md-4 offset-md-4">
                    <a id="goHomeButton" class="btn btn-outline-success btn-block" role = "button" href="../index.jsp">Home</a>
	            </div>
	        </div>
        </form>
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
        <script src= "https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.19.1/moment.min.js"></script>
        <script src="../js/bootstrap-timepicker-customized.js"></script>
        <!-- Date Picker -->
        <script>
            $(function(){
              $( "#datepicker1" ).datepicker({minDate: 0});
              $( "#datepicker2" ).datepicker({minDate: 0});

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
              var name =     $("#eventName").val();
              var category = $("#eventCategoryList").val();
              var venue =    $("#eventVenueList").val();
              var startDate = $("#datepicker1").val();
              var endDate = $("#datepicker2").val();
              var starttime =$("#startTime").val();
              var endtime =  $("#endTime").val();
              var description = $("#eventDescription").val();
              
              var startDateTime=new Date(startDate);
              startDateTime.setHours(starttime.split(":")[0]);
              startDateTime.setMinutes(starttime.split(":")[1]);
              var endDateTime=new Date(endDate)
              endDateTime.setHours(endtime.split(":")[0]);
              endDateTime.setMinutes(endtime.split(":")[1]);
              
              var startMoment = moment(startDateTime);
              var endMoment = moment(endDateTime);
              
              var isEndDateAfterStartDate = endMoment.isAfter(startMoment);



            
              document.getElementById('warningId').setAttribute("class","alert alert-danger alert-dismissible d-none");
                if(name == "" || venue=="" || startDate=="" || endDate=="" || description=="")
                {
                    $("#alertId").addClass("d-none");
                    $("#homeButton").addClass("d-none");
                    $("#createButtonRow").removeClass("d-none");
                  $("#warningId").removeClass("d-none");
                }
               /*  else if(starttime==endtime)
                {
                  $("#alertId").addClass("d-none");
                  $("#sameStartEndTimeErrorId").removeClass("d-none");
                }
                else if(starttime>endtime)
                {
                  $("#alertId").addClass("d-none");
                  $("#startEndTimeOrderErrorId").removeClass("d-none");
                } */
                else if (!isEndDateAfterStartDate)
                	{
                	 $("#alertId").addClass("d-none");
                	 $("#createButtonRow").removeClass("d-none");
                	 $("#homeButton").addClass("d-none");
                     $("#startEndTimeOrderErrorId").removeClass("d-none");
                	}
                else{
            	
                 var datastring =  {
                   "eventName":name,
                   "venue_name":venue,
                   "eventCategory":category,
                   "startDateTime":startMoment.toISOString(),
                   "endDateTime":endMoment.toISOString(),
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
                     $("#startEndDateOrderErrorId").addClass("d-none");
                     $("#alertId").removeClass("d-none");
                     $("#homeButton").removeClass("d-none");
                     $("#createButtonRow").addClass("d-none");
                  }
              })
                }
            }
        </script>
        
        <script>
        $(function(){
        	
        	$.get({
        		url:'/ninerevents/webapi/event/eventLocations',
        		success: function(response){
        			if(!response || 1>response.length){
        				console && console.log('No option was found for event-type dropdown:');
        				return;
        			}
        			
        			var categoryDropDown=$('#eventVenueList');
        			htmlstring="<option></option>";
        			response.forEach(function(location){
        				htmlstring += "<option value=' "+location.id +" '>"+location.venueName+"</option>"
        			});
        			categoryDropDown.append(htmlstring);
        			
        		},
        		error:function(resp){
        			  console && console.log('Error in geting location dropdown:',resp);
        		},
        	});

        	$.get({
        		url:'/ninerevents/webapi/event/eventTypes',
        		success: function(response){
        			if(!response || 1>response.length){
        				console && console.log('No option was found for event-type dropdown:');
        				return;
        			}
        			
        			var categoryDropDown=$('#eventCategoryList');
        			htmlstring="<option></option>";
        			response.forEach(function(category){
        				htmlstring += "<option value=' "+category.id +" '>"+category.categoryName+"</option>"
        			});
        			categoryDropDown.append(htmlstring);
        			
        		},
        		error:function(resp){
        			  console && console.log('Error in geting category dropdown:',resp);
       			 },
        	});
        });        
        </script> 
    </body>
</html>