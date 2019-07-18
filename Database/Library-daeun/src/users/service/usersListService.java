package users.service;

public class usersListService {
	
	private usersListService() {
		
	}
	
	private static usersListService service = new usersListService();
	public static usersListService getInstance() {
		return service;
	}
	
	// users의 memberInfo -> List에 넣어서 리턴
	
}
