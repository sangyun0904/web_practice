package boardEx;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardDao {
	
	private BoardDao() {}
	private static BoardDao instance = new BoardDao();
	public static BoardDao getInstance() {
		return instance;
	}
	
	private Connection conn 		= null;
	private PreparedStatement pstmt = null;
	private ResultSet rs			= null;
	
	public Connection getConnection() {
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String url = "jdbc:mysql://localhost:3306/step3_board_ex?serverTimezone=UTC";
			String user    = "root";
			String password  = "1234";
			
			conn = DriverManager.getConnection(url, user, password);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;
		
	}
	
	public void insertBoard(BoardDto boardDto) {
		
		try {
			conn = getConnection();
			
			String sql = "INSERT INTO BOARD(WRITER , EMAIL , SUBJECT , PASSWORD , REG_DATE , READ_COUNT , CONTENT)";
				   sql += "VALUES(? , ? , ? , ? , NOW() , 0 , ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardDto.getWriter());
			pstmt.setString(2, boardDto.getEmail());
			pstmt.setString(3, boardDto.getSubject());
			pstmt.setString(4, boardDto.getPassword());
			pstmt.setString(5, boardDto.getContent());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
			if (conn != null) {try {conn.close();}  catch (SQLException e) {}}
		}

	}
	
	public ArrayList<BoardDto> getBoardList() {
		ArrayList<BoardDto> boardList = new ArrayList<BoardDto>();
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("SELECT * FROM BOARD");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDto boardDto = new BoardDto();
				
				boardDto.setNum(rs.getInt("NUM"));
				boardDto.setWriter(rs.getString("WRITER"));
				boardDto.setEmail(rs.getString("EMAIL"));
				boardDto.setSubject(rs.getString("SUBJECT"));
				boardDto.setPassword(rs.getString("PASSWORD"));
				boardDto.setRegDate(rs.getDate("REG_DATE"));
				boardDto.setReadCount(rs.getInt("READ_COUNT"));
				boardDto.setContent("CONTENT");
				
				boardList.add(boardDto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return boardList;
	}
	
	public BoardDto getOneBoard(int num) {
		BoardDto boardDto = new BoardDto();
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("SELECT * FROM BOARD WHERE NUM = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			boardDto.setNum(rs.getInt("NUM"));
			boardDto.setWriter(rs.getString("WRITER"));
			boardDto.setEmail(rs.getString("EMAIL"));
			boardDto.setSubject(rs.getString("SUBJECT"));
			boardDto.setPassword(rs.getString("PASSWORD"));
			boardDto.setRegDate(rs.getDate("REG_DATE"));
			boardDto.setReadCount(rs.getInt("READ_COUNT"));
			boardDto.setContent(rs.getString("CONTENT"));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return boardDto;
	}
}



























