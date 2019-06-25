package Dao;

import java.util.List;

import Model.Competition;
import Model.Con_pk;
import Model.Contestants;
import Model.Vote;

public interface CompetitionDao {
	int addCompetition(Competition competition);
	List<Competition> getID();
	List<Contestants> getPlayerID();
	int addConpk(Con_pk pk);
	List<Con_pk> getPk();
	List<Con_pk> findpk();
	List<Con_pk> getonePk(Integer id);
	int updateStatus(Competition competition);
	List<Contestants> findHead(Integer con_id);
	String findHead2(Integer i);
	int addVote(Vote vote);
	int getScore(Vote vote);
	int findip(Vote vote);
}
