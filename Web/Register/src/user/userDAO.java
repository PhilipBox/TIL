package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

// ����(userDTO)�� Ȱ���ؼ�, ���� DB�� JSP�� �����ϱ� ���ؼ� ������� Ŭ���� : userDAO class
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
				return 0; //�̹� �����ϴ� ȸ��
			}
			else {
				return 1; // ���� ������ ȸ�� ���̵�
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
		return -1; // �����ͺ��̽� ����
	}
	
	
	// ������ ȸ�� ����� �ϴ� �Լ�
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
			//������Ʈ�� ���������μ� ������ �����ͺ��̽��� ��� �����Ͱ��� ���� �ϰų�, �����ϰų� �̷������� ������ �� ����.
			//�� SQL���� INSERT���� ��쿡�� �ݵ�� executeUpdate()�� ����ؾ� ��.
			// �̷��� ������ �ϰ�, ����� ����� ������ DB�� � ������ �߰��� �Ǿ��ٸ�, �� �߰��� ��ŭ�� ������ ��ȯ�� �ȴ�.
			// ���� String SQL ~ �̺κ��� ���������� ������ �ƴٸ�, return 1�� ��ȯ�� �� ���̴�. �ֳĸ�, �� ���� ȸ�������� �߰��� �� ���̱� ����.
		
			// ȸ����Ͽ� �����Ͽ�, ������ ��ϵ� ȸ���� ���ٸ� 0 ������ ���� ����� �� ��.
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
		return -1; // �����ͺ��̽� ����
	}
	
	
	
}
