package dakt.javatech.jhibernate.entity;
// Generated Sep 26, 2018 6:04:22 AM by Hibernate Tools 5.3.1.Final

import java.util.HashSet;
import java.util.Set;

import org.codehaus.jackson.annotate.JsonBackReference;

/**
 * Member generated by hbm2java
 */
public class Member implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer memberid;
	private Integer categorymemberid;
	private String name;
	private String membername;
	private String memberpass;
	private String email;
	private Integer sdt;
	
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}


	public Integer getSdt() {
		return sdt;
	}

	public void setSdt(Integer sdt) {
		this.sdt = sdt;
	}

	public Member() {
	}

	public Integer getMemberid() {
		return this.memberid;
	}

	public void setMemberid(Integer memberid) {
		this.memberid = memberid;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMembername() {
		return this.membername;
	}

	public void setMembername(String membername) {
		this.membername = membername;
	}

	public String getMemberpass() {
		return this.memberpass;
	}

	public void setMemberpass(String memberpass) {
		this.memberpass = memberpass;
	}

	public Integer getCategorymemberid() {
		return categorymemberid;
	}

	public void setCategorymemberid(Integer categorymemberid) {
		this.categorymemberid = categorymemberid;
	}

}
