package Controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;

import Model.Competition;
import Model.Con_pk;
import Model.Contestants;


import Model.ResultMsg;
import Service.CompetitionService;
import Service.PlayerService;
import Model.PageResult;

@Controller
@RequestMapping("/manager")
public class BackstageController {
	@Autowired
	private PlayerService playerService;
	
	@Autowired
	private CompetitionService competitionService;
	/*
	 * ��̨��ҳ��
	 */
	@RequestMapping("/index")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView("/index");
		return mv;
	}
	
	/*
	 * ��̨��ӭҳ��
	 */
	@RequestMapping("/welcome")
	public ModelAndView welcome() {
		ModelAndView mv = new ModelAndView("/welcome");
		return mv;
	}
	/*
	 * ������Ա¼��ҳ��
	 */
	@RequestMapping("/participants_entry")
	public ModelAndView participants_entry() {
		ModelAndView mv = new ModelAndView("/participants_entry");
		return mv;
	} 
	
	/*
	 * ������Ա�༭ҳ��
	 */
	@RequestMapping("/participant_update")
	public ModelAndView findPlayer(Integer id) {
		Contestants c = playerService.findPlayer(id);
		ModelAndView mv=new ModelAndView("/participant_update");
		mv.addObject("c", c);
		return mv;
	}
	/*
	 * ������Ϣ¼��ҳ��
	 */
	@RequestMapping("/competition_entry")
	public ModelAndView competition_entry() {
		ModelAndView mv=new ModelAndView("/competition_entry");
		return mv;
	}
	@RequestMapping("/competition_entry_submit")
	@ResponseBody
	public ResultMsg competition_entry_submit(HttpServletRequest request,Competition com){
		Competition competition = new Competition();
		competition.setCompetition_name(com.getCompetition_name());
		competition.setCompetition_status(com.getCompetition_status());
		competition.setVote_type(com.getVote_type());
		competition.setVote_start(com.getVote_start());
		competition.setVote_end(com.getVote_end());
		int i = competitionService.addCompetition(competition);
		if(i>0) {
			return new ResultMsg(1, "������Ϣ¼��ɹ�");
		}else {
			return new ResultMsg(2, "������Ϣ¼��ʧ��");
		}
		
	}
	
	/*
	 * pkѡ��¼��ҳ��
	 */
	@RequestMapping("/pk_entry")
	public ModelAndView findPlayer() {
		List<Competition> comid = competitionService.getID();//��ѯ��������id
		List<Contestants> conid = competitionService.getPlayerID();//��ѯ����ѡ�ֱ��
		ModelAndView mv=new ModelAndView("/pk_entry");
		mv.addObject("comid", comid);
		mv.addObject("conid",conid);
		return mv;
	}
	@RequestMapping("/pk_information_submit")
	@ResponseBody
	public ResultMsg addconpk_submit(HttpServletRequest request,Con_pk con_pk) {
		Con_pk pk = new Con_pk();
		pk.setCompetition_id(con_pk.getCompetition_id());
		pk.setCon1_id(con_pk.getCon1_id());
		pk.setCon1_music(con_pk.getCon1_music());
		pk.setCon1_name(con_pk.getCon1_name());
		pk.setCon1_score(con_pk.getCon1_score());
		pk.setCon2_id(con_pk.getCon2_id());
		pk.setCon2_music(con_pk.getCon2_music());
		pk.setCon2_name(con_pk.getCon2_name());
		pk.setCon2_score(con_pk.getCon2_score());
		
		int i = competitionService.addConpk(pk);
		if(i>0) {
			return new ResultMsg(1,"pk��Ϣ¼��ɹ�");
		}else {
			return new ResultMsg(0,"pk��Ϣ¼��ʧ��");
		}
	}
	/*
	 * pk��Ϣ�б�ҳ��
	 */
	@RequestMapping("/pk_information")
	public ModelAndView pk_information_submit(){
		PageInfo<Con_pk> pklist = competitionService.getPk();
		ModelAndView mv=new ModelAndView("/pk_information");
		mv.addObject("pklist",pklist);
		return mv;
	}
	@RequestMapping("/pk_information2")
	@ResponseBody
	public PageResult pk_information_submit2(Integer pageSize){
		PageInfo<Con_pk> pklist = competitionService.getPk(pageSize);
		PageResult pageResult = new PageResult();
		pageResult.setCpk(pklist.getList());
		return pageResult;
	}
	
	/*
	 * ������Ա�б�ҳ��
	 */
	@RequestMapping("/participant_list")
	public ModelAndView participant_list() {
		PageInfo<Contestants> contestants = playerService.getPlayer();
		ModelAndView mv = new ModelAndView("/participant_list");
		mv.addObject("contestants",contestants);
		return mv;
	}
	@RequestMapping("/participant_list2")
	@ResponseBody
	public PageResult participant_list2(Integer pageSize) {
		PageInfo<Contestants> contestants = playerService.getPlayer(pageSize);
		PageResult pageResult = new PageResult();
		pageResult.setCon(contestants.getList());
		return pageResult;
	}
	
	
	/*
	 * ������Ա¼������
	 */
	@RequestMapping("/addPlayer_submit")
	@ResponseBody
	public ResultMsg addPlayer_submit(HttpServletRequest request,Contestants c){
		Contestants contestants = new Contestants();
		contestants.setCon_id(c.getCon_id());
		contestants.setName(c.getName());
		contestants.setSex(c.getSex());
		contestants.setPicture(c.getPicture());
		contestants.setIntroduce(c.getIntroduce()); 
		
		int i = playerService.addPlayer(contestants);
		if(i>0) {
			return new ResultMsg(1,"����ѡ����ӳɹ�");
		}else{
			return new ResultMsg(2,"����ѡ�����ʧ��");
		}
		
	}
	
	/*
	 * ������Աɾ������
	 */
	@RequestMapping("/del_submit")
	@ResponseBody
	public ResultMsg delPlayer(Integer id) {
		//ɾ����Ա
		int i=playerService.delPlayer(id);
		if(i>0){
			return new ResultMsg(1,"ɾ�������߳ɹ�");
		}else{
			return new ResultMsg(0,"ɾ��������ʧ��");
		}
	}
	
	/*
	 * �޸�״̬����
	 */
	@RequestMapping("/updateStatus")
	@ResponseBody
	public ResultMsg updateStatus(Competition competition) {
		
		int i= competitionService.updateStatus(competition);

		if(i>0){
			return new ResultMsg(1,"�޸ĳɹ�");
		}else{
			return new ResultMsg(0,"�޸�ʧ��");
		}
	}
	
	
	
		/*
		 * �ϴ�ͼƬ
		 */
		@RequestMapping("/upload_submit")
		@ResponseBody
		public String upload_submit(MultipartFile file,HttpServletRequest request) throws IOException {
			//�ϴ��ļ���������
			//��ȡ�ļ����浽�������ϵ������ַ����Ŀ�����ַ/upload/�ļ�����
			
			 String realPath=request.getServletContext().getRealPath("/");//��Ŀ�����ַ
			 String filename = file.getOriginalFilename();//��ȡ�ļ���
			 String path = realPath+"/upload/"+ filename;
			//ͨ������·��������һ��Fileʵ��
			File f = new File(path);
			//���ϴ����ļ����䵽File��
			file.transferTo(f);
			
			
			//��ת�ɹ�ҳ��
			System.out.println(filename);
			
			return filename;
		}
	
}
