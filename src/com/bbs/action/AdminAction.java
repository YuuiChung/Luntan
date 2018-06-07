package com.bbs.action;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;
import com.bbs.actionform.BoardForm;
import com.bbs.actionform.ClassForm;
import com.bbs.actionform.UserForm;
import com.bbs.dao.OpDB;
import com.bbs.tools.Change;

public class AdminAction implements SessionAware, ServletRequestAware {
	
	private String id;
	private String userName;
	private String userFace;
	private String userSex;
	private String userEmail;
	private String userFrom;
	private String userAble;
	private String userPs;
	private String classId;
	private String className;
	private String classIntro;
	private String boardClassID;
	private String boardId;
	private String boardName;
	private String boardMaster;
	private String boardPcard;
	private String showAble;
	private String userPassword;
	private Map<String, Object> session;
	private HttpServletRequest request;
	
	/** 置顶帖子 */
	public String setTopBbs() {
		session.put("mainPage", "/pages/show/bbs/openRootShow.jsp");
		UserForm logoner = (UserForm) session.get("logoner");
		if (logoner != null && (logoner instanceof UserForm)) {
			String lognerAble = logoner.getUserAble(); // 获取当前登录用户的权限
			String lognerName = logoner.getUserName(); // 获取当前登录用户的用户名
			String master = (String) session.get("boardMaster"); // 获取当前版面的斑竹
			System.out.println(master);
			String forwardPath = "";

			String bbsId = request.getParameter("bbsId");
			if (lognerAble.equals("2") || lognerName.equals(master)) {
				if (bbsId != null && !bbsId.equals("")) {
					Date date = new Date();
					String today = Change.dateTimeChange(date);
					String sql = "update tb_bbs set bbs_isTop='1', bbs_toTopTime=? where bbs_id=?";
					Object[] params = { today, bbsId };

					OpDB myOp = new OpDB();
					int i = myOp.OpUpdate(sql, params);
					if (i <= 0) {
						System.out.println("置顶帖子出错！");
						String error = "置顶帖子出错！！！";
						session.put("error", error);
						forwardPath = "error";
					} else {
						System.out.println("置顶帖子成功！");
						forwardPath = "success";
					}
				} else {
					String error = "置顶帖子失败！！！";
					session.put("error", error);
					forwardPath = "error";
				}
			} else {
				System.out.println("您没有权限提前该帖子！");
				String error = "您没有权限提前该帖子！！！";
				session.put("error", error);
				forwardPath = "error";
			}
			return forwardPath;
		} else {
			String error = "用户还没有登录，请登录！！！";
			session.put("error", error);
			return "error";
		}
	}

	/** 设为精华帖子 */
	public String setGoodBbs() {
		String forwardPath = "";
		UserForm logoner = (UserForm) session.get("logoner");
		if (logoner != null && (logoner instanceof UserForm)) {
			String lognerAble = logoner.getUserAble(); // 获取当前登录用户的权限
			String lognerName = logoner.getUserName(); // 获取当前登录用户的用户名
			String master = (String) session.get("boardMaster"); // 获取当前版面的斑竹
			System.out.println(master);
			String bbsId = request.getParameter("bbsId");
			if (lognerAble.equals("2") || lognerName.equals(master)) {
				if (bbsId != null && !bbsId.equals("")) {
					Date date = new Date();
					String today = Change.dateTimeChange(date);
					String sql = "update tb_bbs set bbs_isGood='1', bbs_toTopTime=? where bbs_id=?";
					Object[] params = { today, bbsId };

					OpDB myOp = new OpDB();
					int i = myOp.OpUpdate(sql, params);
					if (i <= 0) {
						System.out.println("设为精华帖子失败！");
						String error = "设为精华帖子失败！！！";
						session.put("error", error);
						forwardPath = "error";
					} else {
						System.out.println("设为精华帖子成功！");
						forwardPath = "success";
					}
				} else {
					String error = "设为精华帖子失败！！！";
					session.put("error", error);
					forwardPath = "error";
				}
			} else {
				System.out.println("您没有权限提前该帖子！");
				String error = "您没有权限提前该帖子！！！";
				session.put("error", error);
				forwardPath = "error";
			}
			return forwardPath;
		} else {
			String error = "用户还没有登录，请登录！！！";
			session.put("error", error);
			return "error";
		}
	}

