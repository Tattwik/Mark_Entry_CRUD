package tech.csm.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import tech.csm.domain.Employee;

public interface EmployeeDao {

	List<Employee> getEmpByBatchandTechId(Integer batchId, Integer technologyId);

}
