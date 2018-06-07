package com.bbs.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;
import org.apache.struts2.interceptor.SessionAware;
import com.bbs.actionform.ClassForm;
import com.bbs.dao.OpDB;

public class IndexAction implements SessionAware {
	
	private Map<String, Object> session;
	private Map<String, List> mapBoard = new HashMap<String, List>();
	
	public String execute() {
		session.put("mainPage", "default.jsp");
		session.put("backMainPage", "default.jsp");
		OpDB myOp = new OpDB();

		List classType = myOp.OpClassListShow();
		if (classType != null && classType.size() != 0) {
			for (int i = 0; i < classType.size(); i++) {
				String classID = ((ClassForm) classType.get(i)).getClassId();
				String sql = "select * from tb_board where board_classID=?";
				Object[] params = { classID };
				List oneboardlist = myOp.OpBoardListShow(sql, params);
				mapBoard.put(classID, oneboardlist);
				System.out.println(classID);
			}
		}
		Map<String, String> searchSQL = new HashMap<String, String>();
		searchSQL.put("bbs_title", "帖子标题");
		searchSQL.put("bbs_content", "帖子内容");
		searchSQL.put("bbs_sender", "发表者");
		
		Map<String, String> headFace = new HashMap<String, String>();
		for (int i = 0; i < 22; i++) {
			String gif = "user" + i + ".gif";
			headFace.put(gif,"头像" + (i + 1));
		}
		
		session.put("mapBoard", mapBoard);
		session.put("classType", classType);
		session.put("searchSQL", searchSQL);
		session.put("headFace", headFace);
		return "success";
	}

	public void setSession(Map<String, Object> session) {
		// TODO Auto-generated method stub
		this.session = session;
	}
}
