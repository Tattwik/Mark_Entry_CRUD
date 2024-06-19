package tech.csm.dao;

import java.sql.Types;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;

import tech.csm.domain.Employee;
import tech.csm.domain.Technology;

@Repository
public class EmployeeDaoImpl implements EmployeeDao {

	@Autowired
	private DataSource dataSource;
	
	@Override
	public List<Employee> getEmpByBatchandTechId(Integer batchId, Integer technologyId) {
		SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(dataSource).withProcedureName("mark_entry_proc")
				.returningResultSet("seEmps", new BeanPropertyRowMapper(Employee.class));

		Map<String, Object> data = simpleJdbcCall.execute("seempbybidandtid",batchId,technologyId,Types.NULL,Types.NULL);
		List<Employee> empList = (List<Employee>) data.get("seEmps");
		
		return empList;
	}

}
