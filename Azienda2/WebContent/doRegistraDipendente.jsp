<%@page import="bean.DipendenteBean"%>

<%@page import="ServizioAzienda.ServizioAzienda"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   

<jsp:useBean id="dipendente" class="bean.DipendenteBean" scope="request"></jsp:useBean>
	<jsp:setProperty property="*" name="dipendente"/>
	
	<jsp:useBean id="utente" class="bean.UtenteBean" scope="request"></jsp:useBean>
	<jsp:setProperty property="*" name="utente"/>
<jsp:useBean id="mex" class="utility.ErroreBean" scope="request"></jsp:useBean>
	

	<%
	ServizioAzienda sA= new ServizioAzienda();
	
    String nome= request.getParameter("nome");
    String cognome= request.getParameter("cognome");
    String username= request.getParameter("username");
    String password= request.getParameter("password");
    char ruolo='D';
    String posizione= request.getParameter("posizione");
    String stipendio= request.getParameter("stipendio");
    double stipendio2=Double.parseDouble(stipendio);
    
  
    dipendente.setNome(nome);
	dipendente.setCognome(cognome);
	dipendente.setPassword(password);
	dipendente.setRuolo(ruolo);
	dipendente.setPosizione(posizione);
	dipendente.setStipendio(stipendio2);
	dipendente.setUsername(username);
    
    
    if(dipendente.isValid() && !sA.trovaUser(username)) {
    	password=sA.conversionePass(password);
    	
    	
        sA.registraDipendente(dipendente);
        sA.creazioneRubrica(username);
        String redirectURL = "./AziendaConGrafica/HomePageAdmin.jsp";
    	response.sendRedirect(redirectURL);
        %>
        <h1>Registrazione effettuata con successo</h1><br>
    	
    <%
    }
    else{
    	mex.setMex("Username già utilizzato o dati non validi");
    	String redirectURL = "./AziendaConGrafica/registraDipendenteGrafica.jsp";
    	response.sendRedirect(redirectURL);
 
    }

    
    %>