package tech.csm.dao;

import java.util.List;
import java.util.Map;

public interface AssignmentMarkDao {

	String save(Integer employeeId, Integer mark);

	List<Map<String, Object>> getAllAssessmentDetails();

	List<Map<String, Object>> getDataFromBatchId(Integer bId);

}
