package step2_00_loginEx;

import java.util.Date;

public class MemberDto {
	private String id;
	private String passwd;
	private String name;
	private Date date;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "MemberDto [id=" + id + ", passwd=" + passwd + ", name=" + name + ", date=" + date + "]";
	}
	
}
