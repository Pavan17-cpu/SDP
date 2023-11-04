<%if (session.getAttribute("Admin_email") == null) {response.sendRedirect("/signin"); } else {%> 

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <jsp:include page="includes/header.jsp" />  
        
        <jsp:include page="includes/adminNav.jsp" />  
        <style>
            .button-container {
  display: flex; /* Use flexbox to align forms horizontally */
  gap: 10px; /* Adjust the value to control the spacing between forms */
}

        </style>
        
          
        <div>
            <p>Welcome 
            <% if(session.getAttribute("Admin_gender").equals("male")){ %> 
                Mr.
            <% } else { %> 
                Miss.
            <% } %> 
            <span style="color:black;font-weight:bold">${Admin_firstname} ${Admin_lastname}</span></p>
        </div>
             
	<div class="d-flex justify-content-between">
	    
		  <!--
		  <form class="d-flex"  action="/bookingSearch"  method="post" autocomplete="off">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input class="form-control" type="search" name="valueToSearch" placeholder="Value To Search" aria-label="Search" value="${booking_keyword}">
            <button class="btn ml-2 btn-info" type="submit" name="search">Search</button>
        </form>
		    --> 
            <style>
                .form-control:focus {
                  border-color: #ced4da; /* Reset the border color to the default */
                  box-shadow: none; /* Remove the box shadow */
              }
              </style>
			
			<form>
				<a href="/downloadExcel" class="btn btn-dark" style="background-color: black; color: white;">Download Report</a>

			</form>
	    </div>

<br /><br/>

          
          
                  <div class="table-responsive">
                      <table class="content-table table" id="table-id">
                          <thead>
                              <tr>
                              <th>USER NAME</th>
                              <th>USER EMAIL</th>
                              <th>HOTEL NAME</th>
                              <th>EVENT NAME</th>
                              <th>CATERING NAME</th>
                              <th>PHOTOGRAPHER NAME</th>
                              <th>DJ NAME</th>
                              <th>MAKEUPARTIST NAME</th>
                              <th>DECORATOR NAME</th>
                              <th>EVENT DATE</th>
                              <th>EVENT BOOKEDON</th>
                              <th>EVENT STARTTIME</th>
                              <th>MAX TIMEEVENT</th>
                              <th>NO OF GUEST</th>
                              <th>STATUS</th>
                              <th>ACTION</th>
                          </tr>
                      </thead>
                           <tbody>
                               <c:forEach var="allbooking" items="${admin_booking}" >
                                  <tr>
                                      <td>${allbooking.user.firstName} ${allbooking.user.lastName}</td>
                                      <td>${allbooking.user.email}</td>
                                      <td>${allbooking.hotel.hotelName}</td>
                                      <td>${allbooking.event.eventname}</td>
                                      <td>${allbooking.catering.catername}</td>
                                      <td>${allbooking.photographer_name_desc}</td>
                                      <td>${allbooking.dj_name_desc}</td>
                                      <td>${allbooking.makeupartist_name_desc}</td>
                                      <td>${allbooking.decorator_name_desc}</td>
                                      <td>${allbooking.event_date}</td>
                                      <td>${allbooking.current_date}</td>
                                      <td>${allbooking.start_at}</td>
                                      <td>${allbooking.max_total_hour} hours</td>
                                      <td>${allbooking.no_of_guest}</td>
                                      <td class="d-flex">
                                        <c:if test = "${allbooking.accept_status==0 && allbooking.payment_status==0}">
                                            <span class="text-muted">Pending</span>
                                        </c:if>
                                        <c:if test = "${allbooking.accept_status==1 && allbooking.payment_status==0}">
                                            <span class="text-muted">Booking Accepted</span>
                                        </c:if>
                                        <c:if test = "${allbooking.accept_status==1 && allbooking.payment_status==1}">
                                            <span class="text-muted">Paid</span>
                                        </c:if>
                                        <c:if test = "${allbooking.accept_status==2 && allbooking.payment_status==0}">
                                            <span class="text-muted">Cancelled by you</span>
                                        </c:if>
                                        <c:if test = "${allbooking.accept_status==3 && allbooking.payment_status==0}">
                                            <span class="text-muted">Cancelled by user</span>
                                        </c:if>
                                      </td>
                                      <td>
                                        <c:if test = "${allbooking.accept_status==0 && allbooking.payment_status==0}">
                                           <div class="d-flex">

                                            <div class="button-container">
                                                <form action="/bookacceptbyadmin" method="POST">
                                                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                  <input type="hidden" value="${allbooking.id}" name="booking_id">
                                                  <button type="submit" class="btn btn-dark" style="background-color: black; color: white;">Accept</button>
                                                </form>
                                              
                                                <form action="/bookcancelbyadmin" method="POST">
                                                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                  <input type="hidden" value="${allbooking.id}" name="booking_id">
                                                  <button type="submit" class="btn btn-dark" onclick='return cancelBooking()' style="background-color: black; color: white;">Cancel</button>
                                                </form>
                                              </div>
                                              
                                           </div>
                                        </c:if>
                                    </td>
                                  </tr>
                              </c:forEach>
                           </tbody>  
                          </table> 
                      </div>
                      
                      <div style="display: flex; justify-content: space-between;">
                        <div>
                            <label style="color: black;">Select No. of rows to display:</label>
                            <select class="form-control" name="state" id="maxRows" style="width: 250px;">
                                <option value="5000" style="color: black;">Show ALL Rows</option>
                                <option value="5" style="color: black;">5</option>
                                <option value="10" style="color: black;">10</option>
                                <option value="15" style="color: black;">15</option>
                                <option value="20" style="color: black;">20</option>
                                <option value="50" style="color: black;">50</option>
                                <option value="70" style="color: black;">70</option>
                                <option value="100" style="color: black;">100</option>
                            </select>
                        </div>
                    
                    
              </div>        
          
    
        
                    </div>
                    </div>
                </div>
    
    
        
                
        
    
    
        <jsp:include page="includes/footer.jsp" />  
        <%}%>
        