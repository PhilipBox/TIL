package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

// 빈즈(userDTO)를 활용해서, 실제 DB와 JSP가 소통하기 위해서 만들어진 클래스 : userDAO class
public class userDAO {
	
	private Connection conn;
	
	public userDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3305/REGISTER";
			String dbID = "root";
			String dbPassword = "login";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	public int registerCheck(String userID) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "SELECT * FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return 0; //이미 존재하는 회원
			}
			else {
				return 1; // 가입 가능한 회원 아이디
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return -1; // 데이터베이스 오류
	}
	
	
	// 실제로 회원 등록을 하는 함수
	public int register(userDTO user) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setInt(4, user.getUserAge());
			pstmt.setString(5, user.getUserType());
			pstmt.setString(6, user.getUserEmail());
			return pstmt.executeUpdate(); 
			//업데이트를 실행함으로서 실제로 데이터베이스에 어떠한 데이터값을 들어가게 하거나, 삭제하거나 이런식으로 저리할 수 있음.
			//위 SQL에서 INSERT같은 경우에는 반드시 executeUpdate()를 사용해야 함.
			// 이렇게 실행을 하고, 실행된 결과는 실제로 DB에 어떤 정보가 추가가 되었다면, 그 추가된 만큼의 개수가 반환이 된다.
			// 만약 String SQL ~ 이부분이 성공적으로 수행이 됐다면, return 1이 반환이 될 것이다. 왜냐면, 한 명의 회원정보가 추가가 될 것이기 때문.
		
			// 회원등록에 실패하여, 실제로 등록된 회원이 없다면 0 이하의 수가 출력이 될 것.
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return -1; // 데이터베이스 오류
	}
	
	
	
}
