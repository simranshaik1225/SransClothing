package com.sran.daoimplementation;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sran.dao.CustomerDAO;
import com.sran.model.Customer;

@Repository
@Transactional
public class CustomerDAOImpl implements CustomerDAO{
	   @Autowired
	    private SessionFactory sessionFactory;

	   private Session getSession() {
	        return sessionFactory.getCurrentSession();
	    }

	    @Override
	    public void addCustomer(Customer customer) {
	        getSession().merge(customer);
	    }

		@Override
		public Customer getCustomer(int customerId) {
			return getSession().get(Customer.class, customerId);
			
		}

		@Override
		public Customer getCustomerByEmail(String email) {
			String HQL="from Customer c where email=:email";
			return getSession().createQuery(HQL,Customer.class).setParameter("email", email).uniqueResult();
			
		}

		@Override
		public void updateCustomer(Customer customer) {
			getSession().merge(customer);
			
		}

		
		@Override
		public void deleteCustomer(int customerId) {
		    Customer customer = getSession().get(Customer.class, customerId);
		    if (customer != null) {
		        getSession().remove(customer);
		        System.out.println("Customer deleted successfully.");
		    } else {
		        System.out.println("Customer with ID " + customerId + " not found.");
		    }
		}

		@Override
		public List<Customer> getAllCustomers() {
			String hql="from Customer c";
			return getSession().createQuery(hql,Customer.class).getResultList();
		}

		
		
		
		
	    
	  

}
