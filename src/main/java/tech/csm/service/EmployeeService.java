package tech.csm.service;

import java.util.List;

import tech.csm.domain.Employee;

public interface EmployeeService {

	List<Employee> getEmpByBatchandTechId(Integer batchId, Integer technologyId);

}
