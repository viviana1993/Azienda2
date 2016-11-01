<%@page import="bean.ClienteBean"%>

<%@page import="ServizioAzienda.ServizioAzienda"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<jsp:useBean id="cliente" class="bean.ClienteBean" scope="request"></jsp:useBean>
	<jsp:setProperty property="*" name="cliente"/>
	
	<jsp:useBean id="utente" class="bean.UtenteBean" scope="request"></jsp:useBean>
	<jsp:setProperty property="*" name="utente"/>
	
<jsp:useBean id="mex" class="utility.MessageBean" scope="request"></jsp:useBean>
	<jsp:setProperty property="*" name="mex"/>

	<%
	ServizioAzienda sA= new ServizioAzienda();

    cliente.setNome(request.getParameter("nome"));
    cliente.setCognome(request.getParameter("cognome"));
    cliente.setUsername(request.getParameter("username"));
    cliente.setPassword(request.getParameter("password"));
    cliente.setRuolo('C');
    cliente.setRagioneSociale(request.getParameter("ragioneSociale"));
    cliente.setP_iva(request.getParameter("p_iva"));
    
    
    if(cliente.isValid() && !sA.trovaUser(cliente.getUsername())) {
    	String pass=sA.conversionePass(cliente.getPassword());
    
    	cliente.setPassword(pass);
        sA.registraCliente(cliente);
       
        sA.creazioneRubrica(cliente.getUsername());
        
        String message = "Registrazione effettuata con successo";
        request.getSession().setAttribute("message", message);
        response.sendRedirect("./AziendaConGrafica/HomePageAdmin.jsp");
  
    }
    else{
    	String message = "Username gi� utilizzato o dati non validi";
        request.getSession().setAttribute("message", message);
        response.sendRedirect("./AziendaConGrafica/registraClienteGrafica.jsp");
    
    
    }

    
    %>