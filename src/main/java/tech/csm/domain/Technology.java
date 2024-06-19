package tech.csm.domain;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class Technology implements Serializable {

	private Integer technologyId;
	
	private String technologyName;
}
