package Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Dao.CompetitionDao;
import Model.Competition;
import Model.Con_pk;
import Model.Contestants;
@Service
public class CompetitionService {
	@Autowired
	private CompetitionDao competitionDao;
	
	public int addCompetition(Competition competition) {
		return competitionDao.addCompetition(competition);
	}
	
	public List<Competition> getID(){
		return competitionDao.getID();
	}
	
	public List<Contestants> getPlayerID(){
		return competitionDao.getPlayerID();
	}
	
	public int addConpk(Con_pk pk) {
		return competitionDao.addConpk(pk);
	}
	
	public List<Con_pk> getPk(){
		return competitionDao.getPk();
	}
}
