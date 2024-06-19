package tech.csm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;

import tech.csm.domain.Technology;

@Repository
public class AssignmentMarkDaoImpl implements AssignmentMarkDao {

	@Autowired
	private DataSource dataSource;
	
	
	@Override
	public String save(Integer employeeId, Integer mark) {
		SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(dataSource).withProcedureName("mark_entry_proc");
		
		Map<String,Object> res=simpleJdbcCall.execute("inassignmark",Types.NULL,Types.NULL,employeeId,mark);	
		return (String)res.get("p_record_count");
	}


	@Override
	public List<Map<String, Object>> getAllAssessmentDetails() {
		SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(dataSource).withProcedureName("mark_entry_proc")
				.returningResultSet("allData", new RowMapper<Map<String,Object>>() {

					@Override
					public Map<String, Object> mapRow(ResultSet rs, int rowNum) throws SQLException {
						
						
						Map<String,Object> dataMap=new HashMap<>();
						dataMap.put("batchName", rs.getString(1));
						dataMap.put("batchStartDate", rs.getDate(2));
						dataMap.put("technologyName", rs.getString(3));
						dataMap.put("employeeName", rs.getString(4));
						dataMap.put("employeePhone", rs.getString(5));
						dataMap.put("mark", rs.getInt(6));
						
						
						return dataMap;
					}
				});

		Map<String, Object> data = simpleJdbcCall.execute("reportdata",Types.NULL,Types.NULL,Types.NULL,Types.NULL);
		List<Map<String,Object>> dataList = (List<Map<String,Object>>) data.get("allData");

		System.out.println(dataList);
		
		return dataList;
	}


	@Override
	public List<Map<String, Object>> getDataFromBatchId(Integer bId) {
		SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(dataSource).withProcedureName("mark_entry_proc")
				.returningResultSet("allDataBybId", new RowMapper<Map<String,Object>>() {

					@Override
					public Map<String, Object> mapRow(ResultSet rs, int rowNum) throws SQLException {
						
						
						Map<String,Object> dataMap=new HashMap<>();
						dataMap.put("batchName", rs.getString(1));
						dataMap.put("batchStartDate", rs.getDate(2));
						dataMap.put("technologyName", rs.getString(3));
						dataMap.put("employeeName", rs.getString(4));
						dataMap.put("employeePhone", rs.getString(5));
						dataMap.put("mark", rs.getInt(6));
						
						
						return dataMap;
					}
				});

		Map<String, Object> data = simpleJdbcCall.execute("filterdata",bId,Types.NULL,Types.NULL,Types.NULL);
		List<Map<String,Object>> dataList = (List<Map<String,Object>>) data.get("allDataBybId");

		System.out.println(dataList);
		
		return dataList;
	}

}