	/** 删除回复帖 */
	public String deleteAnswerBbs() {
		UserForm logoner = (UserForm) session.get("logoner");
		String forwardPath = "";

		if (logoner != null && (logoner instanceof UserForm)) {
			String delbbsId = request.getParameter("delbbsAnswerId");
			String bbsSender = request.getParameter("bbsSender"); // 获取被提前帖子的发布者
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
			if (lognerAble.equals("2") || lognerName.equals(master)
					|| lognerName.equals(bbsSender)) {
				if (delbbsId != null && !delbbsId.equals("")) {
					String sql = "delete from tb_bbsAnswer where bbsAnswer_id=?";
					Object[] params = { delbbsId };

					OpDB myOp = new OpDB();
					int i = myOp.OpUpdate(sql, params);
					if (i <= 0) {
						System.out.println("删除回复帖失败！");
						String error = "删除回复帖失败！！！";
						session.put("error", error);
						forwardPath = "error";
					} else {
						System.out.println("删除回复帖成功！");
						forwardPath = "success";
					}
				}
			} else {
				System.out.println("您没有权限提前该帖子！");
				String error = "您没有权限提前该帖子！！！";
				session.put("error", error);
				forwardPath = "error";
			}
			return forwardPath;
		} else {
			String error = "用户还没有登录，请登录！！！";
			session.put("error", error);
			return "error";
		}
	}

	/** 后台-列表查看论坛类别 */
	public String getClassList() {
		session.put("backMainPage", "../class/classListShow.jsp");

		OpDB myOp = new OpDB();
		List classList = myOp.OpClassListShow();
		session.put("backClassList", classList);
		return "success";
	}

	/** 后台-修改论坛类别 */
	public String modifyClass() {
		session.put("backMainPage", "../class/classModify.jsp");

		String forwardPath = "";
		String classId = request.getParameter("classId");
		if (classId == null)
			classId = "";

		OpDB myOp = new OpDB();
		String validate = request.getParameter("validate");
		if (validate == null || validate.equals("") || !validate.equals("yes")) {
			forwardPath = "showModifyJSP";
			String sql = "select * from tb_class where class_id=?";
			Object[] params = { classId };

			ClassForm classSingle = myOp.OpClassSingleShow(sql, params);
			session.put("classSingle", classSingle);
		} else {
			classId = getClassId();
			String className = Change.HTMLChange(getClassName());
			String classIntro = Change.HTMLChange(getClassIntro());

			String sql = "update tb_class set class_name=?,class_intro=? where class_id=?";
			Object[] paramsMo = { className, classIntro, classId };
			System.out.println(classId + className + classIntro);
			int i = myOp.OpUpdate(sql, paramsMo);
			if (i <= 0) {
				System.out.println("更新论坛类别失败！");
				String error = "更新论坛类别失败！！！";
				session.put("error", error);
				forwardPath = "error";
			} else {
				System.out.println("更新论坛类别成功！");
				session.put("backMainPage", "../class/classListShow.jsp");
				forwardPath = "success";
			}
		}
		return forwardPath;
	}

	/** 后台-添加论坛类别 */
	public String addClass() {
		session.put("backMainPage", "../class/classAdd.jsp");

		String forwardPath = "";
		String validate = request.getParameter("validate");
		if (validate == null || validate.equals("") || !validate.equals("yes")) {
			return "showAddJSP";
		} else {
			String className = Change.HTMLChange(getClassName());
			String classIntro = Change.HTMLChange(getClassIntro());

			String sql = "";
			Object[] params = null;
			OpDB myOp = new OpDB();

			sql = "select * from tb_class where class_name=?";
			params = new Object[1];
			params[0] = className;

			if (myOp.OpClassSingleShow(sql, params) != null) {
				System.out.println("添加论坛类别-名称：" + className + " 的论坛已经存在！");
				String error = "添加论坛类别-名称：" + className + " 的论坛已经存在！";
				session.put("error", error);
				forwardPath = "error";
			} else {
				sql = "insert into tb_class values(null,?,?)";
				params = new Object[2];
				params[0] = className;
				params[1] = classIntro;

				int i = myOp.OpUpdate(sql, params);
				if (i <= 0) {
					System.out.println("添加论坛类别失败！");
					String error = "添加论坛类别失败！！！";
					session.put("error", error);
					forwardPath = "error";
				} else {
					System.out.println("添加论坛类别成功！");
					forwardPath = "success";
				}
			}
		}
		return forwardPath;
	}

