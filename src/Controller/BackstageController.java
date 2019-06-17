package Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/manager")
public class BackstageController {
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
	 * 参赛人员列表页面
	 */
	@RequestMapping("/participant_list")
	public ModelAndView participant_list() {
		ModelAndView mv = new ModelAndView("/participant_list");
		return mv;
	}
	
}
