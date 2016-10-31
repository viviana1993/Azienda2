<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="bean.UtenteBean"%>

<%@page import="ServizioAzienda.ServizioAzienda"%>
<%@page import="utility.ErroreBean"%>

<jsp:useBean id="utente" class="bean.UtenteBean" scope="session"></jsp:useBean>
	<jsp:setProperty property="*" name="utente"/>

<jsp:useBean id="errore" class="utility.ErroreBean" scope="request"></jsp:useBean>
	
	<%
	ServizioAzienda sA= new ServizioAzienda();
	
	String username= request.getParameter("username");
	UtenteBean uBean= sA.trovaUtente(username);
	
	String password=request.getParameter("password");
   	password=sA.conversionePass(password);
    
	if(uBean!=null && uBean.getPassword().equals(password)){
		
		char ruolo=uBean.getRuolo();
		utente.setNome(uBean.getNome());
		utente.setCognome(uBean.getCognome());
		utente.setRuolo(ruolo);
		
		
		
		switch(ruolo){
		case 'A':
			%>
			
			<jsp:forward page="Admin/HomePageAdmin.jsp"/>
			
			<%
			break;
		
		case 'C':
			%>
			
			<jsp:forward page="Cliente/HomePageCliente.jsp"/>
			
			<%
			break;
			
			
		case 'D':
			%>
			
			<jsp:forward page="Dipendente/HomePageDipendente.jsp"/>
			
			<%
			break;
		
		}
	}else{
		errore.setMex("Username o password errati");
	
		%>
		
		<jsp:forward page="login.jsp" />
		
		<%
	
	}
	
	
	%>