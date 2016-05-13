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
 * 公众
 *2016-05-03
 * @author heqing.qi
 */
@Scope("prototype")
@Controller
@RequestMapping("/SworkPublicController")
public class SworkPublicController extends BaseController {

	private User user;
  
    /**
     * sui首页
     *
     * @throws JSONException
     */
   
    @RequestMapping(params = "publichome")
    public String publichome( ModelMap modelMap, HttpServletRequest request) throws JSONException {
    	 

        return "weixin/swork/publichome";
    }
    /**
     * sui
     *
     * @throws JSONException
     */
    @RequestMapping(params = "sui")
    public String sui( ModelMap modelMap, HttpServletRequest request) throws JSONException {
    	 

        return "weixin/swork/sui";
    }
    
    /**
     * 投诉举报表单提交
     *
     * @throws JSONException
     */
    @RequestMapping(params = "publicForm")
    public String publicForm(QuestFormInfo questFormInfo, ModelMap modelMap, HttpServletRequest request) throws JSONException {
        String caseId = "";
        if (questFormInfo != null && !"".equals(questFormInfo)) {
            //取用户信息
            user = (User) request.getSession().getAttribute("wx_user_info");
            if (questFormInfo.getQuestType() != null && !"".equals(questFormInfo.getQuestType())) {
                HashMap<String, String> params = new HashMap<>();
                //绑定字段
                //问题类型
//                params.put(CallServiceKey.CASE_TYPE_ID.getKey(), questFormInfo.getQuestType());
                //事发区域
//                params.put(CallServiceKey.GRID_ID.getKey(), questFormInfo.getEventRegionId());
                //问题描述
                params.put(CallServiceKey.CASE_DESC.getKey(), questFormInfo.getQuestDesc());
                //位置描述
                params.put(CallServiceKey.CASE_POS_DESC.getKey(), questFormInfo.getSpaceDesc());
                //问题程度
                params.put(CallServiceKey.DAMAGE_LID.getKey(), questFormInfo.getQuestLevel());
                //附件ID
                params.put(CallServiceKey.RPT_ATTACH.getKey(), questFormInfo.getPid());

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
                System.out.println(a.get("v_case_id"));
            }

        }

        return "weixin/swork/sui";
    }
    /**
     * 地图
     *
     * @throws JSONException
     */
    @RequestMapping(params = "publicMap")
    public String publicMap( ModelMap modelMap, HttpServletRequest request) throws JSONException {
    	 

        return "weixin/swork/map";
    }
    
    /**
     * 个人中心
     *
     * @throws JSONException
     */
    @RequestMapping(params = "publicCore")
    public String publicCore( ModelMap modelMap, HttpServletRequest request) throws JSONException {
    	 
        return "weixin/swork/core";
    }
    /**
     * 新闻
     *
     * @throws JSONException
     */
    @RequestMapping(params = "publicNews")
    public String publicNews( ModelMap modelMap, HttpServletRequest request) throws JSONException {
    	
    	return "weixin/swork/cityNews";
    }
  
  
   

    
}