	/** 后台-删除论坛类别 */
	public String deleteClass() {
		String classId = request.getParameter("classId");
		if (classId == null || classId.equals(""))
			classId = "-1";
		String sql = "delete from tb_class where class_id=?";
		Object[] params = { classId };

		OpDB myOp = new OpDB();
		int i = myOp.OpUpdate(sql, params);

		String forwardPath = "";

		if (i <= 0) {
			System.out.println("删除论坛类别失败！");
			String error = "删除论坛类别失败！！！";
			session.put("error", error);
			forwardPath = "error";
		} else {
			System.out.println("删除论坛类别成功！");
			forwardPath = "success";
		}
		return forwardPath;
	}

	/** 后台-列表查看版面 */
	public String getBoardList() {
		session.put("backMainPage", "../board/boardListShow.jsp");

		List boardList = null;
		OpDB myOp = new OpDB();
		String getType = request.getParameter("type");

		if (getType == null || getType.equals("") || !getType.equals("show")) {
			List classList = myOp.OpClassListShow();
			session.put("backClassList", classList);
			return "showModifyJSP";
		} else {
			String classId = getClassId();

			if (classId == null || classId.equals("")) {
				classId = (String) session.get("boardListId");
			} else {
				session.put("boardListId", classId);
			}

			String sql = "select * from tb_board where board_classID=?";
			Object[] params = { classId };
			boardList = myOp.OpBoardListShow(sql, params);
		}
		session.put("backBoardList", boardList);
		return "success";
	}

	/** 后台-修改版面 */
	public String modifyBoard() {
		session.put("backMainPage", "../board/boardModify.jsp");

		OpDB myOp = new OpDB();
		List classList = myOp.OpClassListShow();
		session.put("backClassList", classList);

		String forwardPath = "";
		String boardId = request.getParameter("boardId");
		if (boardId == null)
			boardId = "";

		String validate = request.getParameter("validate");
		if (validate == null || validate.equals("") || !validate.equals("yes")) {
			forwardPath = "showModifyJSP";
			String sql = "select * from tb_board where board_id=?";
			Object[] params = { boardId };
			BoardForm select = myOp.OpBoardSingleShow(sql, params);
			session.put("select", select);
		} else {

			String boardClassId = getBoardClassID();
			boardId = getBoardId();
			String boardName = Change.HTMLChange(getBoardName());
			String boardMaster = Change.HTMLChange(getBoardMaster());
			String boardPcard = Change.HTMLChange(getBoardPcard());

			String sql = "select * from tb_user where user_name=?";
			Object[] paramsS = { boardMaster };

			UserForm userform = myOp.OpUserSingleShow(sql, paramsS);
			if (userform == null) {
				forwardPath = "error";
				System.out.println("修改版面-" + boardMaster + " 版主不存在！");
				String error = "修改版面-" + boardMaster + " 版主不存在！！！";
				session.put("error", error);
			} else if (getUserAble().equals("0")) {
				forwardPath = "error";
				System.out.println("修改版面-" + boardMaster + "不是版主！");
				String error = "修改版面-" + boardMaster + "不是版主！！！";
				session.put("error", error);
			} else {
				sql = "update tb_board set board_classID=?,board_name=?,board_master=?,board_pcard=? where board_id=?";
				Object[] paramsM = { boardClassId, boardName, boardMaster,
						boardPcard, boardId };

				int i = myOp.OpUpdate(sql, paramsM);
				if (i <= 0) {
					forwardPath = "error";
					System.out.println("更新版面失败！");
					String error = "更新版面失败！！！";
					session.put("error", error);
				} else {
					forwardPath = "success";
					System.out.println("更新版面成功！");
				}
			}
		}
		return forwardPath;
	}

