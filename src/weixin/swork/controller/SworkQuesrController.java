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
import weixin.swork.entity.Upload;
import weixin.swork.entity.User;
import weixin.swork.service.CallServiceKey;
import weixin.swork.service.RequestCode;
import weixin.swork.service.impl.SworkCommonServiceImpl;
import weixin.swork.util.JsonHelper;
import weixin.swork.util.Wechat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.*;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * 登陆主界面控制器
 *
 * @author dejian.zhang
 */
@Scope("prototype")
@Controller
@RequestMapping("/sworkQuesrController")
public class SworkQuesrController extends BaseController {

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
     * 获取树形数据
     *
     * @param tree_type 1：发生区域 2:问题类别
     * @param request
     * @return
     */
    @RequestMapping(params = "getTree")
    @ResponseBody
    public AjaxJson getTreeJson(String tree_type, HttpServletRequest request) {
        System.out.println("tree_type==========" + tree_type);
        user = (User) request.getSession().getAttribute("wx_user_info");
        HashMap<String, String> params = new HashMap<String, String>();
        // 获取案件类别编码
        params.put(CallServiceKey.SYNC_TYPE.getKey(), tree_type);
        String rCode = "";
        if ("1".equals(tree_type)) {
            rCode = RequestCode.GET_REGION_TREE;

        } else if ("2".equals(tree_type)) {
            rCode = RequestCode.GET_TYPE_TREE;
        }
        System.out.println("rCode=============" + rCode);
        String token = user.getToken();
        if (token == null || "".equals(token)) {
            token = "";
        }
        String returnStr = SworkCommonServiceImpl.getInstance()
                .sworkCallService(rCode, token, params);
        returnStr = JsonHelper.getTreeNodeString(returnStr);
        AjaxJson jon = new AjaxJson();
        jon.setObj(returnStr);
        return jon;
    }

