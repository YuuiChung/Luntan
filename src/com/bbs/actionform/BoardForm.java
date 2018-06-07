package com.bbs.actionform;

public class BoardForm {
	private String boardId;
	private String boardClassID;
	private String boardName;
	private String boardMaster = "tsoft";
	private String boardPcard;
	private String boardBbsnum;
	private String boardBbsundonum;
	private String boardBbsgoodnum;

	public String getBoardBbsgoodnum() {
		return boardBbsgoodnum;
	}

	public void setBoardBbsgoodnum(String boardBbsgoodnum) {
		this.boardBbsgoodnum = boardBbsgoodnum;
	}

	public String getBoardBbsnum() {
		return boardBbsnum;
	}

	public void setBoardBbsnum(String boardBbsnum) {
		this.boardBbsnum = boardBbsnum;
	}

	public String getBoardBbsundonum() {
		return boardBbsundonum;
	}

	public void setBoardBbsundonum(String boardBbsundonum) {
		this.boardBbsundonum = boardBbsundonum;
	}

	public String getBoardClassID() {
		return boardClassID;
	}

	public void setBoardClassID(String boardClassID) {
		this.boardClassID = boardClassID;
	}

	public String getBoardMaster() {
		return boardMaster;
	}

	public void setBoardMaster(String boardMaster) {
		this.boardMaster = boardMaster;
	}

	public String getBoardName() {
		return boardName;
	}

	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}

	public String getBoardId() {
		return boardId;
	}

	public void setBoardId(String boardId) {
		this.boardId = boardId;
	}

	public String getBoardPcard() {
		return boardPcard;
	}

	public void setBoardPcard(String boardPcard) {
		this.boardPcard = boardPcard;
	}

	public void clear() {
		boardId = "";
		boardName = "";
		boardMaster = "tsoft";
		boardPcard = "";
		boardBbsnum = "";
		boardBbsundonum = "";
		boardBbsgoodnum = "";
	}
}
