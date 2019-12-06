package com.ProjectITIL.service;

import java.sql.SQLException;
import java.util.List;

import com.ProjectITIL.model.Employee;
import com.ProjectITIL.model.Ticket;



public interface IEmployeeService {

	public Employee findRole(Employee employee);
	public List<Ticket> myTickets(int employeeId);
	public Ticket newTicket(Ticket ticket);
	public List<Ticket> viewNewTickets();
	public List<Ticket> viewAssignedTickets( String teamMember);
	public List<Employee> teammembers() throws SQLException;
	public int updateTicket(String teamMember,int ticketId ) throws Exception;
	public int updateTicketStatus(String ticketType, int ticketId) throws Exception;
	public Ticket ticketDetails(int ticketId);
	public Employee findByEmployeeName(String employeeName);
}