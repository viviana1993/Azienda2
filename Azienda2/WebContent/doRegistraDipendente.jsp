<%@page import="bean.DipendenteBean"%>

<%@page import="ServizioAzienda.ServizioAzienda"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="ServizioAzienda.ServizioAzienda"%>

<%@page import="java.lang.NumberFormatException"%>
<%@page import="javax.servlet.ServletException"%>

<jsp:useBean id="dipendente" class="bean.DipendenteBean" scope="request"></jsp:useBean>
<%-- <jsp:setProperty property="*" name="dipendente" /> --%>

<jsp:useBean id="utente" class="bean.UtenteBean" scope="request"></jsp:useBean>
<jsp:setProperty property="*" name="utente" />

<%
	ServizioAzienda sA= new ServizioAzienda();
	
    String nome= request.getParameter("nome");
    String cognome= request.getParameter("cognome");
    String username= request.getParameter("username");
    String password= request.getParameter("password");
    char ruolo='D';
    String posizione= request.getParameter("posizione");
    String stipendio= request.getParameter("stipendio");
    double stipendio2=0;
    boolean error = false;
   
   	try
    {
    	stipendio2=Double.parseDouble(stipendio);
    	dipendente.setNome(nome);
	   	dipendente.setCognome(cognome);
	   	dipendente.setPassword(password);
	   	dipendente.setRuolo(ruolo);
	   	dipendente.setPosizione(posizione);
	   	dipendente.setStipendio(stipendio2);
	   	dipendente.setUsername(username);
    }
    catch (NumberFormatException e)
    {	
    	System.out.println("Lo stipendio inserito non è nel formato corretto ");
    	String message = "Lo stipendio inserito non è nel formato corretto";
        request.getSession().setAttribute("message", message);
        response.sendRedirect("./AziendaConGrafica/registraDipendenteGrafica.jsp");
  		error = true;
    }
    	
    if(error == false)
    {
	   	
	   	    
	    if(dipendente.isValid() && !sA.trovaUser(username)) {
	    	password=sA.conversionePass(password);
	    	
	    	
	        sA.registraDipendente(dipendente);
	        sA.creazioneRubrica(username);
	    	
	    	
	    	String message = "Registrazione effettuata con successo";
	        request.getSession().setAttribute("message", message);
	        response.sendRedirect("./AziendaConGrafica/HomePageAdmin.jsp");
	  
	    }
	    else{
	    	
	    	
	    	String message = "Username già utilizzato o dati non validi o incompleti";
	        request.getSession().setAttribute("message", message);
	        response.sendRedirect("./AziendaConGrafica/registraDipendenteGrafica.jsp");
	 
	    }
    }
    
    %>