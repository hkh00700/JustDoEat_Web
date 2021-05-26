package board;

import java.sql.Date;

public class BoardVO {
	private int no, od, readcnt;
	private String s_photo;
	private String s_title, s_content, m_nickname, writer, s_photo_path;
	private Date updatetime;
	
	private String notice;
	
	
	
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	
	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}

	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getOd() {
		return od;
	}
	public void setOd(int od) {
		this.od = od;
	}
	public int getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}
	public String getS_photo() {
		return s_photo;
	}
	public void setS_photo(String s_photo) {
		this.s_photo = s_photo;
	}
	public String getS_title() {
		return s_title;
	}
	public void setS_title(String s_title) {
		this.s_title = s_title;
	}
	public String getS_content() {
		return s_content;
	}
	public void setS_content(String s_content) {
		this.s_content = s_content;
	}
	
	public String getM_nickname() {
		return m_nickname;
	}
	public void setM_nikname(String m_nickname) {
		this.m_nickname = m_nickname;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getS_photo_path() {
		return s_photo_path;
	}
	public void setS_photo_path(String s_photo_path) {
		this.s_photo_path = s_photo_path;
	}
	public Date getUpdatetime() {
		return updatetime;
	}
	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}
	
	
}
