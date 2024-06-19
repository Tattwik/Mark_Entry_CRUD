package tech.csm.dao;

import java.sql.Types;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;

import tech.csm.domain.Batch;

@Repository
public class BatchDaoImpl implements BatchDao {

	@Autowired
	private DataSource dataSource;
	
	@Override
	public List<Batch> getAllBatches() {
		
		SimpleJdbcCall simpleJdbcCall= new SimpleJdbcCall(dataSource).withProcedureName("mark_entry_proc").returningResultSet("allBatch", new BeanPropertyRowMapper(Batch.class));
		
		Map<String,Object> data=simpleJdbcCall.execute("sebatch",Types.NULL,Types.NULL,Types.NULL,Types.NULL);
		List<Batch> batchList=(List<Batch>)data.get("allBatch");	
		
		return batchList;
	}

}
