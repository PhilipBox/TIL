package user;

public class UserDTO {

	String userID;
	String userPassword;
	String userName;
	String userType;
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public UserDTO() {
	}
	public UserDTO(String userID,String userPassword,String userName,String userType) {
		this.userID = userID;
		this.userPassword = userPassword;
		this.userName = userName;
		this.userType = userType;	
	}
}
