package Controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import Model.Contestants;
import Model.Manager;
import Model.ResultMsg;
import Service.PlayerService;

@Controller
@RequestMapping("/manager")
public class BackstageController {
	@Autowired
	private PlayerService playerService;
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
	 * 参赛人员列表页面
	 */
	@RequestMapping("/participant_list")
	public ModelAndView participant_list() {
		ModelAndView mv = new ModelAndView("/participant_list");
		return mv;
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
	
}
