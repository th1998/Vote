package Dao;

import java.util.List;

import Model.Contestants;

public interface PlayerDao {
	int addPlayer(Contestants contestants);//��Ӳ�����
	List<Contestants> getPlayer();//��ѯ������
	int delPlayer(Integer id);//ɾ��������
}
