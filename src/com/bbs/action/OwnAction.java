package com.bbs.action;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;
import com.bbs.actionform.UserForm;
import com.bbs.dao.OpDB;
import com.bbs.model.CreatePage;

public class OwnAction implements SessionAware, ServletRequestAware {

	private HttpServletRequest request;
	private Map<String, Object> session;

	/** 查看发表的根帖 */
	public String lookMyBbs() {
		session.put("mainPage", "/pages/show/bbs/myBbsShow.jsp");
		UserForm logoner = (UserForm) session.get("logoner");
		if (logoner != null && (logoner instanceof UserForm)) {
			String bbsown = logoner.getUserName();
			String sql = "select * from tb_bbs where bbs_sender=? order by bbs_opTime DESC";
			Object[] params = { bbsown };
			OpDB myOp = new OpDB();

			int perR = 5;
			String currentP = request.getParameter("showpage");
			if (currentP == null || currentP.equals(""))
				currentP = (String) session.get("currentPmy");
			else
				session.put("currentPmy", currentP);
			String gowhich = "needLogin/my/listShow.do?method=lookMyBbs";

			myOp.setMark(true); // 进行分页显示
			myOp.setPageInfo(perR, currentP, gowhich); // 设置进行分页显示需要的信息

			List mybbslist = myOp.OpBbsListShow(sql, params);
			CreatePage page = myOp.getPage();

			session.put("mybbslist", mybbslist);
			session.put("page", page);
			return "success";
		} else {
			String error = "用户还没登录，请登录！！！";
			session.put("error", error);
			return "error";
		}

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
