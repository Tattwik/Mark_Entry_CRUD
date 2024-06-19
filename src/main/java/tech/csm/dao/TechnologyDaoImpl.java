package tech.csm.dao;

import java.sql.Types;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;

import tech.csm.domain.Batch;
import tech.csm.domain.Technology;

@Repository
public class TechnologyDaoImpl implements TechnologyDao {

	@Autowired
	private DataSource dataSource;

	@Override
	public List<Technology> getAllTechnologies() {
		SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(dataSource).withProcedureName("mark_entry_proc")
				.returningResultSet("allTechnology", new BeanPropertyRowMapper(Technology.class));

		Map<String, Object> data = simpleJdbcCall.execute("setech",Types.NULL,Types.NULL,Types.NULL,Types.NULL);
		List<Technology> techList = (List<Technology>) data.get("allTechnology");

		return techList;
	}

}
