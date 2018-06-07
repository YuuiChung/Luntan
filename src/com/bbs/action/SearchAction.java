package com.bbs.action;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;
import com.bbs.dao.OpDB;
import com.bbs.model.CreatePage;
import com.bbs.tools.Change;

public class SearchAction implements SessionAware, ServletRequestAware {

	private String subsql;
	private String sqlvalue;
	private String searchType;
	private HttpServletRequest request;
	private Map<String, Object> session;

	public String search() {
		session.put("mainPage", "/pages/show/bbs/searchListShow.jsp");

		String subsql = getSubsql();
		String sqlvalue = getSqlvalue();
		String searchType = getSearchType();

		if (searchType != null && subsql != null && sqlvalue != null) {
			String validate = request.getParameter("validate");
			if (validate == null || validate.equals("")
					|| !validate.equals("yes")) { // 通过“返回”超链接触发的搜索操作
				subsql = (String) session.get("subsql");
				sqlvalue = (String) session.get("sqlvalue");
				searchType = (String) session.get("searchType");
			} else { // 通过提交表单触发的“搜索操作”
				session.put("subsql", subsql);
				sqlvalue = Change.HTMLChange(getSqlvalue());
				session.put("sqlvalue", sqlvalue);
				session.put("searchType", searchType);
			}

			String opname = "";
			String param = "";
			if (searchType.equals("all")) {
				opname = " = ";
				param = sqlvalue;
			} else {
				opname = " like ";
				param = "%" + sqlvalue + "%";
			}

			int perR = 5;
			String currentP = request.getParameter("showpage");
			if (currentP == null || currentP.equals(""))
				currentP = (String) session.get("currentPsh");
			else
				session.put("currentPsh", currentP);
			String gowhich = "user/search.do";

			OpDB myOp = new OpDB();
			myOp.setMark(true); // 进行分页显示
			myOp.setPageInfo(perR, currentP, gowhich); // 设置进行分页显示需要的信息

			String sql = "select * from tb_bbs where " + subsql + opname + "?";
			Object[] params = { param };

			List searchlist = myOp.OpBbsListShow(sql, params);
			CreatePage page = myOp.getPage();

			session.put("searchlist", searchlist);
			session.put("page", page);

			return "success";
		} else {
			String error = "搜索栏不能为空！！！";
			session.put("error", error);
			return "error";
		}
	}

	public String getSubsql() {
		return subsql;
	}

	public void setSubsql(String subsql) {
		this.subsql = subsql;
	}

	public String getSqlvalue() {
		return sqlvalue;
	}

	public void setSqlvalue(String sqlvalue) {
		this.sqlvalue = sqlvalue;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public void setSession(Map<String, Object> session) {
		// TODO Auto-generated method stub
		this.session = session;
	}

	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request = request;
	}
}
