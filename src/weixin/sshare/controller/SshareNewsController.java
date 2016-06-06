package weixin.sshare.controller;

import java.util.HashMap;

import org.apache.log4j.Logger;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

import weixin.swork.entity.User;
import weixin.swork.service.CallServiceKey;
import weixin.swork.service.RequestCode;
import weixin.swork.service.impl.SworkCommonServiceImpl;

import javax.servlet.http.HttpServletRequest;

/**
 * 新闻模块控制
 * Created by dejian.zhang on 2016/5/6.
 */
@Scope("prototype")
@Controller
@RequestMapping("/sshareNewsController")
public class SshareNewsController {
    private Logger log = Logger.getLogger(SshareNewsController.class);
    private User user;
    
    /**
     * 城市动态，并且跳转页面
     */
    @RequestMapping(params = "swCity")
    public String swTrack() {

        return "weixin/sshare/newsPage";
    }
    /**
     * 便民服务，并且跳转页面
     */
    @RequestMapping(params = "swLt")
    public String swLt() {
    	
    	return "weixin/sshare/lunTan";
    }
    /**
     * 获取新闻列表信息
     *
     * @param currentPage
     * @param pageSize
     * @param request
     * @return
     */
    @RequestMapping(params = "newsList")
    @ResponseBody
    public String getNewsList(String currentPage, String pageSize, HttpServletRequest request) {

    	 user = (User) request.getSession().getAttribute("wx_user_info");
         HashMap<String, String> params = new HashMap<String, String>();
//         params.put(CallServiceKey.CASE_BIZ_TYPE_ID.getKey(), "All");
         params.put(CallServiceKey.CURRENT_PAGE.getKey(), currentPage);
         params.put(CallServiceKey.PAGE_SIZE.getKey(), pageSize);
         String returnStr = SworkCommonServiceImpl.getInstance()
                 .sworkCallService(RequestCode.NEWS_LIST, "", params);
         AjaxJson jon = new AjaxJson();
         jon.setObj(returnStr);
         System.out.println("returnStr=====>"+returnStr);
         return returnStr;
    }


    /**
     * 新闻详细跳转
     *
     *
     * @throws JSONException
     */
    @RequestMapping(params = "newsContent")
    public String getNewsContent(ModelMap modelMap,String news_id, HttpServletRequest request) throws JSONException {
        return "weixin/sshare/newsDetail";
    }
    /**
     * 获取新闻详细信息
     *
     *
     * @throws JSONException
     */
    @RequestMapping(params = "newsContentlist")
    @ResponseBody
    public String newsContentlist(ModelMap modelMap,String news_id, HttpServletRequest request) throws JSONException {
//    	String news_id = request.getParameter("news_id");
        //取用户信息
        user = (User) request.getSession().getAttribute("wx_user_info");
        HashMap<String, String> params = new HashMap<>();
        params.put(CallServiceKey.NEWS_ID.getKey(), news_id);
//        System.out.println("params====>"+params);
        String returnStr = "";
        returnStr = SworkCommonServiceImpl.getInstance().sworkCallService(RequestCode.NEWS_CONTENT, "", params);
//        System.out.println("returnStr2====>"+returnStr);
//        JSONObject obj = JSONObject.
//        System.out.println("obj====>"+obj);
//        JSONObject a = new JSONObject(returnStr);
//        modelMap.put("a", returnStr);//事发区域
        AjaxJson jon = new AjaxJson();
        jon.setObj(returnStr);
        System.out.println("params====>"+returnStr);
        return returnStr;
    }
    
    
}