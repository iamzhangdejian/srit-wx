package weixin.sshare.controller;

import org.apache.log4j.Logger;
import org.json.JSONException;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * 新闻模块控制
 * Created by dejian.zhang on 2016/5/6.
 */
@Scope("prototype")
@Controller
@RequestMapping("/sworkQuesrController")
public class SshareNewsController {
    private Logger log = Logger.getLogger(SshareNewsController.class);

    /**
     * 获取新闻列表信息
     *
     * @param currentPage
     * @param pageSize
     * @param request
     * @return
     */
    @RequestMapping(params = "newslist")
    @ResponseBody
    public String getNewsList(String currentPage, String pageSize, HttpServletRequest request) {


        return null;
    }


    /**
     * 获取新闻详细信息
     *
     * @throws JSONException
     */
    @RequestMapping(params = "newscontent")
    public String getNewsContent(ModelMap modelMap, HttpServletRequest request) throws JSONException {

        return null;
    }

}