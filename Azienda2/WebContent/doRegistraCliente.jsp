<%@page import="bean.ClienteBean"%>

<%@page import="ServizioAzienda.ServizioAzienda"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<jsp:useBean id="cliente" class="bean.ClienteBean" scope="request"></jsp:useBean>
	<jsp:setProperty property="*" name="cliente"/>
	
	<jsp:useBean id="utente" class="bean.UtenteBean" scope="request"></jsp:useBean>
	<jsp:setProperty property="*" name="utente"/>
	
<jsp:useBean id="mex" class="utility.ErroreBean" scope="request"></jsp:useBean>
	

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
        
        
        
        String redirectURL = "./AziendaConGrafica/HomePageAdmin.jsp";
      
        response.sendRedirect(redirectURL);
        mex.setMex("Registrazione effettuata con successo");
        
    	
        %>
      
  
    <%
    }
    else{
    	mex.setMex("Username già utilizzato o dati non validi");
    	String redirectURL = "./AziendaConGrafica/registraClienteGrafica.jsp";
    	response.sendRedirect(redirectURL);
    
    }

    
    %>