package Dao;

import java.util.List;

import Model.Contestants;

public interface PlayerDao {
	int addPlayer(Contestants contestants);//��Ӳ�����
	List<Contestants> getPlayer();//��ѯ������
	int delPlayer(Integer id);//ɾ��������
	Contestants findPlayer(Integer id);//��ѯ�޸ĵĲ�����
	int updatePlayer(Contestants contestants);//�޸Ĳ�������Ϣ
	int updateHead(Contestants contestants);//�޸�ͷ��
}
