<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="ServizioAzienda.ServizioAzienda"%>
<%@page import="bean.ClienteBean"%>
<%@page import="java.util.List"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
	
	<jsp:useBean id="utente" class="bean.UtenteBean" scope="session"></jsp:useBean>
	
<!--        header di pagina  -->
<jsp:include page="headerHTML.jsp"></jsp:include>
    
    <!-- nav bar starts -->
    <jsp:include page="navBarAdmin.jsp"></jsp:include>
    
    <div class="ch-container">
    <div class="row">
        
        <!-- left menu starts -->
        <jsp:include page="menùLateraleAdmin.jsp"></jsp:include>
        <!-- left menu ends -->

        <noscript>
            <div class="alert alert-block col-md-12">
                <h4 class="alert-heading">Warning!</h4>

                <p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a>
                    enabled to use this site.</p>
            </div>
        </noscript>

        <div id="content" class="col-lg-10 col-sm-10">
           
           
           
           
           
           
           
           
           
           
           
           
           
            <div>
    <ul class="breadcrumb">
        <li>
            <a href="#">Home :${admin.nome}</a>
        </li>
       
    </ul>
</div>
<div class=" row">
    <div class="alert alert-info">
                <h4>Elenco Clienti</h4>
            </div>
<!--       devo scrivere per ogni pagina   -->
  <div class="box col-md-12" >
    <div class="box-inner" >

    <table class="box-header well">
    <thead >
    <tr>
        <th>Id</th>
        <th>Nome</th>
        <th>Cognome</th>
        <th>Username</th>
        <th>Ragione Sociale</th>
        <th>P.IVA</th>
        <th>Actions</th>
        
    </tr>
    </thead>
    
    <%
    	ServizioAzienda sA=new ServizioAzienda();
    	String username=utente.getUsername();
    	List<ClienteBean> listaClienti=sA.getTuttiClienti();
    	session.setAttribute("listaClienti", listaClienti);
    
    %>
    
    <c:set var="i" value="1" scope="page"/>
    <c:forEach items="${listaClienti}" var="u">
    
    <tbody>
    <tr>
    	
        <td class="center"><c:out value="${i}"/></td>
        <td class="center"> <c:out value="${u.nome}"/></td>
        <td class="center"><c:out value="${u.cognome}"/></td>
        <td class="center"><c:out value="${u.username}"/></td>
        <td class="center"><c:out value="${u.ragioneSociale}"/></td>
        <td class="center"><c:out value="${u.p_iva}"/></td>
        <td class="center">
            <a class="btn btn-success" href="#">
                <i class="glyphicon glyphicon-zoom-in icon-white"></i>
                View
            </a>
            <a class="btn btn-info" href="#">
                <i class="glyphicon glyphicon-edit icon-white"></i>
                Edit
            </a>
            <a class="btn btn-danger" href="#">
                <i class="glyphicon glyphicon-trash icon-white"></i>
                Delete
            </a>
        </td>
    </tr>
    <c:set var="i" value="${i+1}" scope="page"/>
   </c:forEach>
                        </tbody>
                    </table>
                </div>
           
        <!--/span-->

    </div><hr>
   

  

    
</div><!-- content ends -->
    </div><!--/#content.col-md-0-->
</div><!--/fluid-row-->

  
    

    <hr>

    <jsp:include page="footer.jsp"></jsp:include>
    

</div><!--/.fluid-container-->

<!--      includo tutti script di sotto -->
<jsp:include page="IncludeScriptEnd.jsp"></jsp:include>