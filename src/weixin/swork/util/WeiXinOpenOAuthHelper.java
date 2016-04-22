package weixin.swork.util;

import net.sf.json.JSONObject;
import org.jeecgframework.core.util.LogUtil;
import weixin.guanjia.core.util.WeixinUtil;

import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;

/**
 * Created by dejian.zhang on 2016/3/3.
 */
public class WeiXinOpenOAuthHelper {

    public static String WEB_OAUTH_URL = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=APPID&redirect_uri=REDIRECT_URI&response_type=code&scope=SCOPE&state=STATE#wechat_redirect";
    public static String WEB_OAUTH_ACCESSTOKEN_URL = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code";

    public final static String SCOPE_BASE = "snsapi_base";
    public final static String SCOPE_USERINFO = "snsapi_userinfo";

    public static WeiXinOpenOAuthHelper weiXinOpenOAuthHelper;

    public static WeiXinOpenOAuthHelper getInstance() {
        if (weiXinOpenOAuthHelper == null) {
            weiXinOpenOAuthHelper = new WeiXinOpenOAuthHelper();
        }
        return weiXinOpenOAuthHelper;
    }

    /**
     * 获取code
     * code 认证code值
     *
     * @param appid
     * @return
     */
    public String getCode(String appid, String httprequestUrl, HttpServletResponse response) {
        try {
            String web_oauth_url = WEB_OAUTH_URL.replace("APPID", appid);
            web_oauth_url = web_oauth_url.replace("SCOPE", SCOPE_USERINFO);
            web_oauth_url = web_oauth_url.replace("STATE", "1");
            web_oauth_url = web_oauth_url.replace("REDIRECT_URI", java.net.URLEncoder.encode(httprequestUrl, "UTF-8"));
            System.out.println("提交微信平台验证的服务地址=>>" + web_oauth_url);
            response.sendRedirect(web_oauth_url);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return "";
    }

    /**
     * 获取openId
     * code 认证code值
     *
     * @param code
     * @return
     */
    public String getOpenID(String appid, String secret, String code) {
        String openId = null;
        //String access_token = null;
        //String refresh_token = null;
        String expires_in = null;

        String web_oauth_accesstken_url = WEB_OAUTH_ACCESSTOKEN_URL.replace("CODE", code).replace("APPID", appid).replace("SECRET", secret);
        JSONObject web_oauth_json = WeixinUtil.httpRequest(web_oauth_accesstken_url, "GET", null);
        if (null != web_oauth_json) {
            try {
                openId = web_oauth_json.getString("openid");
                //access_token = web_oauth_json.getString("access_token");
                //refresh_token = web_oauth_json.getString("refresh_token");
                expires_in = web_oauth_json.getString("expires_in");
            } catch (Exception e) {
                //获取jsapi凭证失败
                String wrongMessage = "获取用户openid:{" + (web_oauth_json.containsKey("errcode") ? web_oauth_json.get("errcode") : "") + "} errmsg:{" + (web_oauth_json.containsKey("errmsg") ? web_oauth_json.getString("errmsg") : "") + "}";
                LogUtil.info(wrongMessage);
            }
        }
        //System.out.println("code:" + openId + ",access_token:" + access_token + ",refresh_token:" + refresh_token + "expires_in:" + expires_in);
        //System.out.println("code:" + openId + "expires_in:" + expires_in);

        return openId;
    }


}
