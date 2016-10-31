package dao;

import hibernateUtil.HibernateUtil;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import bean.DipendenteBean;


public class DipendenteDao {
	
	//1-Create
	public boolean creaDipendente(DipendenteBean d) {
		boolean bool=false;

		Session session =HibernateUtil.openSession();
		Transaction tx=null;

		try{
			tx=session.getTransaction();
			tx.begin();
			
			session.persist(d);
			bool=true;
			
			tx.commit();
		}catch(Exception ex){
			tx.rollback();
		}finally{
			session.close();
		}
		
		return bool;
	}

	
	
	
	//2-Trova dipendente per username
	public DipendenteBean trovaDipendente(String username)
	{
		DipendenteBean d=null;
		Session session =HibernateUtil.openSession();
		Transaction tx=null;

		try{
			tx=session.getTransaction();
			tx.begin();


			Query query= session.createQuery("from UTENTEBEAN where username=:user");
			query.setString("user", username);
			d=(DipendenteBean) query.uniqueResult();
			
			tx.commit();
		}catch(Exception ex){
			tx.rollback();
		}finally{
			session.close();
		}
		return d;
	}

	
	//3-Read tutti i dipendenti
	@SuppressWarnings("unchecked")
	public List<DipendenteBean> getAllDipendenti() {
		
		List<DipendenteBean> listaDipendenti= new ArrayList<DipendenteBean>();
		Session session =HibernateUtil.openSession();
		Transaction tx=null;
		
		try{
		tx=session.getTransaction();
		tx.begin();

		Query query= session.createQuery("from DipendenteBean");
		
		listaDipendenti=query.list();
		
		 tx.commit();
		}catch(Exception ex){
			tx.rollback();
		}finally{
			session.close();
		}
	return listaDipendenti;
	}
	
	
	
	//4-Update dipendente
	public boolean aggiornaDipendente(DipendenteBean dVecchio,DipendenteBean dNuovo) {
		boolean res=false;
		Session session =HibernateUtil.openSession();
		Transaction tx=null;
		DipendenteBean dV=null;
		
		try{
			tx=session.getTransaction();
			tx.begin();
			
			Query query= session.createQuery("from Utentebean where username=:user");
			query.setString("user", dVecchio.getUsername());
			dV=(DipendenteBean) query.uniqueResult();
			session.update(dV);

			res=true;
			tx.commit();
		}catch(Exception ex){
			tx.rollback();
		}finally{
			session.close();
		}
		return res;

	}
	
	
	
	//5-Delete
	public boolean rimuoviDipendente(DipendenteBean d) {
		boolean bool=false;

		Session session =HibernateUtil.openSession();
		Transaction tx=null;

		try{
			tx=session.getTransaction();
			tx.begin();
			
			session.delete(d);
			bool=true;
			
			tx.commit();
		}catch(Exception ex){
			tx.rollback();
		}finally{
			session.close();
		}
		
		return bool;
	}
}
