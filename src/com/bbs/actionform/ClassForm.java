package com.bbs.actionform;

public class ClassForm {
	private String classId;
	private String className;
	private String classIntro = "欢迎访问！";

	public String getClassId() {
		return classId;
	}

	public void setClassId(String classId) {
		this.classId = classId;
	}

	public String getClassIntro() {
		return classIntro;
	}

	public void setClassIntro(String classIntro) {
		this.classIntro = classIntro;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public void clear() {
		className = "";
		classIntro = "欢迎访问！";
	}
}
