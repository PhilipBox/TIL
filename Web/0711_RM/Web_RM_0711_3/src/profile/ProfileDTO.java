package profile;

public class ProfileDTO {


	private String userCode;
	private String userCompany;
	private String userName;
	private String userPhone;
	private String userEmail; //이메일
	private String business; //사업자 등록증
	private String account; //통장 사본
	private String contrast;//계약일
	private String calcul; //정산주기
	
	ProfileDTO(){
		userCode = "";
	}
	ProfileDTO(String userCode, String userCompany, String userName, String userPhone){
		this.userCode = userCode;
		this.userCompany = userCompany;
		this.userName = userName;
		this.userPhone = userPhone;
		
	}
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	public String getUserCompany() {
		return userCompany;
	}
	public void setUserCompany(String userCompany) {
		this.userCompany = userCompany;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getBusiness() {
		return business;
	}
	public void setBusiness(String business) {
		this.business = business;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getContrast() {
		return contrast;
	}
	public void setContrast(String contrast) {
		this.contrast = contrast;
	}
	public String getCalcul() {
		return calcul;
	}
	public void setCalcul(String calcul) {
		this.calcul = calcul;
	}
	public String getIssue() {
		return issue;
	}
	public void setIssue(String issue) {
		this.issue = issue;
	}
	public String getDeposit() {
		return deposit;
	}
	public void setDeposit(String deposit) {
		this.deposit = deposit;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	String issue; //계산서 발행
	String deposit; //입금일
	String note; //비고
	
}
