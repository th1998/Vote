package Controller;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import Model.Manager;
import Service.LoginService;
import Model.ResultMsg;


@Controller
public class LoginController {
	
	@Autowired
	private LoginService loginService;
	/*
	 * ��¼ҳ��
	 */
	@RequestMapping("/login")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView("/login");
		return mv;
	}
	
	/*
	 * ��¼����
	 */
	@RequestMapping("/login_submit")
	@ResponseBody
	public ResultMsg login_submit(HttpServletRequest request,Manager m){
		boolean islogin = false;
		request.getSession().setAttribute("username", m.getUsername());
		islogin = loginService.execute(m.getUsername(), m.getPassword());
		if(islogin) {
			//ModelAndView mv = new ModelAndView("/index");
			return new ResultMsg(1,"�ɹ�");
		}else {
			//ModelAndView mv = new ModelAndView("/login");
			return new ResultMsg(0,"ʧ��");
		}	
	}
	
}