    /**
     * 问题上报表单提交
     *
     * @throws JSONException
     */
    @RequestMapping(params = "questForm")
    public String questForm(QuestFormInfo questFormInfo, ModelMap modelMap, HttpServletRequest request) throws JSONException {
        System.out.println(questFormInfo);

        String caseId = "";
        if (questFormInfo != null && !"".equals(questFormInfo)) {
            //取用户信息
            user = (User) request.getSession().getAttribute("wx_user_info");
            if (questFormInfo.getQuestType() != null && !"".equals(questFormInfo.getQuestType())) {
                HashMap<String, String> params = new HashMap<>();
                //绑定字段
                //问题类型
                params.put(CallServiceKey.CASE_TYPE_ID.getKey(), questFormInfo.getQuestType());
                //事发区域
                params.put(CallServiceKey.GRID_ID.getKey(), questFormInfo.getEventRegionId());
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
                if (a.get("v_case_id").equals("-1")) {       
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

        return "weixin/swork/questr";
    }

    /**
     * inputstream转byte[]方法
     *
     * @param in
     * @return
     * @throws IOException
     */
    public static byte[] toByteArray(InputStream in) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        byte[] buffer = new byte[1024 * 4];
        int n = 0;
        while ((n = in.read(buffer)) != -1) {
            out.write(buffer, 0, n);
        }
        return out.toByteArray();
    }

    /**
     * 附件上传
     *
     * @param request
     * @param session
     * @param files
     * @return
     */
    @RequestMapping(params = "upLoadold")
    @ResponseBody
    public Object handleFormUpload(
            HttpServletRequest request,
            HttpSession session,
            @RequestParam(value = "file", required = false) MultipartFile[] files) {
        System.out.println("upLoad==========附件上传");
        user = (User) request.getSession().getAttribute("wx_user_info");
        String attStr = fileUploadServer(files);
        System.out.println("upLoad==========上传结果：" + attStr);
        return attStr;

    }

    /**
     * @param request
     * @return
     * @throws IllegalStateException
     * @throws IOException
     */
    @RequestMapping(params = "upLoad")
    @ResponseBody
    public Map<Object, Object> fileUpload(HttpServletRequest request, HttpServletResponse response,Model model) throws IllegalStateException, IOException {
        user = (User) request.getSession().getAttribute("wx_user_info");
        BufferedInputStream fileIn = new BufferedInputStream(request.getInputStream());
        String fn = new Date().getTime() + "_" + request.getParameter("name");
        byte[] buf = new byte[1024];
//        System.out.println("request.getInputStream()===>" + request.getInputStream());
        //接收文件上传并保存到
        String filePath = request.getSession().getServletContext().getRealPath("/attach/");
        File files = new File(filePath+"\\" + fn);
        Map<Object, Object> map=new HashMap<>();
        map.put("files", files);
        System.out.println("files:===>"+files);
        BufferedOutputStream fileOut = new BufferedOutputStream(new FileOutputStream(files));
        while (true) {
            // 读取**
            int bytesIn = fileIn.read(buf, 0, 1024);
            if (bytesIn == -1) {
                break;
            } else {
                fileOut.write(buf, 0, bytesIn);
            }
        }
        InputStream in = new FileInputStream(files);
        byte[] data = toByteArray(in);
        in.close();
        FileOutputStream outs = new FileOutputStream(files);
        outs.write(data);
//        System.out.println("data+++++++++++++" + data);
        outs.close();
        //传入借口数据对象  返回ID
        AttachBase attachBase = new AttachBase();
        attachBase.setBinaryInfo(data);
        attachBase.setAttachInfoisUrl("0");
        attachBase.setAttachType("3");// 视频4 音频5
        attachBase.setAttachExtendName("jpg");
        attachBase.setAttachSize(String.valueOf(files.length()));
        String attStr = SworkCommonServiceImpl.getInstance().sworkAttachLoad(user.getToken(), attachBase);
        map.put("attStr", attStr);
        System.out.println(attStr);
        files.length();
        fileOut.flush();
        fileOut.close();
        return map;
    }
    
    
    @RequestMapping(params="uploadSave")
	  public void uploadSave(HttpServletRequest request, Model model) {
	    Upload upload = new Upload(request, "jpg,png,gif", 2000000L);
	    String iconNew = "";
	    if (upload.save("icon"))
	    {
	      iconNew = upload.getSaveFile();
	    }
	    String host = request.getScheme() + "://" + request.getServerName();
	    String path = request.getContextPath();
	    path = host + path + iconNew;

	    String pa = request.getSession().getServletContext().getRealPath("");

	    Map fileMap = new HashMap();
	    fileMap.put("userfile", pa + iconNew);
	    PropertiesUtil properties = new PropertiesUtil("sysConfig.properties");
   	 	String appId = properties.readProperty("appId");
	    String ret = Wechat.UploadImg(appId, user.getToken(), null, fileMap);
	  //传入借口数据对象  返回ID
        AttachBase attachBase = new AttachBase();
        attachBase.setBinaryInfo(ret.getBytes());
        attachBase.setAttachInfoisUrl("0");
        attachBase.setAttachType("3");// 视频4 音频5
        attachBase.setAttachExtendName("jpg");
        attachBase.setAttachSize(String.valueOf(ret.length()));
        String attStr = SworkCommonServiceImpl.getInstance().sworkAttachLoad(user.getToken(), attachBase);
        System.out.println(attStr);
	  }
    
    
    
    
    

    /**
     * 调用系统服务进行附件上传
     *
     * @param files
     * @return
     */
    private String fileUploadServer(MultipartFile[] files) {
        int i = 0;
        String res = "";
        for (MultipartFile file : files) {
            if (!file.isEmpty()) {
                try {
                    i++;
                    byte[] bytes = file.getBytes();
                    AttachBase attachBase = new AttachBase();
                    attachBase.setBinaryInfo(bytes);
                    attachBase.setAttachInfoisUrl("0");
                    attachBase.setAttachType("3");// 视频4 音频5
                    attachBase.setAttachExtendName("jpg");
                    attachBase.setAttachSize(String.valueOf(file.getSize()));
                    System.out.println("bytes:" + file.getBytes() + "String.valueOf(file.getSize())" + String.valueOf(file.getSize()));
                    String attachId = SworkCommonServiceImpl.getInstance().sworkAttachLoad(user.getToken(), attachBase);
                    if (i == 1) {
                        res = attachId;
                    } else {
                        res = res + "," + attachId;
                    }
                } catch (IOException e) {
                    res = "上传失败!";
                }
            } else {
                res = "附件信息为空!";
            }
        }
        return res;
    }

    /**
     * 附件上传到服务器工程目录下
     *
     * @param files
     * @return
     */
    public String fileUpload(HttpServletRequest request, MultipartFile[] files) {
        int i = 0;
        String res = "";

        Calendar now = Calendar.getInstance();
        int year = now.get(Calendar.YEAR);
        int month = now.get(Calendar.MONTH) + 1;
        int day = now.get(Calendar.DAY_OF_MONTH);

        for (MultipartFile file : files) {
            if (!file.isEmpty()) {
                try {
                    i++;
                    byte[] bytes = file.getBytes();
                    AttachBase attachBase = new AttachBase();
                    attachBase.setBinaryInfo(bytes);
                    attachBase.setAttachInfoisUrl("0");
                    attachBase.setAttachType("3");// 视频4 音频5
                    attachBase.setAttachExtendName("jpg");
                    attachBase.setAttachSize(String.valueOf(file.getSize()));
                    String attachId = SworkCommonServiceImpl.getInstance().sworkAttachLoad(user.getToken(), attachBase);
                    if (i == 1) {
                        res = attachId;
                    } else {
                        res = res + "," + attachId;
                    }
                    String filename = new Date().getTime() + "_"
                            + file.getOriginalFilename();
                    System.out
                            .println(request
                                    .getSession()
                                    .getServletContext()
                                    .getRealPath(
                                            "/attach/" + year + "/" + month
                                                    + "/" + day));
                    FileUtils.writeByteArrayToFile(
                            new File(request
                                    .getSession()
                                    .getServletContext()
                                    .getRealPath(
                                            "/attach/" + year + "/" + month
                                                    + "/" + day), filename),
                            bytes);
                } catch (IOException e) {
                    res = "上传失败";
                }
            }
        }
        return res;
    }
    
}
