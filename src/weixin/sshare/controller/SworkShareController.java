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
import java.util.List;

import jodd.servlet.URLDecoder;

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
    @RequestMapping(params = "shareForum")
    public String shareForum( ModelMap modelMap, HttpServletRequest request) throws JSONException {
    	 
        return "weixin/sshare/forum";
    }
    /**
     * 社区论坛发帖
     *
     * @throws JSONException
     */
    @RequestMapping(params = "sharePost")
    public String sharePost( ModelMap modelMap, HttpServletRequest request) throws JSONException {
    	 
        return "weixin/sshare/post";
    }
    /**
     * 回复帖子
     *
     * @throws JSONException
     */
    @RequestMapping(params = "shareReplypost")
    public String shareReplypost( ModelMap modelMap, HttpServletRequest request) throws JSONException {
    	 
        return "weixin/sshare/replypost";
    }
    /**
     * 获取论坛列表数据
     * 社区论坛列表
     *
     * @param 
     * @param request
     * @return
     */
    @RequestMapping(params = "shareList")
    @ResponseBody
    public String shareList(String currentPage,String pageSize,String posttypeid,HttpServletRequest request) {
        user = (User) request.getSession().getAttribute("wx_user_info");
        HashMap<String, String> params = new HashMap<String, String>();
        // 获取案件类别编码
        if(!"".equals(posttypeid) && posttypeid !=null && posttypeid !="全部" ){
        	 params.put(CallServiceKey.V_POST_TYPE_ID.getKey(),posttypeid);
        }
        params.put(CallServiceKey.CURRENT_PAGE.getKey(),currentPage);
        params.put(CallServiceKey.PAGE_SIZE.getKey(),pageSize);
        String returnStr = SworkCommonServiceImpl.getInstance()
                .sworkCallService(RequestCode.BBS_LIST, user.getToken(), params);
        
//        returnStr = JsonHelper.getTreeNodeString(returnStr);
        AjaxJson jon = new AjaxJson();
        jon.setObj(returnStr);
        return returnStr;   
    }
    /**
     * 点击论坛列表数据获取回复贴数据
     * 回复贴列表
     *
     * @param 
     * @param request
     * @return
     */
    @RequestMapping(params = "replyList")
    @ResponseBody
    public String replyList(String currentPage,String pageSize,String postid,HttpServletRequest request) {
        user = (User) request.getSession().getAttribute("wx_user_info");
        HashMap<String, String> params = new HashMap<String, String>();
        // 获取案件类别编码
        if(!"".equals(postid) && postid !=null  ){
        	 params.put(CallServiceKey.POST_ID.getKey(),postid);
        }
        params.put(CallServiceKey.CURRENT_PAGE.getKey(),currentPage);
        params.put(CallServiceKey.PAGE_SIZE.getKey(),pageSize);
        String returnStr = SworkCommonServiceImpl.getInstance()
                .sworkCallService(RequestCode.BBS_POSBIZINFO, user.getToken(), params);
        
//        returnStr = JsonHelper.getTreeNodeString(returnStr);
        AjaxJson jon = new AjaxJson();
        jon.setObj(returnStr);
        return returnStr;   
    }
    /**
     * 帖子评论回复
     *
     * @throws JSONException
     */
    @RequestMapping(params = "shareFrom")
    @ResponseBody
    public AjaxJson shareFrom(String post_reply_content,String postid,String post_type_id, ModelMap modelMap, HttpServletRequest request) throws JSONException {
        String caseId = "";
            //取用户信息
            user = (User) request.getSession().getAttribute("wx_user_info");
                HashMap<String, String> params = new HashMap<>();
                //帖子ID
                params.put(CallServiceKey.V_POST_ID.getKey(), postid);
                //评论内容
                params.put(CallServiceKey.V_POST_REPLY_CONTENT.getKey(),URLDecoder.decode(post_reply_content,"utf-8"));
                //评论者ID
                params.put(CallServiceKey.V_POST_REPLY_USER_ID.getKey(),user.getUserID());
                //评论者名称
                params.put(CallServiceKey.V_POST_REPLY_USER_NAME.getKey(),user.getRealName());
                //帖子类型ID
                params.put(CallServiceKey.V_POST_TYPE_ID.getKey(),post_type_id);
                String returnStr = "";
                returnStr = SworkCommonServiceImpl.getInstance()
                        .sworkCallService(RequestCode.ADD_BBS_POSTBIZINFO, user.getToken(), params);
                AjaxJson jon = new AjaxJson();
                jon.setObj(returnStr);
        return jon;
    }
    /**
     * 新增帖子
     *
     * @throws JSONException
     */
    @RequestMapping(params = "poatsubmit")
    @ResponseBody
    public AjaxJson poatsubmit(String post_subject_name,String psot_type_id,String post_content, ModelMap modelMap, HttpServletRequest request) throws JSONException {
        String caseId = "";
            //取用户信息
            user = (User) request.getSession().getAttribute("wx_user_info");
                HashMap<String, String> params = new HashMap<>();
                //帖子标题
                params.put(CallServiceKey.V_POST_SUBJECT_NAME.getKey(),URLDecoder.decode(post_subject_name,"utf-8"));
                //帖子内容
                params.put(CallServiceKey.V_POST_CONTENT.getKey(),URLDecoder.decode(post_content,"utf-8"));
                //帖子类型ID
                params.put(CallServiceKey.V_POST_TYPE_ID.getKey(),psot_type_id);
                String returnStr = "";
                returnStr = SworkCommonServiceImpl.getInstance()
                        .sworkCallService(RequestCode.ADD_BBS_POSTINFO, user.getToken(), params);
                AjaxJson jon = new AjaxJson();
                jon.setObj(returnStr);
        return jon;
    }
   

    
}
