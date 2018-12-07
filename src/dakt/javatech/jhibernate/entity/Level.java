package dakt.javatech.jhibernate.entity;

import java.util.Set;

import org.codehaus.jackson.annotate.JsonBackReference;

public class Level implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Integer levelid;
	private String levelname;
	
	public Integer getLevelid() {
		return levelid;
	}
	public void setLevelid(Integer levelid) {
		this.levelid = levelid;
	}
	public String getLevelname() {
		return levelname;
	}
	public void setLevelname(String levelname) {
		this.levelname = levelname;
	}
	public Level()
	{
		
	}

}
