package com.project.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.project.models.Account;

public interface AccountRepository extends CrudRepository<Account, Integer>{

	@Query("from Account where username = :username")
	public Account findByUsername(@Param("username") String username);
	
	
	@Query("from Account where username = :username and status = 1")
	public Account findActiveUsername(@Param("username") String username);
	@Query("select count(id) from Account where username = :username")
	public long countAccountByUsername(@Param("username") String username);
	
	@Query("from Account where role = 'ROLE_EMPLOYEE'")
	public List<Account> findAllEmployee();
	
	@Query("from Account where fullName like :name")
	public List<Account> searchByName(@Param("name") String name);
	
	@Modifying
	@Query(value = "update Account a set a.status = 0 where a.id = :id")
	public void disable(@Param("id") int id);
	
	@Modifying
	@Query(value = "update Account a set a.status = 1 where a.id = :id")
	public void enable(@Param("id") int id);
	
	@Modifying
	@Query(value = "update Account a set a.password = :password where a.id = :id")
	public void updatePassword(@Param("id") int id, @Param("password") String password);

}
