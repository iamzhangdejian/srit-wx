package weixin.swork.controller;

/**
 * Created by dejian.zhang on 2016/2/25.
 */

import net.sf.json.JSONObject;

import org.apache.tools.ant.types.CommandlineJava.SysProperties;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.util.LogUtil;
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.core.util.oConvertUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import weixin.guanjia.core.util.WeixinUtil;
import weixin.p3.oauth2.def.WeiXinOpenConstants;
import weixin.swork.common.SworkConstant;
import weixin.swork.common.SworkDataContent;
import weixin.swork.sworkdata.SworkDataCollectI;
import weixin.swork.sworkdata.impl.SworkIndexDataCollet;
import weixin.swork.util.SworkFreemarkerHelper;
import weixin.swork.util.WeiXinOpenOAuthHelper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

/**
 * SWORK微站核心控制器
 *
 * @author dejian.zhang
 */
@Controller
@RequestMapping("/sworkController")
public class SworkController extends BaseController {

    /**
     * swork 数据收集器配置
     */
    private static Map<String, Object> dataCollectContent = new HashMap<String, Object>();

    static {
        //载swork首页数据
        dataCollectContent.put(SworkConstant.SWORK_PAGE_INDEX, new SworkIndexDataCollet());

    }

    /**
     * 根据访问入口获取rootUrl
     *
     * @param request
     * @param page
     * @return
     */
    private String getRootUrl(HttpServletRequest request, String page) {
        String rootUrl = null;
        if (SworkConstant.SWORK_PAGE_MAIN.equals(page) || SworkConstant.SWORK_PAGE_CHANGERULE.equals(page) || SworkConstant.SWORK_PAGE_PERSON.equals(page) || SworkConstant.SWORK_PAGE_MPOINT.equals(page) || SworkConstant.SWORK_PAGE_INDEX.equals(page) || SworkConstant.SWORK_PAGE_QUESR.equals(page) || SworkConstant.SWORK_PAGE_QUESPG.equals(page)) {
            // index menu article
            rootUrl = request.getSession().getServletContext().getRealPath(SworkConstant.SWORK_ROOT_URL);
        } else if (SworkConstant.SWORK_PHOTO_ALBUM.equals(page) || SworkConstant.SWORK_PHOTO.equals(page)) {
            //photoAlbum photo
            rootUrl = request.getSession().getServletContext().getRealPath(SworkConstant.SWORK_PHOTO_ROOT_URL);
        } else {
            //throw IllegalArgumentException()

        }
        return rootUrl;
    }

    /**
     * 页面调整引擎
     *
     * @param request
     * @param response
     * @param page     模板页
     */
    @RequestMapping(params = "goPage")
    public void goPage(HttpServletRequest request,
                       HttpServletResponse response, @RequestParam String page) {
        Map<String, String> params = paramsToMap(request);

        String code = request.getParameter("code");
        if (code != null && !"".equals(code)) {
            System.out.println("code=======================>>" + code);
            String openId = WeiXinOpenOAuthHelper.getInstance().getOpenID(code);
            System.out.println("openId=====================>>" + openId);
        }

        //-------------------------------------------------------------------------
        //获取站点的网站样式风格 模块根路径
        String rootUrl = getRootUrl(request, page);
        String templateName = SworkConstant.SWORK_DEFAULT_TEMPLATE;
        String styleUrl = rootUrl + SworkConstant.SWORK_DEFAULT_STYLE;

        params.put(SworkConstant.SWORK_STYLE_NAME, templateName);
        //-------------------------------------------------------------------------
        SworkFreemarkerHelper sworkFreemarkerHelper = new SworkFreemarkerHelper(styleUrl);

        //调用对应的数据收集器数据
        if (dataCollectContent.get(page) != null) {
            SworkDataCollectI sworkDataCollect = (SworkDataCollectI) dataCollectContent.get(page);
            sworkDataCollect.collect(params);
        }
        //将所有容器的数据访问，加上前缀sworkData，注意大小写
        String html = sworkFreemarkerHelper.parseTemplate(page + SworkConstant.SWORK_TEMPL_INDEX, SworkDataContent.loadContent());
        response.setContentType("text/html");
        response.setHeader("Cache-Control", "no-store");
        PrintWriter writer;
        try {
            writer = response.getWriter();
            System.out.println(html);
            writer.println(html);
            writer.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void authServer(String code) {
        String web_oauth_url = WeiXinOpenConstants.WEB_OAUTH_ACCESSTOKEN_URL.replace("APPID", code);

    }

    /**
     * 封装request请求参数到Map里
     *
     * @param request
     * @return
     */
    private Map<String, String> paramsToMap(HttpServletRequest request) {
        Map<String, String> params = new HashMap<String, String>();
        // 得到枚举类型的参数名称，参数名称若有重复的只能得到第一个
        Enumeration em = request.getParameterNames();
        while (em.hasMoreElements()) {
            String paramName = (String) em.nextElement();
            String paramValue = request.getParameter(paramName);
            // 形成键值对应的map
            params.put(paramName, paramValue);
        }
        if (!params.containsKey(ACCOUNTID)) {
            params.put(ACCOUNTID, ResourceUtil.getWeiXinAccountId());
        }
        return params;
    }

}
