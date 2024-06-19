package tech.csm.domain;

import java.io.Serializable;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class Batch implements Serializable {

	private Integer batchId;
	
	private String batchName;
	
	private Date batchStartDate;
	
	private Integer batchStrength;
}
