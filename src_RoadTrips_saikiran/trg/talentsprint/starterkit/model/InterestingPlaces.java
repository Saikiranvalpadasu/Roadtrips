package trg.talentsprint.starterkit.model;

import javax.persistence.*;

@Entity
public class InterestingPlaces {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private String ilocation;
	private String iname;
	private String idescription;
	private Long rid;
	private String path;
	
	public InterestingPlaces() {
		super();
	}
	
	public InterestingPlaces(String ilocation, String iname, String idescription,String path) {
		super();
		this.ilocation = ilocation;
		this.iname = iname;
		this.idescription = idescription;
		this.path=path;
	}
	
	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public String getIlocation() {
		return ilocation;
	}

	public void setIlocation(String ilocation) {
		this.ilocation = ilocation;
	}

	public String getIname() {
		return iname;
	}
	
	public void setIname(String iname) {
		this.iname = iname;
	}
	
	public String getIdescription() {
		return idescription;
	}
	
	public void setIdescription(String idescription) {
		this.idescription = idescription;
	}
	
	public Long getRid() {
		return rid;
	}
	
	public void setRid(Long rid) {
		this.rid = rid;
	}
	
}
