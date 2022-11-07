<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" href="index.css">
<meta charset="ISO-8859-1">
<title>Dashboard</title>
<style>
body {
  background-color: #fbfbfb;
}
@media (min-width: 991.98px) {
  main {
    padding-left: 240px;
  }
}

/* Sidebar */
.sidebar {
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  padding: 58px 0 0; /* Height of navbar */
  box-shadow: 0 2px 5px 0 rgb(0 0 0 / 5%), 0 2px 10px 0 rgb(0 0 0 / 5%);
  width: 240px;
  z-index: 600;
}

@media (max-width: 991.98px) {
  .sidebar {
    width: 100%;
  }
}
.sidebar .active {
  border-radius: 5px;
  box-shadow: 0 2px 5px 0 rgb(0 0 0 / 16%), 0 2px 10px 0 rgb(0 0 0 / 12%);
}

.sidebar-sticky {
  position: relative;
  top: 0;
  height: calc(100vh - 48px);
  padding-top: 0.5rem;
  overflow-x: hidden;
  overflow-y: auto; /* Scrollable contents if viewport is shorter than content. */
}

</style>
</head>
<body>
	<!--Main Navigation-->
<header>
  <!-- Sidebar -->
  <nav aria-label="Site menu"
       id="sidebarMenu" 
       class="collapse d-lg-block sidebar collapse bg-white"
       >
    <div class="position-sticky">
      <div class="list-group list-group-flush mx-3 mt-4">
        <a
           href="#"
           class="list-group-item list-group-item-action py-2 ripple"
           aria-current="true"
           >
          <em class="fas fa-tachometer-alt fa-fw me-3"></em>
          <span>Main dashboard</span>
        </a>
        <a
           href="#"
           class="list-group-item list-group-item-action py-2 ripple active"
           >
          <em class="fas fa-chart-area fa-fw me-3"></em>
            ><span>Webiste traffic</span>
        </a>
        <a
           href="#"
           class="list-group-item list-group-item-action py-2 ripple"
           ><em class="fas fa-lock fa-fw me-3"></em><span>Password</span></a
          >
        <a
           href="#"
           class="list-group-item list-group-item-action py-2 ripple"
           ><em class="fas fa-chart-line fa-fw me-3"></em>
          <span>Analytics</span></a
          >
        <a
           href="#"
           class="list-group-item list-group-item-action py-2 ripple"
           >
          <em class="fas fa-chart-pie fa-fw me-3"></em><span>SEO</span>
        </a>
        <a
           href="#"
           class="list-group-item list-group-item-action py-2 ripple"
           ><em class="fas fa-chart-bar fa-fw me-3"></em><span>Orders</span></a
          >
        <a
           href="#"
           class="list-group-item list-group-item-action py-2 ripple"
           ><em class="fas fa-globe fa-fw me-3"></em
          ><span>International</span></a
          >
        <a
           href="#"
           class="list-group-item list-group-item-action py-2 ripple"
           ><em class="fas fa-building fa-fw me-3"></em
          ><span>Partners</span></a
          >
        <a
           href="#"
           class="list-group-item list-group-item-action py-2 ripple"
           ><em class="fas fa-calendar fa-fw me-3"></em
          ><span>Calendar</span></a
          >
        <a
           href="#"
           class="list-group-item list-group-item-action py-2 ripple"
           ><em class="fas fa-users fa-fw me-3"></em><span>Users</span></a
          >
        <a
           href="#"
           class="list-group-item list-group-item-action py-2 ripple"
           ><em class="fas fa-money-bill fa-fw me-3"></em><span>Sales</span></a
          >
      </div>
    </div>
  </nav>
  <!-- Sidebar -->

  <!-- Navbar -->
  <nav aria-label="main-navbar"
       id="main-navbar"
       class="navbar navbar-expand-lg navbar-light bg-white fixed-top"
       >
    <!-- Container wrapper -->
    <div class="container-fluid">
      <!-- Toggle button -->
      <button
              class="navbar-toggler"
              type="button"
              data-mdb-toggle="collapse"
              data-mdb-target="#sidebarMenu"
              aria-controls="sidebarMenu"
              aria-expanded="false"
              aria-label="Toggle navigation"
              >
        <em class="fas fa-bars"></em>
      </button>

      <!-- Brand -->
      <a class="navbar-brand" href="#">
        <img
             src="https://mdbootstrap.com/img/logo/mdb-transaprent-noshadows.png"
             height="25"
             alt=""
             loading="lazy"
             />
      </a>
      <!-- Search form -->
      <form class="d-none d-md-flex input-group w-auto my-auto">
        <input
               autocomplete="off"
               type="search"
               class="form-control rounded"
               placeholder='Search For Product'
               style="min-width: 225px"
               />
        <span class="input-group-text border-0"
              ><em class="fas fa-search"></em
          ></span>
      </form>

      <!-- Right links -->
      <ul class="navbar-nav ms-auto d-flex flex-row">
        <!-- Notification dropdown -->
        <li class="nav-item dropdown">
          <a
             class="nav-link me-3 me-lg-0 dropdown-toggle hidden-arrow"
             href="#"
             id="navbarDropdownMenuLink"
             role="button"
             data-mdb-toggle="dropdown"
             aria-expanded="false"
             >
            <em class="fas fa-bell"></em>
            <span class="badge rounded-pill badge-notification bg-danger"
                  >1</span
              >
          </a>
          <ul
              class="dropdown-menu dropdown-menu-end"
              aria-labelledby="navbarDropdownMenuLink"
              >
            <li><a class="dropdown-item" href="#">Some news</a></li>
            <li><a class="dropdown-item" href="#">Another news</a></li>
            <li>
              <a class="dropdown-item" href="#">Something else here</a>
            </li>
          </ul>
        </li>

        <!-- Icon -->
        <li class="nav-item">
          <a class="nav-link me-3 me-lg-0" href="#">
            <em class="fas fa-fill-drip"></em>
          </a>
        </li>
        <!-- Icon -->
        <li class="nav-item me-3 me-lg-0">
          <a class="nav-link" href="#">
            <em class="fab fa-github"></em>
          </a>
        </li>

        <!-- Icon dropdown -->
        <li class="nav-item dropdown">
          <a
             class="nav-link me-3 me-lg-0 dropdown-toggle hidden-arrow"
             href="#"
             id="navbarDropdown"
             role="button"
             data-mdb-toggle="dropdown"
             aria-expanded="false"
             >
            <em class="united kingdom flag m-0"></em>
          </a>
          <ul
              class="dropdown-menu dropdown-menu-end"
              aria-labelledby="navbarDropdown"
              >
            <li>
              <a class="dropdown-item" href="#"
                 ><em class="united kingdom flag"></em>English
                <em class="fa fa-check text-success ms-2"></em
                  ></a>
            </li>
            <li><hr class="dropdown-divider" /></li>
            <li>
              <a class="dropdown-item" href="#"
                 ><em class="poland flag"></em>Polski</a
                >
            </li>
            <li>
              <a class="dropdown-item" href="#"
                 ><em class="china flag"></em>中文</a
                >
            </li>
            <li>
              <a class="dropdown-item" href="#"
                 ><em class="japan flag"></em>日本語</a
                >
            </li>
            <li>
              <a class="dropdown-item" href="#"
                 ><em class="germany flag"></em>Deutsch</a
                >
            </li>
            <li>
              <a class="dropdown-item" href="#"
                 ><em class="france flag"></em>Français</a
                >
            </li>
            <li>
              <a class="dropdown-item" href="#"
                 ><em class="spain flag"></em>Español</a
                >
            </li>
            <li>
              <a class="dropdown-item" href="#"
                 ><em class="russia flag"></em>Русский</a
                >
            </li>
            <li>
              <a class="dropdown-item" href="#"
                 ><em class="portugal flag"></em>Português</a
                >
            </li>
          </ul>
        </li>

        <!-- Avatar -->
        <li class="nav-item dropdown">
          <a
             class="nav-link dropdown-toggle hidden-arrow d-flex align-items-center"
             href="#"
             id="navbarDropdownMenuLink"
             role="button"
             data-mdb-toggle="dropdown"
             aria-expanded="false"
             >
            <img
                 src="https://mdbootstrap.com/img/Photos/Avatars/img (31).jpg"
                 class="rounded-circle"
                 height="22"
                 alt=""
                 loading="lazy"
                 />
          </a>
          <ul
              class="dropdown-menu dropdown-menu-end"
              aria-labelledby="navbarDropdownMenuLink"
              >
            <li><a class="dropdown-item" href="#">My profile</a></li>
            <li><a class="dropdown-item" href="#">Settings</a></li>
            <li><a class="dropdown-item" href="#">Logout</a></li>
          </ul>
        </li>
      </ul>
    </div>
    <!-- Container wrapper -->
  </nav>
  <!-- Navbar -->
</header>
<!--Main Navigation-->

<!--Main layout-->
<main style="margin-top: 58px">
  <div class="container pt-4">

  </div>
</main>
<!--Main layout-->


</body>
</html>