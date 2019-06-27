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
import Model.Vote;
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
	public String findHead2(Integer i) {
		return competitionDao.findHead2(i);
	}
	
	public List<Con_pk> findpk() {
		return competitionDao.findpk();
	}
	public int addVote(Vote vote) {
		return competitionDao.addVote(vote);
	}
	
	public int getScore(Vote vote){
		return competitionDao.getScore(vote);
	}
	
	public int findip(Vote vote){
		return competitionDao.findip(vote);
	}
	
	public int xgzt(Integer id) {
		return competitionDao.xgzt(id);
	}
	
	public int updateCon1_score(Con_pk pk) {
		return competitionDao.updateCon1_score(pk);
	}
	public int updateCon2_score(Con_pk pk) {
		return competitionDao.updateCon2_score(pk);
	}
	
	public int getNum1() {
		return competitionDao.getNum1();
	}
	public int getNum2() {
		return competitionDao.getNum2();
	}
	public int getNum3() {
		return competitionDao.getNum3();
	}
}
