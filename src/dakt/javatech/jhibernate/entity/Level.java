package dakt.javatech.jhibernate.entity;

import java.util.Set;

public class Level implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Integer levelid;
	private String levelname;
	private Set<Grammarguideline> lstGramGuideLine;
	private Set<Vocabularyguideline> lstVocabGuideLine;
	private Set<Readexercise> lstReadExercise;
	private Set<Listenexercise> lstListenExercise;
	private Set<ListenGuideline> lstListenGuideline;
	
	public Set<ListenGuideline> getLstListenGuideline() {
		return lstListenGuideline;
	}
	public void setLstListenGuideline(Set<ListenGuideline> lstListenGuideline) {
		this.lstListenGuideline = lstListenGuideline;
	}
	public Set<Listenexercise> getLstListenExercise() {
		return lstListenExercise;
	}
	public void setLstListenExercise(Set<Listenexercise> lstListenExercise) {
		this.lstListenExercise = lstListenExercise;
	}
	public Set<Readexercise> getLstReadExercise() {
		return lstReadExercise;
	}
	public void setLstReadExercise(Set<Readexercise> lstReadExercise) {
		this.lstReadExercise = lstReadExercise;
	}
	public Set<Vocabularyguideline> getLstVocabGuideLine() {
		return lstVocabGuideLine;
	}
	public void setLstVocabGuideLine(Set<Vocabularyguideline> lstVocabGuideLine) {
		this.lstVocabGuideLine = lstVocabGuideLine;
	}
	public Set<Grammarguideline> getLstGramGuideLine() {
		return lstGramGuideLine;
	}
	public void setLstGramGuideLine(Set<Grammarguideline> lstGramGuideLine) {
		this.lstGramGuideLine = lstGramGuideLine;
	}
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


}
