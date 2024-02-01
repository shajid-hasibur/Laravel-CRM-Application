<!-- Navbar -->
<style>
  #ticketDropdown .dropdown-menu {
    display: none;
    position: absolute;
    background-color: #fff;
    opacity: 0;
    transition: opacity 0.3s ease;
    padding: 10px;
  }

  #ticketDropdown:hover .dropdown-menu {
    display: block;
    opacity: 1;
  }

  #ticketDropdown .dropdown-item {
    padding: 10px;
    text-decoration: none;
    color: #333;
    display: block;
    transition: background-color 0.3s ease;
  }

  #ticketDropdown .dropdown-item:hover {
    background-color: white;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
    color: black;
    border-radius: 5px;
  }

  .logo-img {
    height: 35px;
    width: 35px;
    border-radius: 50%;
    box-shadow: 0 4px 8px green;
    padding: 3px;
  }


  .indivisul-border {
    border: 1px solid white;
    padding: 2px;
    width: 100%;
    border-radius: 5px;
    background-color: white;
  }
</style>

<nav class="main-header navbar navbar-expand navbar-white navbar-light shadow">
  <!-- #F15A24; -->
  <!-- Left navbar links -->
  <ul class="navbar-nav p-2">

    <li class="nav-item">
      <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
    </li>
    @if(auth()->guard('admin')->user()->role_id == 1)
    <div class="btn-group" id="ticketDropdown">
      <button class="btn mx-1" type="button">
        Manage all Tickets <sup><span class="badge badge-success">{{$allCount}}</span></sup>
      </button>
      <button type="button" class="btn dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <span class="sr-only">Toggle Dropdown</span>
      </button>
      <div class="dropdown-menu">
        <div class=" d-flex" style="background-color: white;">
          <div>
            <div class="indivisul-border"> <a href="{{route('ticket.opTicket')}}" class="dropdown-item text-bold">
                <img class="logo-img" src="https://cdn-icons-png.flaticon.com/512/390/390085.png" class="mr-2" alt="Random Image">
                <sup><span class="badge badge-success">{{$countOp}}</span></sup>
                <span class="mx-3"> Open Ticket</span>
              </a>
            </div>

            <div class="indivisul-border">
              <a href="{{route('ticket.dTicket')}}" class="dropdown-item text-bold">
                <img class="logo-img" src="https://media.istockphoto.com/id/1446139139/vector/ticket-booth-icon.jpg?s=612x612&w=0&k=20&c=zACyq2HZy-YNLcASZgasamnmRnre5Pb80oEYRjKG5Z4=" class="mr-2" alt="Random Image">
                <sup><span class="badge badge-success">{{$countD}}</span></sup>
                <span class="mx-3"> Dispatch Ticket</span>
              </a>
            </div>
            <div class="indivisul-border">
              <a href="{{route('ticket.oTicket')}}" class="dropdown-item text-bold">
                <img class="logo-img" src="https://banner2.cleanpng.com/20180518/byv/kisspng-technical-support-ticket-computer-icons-issue-trac-tickets-5afee6fc90e297.5272584115266547165935.jpg" class="mr-2" alt="Random Image">
                <sup><span class="badge badge-success">{{$countO}}</span></sup>
                <span class="mx-3">
                  Onsite Ticket
                </span>
              </a>
            </div>
            <div class="indivisul-border">
              <a href="{{route('ticket.iTicket')}}" class="dropdown-item text-bold">
                <img class="logo-img" src="https://cdn-icons-png.flaticon.com/512/176/176082.png" class="mr-2" alt="Random Image">
                <sup> <span class="badge badge-success">{{$countI}}</span></sup>
                <span class="mx-3"> Invoiced Ticket</span>
              </a>
            </div>
            <div class="indivisul-border">
              <a href="{{route('ticket.cTicket')}}" class="dropdown-item text-bold">
                <img class="logo-img" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7HdVail1QxUplthX_TJBsnprBhTAVHVQ9Mw&usqp=CAU" class="mr-2" alt="Random Image">
                <sup><span class="badge badge-success">{{$countC}}</span></sup>
                <span class="mx-3"> Closed Ticket</span>
              </a>
            </div>
            <div class="indivisul-border">
              <a href="" class="dropdown-item">
                <img class="logo-img" src="https://cdn.iconscout.com/icon/free/png-256/free-ticket-1855957-1574163.png?f=webp" class="mr-2" alt="Random Image">
                <sup><span class="badge badge-success">{{$countH}}</span></sup>
                <span class="mx-3"> On Hold Ticket</span>
              </a>
            </div>
          </div>
          <!-- <div style="    background-color: white;">
            <img style="width: 350px; height:250px; padding:40px;" src="https://www.scnsoft.com/_default_upload_bucket/automated-ticketing-system.png" class="mr-2" alt="Random Image">
            <h3 class="text-center">Manage All Tickets</h3>
          </div> -->
        </div>
      </div>
    </div>
    @endif
  </ul>
  <!-- Right navbar links -->
  <ul class="navbar-nav ml-auto">

    <!-- Messages Dropdown Menu -->
    <li class="nav-item dropdown">
      <a class="nav-link" data-toggle="dropdown" href="#">
        <i class="far fa-comments"></i>
        <span class="badge badge-success navbar-badge">3</span>
      </a>
      <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
        <a href="#" class="dropdown-item">
          <!-- Message Start -->
          <div class="media">
            <img src="https://cdn-icons-png.flaticon.com/512/2815/2815428.png" alt="User Avatar" class="img-size-50 mr-3 img-circle">
            <div class="media-body">
              <h3 class="dropdown-item-title">
                Brad Diesel
                <span class="float-right text-sm text-success"><i class="fas fa-star"></i></span>
              </h3>
              <p class="text-sm">Call me whenever you can...</p>
              <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
            </div>
          </div>
          <!-- Message End -->
        </a>
        <div class="dropdown-divider"></div>
        <a href="#" class="dropdown-item">
          <!-- Message Start -->
          <div class="media">
            <img src="https://cdn-icons-png.flaticon.com/512/2815/2815428.png" alt="User Avatar" class="img-size-50 img-circle mr-3">
            <div class="media-body">
              <h3 class="dropdown-item-title">
                John Pierce
                <span class="float-right text-sm text-muted"><i class="fas fa-star"></i></span>
              </h3>
              <p class="text-sm">I got your message bro</p>
              <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
            </div>
          </div>
          <!-- Message End -->
        </a>
        <div class="dropdown-divider"></div>
        <a href="#" class="dropdown-item">
          <!-- Message Start -->
          <div class="media">
            <img src="https://cdn-icons-png.flaticon.com/512/2815/2815428.png" alt="User Avatar" class="img-size-50 img-circle mr-3">
            <div class="media-body">
              <h3 class="dropdown-item-title">
                Nora Silvester
                <span class="float-right text-sm text-success"><i class="fas fa-star"></i></span>
              </h3>
              <p class="text-sm">The subject goes here</p>
              <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
            </div>
          </div>
          <!-- Message End -->
        </a>
        <div class="dropdown-divider"></div>
        <a href="#" class="dropdown-item dropdown-footer">See All Messages</a>
      </div>
    </li>
    <!-- Notifications Dropdown Menu -->
    <li class="nav-item dropdown">
      <a class="nav-link" data-toggle="dropdown" href="#">
        <i class="far fa-bell"></i>
        <span class="badge badge-success navbar-badge">15</span>
      </a>
      <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
        <span class="dropdown-item dropdown-header">15 Notifications</span>
        <div class="dropdown-divider"></div>
        <a href="#" class="dropdown-item">
          <i class="fas fa-envelope mr-2"></i> 4 new messages
          <span class="float-right text-muted text-sm">3 mins</span>
        </a>
        <div class="dropdown-divider"></div>
        <a href="#" class="dropdown-item">
          <i class="fas fa-users mr-2"></i> 8 friend requests
          <span class="float-right text-muted text-sm">12 hours</span>
        </a>
        <div class="dropdown-divider"></div>
        <a href="#" class="dropdown-item">
          <i class="fas fa-file mr-2"></i> 3 new reports
          <span class="float-right text-muted text-sm">2 days</span>
        </a>
        <div class="dropdown-divider"></div>
        <a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
      </div>
    </li>
    <li class="nav-item dropdown">
      <a class="nav-link" data-toggle="dropdown" href="#">
        <i class="far fa-user"></i>
      </a>
      <div class="dropdown-menu dropdown-menu-right">
        <a href="#" class="dropdown-item">
          <i class="fas fa-user-circle mr-2"></i> Profile
        </a>
        <a href="#" class="dropdown-item">
          <i class="fas fa-cog mr-2"></i> Settings
        </a>
        <a href="#" class="dropdown-item">
          <i class="fas fa-list-alt mr-2"></i> Activity Log
        </a>
        <div class="dropdown-divider"></div>
        <a href="{{route('admin.logout')}}" class="dropdown-item">
          <i class="fas fa-sign-out-alt mr-2"></i> Logout
        </a>
      </div>
    </li>

  </ul>
</nav>