package dakt.javatech.jhibernate.entity;
// Generated Sep 26, 2018 6:04:22 AM by Hibernate Tools 5.3.1.Final

import java.util.HashSet;
import java.util.Set;

public class ListenGuideline implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Integer listenguidelineid;
	private String listenname;
	private String listenimage;
	private String content;
	private Set<Cmtlisten> cmtlistens;
	private Level level;
	
	public Level getLevel() {
		return level;
	}
	public void setLevel(Level level) {
		this.level = level;
	}
	public Integer getListenguidelineid() {
		return listenguidelineid;
	}
	public void setListenguidelineid(Integer listenguidelineid) {
		this.listenguidelineid = listenguidelineid;
	}
	public String getListenname() {
		return listenname;
	}
	public void setListenname(String listenname) {
		this.listenname = listenname;
	}
	public String getListenimage() {
		return listenimage;
	}
	public void setListenimage(String listenimage) {
		this.listenimage = listenimage;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Set<Cmtlisten> getCmtlistens() {
		return cmtlistens;
	}
	public void setCmtlistens(Set<Cmtlisten> cmtlistens) {
		this.cmtlistens = cmtlistens;
	}

}
