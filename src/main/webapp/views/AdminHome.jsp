<%if (session.getAttribute("Admin_email") == null) {response.sendRedirect("/signin"); } else {%> 
<jsp:include page="includes/header.jsp" />  
	
	<jsp:include page="includes/adminNav.jsp" />  
	
	<style>
    .card:hover {
      transform: scale(1.05);
      box-shadow: 0 10px 20px rgba(0, 0, 0, .12), 0 4px 8px rgba(0, 0, 0, .06);
      transition: 0.3s ease-in-out;
      cursor:pointer;
  }
    </style>
    <style>
        .form-control:focus {
          border-color: #ced4da; /* Reset the border color to the default */
          box-shadow: none; /* Remove the box shadow */
      }
      </style>
     <style>
      body {
          font-family: Arial, sans-serif;
          margin: 0;
          padding: 0;
          background-color: #f4f4f4;
      }

      header {
          background-color: #333;
          color: #fff;
          padding: 20px;
          text-align: center;
      }

  

      main {
          padding: 20px;
      }

      h2 {
          font-size: 24px;
          margin-bottom: 10px;
      }

      .stat-box {
          background-color: #fff;
          border-radius: 5px;
          box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
          padding: 20px;
          text-align: center;
          margin: 10px;
      }

      .stat-box h3 {
          font-size: 18px;
      }

      .stat-box p {
          font-size: 24px;
          font-weight: bold;
      }

      footer {
          text-align: center;
          background-color: #333;
          color: #fff;
          padding: 10px;
      }
  </style>
	    <!-- Page Content  -->
      <div>
        <div>
            <p>Welcome 
            <% if(session.getAttribute("Admin_gender").equals("male")){ %> 
                Mr.
            <% } else { %> 
                Miss.
            <% } %> 
            <span style="color:black;font-weight:bold">${Admin_firstname} ${Admin_lastname}</span></p>
        </div>

<link rel="stylesheet" type="text/css" href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/css/bootstrap-extended.min.css">
<link rel="stylesheet" type="text/css" href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/fonts/simple-line-icons/style.min.css">
<link rel="stylesheet" type="text/css" href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/css/colors.min.css">


<div class="grey-bg container-fluid">
  <section id="minimal-statistics">
    <div class="row">
      <div class="col-12 mt-3 mb-1">
       
      </div>
    </div>
    <main>
      <section id="statistics">
          <h2>Statistics</h2>
          <div class="stat-box">
              <h3>Total Users</h3>
              <p style="color: black;"   >${admin_user_count}</p>
          </div>
          <div class="stat-box">
              <h3>Total Hotels</h3>
              <p style="color: black;" > ${admin_hotel_count}</p>
          </div>
          <div class="stat-box">
              <h3>Total Events</h3>
              <p style="color: black;" >${admin_event_count}</p>
          </div>
        <div class="stat-box">
              <h3>Total Caterings</h3>
              <p style="color: black;" >${admin_catering_count}</p>
          </div>
        <div class="stat-box">
              <h3>Total Vendors</h3>
              <p style="color: black;" >${admin_vendor_count}</p>
          </div>
<div class="stat-box">
              <h3>Total Booking</h3>
              <p style="color: black;" >${admin_booking_count}</p>
          </div>
<div class="stat-box">
              <h3>Pending Bookings</h3>
              <p style="color: black;" >${admin_bookingpending_count}</p>
          </div>
  <div class="stat-box">
              <h3>Paid Bookings</h3>
              <p style="color: black;" >${admin_bookingpaid_count}</p>
          </div>
<div class="stat-box">
              <h3>UnPaid Bookings</h3>
              <p style="color: black;" >${admin_bookingunpaid_count}</p>
          </div>
<div class="stat-box">
              <h3>Bookings Cancelled by Admin</h3>
              <p style="color: black;" >${admin_bookingcancelbyadmin_count}</p>
          </div>
<div class="stat-box">
              <h3>Bookings Cancelled by User</h3>
              <p style="color: black;" >${admin_bookingcancelbyuser_count}</p>
          </div>
      </section>
  </main>
</div>
</div>
</div>
	
	

<jsp:include page="includes/footer.jsp" />  
<%}%>