	/** 后台-添加版面 */
	public String addBoard() {
		session.put("backMainPage", "../board/boardAdd.jsp");

		String forwardPath = "";
		OpDB myOp = new OpDB();

		String validate = request.getParameter("validate");
		if (validate == null || validate.equals("") || !validate.equals("yes")) {
			List classList = myOp.OpClassListShow();
			session.put("backClassList", classList);
			return "showAddJSP";
		} else {
			String classId = getBoardClassID();
			String boardName = Change.HTMLChange(getBoardName());
			String boardMaster = Change.HTMLChange(getBoardMaster());
			String boardPcard = Change.HTMLChange(getBoardPcard());

			String sql = "select * from tb_board where board_name=? and board_classID=?";
			Object[] params = { boardName, classId };

			if (myOp.OpBoardSingleShow(sql, params) != null) {
				System.out.println("添加版面- " + boardName + " 版面已经存在！");
				String error = "添加版面- " + boardName + " 版面已经存在！！！";
				session.put("error", error);
				forwardPath = "error";
			} else {
				sql = "select * from tb_user where user_name=?";
				Object[] params1 = { boardMaster };

				UserForm userform = myOp.OpUserSingleShow(sql, params1);
				if (userform == null) {
					System.out.println("添加版面-" + boardMaster + " 版主不存在！");
					String error = "添加版面-" + boardMaster + " 版主不存在！！！";
					session.put("error", error);
					forwardPath = "error";
				} else if (getUserAble().equals("0")) {
					System.out.println("添加版面-" + boardMaster + " 不是版主！");
					String error = "添加版面-" + boardMaster + " 不是版主！！！";
					session.put("error", error);
					forwardPath = "error";
				} else {
					sql = "insert into tb_board values(null,?,?,?,?)";
					Object[] params2 = { classId, boardName, boardMaster,
							boardPcard };

					int i = myOp.OpUpdate(sql, params2);
					if (i <= 0) {
						System.out.println("添加版面失败！");
						String error = "添加版面失败！！！";
						session.put("error", error);
						forwardPath = "error";
					} else {
						System.out.println("添加版面成功！");
						forwardPath = "success";
					}
				}
			}
			return forwardPath;
		}
	}

	/** 后台-删除版面 */
	public String deleteBoard() {
		String boardId = request.getParameter("boardId");
		if (boardId == null || boardId.equals(""))
			boardId = "-1";
		String sql = "delete from tb_board where board_id=?";
		Object[] params = { boardId };

		OpDB myOp = new OpDB();
		int i = myOp.OpUpdate(sql, params);

		String forwardPath = "";

		if (i <= 0) {
			System.out.println("删除版面失败！");
			String error = "删除版面失败！！！";
			session.put("error", error);
			forwardPath = "error";
		} else {
			System.out.println("删除版面成功！");
			forwardPath = "success";
		}
		return forwardPath;
	}

	/** 后台-列表查看用户 */
	public String getUserList() {
		session.put("backMainPage", "../user/userListShow.jsp");

		String getType = request.getParameter("type");
		if (getType == null || getType.equals("") || !getType.equals("show")) {
			Map<String, String> ableList = new HashMap<String, String>();
			ableList.put("all", "全部");
			ableList.put("2", "管理员");
			ableList.put("1", "版主");
			ableList.put("0", "普通用户");
			session.put("backListAble", ableList);
			return "showListJSP";
		} else {
			String able = getShowAble();

			if (able == null || able.equals("")) {
				able = (String) session.get("userAble");
			} else
				session.put("userAble", able);

			String sql = "";
			Object[] params = null;
			if (able.equals("all")) {
				sql = "select * from tb_user order by user_able DESC";
			} else {
				sql = "select * from tb_user where user_able=?";
				params = new Object[1];
				params[0] = able;
			}

			OpDB myOp = new OpDB();
			List userlist = myOp.OpUserListShow(sql, params);
			session.put("backUserList", userlist);
		}
		return "success";
	}

