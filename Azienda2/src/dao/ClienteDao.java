package dao;



import hibernateUtil.HibernateUtil;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import bean.ClienteBean;




public class ClienteDao {
	//1-Create
			public boolean creaCliente(ClienteBean c) {
				boolean bool=false;

				Session session =HibernateUtil.openSession();
				Transaction tx=null;

				try{
					tx=session.getTransaction();
					tx.begin();
					
					session.persist(c);
					bool=true;
					
					tx.commit();
				}catch(Exception ex){
					tx.rollback();
				}finally{
					session.close();
				}
				
				return bool;
			}

			
			
			
			//2-Trova cliente per username
			public ClienteBean trovaCliente(String username)
			{
				ClienteBean c=null;
				Session session =HibernateUtil.openSession();
				Transaction tx=null;

				try{
					tx=session.getTransaction();
					tx.begin();


					Query query= session.createQuery("from ClienteBean where username=:user");
					query.setString("user", username);
					c=(ClienteBean) query.uniqueResult();
					
					tx.commit();
				}catch(Exception ex){
					tx.rollback();
				}finally{
					session.close();
				}
				return c;
			}

			
			//3-Read tutti i clienti
			
			@SuppressWarnings("unchecked")
			public List<ClienteBean> getAllClient() {
				
				List<ClienteBean> listaClienti= new ArrayList<ClienteBean>();
				Session session =HibernateUtil.openSession();
				Transaction tx=null;
				
				try{
				tx=session.getTransaction();
				tx.begin();

				Query query= session.createQuery("from ClienteBean");
				
				listaClienti=query.list();
				
				 tx.commit();
				}catch(Exception ex){
					tx.rollback();
				}finally{
					session.close();
				}
			return listaClienti;
			}
			
			
			
//			//4-Update cliente
//			public boolean aggiornaCliente(ClienteBean cVecchio,ClienteBean cNuovo) {
//				boolean res=false;
//				Session session =HibernateUtil.openSession();
//				Transaction tx=null;
//				ClienteBean cV=null;
//				
//				try{
//					tx=session.getTransaction();
//					tx.begin();
//					
//					Query query= session.createQuery("from ClienteBean where username=:user");
//					query.setString("user", cVecchio.getUsername());
//					cV=(ClienteBean) query.uniqueResult();
//					session.update(cV);
//
//					res=true;
//					tx.commit();
//				}catch(Exception ex){
//					tx.rollback();
//				}finally{
//					session.close();
//				}
//				return res;
//
//			}
//			
//			
//			
//			//5-Delete
//			public boolean rimuoviCliente(ClienteBean c) {
//				boolean bool=false;
//
//				Session session =HibernateUtil.openSession();
//				Transaction tx=null;
//
//				try{
//					tx=session.getTransaction();
//					tx.begin();
//					
//					session.delete(c);
//					bool=true;
//					
//					tx.commit();
//				}catch(Exception ex){
//					tx.rollback();
//				}finally{
//					session.close();
//				}
//				
//				return bool;
//			}
}
