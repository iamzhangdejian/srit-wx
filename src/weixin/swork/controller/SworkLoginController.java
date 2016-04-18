package weixin.swork.controller;

/**
 * Created by dejian.zhang on 2016/2/25.
 */

import org.apache.log4j.Logger;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.util.PropertiesUtil;
import org.jeecgframework.web.system.service.SystemService;
import org.jeecgframework.web.system.service.UserService;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import weixin.guanjia.account.service.WeixinAccountServiceI;
import weixin.swork.entity.User;
import weixin.swork.service.CallServiceKey;
import weixin.swork.service.RequestCode;
import weixin.swork.service.impl.SworkCommonServiceImpl;
import weixin.swork.util.JsonHelper;
import weixin.swork.util.Wechat;
import weixin.swork.util.WeiXinOpenOAuthHelper;

import javax.servlet.http.HttpServletRequest;

import java.util.HashMap;
import java.util.Map;

/**
 * 登陆初始化控制器
 *
 * @author dejian.zhang
 */
@Scope("prototype")
@Controller
@RequestMapping("/sworkLoginController")
public class SworkLoginController extends BaseController {
    private static Wechat wechat = new Wechat();
    private Logger log = Logger.getLogger(SworkLoginController.class);
    private SystemService systemService;
    @Autowired
    private WeixinAccountServiceI weixinAccountService;
    private UserService userService;
    private String message = null;

    @Autowired
    public void setSystemService(SystemService systemService) {
        this.systemService = systemService;
    }

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    /**
     * 用户登录
     *
     * @param request
     * @return
     */
    @RequestMapping(params = "swLogin")
    public String swlogin(Model model, ModelMap modelMap,
                          HttpServletRequest request) {
        String code = request.getParameter("code");
        String openId = request.getParameter("openid");
        boolean isHasBound = false;
        if (code != null && !"".equals(code)) {
            openId = WeiXinOpenOAuthHelper.getInstance().getOpenID(code);
            // 检查openId是否已注册，调用后台服务接口验证
            User user = SworkCommonServiceImpl.getInstance()
                    .sworkUserOauthService(openId);
            if (user != null && !"".equals(user)) {
                isHasBound = true;
                request.getSession().setAttribute("wx_user_info", user);
            }
        }

        // 如果已经绑定则进入主界面，如未绑定则进入验证绑定界面
        if (!isHasBound) {
            return "weixin/swork/wxuserauthor";
        } else {
            return "weixin/swork/main";
        }

    }

    /**
     * 用户登录
     *
     * @param request
     * @return
     */
    @RequestMapping(params = "swLoginUser")
    public String swLoginUser(Model model, ModelMap modelMap,
                              HttpServletRequest request) {
        String code = request.getParameter("code");
        String openId = request.getParameter("openid");
        boolean isHasBound = false;
        if (code != null && !"".equals(code)) {
            openId = WeiXinOpenOAuthHelper.getInstance().getOpenID(code);
            // 检查openId是否已注册，调用后台服务接口验证
            User user = SworkCommonServiceImpl.getInstance()
                    .sworkUserOauthService(openId);
            if (user != null && !"".equals(user)) {
                isHasBound = true;
                request.getSession().setAttribute("wx_user_info", user);
            }
        }

        // 如果已经绑定则进入主界面，如未绑定则进入验证绑定界面
        if (!isHasBound) {
            return "weixin/swork/login";
        } else {
            return "weixin/swork/main";
        }
    }

    /**
     * 实现登陆，并且跳转页面
     */
    @RequestMapping(params = "swMain")
    public String swMain(String userName, String password) {

        System.out.println("userName:" + userName + "password:" + password);

        return "weixin/swork/main";
    }


    /**
     * 问题上报
     */
    @RequestMapping(params = "swQuest")
    public String uploadImg(HttpServletRequest request, Model model) {
        PropertiesUtil properties = new PropertiesUtil("sysConfig.properties");
        String appId = properties.readProperty("appId");
        String appSecret = properties.readProperty("appSecret");
        String urlEnd = "?swQuest";
        // 动态获取url
        // request.getSchema()可以返回当前页面使用的协议，http 或是 https;
        // request.getServerName()可以返回当前页面所在的服务器的名字;
        // request.getServerPort()可以返回当前页面所在的服务器使用的端口,就是80;
        // request.getContextPath()可以返回当前页面所在的应用的名字;
        String url = request.getScheme() + "://" + request.getServerName()
                + request.getRequestURI()
                + urlEnd;
        System.out.println("url====>" + url);
        Map map = wechat.jsConfig(url, appId, appSecret);
        model.addAttribute("map", map);
        return "weixin/swork/questr";
    }

    /**
     * 手机验证
     *
     * @param request
     * @return
     */
    @RequestMapping(params = "swPhone")
    public String swPhone(String phoneNum, ModelMap modelMap,
                          HttpServletRequest request) {
        String openId = (String) request.getSession().getAttribute("openid");

        if (openId == null || "".equals(openId)) {
            openId = phoneNum;
        }

        System.out
                .println("用户验证&&==openId:" + openId + ",phoneNum:" + phoneNum);

        // 调用用户验证接口进行用户的openId验证
        User user = SworkCommonServiceImpl.getInstance().sworkUserOauthService(
                openId);
        if (user != null && !"".equals(user)) {
            request.getSession().setAttribute("wx_user_info", user);
            request.getSession().setAttribute("phoneNum", phoneNum);
            return "weixin/swork/main";
        }

        // 通过手机号进行注册
        HashMap<String, String> params = new HashMap<String, String>();
        params.put(CallServiceKey.PHONE_NUM.getKey(), phoneNum);
        params.put(CallServiceKey.PASSWORD.getKey(), phoneNum);
        params.put(CallServiceKey.OPENID.getKey(), openId);
        params.put(CallServiceKey.USER_NAME.getKey(), phoneNum);
        params.put(CallServiceKey.EMAIL_ADDRESS.getKey(), "sz@163.com");
        SworkCommonServiceImpl.getInstance().sworkCallService(
                RequestCode.REGISTER, "", params);
        return "weixin/swork/wxuserauthor";
    }

    /**
     * 用户名登陆验证
     *
     * @param request
     * @return
     * @throws JSONException
     */
    @RequestMapping(params = "swUser")
    public String swUser(String phoneNum, ModelMap modelMap,
                         HttpServletRequest request) throws JSONException {
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String openId = request.getParameter("openId");
        HashMap<String, String> params = new HashMap<String, String>();
        params.put(CallServiceKey.USER_NAME.getKey(), userName);
        params.put(CallServiceKey.PASSWORD.getKey(), password);
        params.put(CallServiceKey.OPENID.getKey(), openId);
        params.put(CallServiceKey.RESULT.getKey(), "0");

        String datas = SworkCommonServiceImpl.getInstance().sworkCallService(
                RequestCode.OPENCODE, "", params);
        // 如果已经绑定则进入主界面，如未绑定则进入验证绑定界面
        JSONObject a = new JSONObject(datas);

        String result = "0";
        if (null != a.get("result")) {
            result = (String) a.get("result");
        }
        System.out.println("result===============>" + result);
        if (result.equals("1")) {
            return "weixin/swork/main";
        } else {
            return "weixin/swork/login";

        }
    }
}
