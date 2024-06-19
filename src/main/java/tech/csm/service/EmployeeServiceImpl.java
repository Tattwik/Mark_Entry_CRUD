package tech.csm.service;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tech.csm.dao.EmployeeDao;
import tech.csm.domain.Employee;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	private EmployeeDao employeeDao;
	@Override
	public List<Employee> getEmpByBatchandTechId(Integer batchId, Integer technologyId) {
		return employeeDao.getEmpByBatchandTechId( batchId,  technologyId);
	}

}
