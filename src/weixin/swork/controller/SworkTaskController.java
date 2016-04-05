package weixin.swork.controller;

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
 * 待办理列表
 *
 * @author heqing.qi
 */
@Scope("prototype")
@Controller
@RequestMapping("/sworkTaskController")
public class SworkTaskController extends BaseController {

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
     * 核查核实上报表单提交
     *
     * @throws JSONException
     */
    @RequestMapping(params = "taskForm")
    public String taskForm( ModelMap modelMap, HttpServletRequest request) throws JSONException {
    	 String caseId = "";
            //取用户信息
            user = (User) request.getSession().getAttribute("wx_user_info");
                HashMap<String, String> params = new HashMap<>();

                params.put(CallServiceKey.CASE_ID.getKey(), request.getParameter("case_id"));
                params.put(CallServiceKey.CASE_BIZ_TYPE_ID.getKey(), request.getParameter("case_biz_type_id"));
                params.put(CallServiceKey.CASE_BIZ_SN.getKey(), request.getParameter("case_biz_sn"));
                params.put(CallServiceKey.VERIFY_EXAMINE_DESC.getKey(), request.getParameter("verify_examine_desc"));
                params.put(CallServiceKey.VERIFY_EXAMINE_REMARKS.getKey(), request.getParameter("verify_examine_remarks"));
                params.put(CallServiceKey.OP_RESULT_ID.getKey(), request.getParameter("op_result_id"));
                params.put(CallServiceKey.ATTACH_LIST.getKey(), request.getParameter("pid"));
//                JSONObject returnStr = new JSONObject(returnStr);
                String returnStr = "";
                returnStr = SworkCommonServiceImpl.getInstance().sworkCallService(RequestCode.SUBMIT_TASK_LIST, user.getToken(), params);
                if(!"".equals(request.getParameter("case_id")) && request.getParameter("case_id")!=null){
                	if (returnStr == null || "".equals(returnStr)) {       
                        caseId = "2";
                        modelMap.addAttribute("failsuccess", caseId);
                    } else {
                        caseId = "1";
                        modelMap.addAttribute("failsuccess", caseId);
                    }	
                }else{
                	modelMap.addAttribute("failsuccess", "");
                }
                

        return "weixin/swork/taskList";
    }
  
    /**
     * 案件详细信息
     *
     * @throws JSONException
     */
    @RequestMapping(params = "taskDetail")
    public String taskDetail( ModelMap modelMap, HttpServletRequest request) throws JSONException {
    	 String caseId = "";
            //取用户信息
            user = (User) request.getSession().getAttribute("wx_user_info");
                HashMap<String, String> params = new HashMap<>();
                params.put(CallServiceKey.CASE_ID.getKey(), request.getParameter("case_id"));
                String returnStr = "";
                returnStr = SworkCommonServiceImpl.getInstance().sworkCallService(RequestCode.DETAIL_TASK_LIST, user.getToken(), params);
                System.out.println(returnStr);
                         JSONObject a = new JSONObject(returnStr);
                 modelMap.put("region_name", a.get("REGION_NAME"));//事发区域
                 modelMap.put("case_pos_desc", a.get("CASE_POS_DESC"));//位置描述
                 modelMap.put("case_desc", a.get("CASE_DESC"));//问题描述

        return "weixin/swork/taskDetail";
    }
  

  

   

  
   

    
}
