package weixin.swork.controller;

import org.apache.commons.io.FileUtils;
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

/**
 * 待办理列表
 *
 * @author heqing.qi
 */
@Scope("prototype")
@Controller
@RequestMapping("/sworkTaskController")
public class SworkTaskController extends BaseController {
	 private static Wechat wechat = new Wechat();
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
    @RequestMapping(params = "swTrack")
    public String swTrack() {

        return "weixin/swork/taskList";
    }


    /**
     * 获取问题跟踪列表数据
     * 问题待办列表
     *
     * @param
     * @param request
     * @return
     */
    @RequestMapping(params = "taskList")
    @ResponseBody
    public String taskList(String currentPage, String pageSize, HttpServletRequest request) {
        user = (User) request.getSession().getAttribute("wx_user_info");
        HashMap<String, String> params = new HashMap<String, String>();
        // 获取案件类别编码
        params.put(CallServiceKey.CASE_BIZ_TYPE_ID.getKey(), "All");
        params.put(CallServiceKey.CURRENT_PAGE.getKey(), currentPage);
        params.put(CallServiceKey.PAGE_SIZE.getKey(), pageSize);
        String returnStr = SworkCommonServiceImpl.getInstance()
                .sworkCallService(RequestCode.GET_TASK_LIST, user.getToken(), params);

        AjaxJson jon = new AjaxJson();
        jon.setObj(returnStr);
        return returnStr;
    }


    /**
     * 问题待办列表，跳转(任务反馈)页面
     * <p/>
     * case_code： 事项编号 SEND_OP_INFO ：处置要求 case_pos_desc：详细地址
     */
    @RequestMapping(params = "swTaskcheck")
    public String swTaskcheck(ModelMap modelMap, HttpServletRequest request,Model model) {
        modelMap.put("send_op_info", request.getParameter("send_op_info"));
        modelMap.put("case_code", request.getParameter("case_code"));
        modelMap.put("case_pos_desc", request.getParameter("case_pos_desc"));
        modelMap.put("case_biz_type_id",
                request.getParameter("case_biz_type_id"));
        modelMap.put("case_biz_type_name",
                request.getParameter("case_biz_type_name"));
        modelMap.put("case_id", request.getParameter("case_id"));
        modelMap.put("case_biz_sn", request.getParameter("case_biz_sn"));
        System.out.println(request.getParameter("send_op_info"));
        System.out.println(request.getParameter("case_biz_type_name"));
        
//        获取微信接口认证参数
        String endUrl="?swTaskcheck";
        Map map=wechat.wxConfig(request, endUrl);
        model.addAttribute("map", map);
       
        return "weixin/swork/taskcheck";
    }

    /**
     * 案件详细信息
     *
     * @throws JSONException
     */
    @RequestMapping(params = "taskDetail")
    public String taskDetail(ModelMap modelMap, HttpServletRequest request) throws JSONException {
        String caseId = request.getParameter("case_id");
        //取用户信息
        user = (User) request.getSession().getAttribute("wx_user_info");
        HashMap<String, String> params = new HashMap<>();
        params.put(CallServiceKey.CASE_ID.getKey(), caseId);
        String returnStr = "";
        returnStr = SworkCommonServiceImpl.getInstance().sworkCallService(RequestCode.DETAIL_TASK_LIST, user.getToken(), params);
        System.out.println(returnStr);
        JSONObject a = new JSONObject(returnStr);
        modelMap.put("region_name", a.get("REGION_NAME"));//事发区域
        modelMap.put("case_pos_desc", a.get("CASE_POS_DESC"));//位置描述
        modelMap.put("case_desc", a.get("CASE_DESC"));//问题描述

        return "weixin/swork/taskDetail";
    }


    /**
     * 核查核实上报表单提交
     *
     * @throws JSONException
     */
    @RequestMapping(params = "taskForm")
    public String taskForm(ModelMap modelMap, HttpServletRequest request) throws JSONException {
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
        if (!"".equals(request.getParameter("case_id")) && request.getParameter("case_id") != null) {
            if (returnStr == null || "".equals(returnStr)) {
                caseId = "2";
                modelMap.addAttribute("failsuccess", caseId);
            } else {
                caseId = "1";
                modelMap.addAttribute("failsuccess", caseId);
            }
        } else {
            modelMap.addAttribute("failsuccess", "");
        }
        return "weixin/swork/taskList";
    }


    /**
     * 历史信息列表，并跳转页面
     */
    @RequestMapping(params = "swHistory")
    public String swHistory(ModelMap modelMap, HttpServletRequest request) throws JSONException {

        return "weixin/swork/historyRecord";
    }

    /**
     * 获取历史纪录列表数据
     * @param currentPage
     * @param pageSize
     * @param request
     * @return
     */
    @RequestMapping(params = "historyRecord")
    @ResponseBody
    public String historyRecord(String currentPage, String pageSize, HttpServletRequest request,Model model) {
        user = (User) request.getSession().getAttribute("wx_user_info");
        HashMap<String, String> params = new HashMap<String, String>();
        // 获取案件类别编码
        params.put(CallServiceKey.CASE_BIZ_TYPE_ID.getKey(), "All");
        params.put(CallServiceKey.CURRENT_PAGE.getKey(), currentPage);
        params.put(CallServiceKey.PAGE_SIZE.getKey(), pageSize);
//        params.put("", value)
        String returnStr = SworkCommonServiceImpl.getInstance()
                .sworkCallService(RequestCode.HIS_TASK_LIST, user.getToken(), params);

        AjaxJson jon = new AjaxJson();
        jon.setObj(returnStr);
        
       
        return returnStr;
    }
    /**
     * 历史案件详细信息
     *
     * @throws JSONException
     */
    @RequestMapping(params = "hisDetail")
    public String hisDetail(ModelMap modelMap, HttpServletRequest request,Model model) throws JSONException {
        String caseId = "";
//    	获取用户信息
        user = (User) request.getSession().getAttribute("wx_user_info");
//       获取案件信息
        HashMap<String, String> params = new HashMap<>();
        params.put(CallServiceKey.CASE_ID.getKey(), request.getParameter("case_id"));
        System.out.println(request.getParameter("case_id"));
        String returnStr = "";
        returnStr = SworkCommonServiceImpl.getInstance().sworkCallService(RequestCode.DETAIL_TASK_LIST, user.getToken(), params);
        System.out.println(returnStr);
        JSONObject a = new JSONObject(returnStr);
        modelMap.put("case_type_name", a.get("CASE_TYPE_NAME"));//案件类别
        modelMap.put("region_name", a.get("REGION_NAME"));//事发区域
        modelMap.put("case_pos_desc", a.get("CASE_POS_DESC"));//位置描述
        modelMap.put("case_desc", a.get("CASE_DESC"));//问题描述
        modelMap.put("rpt_time", a.get("RPT_TIME"));//上报时间
//        获取微信接口验证参数
        String endUrl="?hisDetail";
        Map map=wechat.wxConfig(request, endUrl);
        model.addAttribute("map", map);
        return "weixin/swork/histDetail";
    }

}
