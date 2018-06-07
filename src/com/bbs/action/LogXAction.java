package com.bbs.action;

import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;
import com.bbs.actionform.UserForm;
import com.bbs.dao.OpDB;
import com.bbs.tools.Change;

public class LogXAction implements SessionAware {

	private String userPs;
	private String userName;
	private String userFace;
	private String userSex;
	private String userEmail;
	private String userFrom;
	private String userPassword;
	private String againPassword;
	private Map<String, Object> session;

	 /** 后台登录判断 */
	public String isAdminLogin() {
		Object obj = session.get("logoner");
		if (obj != null && (obj instanceof UserForm)) {
			UserForm logoner = (UserForm) obj;
			String able = logoner.getUserAble();

			if (!able.equals("2")) {
				String error = "您不是管理员，没有权限！！！";
				session.put("error", error);
				return "error";
			} else {
				return "success";
			}
		} else {
			String error = "用户还没登录，请登录！！！";
			session.put("error", error);
			return "error";
		}
	}

	/** 登录 */
	public String login() {
		String userName = Change.HTMLChange(getUserName());
		String userPassword = Change.HTMLChange(getUserPassword());

		String sql = "select * from tb_user where user_name=? and user_password=?";
		Object[] params = { userName, userPassword };

		OpDB myOp = new OpDB();
		UserForm logoner = myOp.OpUserSingleShow(sql, params);
		if (logoner != null) {
			session.put("logoner", logoner);
			return "success";
		} else {
			String error = "账号或密码出错，请重新登录！！！";
			session.put("error", error);
			return "error";
		}
	}

	/** 注销 */
	public String logout() {
		Object loginer = session.get("logoner");
		if (loginer != null && (loginer instanceof UserForm)) {
			loginer = null;
			session.put("logoner", loginer);
		}
		return "success";
	}

	/** 用户注册 */
	public String userReg() {
		String pass1 = getUserPassword().trim();
		String pass2 = getAgainPassword();
		String userSex = getUserSex();

		if (userSex != null) {
			if (!pass1.equals(pass2)) {
				System.out.println("两次输入的密码不一致！");
				String error = "两次输入的密码不一致！！！";
				session.put("error", error);
				return "error";
			} else {
				String userName = Change.HTMLChange(getUserName());
				Object[] params = null;
				String sql = "";

				sql = "select * from tb_user where user_name=?";
				params = new Object[1];
				params[0] = userName;

				OpDB myOp = new OpDB();
				UserForm user = myOp.OpUserSingleShow(sql, params);

				if (user != null) {
					System.out.println(userName + " 用户已经存在！");
					String error = userName + " 用户已经存在！";
					session.put("error", error);
					return "error";
				} else {
					String userPassword = Change.HTMLChange(getUserPassword());
					String userFace = getUserFace();
					String userEmail = getUserEmail();
					String userFrom = Change.HTMLChange(getUserFrom());
					String userAble = "0";

					sql = "insert into tb_user values(null,?,?,?,?,?,?,?,?)";
					params = new Object[8];
					params[0] = userName;
					params[1] = userPassword;
					params[2] = userFace;
					params[3] = userSex;
					params[4] = userEmail;
					params[5] = userFrom;
					params[6] = userAble;
					params[7] = userPs;

					int i = myOp.OpUpdate(sql, params);
					if (i <= 0) {
						System.out.println("用户注册失败！");
						String error = "用户注册失败！！！";
						session.put("error", error);
						return "error";
					} else {
						System.out.println("用户注册成功！");
						return "success";
					}
				}
			}
		} else {
			String error = "用户注册不能为空，请重新注册！！！";
			session.put("error", error);
			return "error";
		}
	}
	public String getAgainPassword() {
		return againPassword;
	}

	public void setAgainPassword(String againPassword) {
		this.againPassword = againPassword;
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

	public String getUserPs() {
		return userPs;
	}

	public void setUserPs(String userPs) {
		this.userPs = userPs;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public void setSession(Map<String, Object> session) {
		// TODO Auto-generated method stub
		this.session = session;
	}
}
