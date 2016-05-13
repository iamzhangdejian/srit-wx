package weixin.sshare.controller;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.web.system.service.SystemService;
import org.jeecgframework.web.system.service.UserService;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import weixin.guanjia.account.service.WeixinAccountServiceI;
import weixin.swork.entity.AttachBase;
import weixin.swork.entity.QuestFormInfo;
import weixin.swork.entity.User;
import weixin.swork.service.CallServiceKey;
import weixin.swork.service.RequestCode;
import weixin.swork.service.impl.SworkCommonServiceImpl;
import weixin.swork.util.JsonHelper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

/**
 * 社区论坛
 *2016-05-09
 * @author heqing.qi
 */
@Scope("prototype")
@Controller
@RequestMapping("/SworkShareController")
public class SworkShareController extends BaseController {

	private User user;
    /**
     * 社区论坛列表
     *
     * @throws JSONException
     */
    @RequestMapping(params = "publicForum")
    public String publicForum( ModelMap modelMap, HttpServletRequest request) throws JSONException {
    	 
        return "weixin/swork/forum";
    }
    /**
     * 社区论坛发帖
     *
     * @throws JSONException
     */
    @RequestMapping(params = "publicPost")
    public String publicPost( ModelMap modelMap, HttpServletRequest request) throws JSONException {
    	 
        return "weixin/swork/post";
    }
    /**
     * 回复帖子
     *
     * @throws JSONException
     */
    @RequestMapping(params = "publicReplypost")
    public String publicReplypost( ModelMap modelMap, HttpServletRequest request) throws JSONException {
    	 
        return "weixin/swork/replypost";
    }
    
  
   

    
}
