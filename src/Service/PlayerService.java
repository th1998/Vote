package Service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import Dao.PlayerDao;
import Model.Contestants;


@Service
public class PlayerService {
	@Autowired
	private PlayerDao playerDao;
	//��Ӳ�����
	public int addPlayer(Contestants contestants) {
		return playerDao.addPlayer(contestants);
	}
	//��ѯ������
	public PageInfo<Contestants> getPlayer(){
		PageHelper.startPage(1, 4);
		List<Contestants> a= playerDao.getPlayer();
		PageInfo<Contestants> page = new PageInfo<>(a);
		return page;
	}
	
	public PageInfo<Contestants> getPlayer(Integer pageSize){
		PageHelper.startPage(pageSize, 4);
		List<Contestants> a= playerDao.getPlayer();
		PageInfo<Contestants> page = new PageInfo<>(a);
		return page;
	}
	
	public int delPlayer(Integer id) {
		return playerDao.delPlayer(id);
	}
	
	public Contestants findPlayer(Integer id) {
		return playerDao.findPlayer(id);
	}
}
