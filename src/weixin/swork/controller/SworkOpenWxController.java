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
        String page = request.getParameter("page");
        String code = request.getParameter("code");
        user = (User) request.getSession().getAttribute("wx_user_info");
        openId = (String) request.getSession().getAttribute("openid");
        if (user != null && !"".equals(user)) {
            System.out.println("User=======================>>" + user.toString());
            String token = user.getToken();
            if (token == null || "".equals(token)) {
                user = SworkCommonServiceImpl.getInstance().sworkUserOauthService(
                        openId);
            }
            isHasBound = true;
            openId = user.getOpenID();
        } else {
            isHasBound = false;
            if (openId == null || "".equals(openId)) {
                openId = WeiXinOpenOAuthHelper.getInstance().getOpenID(code);
                request.getSession().setAttribute("openid", openId);
            }
        }
        System.out.println("isHasBound=================>>" + String.valueOf(isHasBound));
        System.out.println("code=======================>>" + code);
        System.out.println("openId=====================>>" + openId);
        System.out.println("page=======================>>" + page);
        if (isHasBound) {
            return goPage(model, page);
        } else {
            // 调用用户验证接口进行用户的openId验证
            user = SworkCommonServiceImpl.getInstance().sworkUserOauthService(
                    openId);
            if (user != null && !"".equals(user)) {
                System.out.println("User=======================>>" + user.toString());
                isHasBound = true;
                request.getSession().setAttribute("openid", openId);
                request.getSession().setAttribute("wx_user_info", user);
            }
            return goPage(model, page);
        }
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
        if ("main".equals(page)) {
            model.addAttribute("phoneNum", user.getRealName());
            return "weixin/swork/main";
        }
        if ("login".equals(page)) {
            return "weixin/swork/login";
        }
        return "common/error";
    }

}
