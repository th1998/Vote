package Dao;

import java.util.List;

import Model.Contestants;

public interface PlayerDao {
	int addPlayer(Contestants contestants);//添加参赛者
	List<Contestants> getPlayer();//查询参赛者
	int delPlayer(Integer id);//删除参赛者
}
