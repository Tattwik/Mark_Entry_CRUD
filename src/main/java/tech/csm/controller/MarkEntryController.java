package tech.csm.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tech.csm.domain.Employee;
import tech.csm.service.AssignmentMarkService;
import tech.csm.service.BatchService;
import tech.csm.service.EmployeeService;
import tech.csm.service.TechnologyService;

@Controller
public class MarkEntryController {
	
	@Autowired
	private BatchService batchService;
	@Autowired
	private TechnologyService technologyService;
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private AssignmentMarkService assignmentMarkService;
	
	@GetMapping("/getForm")
	public String getForm(Model model) {
		
		
		model.addAttribute("batchList", batchService.getAllBatches());
		model.addAttribute("techList", technologyService.getAllTechnologies());
		
		model.addAttribute("dataLst",assignmentMarkService.getAllAssessmentDetails());
		
		return "getForm";
	}
	@GetMapping("/getEmpByBatchandTechId")
	public void getEmpByBatchandTechId(@RequestParam("technologyId") Integer technologyId,
			@RequestParam("batchId") Integer batchId,
			HttpServletRequest req, HttpServletResponse response) {
		
		List<Employee> empList=employeeService.getEmpByBatchandTechId(batchId,technologyId);		
		String res="<option value='0'>-select-</option>";
		for(Employee e:empList) {
			res+="<option value='"+e.getEmployeeId()+"'>"+e.getEmployeeName() +"</option>";
		}
		try {
			response.getWriter().print(res);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	@PostMapping("/registerMark")
	public String saveMark(@RequestParam("empName") Integer employeeId, 
			@RequestParam Integer mark,
			RedirectAttributes rd) {
				
		rd.addFlashAttribute("msg", assignmentMarkService.save(employeeId,mark));
		return "redirect:/getForm";
		
	}
	
	@GetMapping("/batchFilter")
	public String filterBatch(Model model, @RequestParam("batchFilter") Integer bId) {
		model.addAttribute("batchList", batchService.getAllBatches());
		model.addAttribute("techList", technologyService.getAllTechnologies());
		model.addAttribute("dataLst", assignmentMarkService.getDataFromBatchId(bId));
		return "getForm";
	}
}
