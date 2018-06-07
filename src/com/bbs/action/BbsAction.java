package com.bbs.action;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.bbs.actionform.BbsAnswerForm;
import com.bbs.actionform.BbsForm;
import com.bbs.actionform.BoardForm;
import com.bbs.actionform.UserForm;
import com.bbs.dao.OpDB;
import com.bbs.model.CreatePage;
import com.bbs.tools.Change;

public class BbsAction implements SessionAware, ServletRequestAware {

	private String bbsFace;
	private String bbsTitle;
	private String bbsAnswerTitle;
	private String bbsAnswerContent;
	private String bbsContent;
	private HttpServletRequest request;
	private Map<String, Object> session;

	/** 显示指定版面中的所有根帖 */
	public String rootListShow() {
		session.put("mainPage", "/pages/show/bbs/listRootShow.jsp");

		String classId = request.getParameter("classId");
		String boardId = request.getParameter("boardId");
		if (classId == null || classId.equals(""))
			classId = (String) session.get("classId");
		else
			session.put("classId", classId);
		if (boardId == null || boardId.equals(""))
			boardId = (String) session.get("boardId");
		else
			session.put("boardId", boardId);
		String boardPcard = request.getParameter("boardPcard");
		if (boardPcard == null)
			boardPcard = "";
		try {
			boardPcard = new String(boardPcard.getBytes("ISO-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			boardPcard = "";
			e.printStackTrace();
		}
		System.out.println(boardPcard);
		session.put("boardPcard", boardPcard);
		// 生成“跳转版面”下拉列表中的选项，这些选项应为当前论坛类别中的版面
		
		Map<String, String> jumpBoard = new HashMap<String, String>();
		Map mapList = (HashMap) session.get("mapBoard");
		List boardlist = (List) mapList.get(classId);
		if (boardlist != null && boardlist.size() != 0) {
			for (int i = 0; i < boardlist.size(); i++) {
				BoardForm boardSingle = (BoardForm) boardlist.get(i);
				jumpBoard.put(boardSingle.getBoardId(),boardSingle.getBoardName());
				if (boardId.equals(boardSingle.getBoardId())) { // 如果是当前版面
					session.put("boardMaster",
							boardSingle.getBoardMaster());
					// 保存当前版面的斑竹
					session.put("boardPcard",
							boardSingle.getBoardPcard());
					// 保存当前版面的公告
				}
			}
		}
		session.put("jumpBoard", jumpBoard);
		 

		String sql = "";
		Object[] params = { boardId };
		OpDB myOp = new OpDB();

		// 查询数据库，获取置顶帖子(不包括括精华帖子)
		myOp.setMark(false); // 不进行分页显示
		sql = "select * from tb_bbs where bbs_boardID=? and bbs_isTop='1' order by bbs_toTopTime DESC";
		List topbbslist = myOp.OpBbsListShow(sql, params);
		session.put("topbbslist", topbbslist);

		// 查询数据库，获取其他帖子(包括精华帖子，也包括即是置顶，又是精华的帖子)
		int perR = 5;
		String currentP = request.getParameter("showpage");
		if (currentP == null || currentP.equals(""))
			currentP = (String) session.get("currentP");
		else
			session.put("currentP", currentP);
		String gowhich = "user/listShow.do?method=rootListShow";

		myOp.setMark(true); // 进行分页显示
		myOp.setPageInfo(perR, currentP, gowhich); // 设置进行分页显示需要的信息

		sql = "select * from tb_bbs where bbs_boardID=? and (bbs_isTop='0' or bbs_isGood='1') order by bbs_opTime DESC";
		List otherbbslist = myOp.OpBbsListShow(sql, params);
		CreatePage page = myOp.getPage();

		session.put("otherbbslist", otherbbslist);
		session.put("page", page);

		return "success";
	}

	/** 查看某个根帖 */
	public String openShow() {
		session.put("mainPage", "/pages/show/bbs/openRootShow.jsp");

		String bbsId = request.getParameter("bbsId");
		if (bbsId == null || bbsId.equals(""))
			bbsId = (String) session.get("bbsId");
		else
			session.put("bbsId", bbsId);

		String sql = "";
		Object[] params = { bbsId };
		OpDB myOp = new OpDB();

		// *********** 查询tb_bbs数据表，获取要查看的根帖 ***********//*
		sql = "select * from tb_bbs where bbs_id=?";
		BbsForm bbsRootSingle = myOp.OpBbsSingleShow(sql, params);
		session.put("bbsRootSingle", bbsRootSingle);

		// 查询tb_user数据表，获取该根帖发表者信息
		String asker = bbsRootSingle.getBbsSender();
		sql = "select * from tb_user where user_name=?";
		params[0] = asker;
		UserForm askUser = myOp.OpUserSingleShow(sql, params);
		session.put("askUser", askUser);

		// 获取进行分页显示需要的信息
		int perR = 6;
		String currentP = request.getParameter("showpage");
		if (currentP == null || currentP.equals(""))
			currentP = (String) session.get("currentPopen");
		else
			session.put("currentPopen", currentP);
		String gowhich = "user/openShow.do?method=openShow";

		myOp.setMark(true); // 进行分页显示
		myOp.setPageInfo(perR, currentP, gowhich); // 设置进行分页显示需要的信息

		// *********** 查询tb_bbsAnswer数据表，获取根帖的回复帖 ***********//*
		sql = "select * from tb_bbsAnswer where bbsAnswer_rootID=? order by bbsAnswer_sendTime";
		params[0] = bbsId;
		List answerbbslist = myOp.OpBbsAnswerListShow(sql, params);
		CreatePage page = myOp.getPage();

		session.put("answerbbslist", answerbbslist);
		session.put("page", page);

		// 查询tb_user数据表，获取当前回复帖发表者信息
		sql = "select * from tb_user where user_name=?";
		Map answerMap = new HashMap();
		for (int i = 0; i < answerbbslist.size(); i++) {
			String answerer = ((BbsAnswerForm) answerbbslist.get(i))
					.getBbsAnswerSender();
			System.out.println(answerer);
			if (!answerMap.containsKey(answerer)) {
				params[0] = answerer;
				UserForm answerUser = myOp.OpUserSingleShow(sql, params);
				answerMap.put(answerer, answerUser);
			}
		}
		session.put("answerMap", answerMap);

		return "success";
	}

	/** 查看精华帖 */
	public String goodListShow() {
		session.put("mainPage", "/pages/show/bbs/goodListShow.jsp");
		OpDB myOp = new OpDB();

		int perR = 5;
		String currentP = request.getParameter("showpage");
		if (currentP == null || currentP.equals(""))
			currentP = (String) session.get("currentPgood");
		else
			session.put("currentPgood", currentP);
		String gowhich = "user/goodListShow.do?method=goodListShow";

		myOp.setMark(true); // 进行分页显示
		myOp.setPageInfo(perR, currentP, gowhich); // 设置进行分页显示需要的信息

		String sql = "select * from tb_bbs where bbs_isGood='1' order by bbs_toGoodTime DESC";
		List goodlist = myOp.OpBbsListShow(sql, null);
		CreatePage page = myOp.getPage();

		session.put("goodlist", goodlist);
		session.put("page", page);

		return "success";
	}

	/** 发表帖子 */
	public String addBbs() {
		session.put("mainPage", "/pages/add/bbsAdd.jsp");

		String validate = request.getParameter("validate");
		if (validate == null || validate.equals("") || !validate.equals("yes")) {
			if ((UserForm) session.get("logoner") != null) {
				return "showAddJSP";
			} else {
				String error = "用户还没登录，请登录！！！";
				session.put("error", error);
				return "error";
			}
		} else {
			String boardId = (String) session.get("boardId");
			String bbsFace = getBbsFace();
			if (boardId != null && bbsFace != null) {
				String bbsTitle = Change.HTMLChange(getBbsTitle());
				String bbsContent = Change.HTMLChange(getBbsContent());
				String bbsSender = ((UserForm) session.get("logoner"))
						.getUserName();
				String bbsSendTime = Change.dateTimeChange(new Date());
				String bbsOpTime = bbsSendTime;
				String bbsIsTop = "0";
				String bbsToTopTime = "";
				String bbsIsGood = "0";
				String bbsToGoodTime = "";

				String sql = "insert into tb_bbs values(null,?,?,?,?,now(),?,?,?,null,?,null)";
				Object[] params = { boardId, bbsTitle, bbsContent, bbsSender,
						bbsFace, bbsOpTime, bbsIsTop, bbsIsGood };

				OpDB myOp = new OpDB();
				int i = myOp.OpUpdate(sql, params);
				if (i <= 0) {
					System.out.println("发表帖子失败！");
					String error = "发表帖子失败！！！";
					session.put("error", error);
					return "error";
				} else {
					System.out.println("发表帖子成功！");
					session.put("currentP", "1");
					return "success";
				}
			} else {
				String error = "发表帖子不能为空！！！";
				session.put("error", error);
				return "error";
			}
		}
	}

	/** 回复帖子 */
	public String answerBbs() {

		UserForm logoner = (UserForm) session.get("logoner");
		String bbsFace = getBbsFace();
		if (logoner != null && (logoner instanceof UserForm)) {
			if (bbsFace != null) {
				String rootId = (String) session.get("bbsId");
				String bbsTitle = Change.HTMLChange(getBbsAnswerTitle());
				String bbsContent = Change.HTMLChange(getBbsAnswerContent());
				String bbsSender = logoner.getUserName();
				String bbsSendTime = Change.dateTimeChange(new Date());

				String sql = "insert into tb_bbsAnswer values(null,?,?,?,?,?,?)";
				Object[] params = new Object[6];

				params[0] = rootId;
				params[1] = bbsTitle;
				params[2] = bbsContent;
				params[3] = bbsSender;
				params[4] = bbsSendTime;
				params[5] = bbsFace;

				String forwardPath = "";

				OpDB myOp = new OpDB();
				int i = myOp.OpUpdate(sql, params);
				if (i <= 0) {
					System.out.println("回复帖子失败！");
					String error = "回复帖子失败！！！";
					session.put("error", error);
					forwardPath = "error";
				} else {
					System.out.println("回复帖子成功！");
					forwardPath = "success";
				}
				return forwardPath;
			} else {
				String error = "回复不能为空，回复失败！！！";
				session.put("error", error);
				return "error";
			}
		} else {
			String error = "用户还没有登录，请登录！！！";
			session.put("error", error);
			return "error";
		}
	}

	/** 将帖子提前 */
	public String toFirstBbs() {
		UserForm logoner = (UserForm) session.get("logoner");

		if (logoner != null && (logoner instanceof UserForm)) {
			String bbsId = request.getParameter("bbsId"); // 获取被提前帖子的ID
			String bbsSender = request.getParameter("bbsSender"); // 获取被提前帖子的发布者
			String time = Change.dateTimeChange(new Date()); // 获取操作时间
			String lognerAble = logoner.getUserAble(); // 获取当前登录用户的权限
			String lognerName = logoner.getUserName(); // 获取当前登录用户的用户名
			String master = (String) session.get("boardMaster"); // 获取当前版面的斑竹
			if (bbsSender == null)
				bbsSender = "";
			try {
				bbsSender = new String(bbsSender.getBytes("ISO-8859-1"),
						"utf-8");
			} catch (UnsupportedEncodingException e) {
				bbsSender = "";
				e.printStackTrace();
			}

			if (bbsId == null)
				bbsId = "-1";

			// 如果当前登录的用户是帖子的发表者、帖子所属版面的斑竹、管理员
			if (lognerAble.equals("2") || lognerName.equals(master)
					|| lognerName.equals(bbsSender)) {
				if (bbsId != null && !bbsId.equals("")) {
					Object[] params = { time, bbsId };
					String sql = "update tb_bbs set bbs_opTime=? where bbs_id=?";
					OpDB myOp = new OpDB();
					int i = myOp.OpUpdate(sql, params);
					if (i <= 0) {
						System.out.println("提前帖子失败");
						String error = "提前帖子失败！！！";
						session.put("error", error);
						return "error";
					} else {
						System.out.println("提前帖子成功！");
						return "success";
					}
				} else {
					String error = "提前帖子失败！！！";
					session.put("error", error);
					return "error";
				}
			} else {
				System.out.println("您没有权限提前该帖子！");
				String error = "您没有权限提前该帖子！！！";
				session.put("error", error);
				return "error";
			}
		} else {
			String error = "用户还没有登录，请登录！！！";
			session.put("error", error);
			return "error";
		}
	}

	/** 删除根帖 */
	public String deleteRootBbs() {
		UserForm logoner = (UserForm) session.get("logoner");

		if (logoner != null && (logoner instanceof UserForm)) {
			String bbsId = request.getParameter("bbsId"); // 获取要删除帖子的ID
			String bbsSender = request.getParameter("bbsSender"); // 获取要删除帖子的发布者
			String lognerAble = logoner.getUserAble(); // 获取当前登录用户的权限
			String lognerName = logoner.getUserName(); // 获取当前登录用户的用户名
			String master = (String) session.get("boardMaster"); // 获取当前斑竹
			if (bbsSender == null)
				bbsSender = "";
			try {
				bbsSender = new String(bbsSender.getBytes("ISO-8859-1"),
						"utf-8");
			} catch (UnsupportedEncodingException e) {
				bbsSender = "";
				e.printStackTrace();
			}

			if (bbsId == null)
				bbsId = "-1";

			// 如果当前登录的用户是帖子的发表者、帖子所属版面的斑竹、管理员
			if (lognerAble.equals("2") || lognerName.equals(master)
					|| lognerName.equals(bbsSender)) {
				if (bbsId != null && !bbsId.equals("")) {
					String sql = "delete from tb_bbs where bbs_id=?";
					Object[] params = { bbsId };

					OpDB myOp = new OpDB();
					int i = myOp.OpUpdate(sql, params);
					if (i <= 0) {
						System.out.println("删除出错！");
						String error = "删除出错！！！";
						session.put("error", error);
						return "error";
					} else { 
						// 删除成功后，要返回列表显示根帖的页面，该页面有：查看某版面下所有根帖的页面、查看我的帖子的页面、查看精华帖子的页面
						System.out.println("删除成功！");
						return "success";
					}
				} else {
					String error = "删除出错！！！";
					session.put("error", error);
					return "error";
				}
			} else {
				System.out.println("您没有权限删除该帖子!");
				String error = "您没有权限删除该帖子！！！";
				session.put("error", error);
				return "error";
			}
		} else {
			String error = "用户还没有登录，请登录！！！";
			session.put("error", error);
			return "error";
		}
	}

	/** 查看帖子的发表者的详细信息 */
	public String getUserSingle() {

		String userName = request.getParameter("userName");
		if (userName == null)
			userName = "";
		try {
			userName = new String(userName.getBytes("ISO-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			userName = "";
			e.printStackTrace();
		}

		String forwardPath = "";

		String sql = "select * from tb_user where user_name=?";
		Object[] params = { userName };

		OpDB myOp = new OpDB();
		UserForm bbsUser = myOp.OpUserSingleShow(sql, params);

		if (bbsUser == null) {
			System.out.println("查看帖子的发表者失败！");
			forwardPath = "error";
		} else {
			System.out.println("查看帖子的发表者成功！");
			forwardPath = "success";
			session.put("bbsUserSingle", bbsUser);
			session.put("mainPage", "/pages/show/user/bbsUserSingle.jsp");
		}
		return forwardPath;
	}

	public String getBbsAnswerTitle() {
		return bbsAnswerTitle;
	}

	public void setBbsAnswerTitle(String bbsAnswerTitle) {
		this.bbsAnswerTitle = bbsAnswerTitle;
	}

	public String getBbsAnswerContent() {
		return bbsAnswerContent;
	}

	public void setBbsAnswerContent(String bbsAnswerContent) {
		this.bbsAnswerContent = bbsAnswerContent;
	}

	public String getBbsTitle() {
		return bbsTitle;
	}

	public void setBbsTitle(String bbsTitle) {
		this.bbsTitle = bbsTitle;
	}

	public String getBbsContent() {
		return bbsContent;
	}

	public void setBbsContent(String bbsContent) {
		this.bbsContent = bbsContent;
	}

	public String getBbsFace() {
		return bbsFace;
	}

	public void setBbsFace(String bbsFace) {
		this.bbsFace = bbsFace;
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
