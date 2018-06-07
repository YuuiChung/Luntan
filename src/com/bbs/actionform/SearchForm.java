package com.bbs.actionform;

public class SearchForm {
	private String subsql;
	private String sqlvalue;
	private String searchType = "like";

	public String getSqlvalue() {
		return sqlvalue;
	}

	public void setSqlvalue(String sqlvalue) {
		this.sqlvalue = sqlvalue;
	}

	public String getSubsql() {
		return subsql;
	}

	public void setSubsql(String subsql) {
		this.subsql = subsql;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
}
