package tech.csm.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tech.csm.dao.AssignmentMarkDao;

@Service
public class AssignmentMarkServiceImpl implements AssignmentMarkService {

	@Autowired
	private AssignmentMarkDao assignmentMarkDao;
	
	@Override
	public String save(Integer employeeId, Integer mark) {
		return assignmentMarkDao.save(employeeId, mark);

	}

	@Override
	public List<Map<String, Object>> getAllAssessmentDetails() {
		
		return assignmentMarkDao.getAllAssessmentDetails();
	}

	@Override
	public List<Map<String, Object>> getDataFromBatchId(Integer bId) {
		return assignmentMarkDao.getDataFromBatchId(bId);
	}

}
