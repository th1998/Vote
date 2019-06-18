package Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Dao.PlayerDao;
import Model.Contestants;

@Service
public class PlayerService {
	@Autowired
	private PlayerDao playerDao;
	
	public int addPlayer(Contestants contestants) {
		return playerDao.addPlayer(contestants);
	}
}
