package Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Dao.LoginDao;
import Model.Manager;


@Service
public class LoginService {
	@Autowired
	private LoginDao loginDao;
	
	public boolean execute(String username,String password){
		Manager manager = new Manager();
		manager.setUsername(username);
		manager.setPassword(password);
		Manager m = loginDao.getManager(manager);
		if(m!=null) {
			return true;
		}else {
			return false;
		}
	}
}
