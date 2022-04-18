package step2_00_loginEx;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDao {
	private MemberDao() {}
	private static MemberDao instance = new MemberDao();
	public static MemberDao getInstance() {
		return instance;
	}
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String url = "jdbc:mysql://localhost:3306/login_ex?serverTimezone=UTC";
			String user    = "root";
			String password  = "1234";
			
			conn = DriverManager.getConnection(url, user, password);
			
			return conn;
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	public boolean insertMember(MemberDto memberDto) {
		
		boolean isFirstMember = false;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM MEMBER WHERE ID = ?");
			pstmt.setString(1, memberDto.getId());
			rs = pstmt.executeQuery();
			
			if (!rs.next()) {
				pstmt = conn.prepareStatement("INSERT INTO MEMBER VALUES(?,?,?,NOW()");
				pstmt.setString(1, memberDto.getId());
				pstmt.setString(2, memberDto.getPasswd());
				pstmt.setString(3, memberDto.getName());
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			try {conn.close();} catch (SQLException e) {e.printStackTrace();}
		}
		
		return isFirstMember;
	}
}
