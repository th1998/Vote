package Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

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
	
	//联合查询 pk信息
	public List<Con_pk> getPk2(){
		return competitionDao.getPk();
	}
	
	public List<Con_pk> getonePk(Integer id){
		return competitionDao.getonePk(id);
	}
	
	//联合查询 pk信息
	public PageInfo<Con_pk> getPk(){
		PageHelper.startPage(1, 8);
		List<Con_pk> l = competitionDao.getPk();
		PageInfo<Con_pk> page = new PageInfo<>(l);
		return page;
	}
	
	public PageInfo<Con_pk> getPk(Integer pageSize){
		PageHelper.startPage(pageSize, 8);
		List<Con_pk> l = competitionDao.getPk();
		PageInfo<Con_pk> page = new PageInfo<>(l);
		return page;
	}
	
	public int updateStatus(Competition competition){
		return competitionDao.updateStatus(competition);
	}
	
	public List<Contestants> findHead(Integer con_id){
		return competitionDao.findHead(con_id);
	}
}
