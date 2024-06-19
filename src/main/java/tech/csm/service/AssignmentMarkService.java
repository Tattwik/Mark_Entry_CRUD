package tech.csm.service;

import java.util.List;
import java.util.Map;

public interface AssignmentMarkService {

	String save(Integer employeeId, Integer mark);

	List<Map<String, Object>> getAllAssessmentDetails();

	List<Map<String, Object>> getDataFromBatchId(Integer bId);

}
