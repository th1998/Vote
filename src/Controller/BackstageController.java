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
	 * 后台主页面
	 */
	@RequestMapping("/index")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView("/index");
		return mv;
	}
	
	/*
	 * 后台欢迎页面
	 */
	@RequestMapping("/welcome")
	public ModelAndView welcome() {
		ModelAndView mv = new ModelAndView("/welcome");
		return mv;
	}
	/*
	 * 参赛人员录入页面
	 */
	@RequestMapping("/participants_entry")
	public ModelAndView participants_entry() {
		ModelAndView mv = new ModelAndView("/participants_entry");
		return mv;
	} 
	
	/*
	 * 参赛人员编辑页面
	 */
	@RequestMapping("/participant_update")
	public ModelAndView findPlayer(Integer id) {
		Contestants c = playerService.findPlayer(id);
		ModelAndView mv=new ModelAndView("/participant_update");
		mv.addObject("c", c);
		return mv;
	}
	/*
	 * 比赛信息录入页面
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
			return new ResultMsg(1, "比赛信息录入成功");
		}else {
			return new ResultMsg(2, "比赛信息录入失败");
		}
		
	}
	
	/*
	 * pk选手录入页面
	 */
	@RequestMapping("/pk_entry")
	public ModelAndView findPlayer() {
		List<Competition> comid = competitionService.getID();//查询比赛主题id
		List<Contestants> conid = competitionService.getPlayerID();//查询参赛选手编号
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
			return new ResultMsg(1,"pk信息录入成功");
		}else {
			return new ResultMsg(0,"pk信息录入失败");
		}
	}
	/*
	 * pk信息列表页面
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
	 * 参赛人员列表页面
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
	 * 参赛人员录入请求
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
			return new ResultMsg(1,"参赛选手添加成功");
		}else{
			return new ResultMsg(2,"参赛选手添加失败");
		}
		
	}
	
	/*
	 * 参赛人员删除请求
	 */
	@RequestMapping("/del_submit")
	@ResponseBody
	public ResultMsg delPlayer(Integer id) {
		//删除雇员
		int i=playerService.delPlayer(id);
		if(i>0){
			return new ResultMsg(1,"删除参赛者成功");
		}else{
			return new ResultMsg(0,"删除参赛者失败");
		}
	}
	
	/*
	 * 修改状态请求
	 */
	@RequestMapping("/updateStatus")
	@ResponseBody
	public ResultMsg updateStatus(Competition competition) {
		
		int i= competitionService.updateStatus(competition);

		if(i>0){
			return new ResultMsg(1,"修改成功");
		}else{
			return new ResultMsg(0,"修改失败");
		}
	}
	
	
	
		/*
		 * 上传图片
		 */
		@RequestMapping("/upload_submit")
		@ResponseBody
		public String upload_submit(MultipartFile file,HttpServletRequest request) throws IOException {
			//上传文件到服务器
			//获取文件保存到服务器上的物理地址（项目物理地址/upload/文件名）
			
			 String realPath=request.getServletContext().getRealPath("/");//项目物理地址
			 String filename = file.getOriginalFilename();//获取文件名
			 String path = realPath+"/upload/"+ filename;
			//通过给定路径来创建一个File实例
			File f = new File(path);
			//将上传的文件传输到File中
			file.transferTo(f);
			
			
			//跳转成功页面
			System.out.println(filename);
			
			return filename;
		}
	
}
