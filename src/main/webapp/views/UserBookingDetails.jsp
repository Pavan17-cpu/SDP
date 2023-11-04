<% if (session.getAttribute("User_email") == null) {
    response.sendRedirect("/signin");
  } else { %>
  
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <jsp:include page="includes/header.jsp" />  
  <jsp:include page="includes/userNav.jsp" /> 
  <style>
    .card:hover {
    transform: scale(1.05);
    box-shadow: 0 10px 20px rgba(0, 0, 0, .12), 0 4px 8px rgba(0, 0, 0, .06);
    transition: 0.3s ease-in-out;
    cursor: pointer;
    }
    </style> 
  
  <div>
    <p>Welcome 
    <% if(session.getAttribute("User_gender").equals("male")) { %> 
        Mr.
    <% } else { %> 
        Miss.
    <% } %> 
    <span style="color: black; font-weight: bold">${User_firstname} ${User_lastname}</span></p>
  </div>
  <style>
    .form-control:focus {
      border-color: #ced4da; /* Reset the border color to the default */
      box-shadow: none; /* Remove the box shadow */
  }
  </style>

<style>
    /* Style the table */
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
        background-color: #f2f2f2;
    }

    th, td {
        padding: 10px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: black;
        color: #fff;
    }

    /* Style the table rows */
    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    tr:hover {
        background-color: #ddd;
    }

    /* Style the status based on accept_status and payment_status */
    .status-pending {
        background-color: #ffc107;
        color: #000;
    }

    .status-accepted {
        background-color: #28a745;
        color: #fff;
    }

    .status-paid {
        background-color: #007BFF;
        color: #fff;
    }

    .status-cancelled-admin {
        background-color: #dc3545;
        color: #fff;
    }

    .status-cancelled-user {
        background-color: #17a2b8;
        color: #fff;
    }
</style>
<!-- Rest of your code -->

  <div style="overflow-x: auto;">
<table class="table table-bordered table-hover">
    <thead>
        <tr>
            
            <th>Status</th>
            <th>Hotel</th>
            <th>Event</th>
            <th>Booked Date</th>
            <th>Catering Name</th>
            <th>Event Date</th>
            <th>Event Time</th>
            <th>No of Hours</th>
            <th>No of Guests</th>
            <th>Photographer</th>
            <th>DJ</th>
            <th>Makeup Artist</th>
            <th>Decorator</th>
            <th>Cost</th>

            <th>Action</th> <!-- Add a new table header for actions -->
        </tr>
    </thead>
    <tbody>
        <c:forEach var="booking" items="${User_bookings}" varStatus="loop">
            <tr>
               
                <td>
                    <c:choose>
                        <c:when test="${booking.accept_status == 0 && booking.payment_status == 0}">Pending</c:when>
                        <c:when test="${booking.accept_status == 1 && booking.payment_status == 0}">Booking Accepted</c:when>
                        <c:when test="${booking.accept_status == 1 && booking.payment_status == 1}">Paid</c:when>
                        <c:when test="${booking.accept_status == 2 && booking.payment_status == 0}">Cancelled by admin</c:when>
                        <c:when test="${booking.accept_status == 3 && booking.payment_status == 0}">Cancelled by you</c:when>
                    </c:choose>
                </td>
                <td>${booking.hotel.hotelName}</td>
                <td>${booking.event.eventname}</td>
                <td>${booking.current_date}</td>
                <td>${booking.catering.catername}</td>
                <td>${booking.event_date}</td>
                <td>${booking.start_at}</td>
                <td>${booking.max_total_hour} hrs</td>
                <td>${booking.no_of_guest}</td>
                <td>
                    <c:if test="${booking.photographer_name_desc != 'none'}">
                         ${booking.photographer_name_desc}
                    </c:if>
                    <c:if test="${booking.photographer_name_desc == 'none'}">
                        None
                    </c:if>
                </td>
                <td>
                    <c:if test="${booking.dj_name_desc != 'none'}">
                         ${booking.dj_name_desc}
                    </c:if>
                    <c:if test="${booking.dj_name_desc == 'none'}">
                         None
                    </c:if>
                </td>
                <td>
                    <c:if test="${booking.makeupartist_name_desc != 'none'}">
                       ${booking.makeupartist_name_desc}
                    </c:if>
                    <c:if test="${booking.makeupartist_name_desc == 'none'}">
                         None
                    </c:if>
                </td>
                <td>
                    <c:if test="${booking.decorator_name_desc != 'none'}">
                         ${booking.decorator_name_desc}
                    </c:if>
                    <c:if test="${booking.decorator_name_desc == 'none'}">
                         None
                    </c:if>
                </td>
                <td>
                    <span class="font-weight-bold"><i class="fa fa-inr" aria-hidden="true"></i>${booking.amount}</span>
                </td>
                                                
                      <td>          
                    <!-- Buttons for actions -->
                    <c:if test="${booking.accept_status == 0 && booking.payment_status == 0}">
                        <form action="/bookcancelbyuser" method="POST">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            <input type="hidden" value="${booking.id}" name="booking_id">
                            <button type="submit" class="btn btn-dark" onclick='return cancelBooking()'>Cancel</button>
                        </form>
                    </c:if>
                    <c:if test="${booking.accept_status == 1 && booking.payment_status == 0}">
                        <div class="d-flex">
                            <form action="/paytmuser" method="POST">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <input type="hidden" value="${User_id}" name="booking_userid">
                                <input type="hidden" value="${booking.amount}" name="total_amt">
                                <input type="hidden" value="${booking.id}" name="booking_id">
                                <button type="submit" value="Continue to checkout" class="btn btn-dark">Pay</button>
                            </form>
                            <form action="/bookcancelbyuser" method="POST" class="ml-3">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <input type="hidden" value="${booking.id}" name="booking_id">
                                <button type="submit" class="btn btn-dark">Cancel</button>
                            </form>
                        </div>
                    </c:if>
                    <c:if test="${booking.accept_status == 1 && booking.payment_status == 1}">
                        <form action="userbookingdetails/export" method="GET">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            <input type="hidden" value="${booking.id}" name="booking_id">
                            <button type="submit" class="btn btn-dark">Bill</button>
                        </form>
                    </c:if>

                    <!-- Add more buttons or actions as needed -->
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</div>
<!-- Rest of your code -->





<jsp:include page="includes/footer.jsp" />

<% } %>

