package ServizioAzienda;

import java.util.List;

import model.Rubrica;
import utility.CodificationOfPassword;
import bean.AdminBean;
import bean.ClienteBean;
import bean.DipendenteBean;
import bean.UtenteBean;
import dao.AdminDao;
import dao.ClienteDao;
import dao.DipendenteDao;
import dao.RubricaDao;
import dao.UtenteDao;



public class ServizioAzienda {
	UtenteDao uDao=new UtenteDao();
	ClienteDao cDao=new ClienteDao();
	DipendenteDao dDao=new DipendenteDao();
	AdminDao adao= new AdminDao();

	RubricaDao rDao=new RubricaDao();
//	VoceDao vdao= new VoceDao();

//	//metodo per registrare  utente
//		public boolean registraUtente(UtenteBean u) {
//			boolean result=false;
//			result=uDao.creaUtente(u);
//
//			return result;
//		}
	//metodo per registrare cliente
	
	public boolean registraCliente(ClienteBean c){
		
		return cDao.creaCliente(c);
		
	}
	
	//metodo per registrare dipendente
		public boolean registraDipendente(DipendenteBean d){
			
			return dDao.creaDipendente(d);
			
		}
		
	
	//metodo per registrare rubrica di un utente
	
	public boolean creazioneRubrica(String nome){
		Rubrica r=new Rubrica(nome);
		return rDao.creaRubrica(r);
	}
	
	//metodo per controllare se l'username è già presente
	
	public boolean trovaUser(String username){
		UtenteBean u=uDao.trovaUtente(username);
		if(u==null) return false;
		else return true;
	}
	
	//metodo per convertire la password
	
	public String conversionePass(String pass){
		return CodificationOfPassword.codificatePass(pass);
	}
	
	//metodo per trovare utente tramite username
	
	public UtenteBean trovaUtente(String username){
		 UtenteBean uBean=uDao.trovaUtente(username);
		 return uBean;
	}
	
		
	//metodo per leggere elenco clienti
	
	public List<ClienteBean> getTuttiClienti(){
		List <ClienteBean> listaClient=cDao.getAllClient();
		return listaClient;
	}
	
	//metodo per leggere elenco dipendenti
	
		public List<DipendenteBean> getTuttiDipendenti(){
			List <DipendenteBean> listaDipendenti=dDao.getAllDipendenti();
			return listaDipendenti;
		}
		
	
		public AdminBean leggiAdmin(String username) {
			AdminBean a =adao.trovaAdmin(username);
			return a;
		}
		
//		public ClienteBean leggiCliente(String username) {
//			ClienteBean c =cDao.trovaCliente(username);
//			return c;
//		}
//		
//		public DipendenteBean leggiDipendente(String username) {
//			DipendenteBean d =dDao.trovaDipendente(username);
//			return d;
//		}
//		
//		
//		
//		//metodo per cancellare
//		public boolean eliminaUtenteESuaRubrica(UtenteBean uBean) {
//			boolean bool=false;
//			if(uBean.getRuolo()=='A')
//			{
//				return bool;
//			}
//			else if(uBean.getRuolo()=='C' || uBean.getRuolo()=='D'){
//				Rubrica r=rDao.leggiRubricaConNome(uBean.getUsername());
//				if(r!=null) {
//				bool=rDao.rimuoviRubrica(r);
//				}
//				return bool=uDao.rimuoviUtente(uBean);
//			}
//			return bool;
//			}
//		
//		
//		//metodo per aggiungere una voce in rubrica
//		public boolean registraVoce(Rubrica r,Voce v) {
//			boolean result= false;
//			v.setRubrica(r);
//			r.aggiungiVoce(v);
//			boolean b=vdao.creaVoce(v);
//			rDao.aggiornaRubrica(r);
//
//			if(b==true)
//			{
//				result =true;
//			}
//
//			return result;
//
//		}
//
//		//Metodo per trovare la rubrica di un utente tramiteusername
//		public Rubrica trovaRubrica(String username) {
//
//			Rubrica r= rDao.leggiRubricaConNome(username);
//
//			return r;
//		}
//
//		//metodo per prendere tutte le voci di rubrica
//		public List<Voce> getAllVoci(Rubrica r) {
//			List<Voce> voci = vdao.getVociRubrica(r);
//
//			return voci;
//		}
//
//
//		//metodo per eliminare una voce
//		public boolean eliminaVoce(Rubrica r, String nome, String cognome)
//		{
//			
//			return vdao.rimuoviVoce(nome, cognome, r.getId_Rubrica());
//			
//		}
		
}
