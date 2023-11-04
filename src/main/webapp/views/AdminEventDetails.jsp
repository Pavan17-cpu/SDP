<%if (session.getAttribute("Admin_email") == null) {response.sendRedirect("/signin"); } else {%> 

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
    <jsp:include page="includes/header.jsp" />  
        
    <jsp:include page="includes/adminNav.jsp" />  
    
    
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
            <style>
                .form-control:focus {
                  border-color: #ced4da; /* Reset the border color to the default */
                  box-shadow: none; /* Remove the box shadow */
              }
              </style>
    <nav class="d-flex justify-content-between">
    
     
              <form class="d-flex"  action="/admineventSearch"  method="post" autocomplete="off">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                
                <input class="form-control" type="search" name="valueToSearch" placeholder="Value To Search" aria-label="Search" value="${event_keyword}">
                <button class="btn btn-dark" type="submit" name="search" style="background-color: black; color: white;">Search</button>
    
            </form>
        
         
        
    
    
         <!-- Add User modal -->
         <div class="modal fade" id="AddeventModal" tabindex="-1" role="dialog" aria-labelledby="AdduserModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Add event</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="/addeventForm" modelAttribute="eventForm"  method="POST" enctype= "multipart/form-data">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <input type="hidden" name="superadmin" value="not"/>
                            <input type="hidden" name="subadmin" value="not"/>
                    <div class="modal-body">
    
                        <div class="form-group">
                            <label for="message-text" class="col-form-label">Event Name:</label>
                            <input type="text" class="form-control" placeholder="Event Name" name="eventname" id="eventname" required>
                        </div>
                        <div class="form-group">
                            <label for="message-text" class="col-form-label">Event Description</label>
                            <textarea class="form-control" name="event_desc" placeholder="Event Description" id="event_desc"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="message-text" class="col-form-label">Event Image:</label>
                            <input type="file" class="form-control" name="event_img" id="event_img" required>
                        
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-dark" data-dismiss="modal" style="background-color: black; color: white;">Close</button>
    <button type="submit" class="btn btn-dark" name="addevent" style="background-color: black; color: white;">Add event</button>
    
                    </div>
                </form>
                </div>
            </div>
            </div>
    
    </nav>
    
    <br /><br/>
    
    
    
    
            <div class="table-responsive">
                <table class="content-table table" id="table-id">
                    <thead>
                        <tr>
                        <th>EVENT NAME</th>
                        <th>EVENT DESCRIPTION</th>
                        <th>EVENT IMG</th>
                        <th>ACTION</th>
                    </tr>
                </thead>
                    <tbody>
                         <c:forEach var="allevent" items="${eventlist}" >
                            <tr>
                            <td>${allevent.eventname}</td>
                            <td>${fn:substring(allevent.event_desc, 0, 100)}...</td>
                           <td ><img src="data:image/jpeg;base64,${allevent.event_img}" class="rounded-circle" width="100" height="100"/></td>
                            <td class="d-flex">
                                <a class="btn btn-dark edit" data-toggle="modal" name="edit_event" data-target="#EditeventModal" data-whatever="@mdo" style="background-color: black; color: white; margin-right: 10px;">EDIT</a>
                                <input type="hidden" value="${allevent.id}" id="edit_id">
                                <a href="/admindeleteevent/${allevent.id}" class="btn btn-dark" onclick='return deleteEvent()' style="background-color: black; color: white;">DELETE</a>
                                
    
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

                    <form >
                        <button type="button" class="btn btn-dark" name="add_event" data-toggle="modal" data-target="#AddeventModal" data-whatever="@mdo" style="background-color: black; color: white;">Add event</button>
                
                    </form>

                
            
            </div>
            </div>
        </div>
         <!-- Edit User modal -->
                 <div class="modal fade" id="EditeventModal" tabindex="-1" role="dialog" aria-labelledby="AdduserModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Edit User</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form action="/EditeventForm" modelAttribute="eventEditForm" method="POST" enctype= "multipart/form-data">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            <input type="hidden" name="superadmin" value="not"/>
                            <input type="hidden" name="subadmin" value="not"/>
                            <input type="hidden" name="id" id="event_id">
                            <div class="modal-body">
            
                                <div class="modal-body">
    
                                    <div class="form-group">
                                        <label for="message-text" class="col-form-label">Event Name:</label>
                                        <input type="text" class="form-control" placeholder="eventName" name="eventname" id="eventName1" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="message-text" class="col-form-label">Event Description:</label>
                                        <input type="text" class="form-control" placeholder="eventDesc" name="event_desc" id="eventDesc1" required>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="message-text" class="col-form-label">Event Image:</label>
                                    <input type="file" class="form-control" name="event_img" id="eventImg11" >
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-dark" data-dismiss="modal" style="background-color: black; color: white;">Close</button>
    <button type="submit" class="btn btn-dark" name="Editevent" style="background-color: black; color: white;">Edit event</button>
    
                            </div>
                        </form>
                        </div>
                    </div>
                    </div>
                    
                    
        <script type="text/javascript">
            $(document).ready(function() {
                $('table .edit').click(function ()
                {
                    var id=$(this).parent().find('#edit_id').val();
    
                    console.log(id)
                    $.ajax({
                        type: "GET",
                        url: "${pageContext.request.contextPath}/eventfind/"+id, //this is my servlet
                        data: "input=" +$('#ip').val()+"&output="+$('#op').val(),
                        success: function(allevent){ 
                                $('#EditeventModal #event_id').val(allevent.id);
                                $('#EditeventModal #eventName1').val(allevent.eventname);
                                $('#EditeventModal #eventDesc1').val(allevent.event_desc);
                                $('#EditeventModal #eventImg11').val(allevent.event_img);
                                
                        }
                    });
                });
    
            });
        </script>
        
    <jsp:include page="includes/footer.jsp" />  
    
    <%}%>