<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
   <jsp:useBean id="admin" class="bean.AdminBean" scope="session"></jsp:useBean>
    <jsp:useBean id="mex" class="utility.ErroreBean" scope="request"></jsp:useBean>
<!--        header di pagina  -->
<jsp:include page="./headerHTML.jsp"></jsp:include>
    
    <!-- nav bar starts -->
    <jsp:include page="./navBarAdmin.jsp"></jsp:include>
    
   
    <div class="row">
        
        <!-- left menu starts -->
        <jsp:include page="./menùLateraleAdmin.jsp"></jsp:include>
        <!-- left menu ends -->


        <div id="content" class="col-lg-10 col-sm-10">
            <!-- content starts -->
            <h4><%=mex.getMex() %></h4>
            <div>
  <ul class="breadcrumb">
        <li>
            <a href="#">Home</a>
        </li>
        <li>
            <a href="#">Admin</a>
        </li>
    </ul>
   
</div>


<div class=" row">
    
<!--       devo scrivere per ogni pagina   -->
   
      <div class="alert alert-info">
                <h1 >Welcome ${admin.nome}</h1>
               
                
                
                
                
                
            </div>
	
  

    
</div><!-- content ends -->
    </div><!--/#content.col-md-0-->
</div><!--/fluid-row-->

  
    

    <hr>

    <jsp:include page="./footer.jsp"></jsp:include>
    








<!--      includo tutti script di sotto -->
<jsp:include page="./IncludeScriptEnd.jsp"></jsp:include>