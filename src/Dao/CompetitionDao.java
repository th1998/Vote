package Dao;

import java.util.List;

import Model.Competition;
import Model.Contestants;

public interface CompetitionDao {
	int addCompetition(Competition competition);
	List<Competition> getID();
	List<Contestants> getPlayerID();
	Contestants findPlayer(Integer id);
}
