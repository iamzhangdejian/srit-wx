package weixin.swork.controller;

import org.apache.log4j.Logger;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.util.PropertiesUtil;
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.web.system.service.SystemService;
import org.jeecgframework.web.system.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import weixin.guanjia.account.service.WeixinAccountServiceI;
import weixin.swork.entity.User;
import weixin.swork.service.impl.SworkCommonServiceImpl;
import weixin.swork.util.WeiXinOpenOAuthHelper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 登陆初始化控制器
 *
 * @author dejian.zhang
 */
@Scope("prototype")
@Controller
@RequestMapping("/sworkOpenWxController")
public class SworkOpenWxController extends BaseController {

    private Logger log = Logger.getLogger(SworkOpenWxController.class);
    private SystemService systemService;
    @Autowired
    private WeixinAccountServiceI weixinAccountService;
    private UserService userService;
    private User user;
    private String openId;
    private boolean isHasBound;
    private String appId;

    @Autowired
    public void setSystemService(SystemService systemService) {
        this.systemService = systemService;
    }

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    private SworkOpenWxController() {
        PropertiesUtil properties = new PropertiesUtil("sysConfig.properties");
        if (properties != null) {
            appId = properties.readProperty("appId");
        } else {
            appId = "wx16824288d04eaa3b";
        }
    }

    /**
     * 授权功能
     *
     * @param request
     * @param response
     */
    @RequestMapping(params = "goAuthor")
    public void goAuthor(HttpServletRequest request, HttpServletResponse response) {
        String page = request.getParameter("page");
        try {
            System.out.println("appId==========>>" + appId);
            String web_oauth_url = WeiXinOpenOAuthHelper.WEB_OAUTH_URL.replace("APPID", appId);
            String httprequestUrl = ResourceUtil.getConfigByName("domain") + "/sworkOpenWxController.do?openWws&page=" + page;
            web_oauth_url = web_oauth_url.replace("SCOPE", WeiXinOpenOAuthHelper.SCOPE_USERINFO);
            web_oauth_url = web_oauth_url.replace("STATE", "1");
            web_oauth_url = web_oauth_url.replace("REDIRECT_URI", java.net.URLEncoder.encode(httprequestUrl, "UTF-8"));
            System.out.println("提交微信平台验证的服务地址=>>" + web_oauth_url);
            response.sendRedirect(web_oauth_url);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 用户接入
     *
     * @param request
     * @return
     */
    @RequestMapping(params = "openWws")
    public String openWws(Model model, HttpServletRequest request) {
        //页面跳转指向
        String page = request.getParameter("page");
        //微信平台提供code
        String code = request.getParameter("code");
        if (code == null || "".equals(code)) {
            return "common/error";
        }
        System.out.println("提供code===================>>" + code);
        System.out.println("跳转page===================>>" + page);
        openId = (String) request.getSession().getAttribute("openid");
        if (openId == null || "".equals(openId)) {
            openId = WeiXinOpenOAuthHelper.getInstance().getOpenID(code);
            if (openId == null || "".equals(openId)) {
                return "common/error";
            } else {
                request.getSession().setAttribute("openid", openId);
            }
        }

        //根据openId进行服务器的用户验证
        user = SworkCommonServiceImpl.getInstance().sworkUserOauthService(
                openId);
        if (user != null && !"".equals(user)) {
            //验证通过
            isHasBound = true;
            request.getSession().setAttribute("wx_user_info", user);
        } else {
            //验证失败-进入验证页面
            isHasBound = false;
            request.getSession().setAttribute("wx_user_info", null);
        }
        System.out.println("验证是否通过=================>>" + String.valueOf(isHasBound));
        System.out.println("获取微信OPENID==============>>" + openId);
        return goPage(model, page);
    }

    /**
     * 页面跳转方向
     *
     * @param model
     * @param page
     * @return
     */
    private String goPage(Model model, String page) {
        //如果已经绑定则进入主界面，如未绑定则进入验证绑定界面
        if (!isHasBound) {
            model.addAttribute("openid", openId);
            return "weixin/swork/wxuserauthor";
        }
        //首页
        if ("main".equals(page)) {
            model.addAttribute("phoneNum", user.getRealName());
            return "weixin/swork/main";
        }
        //登录界面
        if ("swUser".equals(page)) {
            return "weixin/swork/login";
        }
        //问题上报
        if ("swQuest".equals(page)) {
            return "weixin/swork/questr";
        }
        //用户信息
        if ("showuser".equals(page)) {
            return "weixin/swork/userinfo";
        }
        //待办任务
        if ("taskList".equals(page)) {
            return "weixin/swork/taskList";
        }
        //历史纪录
        if ("swHistory".equals(page)) {
            return "weixin/swork/historyRecord";
        }
        return "common/error";
    }

}
