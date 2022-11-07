<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>Collapsible sidebar using Bootstrap 4</title>

    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="/css/style.css">

    <!-- Font Awesome JS -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
<style>
.card-img-top {
	object-fit: contain;
}

</style>
</head>

<body>
    <div class="wrapper">
        <!-- Sidebar  -->
        <nav id="sidebar">
            <div class="sidebar-header">
                <h3>Ecommerce Application</h3>
            </div>

            <ul class="list-unstyled components">
                <p class="font-weight-normal">Main Menu</p>
                <li class="active">
                    <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Home</a>
                    <ul class="collapse list-unstyled" id="homeSubmenu">
                        <li>
                            <a href="#">Home 1</a>
                        </li>
                        <li>
                            <a href="#">Home 2</a>
                        </li>
                        <li>
                            <a href="#">Home 3</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#">About</a>
                </li>
                <li>
                    <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Pages</a>
                    <ul class="collapse list-unstyled" id="pageSubmenu">
                        <li>
                            <a href="#">Page 1</a>
                        </li>
                        <li>
                            <a href="#">Page 2</a>
                        </li>
                        <li>
                            <a href="#">Page 3</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#">Portfolio</a>
                </li>
                <li>
                    <a href="#">Contact</a>
                </li>
            </ul>
        </nav>

        <!-- Page Content  -->
        <div id="content">

            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">

                    <button class="navbar-toggler" type="button"
					data-mdb-toggle="collapse" data-mdb-target="#sidebarMenu"
					aria-controls="sidebarMenu" aria-expanded="false"
					aria-label="Toggle navigation">
					<em class="fas fa-bars"></em>
				</button>

			
				<!-- Search form -->
				<form class="d-none d-md-flex input-group w-auto my-auto">
					<input autocomplete="off" type="search"
						class="form-control rounded" placeholder='Search For Product'
						style="min-width: 225px" /> <span
						class="input-group-text border-0">
						<button type="button" class="btn"> <span class="fas fa-search"></span>   search</button></span>
				</form>
                    <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fas fa-align-justify"></i>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="nav navbar-nav ml-auto">
                            <li class="nav-item ">
                                <a class="nav-link" href="#"><span class="fas fa-bell"></span>  Notifications</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#"><span class="fas fa-cart-plus"></span>  Cart</a>   
                            </li>
                          
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- Card  -->
            <div class="card shadow  mb-2 bg-white rounded">
                <div class="row no-gutters">
                    <div class="col-sm-3" style="border-right: 2px solid blue;">
                        <img class="card-img-top img-fluid my-2" src="../images/me ugly.png" alt="Suresh Dasari Card" style="height: 200px; width: 350px;">
                    </div>
                    <div class="col-sm-9">
                        <div class="card-body">
                            <h5 class="card-title">Suresh Dasari</h5>
                            <p class="card-text">Suresh Dasari is a founder and technical lead developer in tutlane.Fire-Boltt Visionary 1.78" AMOLED Bluetooth Calling Smartwatch with 368*448 Pixel Resolution 100+ Sports Mode, TWS Connection, Voice Assistance, SPO2 & Heart Rate Monitoring.</p>
                            <div class="text-right">
                            <a href="#" class="btn btn-primary">Add to Cart</a> 
                            <a href="#" class="btn btn-danger">Buy Now</a>
                            </div>
                        </div>
                    </div>
                </div>
        </div>

        <div class="card shadow  mb-2 bg-white rounded">
            <div class="row no-gutters">
                <div class="col-sm-3" style="border-right: 2px solid blue;">
                    <img class="card-img-top img-fluid my-2" src="../images/me ugly.png" alt="Suresh Dasari Card" style="height: 200px; width: 350px;">
                </div>
                <div class="col-sm-9">
                    <div class="card-body">
                        <h5 class="card-title">Suresh Dasari</h5>
                        <p class="card-text">Suresh Dasari is a founder and technical lead developer in tutlane.Fire-Boltt Visionary 1.78" AMOLED Bluetooth Calling Smartwatch with 368*448 Pixel Resolution 100+ Sports Mode, TWS Connection, Voice Assistance, SPO2 & Heart Rate Monitoring.</p>
                        <div class="text-right">
                        <a href="#" class="btn btn-primary">Add to Cart</a> 
                        <a href="#" class="btn btn-danger">Buy Now</a>
                        </div>
                    </div>
                </div>
            </div>
    </div>
    <div class="card shadow  mb-2 bg-white rounded">
        <div class="row no-gutters">
            <div class="col-sm-3" style="border-right: 2px solid blue;">
                <img class="card-img-top img-fluid my-2" src="../images/me ugly.png" alt="Suresh Dasari Card" style="height: 200px; width: 350px;">
            </div>
            <div class="col-sm-9">
                <div class="card-body">
                    <h5 class="card-title">Suresh Dasari</h5>
                    <p class="card-text">Suresh Dasari is a founder and technical lead developer in tutlane.Fire-Boltt Visionary 1.78" AMOLED Bluetooth Calling Smartwatch with 368*448 Pixel Resolution 100+ Sports Mode, TWS Connection, Voice Assistance, SPO2 & Heart Rate Monitoring.</p>
                    <div class="text-right">
                    <a href="#" class="btn btn-primary">Add to Cart</a> 
                    <a href="#" class="btn btn-danger">Buy Now</a>
                    </div>
                </div>
            </div>
        </div>
</div>
<div class="card shadow  mb-2 bg-white rounded">
    <div class="row no-gutters">
        <div class="col-sm-3" style="border-right: 2px solid blue;">
            <img class="card-img-top img-fluid my-2" src="../images/me ugly.png" alt="Suresh Dasari Card" style="height: 200px; width: 350px;">
        </div>
        <div class="col-sm-9">
            <div class="card-body">
                <h5 class="card-title">Suresh Dasari</h5>
                <p class="card-text">Suresh Dasari is a founder and technical lead developer in tutlane.Fire-Boltt Visionary 1.78" AMOLED Bluetooth Calling Smartwatch with 368*448 Pixel Resolution 100+ Sports Mode, TWS Connection, Voice Assistance, SPO2 & Heart Rate Monitoring.</p>
                <div class="text-right">
                <a href="#" class="btn btn-primary">Add to Cart</a> 
                <a href="#" class="btn btn-danger">Buy Now</a>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="card shadow  mb-2 bg-white rounded">
    <div class="row no-gutters">
        <div class="col-sm-3" style="border-right: 2px solid blue;">
            <img class="card-img-top img-fluid my-2" src="../images/me ugly.png" alt="Suresh Dasari Card" style="height: 200px; width: 350px;">
        </div>
        <div class="col-sm-9">
            <div class="card-body">
                <h5 class="card-title">Suresh Dasari</h5>
                <p class="card-text">Suresh Dasari is a founder and technical lead developer in tutlane.Fire-Boltt Visionary 1.78" AMOLED Bluetooth Calling Smartwatch with 368*448 Pixel Resolution 100+ Sports Mode, TWS Connection, Voice Assistance, SPO2 & Heart Rate Monitoring.</p>
                <div class="text-right">
                <a href="#" class="btn btn-primary">Add to Cart</a> 
                <a href="#" class="btn btn-danger">Buy Now</a>
                </div>
            </div>
        </div>
    </div>
</div>


    </div>

    <!-- jQuery CDN - Slim version (=without AJAX) -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <!-- Popper.JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
</body>

</html>