	/** 后台-修改用户 */
	public String modifyUser() {
		session.put("backMainPage", "../user/userModify.jsp");

		Map<String, String> backUserAble = new HashMap<String, String>();
		backUserAble.put("2", "管理员");
		backUserAble.put("1", "版主");
		backUserAble.put("0", "普通用户");
		session.put("backUserAble", backUserAble);

		String forwardPath = "";
		String userId = request.getParameter("userId");
		if (userId == null)
			userId = "";

		String validate = request.getParameter("validate");
		if (validate == null || validate.equals("") || !validate.equals("yes")) {
			forwardPath = "showModifyJSP";
			String sql = "select * from tb_user where id=?";
			Object[] params = { userId };

			OpDB myOp = new OpDB();
			UserForm select = myOp.OpUserSingleShow(sql, params);
			session.put("select", select);
		} else {

			String userName = Change.HTMLChange(getUserName());
			String userPassword = Change.HTMLChange(getUserPassword());
			String userFace = getUserFace();
			String userSex = getUserSex();
			String userEmail = getUserEmail();
			String userFrom = Change.HTMLChange(getUserFrom());
			String userAble = getUserAble();
			String userPs = getUserPs();

			String sql = "update tb_user set user_name=?,user_password=?,user_face=?,user_sex=?,user_email=?,user_from=?,user_able=?,user_ps=? where id=?";
			Object[] params = { userName, userPassword, userFace, userSex,
					userEmail, userFrom, userAble, userPs, userId };

			OpDB myOp = new OpDB();
			int i = myOp.OpUpdate(sql, params);

			if (i <= 0) {
				System.out.println("更新用户失败！");
				String error = "更新用户失败！！！";
				session.put("error", error);
				forwardPath = "error";
			} else {
				System.out.println("更新用户成功！");
				forwardPath = "success";
			}
		}
		return forwardPath;
	}

	/** 后台-删除用户 */
	public String deleteUser() {
		String userId = request.getParameter("userId");
		if (userId == null || userId.equals(""))
			userId = "-1";
		String sql = "delete from tb_user where id=?";
		Object[] params = { userId };

		OpDB myOp = new OpDB();
		int i = myOp.OpUpdate(sql, params);

		String forwardPath = "";

		if (i <= 0) {
			System.out.println("删除用户失败！");
			String error = "删除用户失败！！！";
			session.put("error", error);
			forwardPath = "error";
		} else {
			System.out.println("删除用户成功！");
			forwardPath = "success";
		}
		return forwardPath;
	}

	public void setSession(Map<String, Object> session) {
		// TODO Auto-generated method stub
		this.session = session;
	}

	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request = request;
	}
	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserFace() {
		return userFace;
	}

	public void setUserFace(String userFace) {
		this.userFace = userFace;
	}

	public String getUserSex() {
		return userSex;
	}

	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserFrom() {
		return userFrom;
	}

	public void setUserFrom(String userFrom) {
		this.userFrom = userFrom;
	}

	public String getUserAble() {
		return userAble;
	}

	public void setUserAble(String userAble) {
		this.userAble = userAble;
	}

	public String getUserPs() {
		return userPs;
	}

	public void setUserPs(String userPs) {
		this.userPs = userPs;
	}
	public String getShowAble() {
		return showAble;
	}

	public void setShowAble(String showAble) {
		this.showAble = showAble;
	}

	public String getBoardClassID() {
		return boardClassID;
	}

	public void setBoardClassID(String boardClassID) {
		this.boardClassID = boardClassID;
	}

	public String getBoardId() {
		return boardId;
	}

	public void setBoardId(String boardId) {
		this.boardId = boardId;
	}

	public String getBoardName() {
		return boardName;
	}

	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}

	public String getBoardMaster() {
		return boardMaster;
	}

	public void setBoardMaster(String boardMaster) {
		this.boardMaster = boardMaster;
	}

	public String getBoardPcard() {
		return boardPcard;
	}

	public void setBoardPcard(String boardPcard) {
		this.boardPcard = boardPcard;
	}

	public String getClassId() {
		return classId;
	}

	public void setClassId(String classId) {
		this.classId = classId;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getClassIntro() {
		return classIntro;
	}

	public void setClassIntro(String classIntro) {
		this.classIntro = classIntro;
	}
}
