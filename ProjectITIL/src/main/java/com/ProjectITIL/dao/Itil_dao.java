package com.ProjectITIL.dao;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.ProjectITIL.model.Employee;



public interface Itil_dao extends CrudRepository<Employee, Integer>  {

	/*@Query(value = "select employee_role FROM employee  WHERE employee_name = ? and password=?",
	nativeQuery=true)*/
	public Employee findByEmployeeNameAndPassword(String employeeName,String password);

	public List<Employee> findByEmployeeRole(String role);

	public Employee findByEmployeeName(String employeeName);
}


