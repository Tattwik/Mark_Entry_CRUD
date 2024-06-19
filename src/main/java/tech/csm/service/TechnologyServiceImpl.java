package tech.csm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tech.csm.dao.TechnologyDao;
import tech.csm.domain.Technology;

@Service
public class TechnologyServiceImpl implements TechnologyService {

	@Autowired
	private TechnologyDao technologyDao;
	
	@Override
	public List<Technology> getAllTechnologies() {
		return technologyDao.getAllTechnologies();
	}

}
