package Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/manager")
public class BackstageController {
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
	 * ������Ա�б�ҳ��
	 */
	@RequestMapping("/participant_list")
	public ModelAndView participant_list() {
		ModelAndView mv = new ModelAndView("/participant_list");
		return mv;
	}
	
}
