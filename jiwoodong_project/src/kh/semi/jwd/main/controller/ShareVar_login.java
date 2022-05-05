package kh.semi.jwd.main.controller;

public class ShareVar_login {

	
	
//	//이메일 발송이 성공하게 되면 해당 인증코드를 ShareVar_login에 저장해 세션대신 사용합니다.
    private static ShareVar_login authEamilCode;
    
	private ShareVar_login() {
	}
    public static ShareVar_login getInstance() {
    	
        return authEamilCode;
        
    }

	public static ShareVar_login getAuthEamilCode() {
		return authEamilCode;
	}
	public static void setAuthEamilCode(ShareVar_login authEamilCode) {
		ShareVar_login.authEamilCode = authEamilCode;
	}
	@Override
	public String toString() {
		return "ShareVar_login [getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return super.hashCode();
	}
	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		return super.equals(obj);
	}
	@Override
	protected Object clone() throws CloneNotSupportedException {
		// TODO Auto-generated method stub
		return super.clone();
	}
	@Override
	protected void finalize() throws Throwable {
		// TODO Auto-generated method stub
		super.finalize();
	}

	
	
}
