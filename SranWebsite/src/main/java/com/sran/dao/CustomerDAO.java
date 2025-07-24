package com.sran.dao;

import java.util.List;

import com.sran.model.Customer;

public interface CustomerDAO {
	void addCustomer(Customer Customer);
	Customer getCustomer(int customerId);
	Customer getCustomerByEmail(String email);
	void updateCustomer(Customer customer);
	void deleteCustomer(int customerId);
	List<Customer> getAllCustomers();

}
