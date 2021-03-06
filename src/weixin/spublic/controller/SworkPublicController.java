package weixin.spublic.controller;

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
import org.springframework.ui.Model;
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
import weixin.swork.util.Wechat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import jodd.servlet.URLDecoder;

/**
 * 公众
 *2016-05-03
 * @author heqing.qi
 */
@Scope("prototype")
@Controller
@RequestMapping("/SworkPublicController")
public class SworkPublicController extends BaseController {
	private static Wechat wechat = new Wechat();
	private User user;
  
    /**
     * sui首页
     *
     * @throws JSONException
     */
   
    @RequestMapping(params = "publichome")
    public String publichome( ModelMap modelMap, HttpServletRequest request,Model model) throws JSONException {
    	//    	获得验证微信接口的参数方法
//    	
//    	 String endUrl="?publichome";
//         Map map = wechat.wxConfig(request, endUrl);
//         model.addAttribute("map", map);
//    	 String code=request.getParameter("code");
//         System.out.println("code========>"+code);
//         String urlE="?openWws&page=main&code="+code+"&state=1";
//    	 	String endUrl=urlE;
//         Map map=wechat.wxConfig(request, endUrl);
    	
//    	Map map=(Map)request.getSession().getAttribute("map");
//    	
//    	System.out.println("map===============>"+map);
//         model.addAttribute("map", map);
        return "weixin/spublic/publichome";
    }
  
    /**
     * sui
     *
     * @throws JSONException
     */
    @RequestMapping(params = "sui")
    public String sui( ModelMap modelMap, HttpServletRequest request) throws JSONException {
    	 

        return "weixin/spublic/sui";
    }
    
    /**
     * 投诉举报表单提交
     *
     * @throws JSONException
     */
    @RequestMapping(params = "publicForm")
    @ResponseBody
    public String publicForm(String case_desc,String rpt_attch ,String case_pos_desc,  ModelMap modelMap, HttpServletRequest request) throws JSONException {
        String caseId = "";
        
            //取用户信息
            user = (User) request.getSession().getAttribute("wx_user_info");
            
                HashMap<String, String> params = new HashMap<>();
                //绑定字段
                //问题描述
                params.put(CallServiceKey.CASE_DESC.getKey(),URLDecoder.decode(case_desc,"utf-8") );
                //位置描述
                params.put(CallServiceKey.CASE_POS_DESC.getKey(), URLDecoder.decode(case_pos_desc,"utf-8"));
                //问题程度
                //params.put(CallServiceKey.DAMAGE_LID.getKey(), questFormInfo.getQuestLevel());
                //附件ID 
                params.put(CallServiceKey.RPT_ATTACH.getKey(), rpt_attch);
//                params.put(CallServiceKey.V_CASE_LEVEL_ID.getKey(), "7");

                 String returnStr = "";
                returnStr = SworkCommonServiceImpl.getInstance()
                        .sworkCallService(RequestCode.SUBMIT_CASE, user.getToken(), params);
                JSONObject a = new JSONObject(returnStr);
                if (a.get("v_case_id") == "-1") {       
                    caseId = "2";
                    modelMap.addAttribute("caseId", caseId);
                } else {
                    caseId = "1";
                    modelMap.addAttribute("caseId", caseId);
                }
                System.out.println(returnStr);
                System.out.println(caseId);
                System.out.println(a.get("v_case_id"));
              

        

        return caseId;
    }
    /**
     * 地图
     *
     * @throws JSONException
     */
    @RequestMapping(params = "publicMap")
    public String publicMap( ModelMap modelMap, HttpServletRequest request,Model model) throws JSONException {
    	 


        return "weixin/spublic/map";

    }
    
    /**
     * 个人中心
     *
     * @throws JSONException
     */
    @RequestMapping(params = "publicCore")
    public String publicCore( ModelMap modelMap, HttpServletRequest request) throws JSONException {
    	 
        return "weixin/spublic/core";
    }
    /**
     * 新闻
     *
     * @throws JSONException
     * @author guilong.liang
     */
    @RequestMapping(params = "publicNews")
    public String publicNews( ModelMap modelMap, HttpServletRequest request) throws JSONException {
    	
    	return "weixin/sshare/cityNews";
    }
  
    /**
     * 历史记录
     *
     * @throws JSONException
     */
   
    @RequestMapping(params = "publiHistory")
    public String publiHistory( ModelMap modelMap, HttpServletRequest request,Model model) throws JSONException {
        return "weixin/spublic/history";
    }
   

//    HIS_TASK_LIST
    /**
     * 历史记录信息列表数据查询
     * 
     * @param request
     * @return
     */
    @RequestMapping(params = "histask")
    @ResponseBody
    public String histask(String currentPage,String pageSize,String case_status_id,HttpServletRequest request) {
        user = (User) request.getSession().getAttribute("wx_user_info");
        HashMap<String, String> params = new HashMap<String, String>();
        // 获取案件类别编码
        if(!"".equals(case_status_id) && case_status_id !=null  ){
        	 params.put(CallServiceKey.CASE_STATUS_ID.getKey(),case_status_id);
        }
        params.put(CallServiceKey.CURRENT_PAGE.getKey(),currentPage);
        params.put(CallServiceKey.PAGE_SIZE.getKey(),pageSize);
        String returnStr = SworkCommonServiceImpl.getInstance()
                .sworkCallService(RequestCode.PUBLIC_HIS_LIST, user.getToken(), params);
        
        System.out.println("returnStrHis=====>"+returnStr);
//        returnStr = JsonHelper.getTreeNodeString(returnStr);
        AjaxJson jon = new AjaxJson();
        jon.setObj(returnStr);
        return returnStr;   
    }
    /**
     * 历史记录详细信息
     *
     * @throws JSONException
     */

    @RequestMapping(params = "recordinfo")
    public String recordinfo( ModelMap modelMap, HttpServletRequest request,Model model) throws JSONException {
        return "weixin/spublic/recordinfo";
    }
}

