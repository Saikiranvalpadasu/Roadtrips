package trg.talentsprint.starterkit.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "route")
public class Routes {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String routename;
	private String category;
	private String keyword;
	private String rdescription;
	private String fromaddress;
	private String toaddress;
	private String user;
	private String path;
	private long rating;
	private String comment;
	public Routes() {
		super();
	}

	public Routes(String routename, String category, String keyword, String rdescription, String fromaddress,
			String toaddress, String user,String path,long rating,String comment) {
		super();
		this.routename = routename;
		this.category = category;
		this.keyword = keyword;
		this.rdescription = rdescription;
		this.fromaddress = fromaddress;
		this.toaddress = toaddress;
		this.user = user;
		this.path=path;
		this.rating=rating;
		this.comment=comment;
	}
	

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Routes(String user) {
		super();
		this.user = user;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getRoutename() {
		return routename;
	}

	public void setRoutename(String routename) {
		this.routename = routename;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getRdescription() {
		return rdescription;
	}

	public void setRdescription(String rdescription) {
		this.rdescription = rdescription;
	}

	public String getFromaddress() {
		return fromaddress;
	}

	public void setFromaddress(String fromaddress) {
		this.fromaddress = fromaddress;
	}

	public String getToaddress() {
		return toaddress;
	}

	public void setToaddress(String toaddress) {
		this.toaddress = toaddress;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public long getRating() {
		return rating;
	}

	public void setRating(long rating) {
		this.rating = rating;
	}
	

}
