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
    </head>

    <style>
        /* Fix NavBar to the top */
        body {
            min-height: 75rem;
            padding-top: 4.5rem;
        }

        /* Size for Material Icons */
        .material-icons.md-18 { font-size: 18px; }

        /* Size of DatePicker */
        .ui-datepicker {
            font-size: 60%;
        }
    </style>

    <body>
        <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
            <a class="navbar-brand" href="#">Niner Events</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="nav navbar-nav ml-auto">
                        <li class="nav-item active">
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

        <main role="main" class="container-fluid">
            <div class="card text-center border-primary">
                <div class="card-header">
                    <strong>
                        Featured
                    </strong>
                </div>
                <div class="card-body">
                    <div class = "row">
                        <div class = "col-sm-4 col-md-4 col-xs-12">
                            <div class="card text-center">
                                <div class="card-header">
                                    EVENT 1
                                </div>

                                <div class="card-body">
                                    <h4 class="card-title">
                                        EVENT 1 Tag Line
                                    </h4>

                                    <p class = "card-text">
                                        Event 1 Detals
                                    </p>
                                </div>

                                <div class="card-footer text-muted">
                                    <a href="#" class="btn btn-primary">Register</a>
                                </div>
                            </div>
                        </div>

                        <div class = "col-sm-4 col-md-4 col-xs-12">
                            <div class="card text-center">
                                <div class="card-header">
                                    EVENT 2
                                </div>

                                <div class="card-body">
                                    <h4 class="card-title">
                                        EVENT 2 Tag Line
                                    </h4>

                                    <p class = "card-text">
                                        Event 2 Detals
                                    </p>
                                </div>

                                <div class="card-footer text-muted">
                                    <a href="#" class="btn btn-primary">Register</a>
                                </div>
                            </div>
                        </div>

                        <div class = "col-sm-4 col-md-4 col-xs-12">
                            <div class="card text-center">
                                <div class="card-header">
                                    EVENT 3
                                </div>

                                <div class="card-body">
                                    <h4 class="card-title">
                                        EVENT 3 Tag Line
                                    </h4>

                                    <p class = "card-text">
                                        Event 3 Detals
                                    </p>
                                </div>

                                <div class="card-footer text-muted">
                                    <a href="#" class="btn btn-primary">Register</a>
                                </div>
                            </div>
                        </div>
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
                            <span id="datepicker"></span>
                        </div>
                    </div>
                </aside>

                <div class = "col-md-8">
                    <div class = "card text-center border-primary">
                        <h5 class = "card-header">
                            Upcoming Events
                        </h5>

                        <div class = "card-body">
                            <table class = "table">
                                <thead class="thead-light">
                                    <tr>
                                        <th colspan="2">
                                            Day 1
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            Event Name
                                        </td>
                                        <td>
                                            Timing
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Event Name
                                        </td>
                                        <td>
                                            Timing
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Event Name
                                        </td>
                                        <td>
                                            Timing
                                        </td>
                                    </tr>
                                </tbody>
                            </table>

                            <table class = "table">
                                <thead class="thead-light">
                                    <tr>
                                        <th colspan="2">
                                            Day 2
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            Event Name
                                        </td>
                                        <td>
                                            Timing
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Event Name
                                        </td>
                                        <td>
                                            Timing
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Event Name
                                        </td>
                                        <td>
                                            Timing
                                        </td>
                                    </tr>
                                </tbody>
                            </table>

                            <table class = "table">
                                <thead class="thead-light">
                                    <tr>
                                        <th colspan="2">
                                            Day 3
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            Event Name
                                        </td>
                                        <td>
                                            Timing
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Event Name
                                        </td>
                                        <td>
                                            Timing
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Event Name
                                        </td>
                                        <td>
                                            Timing
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <aside class = "d-none d-sm-block col-md-2">
                    <div class = "card text-center border-warning">
                        <p class = "card-header">
                            Important Events
                        </p>

                        <div class = "card-body">
                            Important Events Table goes here
                        </div>
                    </div>
                </aside>
            </div>
        </main>

        <!-- Bootstrap core JavaScript
            ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script>window.jQuery || document.write('<script src="../../../../assets/js/vendor/jquery.min.js"><\/script>')</script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
        <script src="https://getbootstrap.com/assets/js/vendor/popper.min.js"></script>
        <script src="https://getbootstrap.com/dist/js/bootstrap.min.js"></script>

        <script>
            $( function() {
                $( "#datepicker" ).datepicker({
                    autoSize: true
                });
            });
        </script>
    </body>
</html>