package profile;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

//TODO: �Ķ���� userid, password ������ �ٲ㼭 db join
public class ProfileDAO {
	public ProfileDTO initial(String code) {
		String SQL="SELECT * FROM TESTPROFILE WHERE userCode = ?";
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		String userCode;
		String userCompany;
		String userName;
		String userPhone;
		ProfileDTO dto = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, code);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				
				userCode = rs.getString(1);
				userCompany= rs.getString(2);
				userName = rs.getString(3);
				userPhone = rs.getString(3);
				dto = new ProfileDTO(userCode, userCompany, userName,userPhone );
				
				/*
				if(rs.getString(1).equals(userPassword)) {
					return 1; //�α��� ����
				}
				else {
					return 0; //��й�ȣ Ʋ��
				}*/
			}
			return dto;
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try{if(conn !=null) conn.close();}catch(Exception e) {e.printStackTrace();}
			try{if(pstmt !=null) pstmt.close();}catch(Exception e) {e.printStackTrace();}
			try{if(rs !=null) rs.close();}catch(Exception e) {e.printStackTrace();}
		}
		return dto;
	}

}
