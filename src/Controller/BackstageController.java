package Controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import Model.Vote;
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
	 * 选手海报录入页面
	 */
	@RequestMapping("/bill_entry")
	public ModelAndView bill_entry() {
		List<Contestants> conid = competitionService.getPlayerID();//查询参赛选手编号
		ModelAndView mv = new ModelAndView("/bill_entry");
		mv.addObject("conid",conid);
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
		System.out.println("aaa");
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
	 * 修改参赛者信息
	 */
	@RequestMapping("/updatePlayer_submit")
	@ResponseBody
	public ResultMsg update_submit(Contestants c){
		Contestants contestants = new Contestants();
		
		contestants.setCon_id(c.getCon_id());
		contestants.setName(c.getName());
		contestants.setSex(c.getSex());
		contestants.setIntroduce(c.getIntroduce());
		int i = playerService.updatePlayer(contestants);
		if(i>0){
			return new ResultMsg(1,"修改参赛信息成功");
		}else{
			return new ResultMsg(0,"修改参赛信息失败");
		}
	}
	
		/*
		 * 上传图片
		 */
		@RequestMapping("/upload_submit")
		@ResponseBody
		public ModelAndView upload_submit(MultipartFile file,HttpServletRequest request) throws IOException {
			 String id = request.getParameter("con_id");
			 Integer con_id = Integer.parseInt(id);
			 String realPath=request.getServletContext().getRealPath("/");
			 System.out.println(realPath);
			 String filename = file.getOriginalFilename();
			 long currentDate = new Date().getTime();
			 String filename2 =filename.substring(0,filename.lastIndexOf("."))
					 +currentDate
					 +filename.substring(filename.lastIndexOf(".")); 
			 String newFileName =
					 filename.substring(0,filename.lastIndexOf("."))
					 +currentDate
					 +filename.substring(filename.lastIndexOf("."));
			 
			 String path = realPath+"/upload/"+ filename2;
			 File f = new File(path);
			 file.transferTo(f); 
			 
			 System.out.println(newFileName);
			 Contestants c = new Contestants();
			 c.setPicture(newFileName);
			 c.setCon_id(con_id);
			 int i = playerService.updateHead(c);
			 if(i>0) {
				 List<Contestants> conid = competitionService.getPlayerID();
				 ModelAndView mv =new ModelAndView("/bill_entry");
				 mv.addObject("conid",conid);
				 mv.addObject("mes","成功");
				 return mv;
			 }else {
				 List<Contestants> conid = competitionService.getPlayerID();
				 ModelAndView mv =new ModelAndView("/bill_entry");
				 mv.addObject("mes","失败");
				 mv.addObject("conid",conid);
				 return mv;
			 }
			
		}
		
		/*
		 * 投票结果页面
		 */
		@RequestMapping("/vote_result")
		public ModelAndView vote_result() {
			List<Con_pk> pk = competitionService.getPk2();
			ModelAndView mv =new ModelAndView("/vote_result");
			mv.addObject("pk",pk);
			return mv;
		}
		
		@RequestMapping("/vote_result2")
		@ResponseBody
		public List<Con_pk> result() {
			List<Con_pk> pk = competitionService.getPk2();
			return pk;
		}
		
		@RequestMapping("/onepk")
		@ResponseBody
		public List<Con_pk> getonePk(Integer id){
			List<Con_pk> onepk = competitionService.getonePk(id);
			return onepk;
		}
		
		@RequestMapping("/findhead")
		@ResponseBody
		public List<Contestants> findHead(Integer con_id){
			List<Contestants> headlist = competitionService.findHead(con_id);
			return headlist;
		}
		
		@RequestMapping("/findpk")
		@ResponseBody
		public List<Con_pk> findpk(Integer con_id){
			List<Con_pk> statuspk = competitionService.findpk();
			return statuspk;
		}
		
		
		
		
		
		/*
		 * 投票页面
		 * */
		@RequestMapping("/vote")
		@ResponseBody
		public ModelAndView vote(Integer con_id) {
			List<Con_pk> pk = competitionService.getPk2();
			List<Con_pk> statuspk = competitionService.findpk();
			ModelAndView mv =new ModelAndView("/vote");
			mv.addObject("pk",pk);
			mv.addObject("statuspk",statuspk);
			/*List<Integer> pk_num= new ArrayList<Integer>();
			System.out.println(pk.size());
			for(int j =0;j<pk.size();j++) {
				if(pk.get(j).getComp().getCompetition_status() == 1) {					
							pk_num.add(pk.get(j).getCon1_id());
							pk_num.add(pk.get(j).getCon2_id());
											
				}
			}
			List<String> pic= new ArrayList<String>();
			for(int i=0;i<pk_num.size();i++) {
				String headlist = competitionService.findHead2(pk_num.get(i));
				pic.add(headlist);
			}
			System.out.println(pic);
			mv.addObject("pic",pic);*/
			return mv;
		}
		
		
		@RequestMapping("/vote_submit")
		@ResponseBody
		public List<Con_pk> vote_submit() {
			List<Con_pk> pk_xx = competitionService.findpk();
			return pk_xx;
		}
		
		@RequestMapping("/zan_submit")
		@ResponseBody
		public ResultMsg zan_submit(String voter_ip,Integer voted_comid,Integer voted_contestantid) {
			Vote v = new Vote();
			v.setVoted_comid(voted_comid);
			v.setVoted_contestantid(voted_contestantid);
			v.setVoter_ip(voter_ip);
			int i =competitionService.addVote(v);
			if(i>0) {
				return new ResultMsg(1, "恭喜您，投票成功！");
			}
			return new ResultMsg(0, "投票失败");
		}
		
		/*
		 * 返回分数
		 */
		@RequestMapping("/getScore")
		@ResponseBody
		public int getScore(Vote vote){
			Vote v = new Vote();
			v.setVoted_comid(vote.getVoted_comid());
			v.setVoted_contestantid(vote.getVoted_contestantid());
			int score = competitionService.getScore(v);
			return score;
		}
		
		@RequestMapping("/findip")
		@ResponseBody
		public int findip(Vote vote){
			Vote v = new Vote();
			v.setVoted_comid(vote.getVoted_comid());
			v.setVoter_ip(vote.getVoter_ip());
			int ip = competitionService.findip(v);
			return ip;
		}
		
		@RequestMapping("/xgzt")
		@ResponseBody
		public int xgzt(Integer id) {
			int i = competitionService.xgzt(id);
			return i;
		}
		@RequestMapping("/updateCon1_score")
		@ResponseBody
		public int updateCon1_score(Con_pk pk) {
			Con_pk p = new Con_pk();
			p.setCon1_id(pk.getCon1_id());
			p.setId(pk.getId());
			p.setCon1_score(pk.getCon1_score());
			int i = competitionService.updateCon1_score(p);
			return i;
		}
		@RequestMapping("/updateCon2_score")
		@ResponseBody
		public int updateCon2_score(Con_pk pk) {
			Con_pk p = new Con_pk();
			p.setCon2_id(pk.getCon2_id());
			p.setId(pk.getId());
			p.setCon2_score(pk.getCon2_score());
			int i = competitionService.updateCon2_score(p);
			return i;
		}
		
		@RequestMapping("/getNum1")
		@ResponseBody
		public int getNum1() {
			int i = competitionService.getNum1();
			return i;
		}
		
		@RequestMapping("/getNum2")
		@ResponseBody
		public int getNum2() {
			int i = competitionService.getNum2();
			return i;
		}
		@RequestMapping("/getNum3")
		@ResponseBody
		public int getNum3() {
			int i = competitionService.getNum3();
			return i;
		}
		
}
