package upload_files;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class FileDao {
	private FileDao() {}
	private static FileDao instance = new FileDao();
	public static FileDao getInstance() {
		return instance;
	}
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public Connection getConnection() {
		
		String dbURL 	  = "jdbc:mysql://localhost:3306/file_ex?serverTimezone=UTC";
		String dbID 	  = "root";
		String dbPassword = "1234";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	public void uploadFiles(ArrayList<FileDto> fileList) {
		
		try {
			
			conn = getConnection();
			
			for (FileDto file : fileList) {
				pstmt = conn.prepareStatement("INSERT INTO FILE VALUES(?,?,?,?,?,?,NOW())");
				pstmt.setString(1, file.getUserName());
				pstmt.setString(2, file.getTitle());
				pstmt.setString(3, file.getOriginalFileName());
				pstmt.setString(4, file.getFilesystemName());
				pstmt.setString(5, file.getContentType());
				pstmt.setLong(6, file.getLength());
				
				pstmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
