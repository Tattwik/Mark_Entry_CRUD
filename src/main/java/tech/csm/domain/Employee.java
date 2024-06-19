package tech.csm.domain;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class Employee implements Serializable {

	private Integer employeeId;
	
	private String employeeName;
	
	private String employeePhone;
	
	private String employeeEmail;
	
	
}
