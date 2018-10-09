package dakt.javatech.jhibernate.entity;
// Generated Sep 26, 2018 6:04:22 AM by Hibernate Tools 5.3.1.Final

public class Cmtlisten implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Integer cmtlistenid;
	private ListenGuideline listenguideline;
	private Member member;
	private String cmtlistencontent;
	
	
	public Integer getCmtlistenid() {
		return cmtlistenid;
	}
	public void setCmtlistenid(Integer cmtlistenid) {
		this.cmtlistenid = cmtlistenid;
	}
	public ListenGuideline getListenguideline() {
		return listenguideline;
	}
	public void setListenguideline(ListenGuideline listenguideline) {
		this.listenguideline = listenguideline;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public String getCmtlistencontent() {
		return cmtlistencontent;
	}
	public void setCmtlistencontent(String cmtlistencontent) {
		this.cmtlistencontent = cmtlistencontent;
	}

	

}
