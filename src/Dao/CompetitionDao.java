package Dao;

import java.util.List;

import Model.Competition;
import Model.Con_pk;
import Model.Contestants;

public interface CompetitionDao {
	int addCompetition(Competition competition);
	List<Competition> getID();
	List<Contestants> getPlayerID();
	int addConpk(Con_pk pk);
	List<Con_pk> getPk();
	int updateStatus(Competition competition);
}
