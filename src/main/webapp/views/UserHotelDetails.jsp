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

<div class="album py-5 bg-light">
  <div class="container">
    <c:forEach var="allhotel" items="${hotellist}">
      <div class="row mb-4">
        <div class="col-md-12">
          <div class="card">
            <img class="card-img-top" img src="data:image/jpeg;base64,${allhotel.hotelImg1}";bg=55595c&amp;fg=eceeef&amp;text=Thumbnail" alt="Thumbnail [100%x225]" style="height: 225px; width: 100%; display: block;"  data-holder-rendered="true">
            <div class="card-body">
              <h5 class="card-title" style="font-weight: bold; color: black;">HotelName:${allhotel.hotelName}</h5>
              <p class="card-text" style="font-weight: bold; color: black;">HotelDescription:${allhotel.hotelDesc}</p>
              <p class="card-text "style="font-weight: bold; color: black;">Price: Rs ${allhotel.price} per hour</p>
              <p class="card-text" style="font-weight: bold; color: black;">Location: ${allhotel.location}</p>
              <a href="/usernewbooking" class="btn btn-dark">Book</a>
            </div>
          </div>
        </div>
      </div>
    </c:forEach>
  </div>
</div>

<jsp:include page="includes/footer.jsp" />  
<%}%>
