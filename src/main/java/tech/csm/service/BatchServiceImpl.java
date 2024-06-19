package tech.csm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tech.csm.dao.BatchDao;
import tech.csm.domain.Batch;

@Service
public class BatchServiceImpl implements BatchService {

	@Autowired
	private BatchDao batchDao;
	
	@Override
	public List<Batch> getAllBatches() {
		
		return batchDao.getAllBatches();
	}

}
