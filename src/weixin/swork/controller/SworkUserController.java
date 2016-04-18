package weixin.swork.controller;


import org.apache.log4j.Logger;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.web.system.service.SystemService;
import org.jeecgframework.web.system.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import weixin.guanjia.account.service.WeixinAccountServiceI;
import weixin.swork.entity.User;

import javax.servlet.http.HttpServletRequest;

/**
 * 待办理列表
 *
 * @author dejian.zhang
 */
@Scope("prototype")
@Controller
@RequestMapping("/sworkUserController")
public class SworkUserController extends BaseController {

    private Logger log = Logger.getLogger(SworkQuesrController.class);
    private SystemService systemService;
    @Autowired
    private WeixinAccountServiceI weixinAccountService;
    private UserService userService;
    private String message = null;

    private User user;

    @Autowired
    public void setSystemService(SystemService systemService) {
        this.systemService = systemService;
    }

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }


    /**
     * 问题跟踪，并且跳转页面
     */
    @RequestMapping(params = "showuser")
    public String showUserInfo(ModelMap modelMap, HttpServletRequest request) {
        user = (User) request.getSession().getAttribute("wx_user_info");
        if (user != null && !"".equals(user)) {
            modelMap.put("user_id", user.getUserID());
            modelMap.put("user_name", user.getRealName());
            modelMap.put("depart_name", user.getDepartName());
            modelMap.put("role_name", user.getRoleName());
            modelMap.put("phone_num", user.getUserID());
            modelMap.put("user_token", user.getToken());
            modelMap.put("user_openid", user.getOpenID());
        }

        return "weixin/swork/userinfo";
    }


}
