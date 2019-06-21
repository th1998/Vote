package Dao;

import java.util.List;

import Model.Contestants;

public interface PlayerDao {
	int addPlayer(Contestants contestants);//添加参赛者
	List<Contestants> getPlayer();//查询参赛者
	int delPlayer(Integer id);//删除参赛者
	Contestants findPlayer(Integer id);//查询修改的参赛者
	int updatePlayer(Contestants contestants);//修改参赛者信息
	int updateHead(Contestants contestants);//修改头像
}
