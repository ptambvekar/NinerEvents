<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="https://getbootstrap.com/favicon.ico">
        <title>Niner Events</title>
        
        <!-- Bootstrap core CSS -->
        <link href="https://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Google Material Icon Pack -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

        <!-- jQuery UI -->
        <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">

        <!-- DatePicker CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/css/bootstrap-datepicker.css">
        

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

        /* Size for Material Icons */
        .material-icons.md-18 { font-size: 18px; }

        /* Size of DatePicker */
        .ui-datepicker {
            font-size: 60%;
        }
    </style>

    <body>
        <!-- HEADER - END -->
        <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
            <a class="navbar-brand" href="/ninerevents/">Niner Events</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="nav navbar-nav ml-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="">
                                <i class="material-icons md-18">home</i>
                                Home
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="jsp/browseEvents.jsp">
                                <i class="material-icons md-18">date_range</i>
                                Events
                            </a>
                        </li>
                    </ul>   
            </div>
        </nav>
        <!-- HEADER - END -->

        <main role="main" class="container-fluid top-adjust">
            <div class="card text-center border-primary">
                <div class="card-header">
                    <strong>
                        Featured
                    </strong>
                </div>
                <div class="card-body card-warning">
                    <div id = "featuredEvents"   class = "row">
                        
                    </div>
                </div>
            </div>

            <br/>

            <div class="form-group row">
                <aside class = "d-none d-sm-block col-md-2">
                    <div class = "card text-center border-warning">
                        <p class = "card-header">
                            Calendar
                        </p>

                        <div class = "card-body">
                            <div id="datepicker" data-date="<% new java.util.Date(); %>"></div>
                            <span id="datepicker"></span>
                        </div>
                        
                        <div class="card-footer text-muted">
                        	<a href="html/add_event_page.html" class="btn btn-primary">Create Event</a>
                        </div>
                    </div>
                </aside>

                <div class = "col-md-8">
                    <div class = "card text-center border-primary">
                        <h5 class = "card-header">
                            Upcoming Events
                        </h5>
                        <div class = "card-body">
                        	<table id="upcomingEvents" class = "table"></table>
                        </div>
                    </div>
                </div>

                <aside class = "d-none d-sm-block col-md-2">
                    <div class = "card text-center border-warning">
                        <p class = "card-header">
                            Important Events
                        </p>

                        <div>
                           <table id="importantEvents" class = "table"></table>
                        </div>
                    </div>
                </aside>
            </div>
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
        <script>window.jQuery || document.write('<script src="../../../../assets/js/vendor/jquery.min.js"><\/script>')</script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
        <script src="https://getbootstrap.com/assets/js/vendor/popper.min.js"></script>
        <script src="https://getbootstrap.com/dist/js/bootstrap.min.js"></script>
		<script src= "https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.19.1/moment.min.js"></script>
		<!-- bootstrap datepicker -->		
		<script src= "https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/js/bootstrap-datepicker.js"></script>
		<!-- custom js -->		        
        <script src="/ninerevents/js/ninerEvents.js"> </script>
        
    </body>
</html>