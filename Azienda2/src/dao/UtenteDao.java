package dao;




import hibernateUtil.HibernateUtil;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import bean.UtenteBean;




public class UtenteDao {

	//1-Create
	public boolean creaUtente(UtenteBean u) {
		boolean bool=false;

		Session session =HibernateUtil.openSession();
		Transaction tx=null;

		try{
			tx=session.getTransaction();
			tx.begin();

			session.persist(u);
			bool=true;

			tx.commit();
		}catch(Exception ex){
			tx.rollback();
		}finally{
			session.close();
		}

		return bool;
	}




	//2-Trova utente per username
	public UtenteBean trovaUtente(String username)
	{
		UtenteBean u=null;
		Session session =HibernateUtil.openSession();
		Transaction tx=null;

		try{
			tx=session.getTransaction();
			tx.begin();


			Query query= session.createQuery("from UtenteBean where username=:user");
			query.setString("user", username);
			u=(UtenteBean) query.uniqueResult();

			tx.commit();
		}catch(Exception ex){
			tx.rollback();
		}finally{
			session.close();
		}
		return u;
	}


//	//3-Read tutti gli utenti
//	@SuppressWarnings("unchecked")
//	public List<UtenteBean> getAllUtenti() {
//
//		List<UtenteBean> utenti= new ArrayList<UtenteBean>();
//		Session session =HibernateUtil.openSession();
//		Transaction tx=null;
//
//		try{
//			tx=session.getTransaction();
//			tx.begin();
//
//			Query query= session.createQuery("from UtenteBean");
//			utenti=query.list();
//
//			tx.commit();
//		}catch(Exception ex){
//			tx.rollback();
//		}finally{
//			session.close();
//		}
//		return utenti;
//	}
//
//
//
//	//4-Update utente
//	public boolean aggiornaUtente(UtenteBean uVecchio,UtenteBean uNuovo) {
//		boolean res=false;
//		Session session =HibernateUtil.openSession();
//		Transaction tx=null;
//		UtenteBean uV=null;
//
//		try{
//			tx=session.getTransaction();
//			tx.begin();
//
//			Query query= session.createQuery("from UtenteBean where username=:user");
//			query.setString("user", uVecchio.getUsername());
//			uV=(UtenteBean) query.uniqueResult();
//
//			session.update(uV);
//
//			res=true;
//			tx.commit();
//		}catch(Exception ex){
//			tx.rollback();
//		}finally{
//			session.close();
//		}
//		return res;
//
//	}
//
//
//
//	//5-Delete
//	public boolean rimuoviUtente(UtenteBean u) {
//		boolean bool=false;
//
//		Session session =HibernateUtil.openSession();
//		Transaction tx=null;
//
//		try{
//			tx=session.getTransaction();
//			tx.begin();
//
//			session.delete(u);
//			bool=true;
//
//			tx.commit();
//		}catch(Exception ex){
//			tx.rollback();
//		}finally{
//			session.close();
//		}
//
//		return bool;
//	}


}
