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
	 * pk选手录入页面
	 */
	@RequestMapping("/pk_entry")
	public ModelAndView findPlayer() {
		ModelAndView mv=new ModelAndView("/pk_entry");
		return mv;
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
