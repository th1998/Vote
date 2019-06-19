package Controller;

import java.io.File;
import java.io.IOException;



import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;

import Model.Contestants;


import Model.ResultMsg;
import Service.PlayerService;
import Model.PageResult;

@Controller
@RequestMapping("/manager")
public class BackstageController {
	@Autowired
	private PlayerService playerService;
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
	 * pkѡ��¼��ҳ��
	 */
	@RequestMapping("/pk_entry")
	public ModelAndView findPlayer() {
		ModelAndView mv=new ModelAndView("/pk_entry");
		return mv;
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
