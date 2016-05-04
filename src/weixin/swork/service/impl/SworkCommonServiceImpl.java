package weixin.swork.service.impl;

import com.alibaba.druid.support.json.JSONParser;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.apache.axiom.soap.SOAP11Constants;
import org.apache.axis2.Constants;
import org.apache.axis2.addressing.EndpointReference;
import org.apache.axis2.client.Options;
import org.apache.axis2.rpc.client.RPCServiceClient;
import org.apache.axis2.transport.http.HTTPConstants;
import org.jeecgframework.core.util.JSONHelper;
import org.jeecgframework.core.util.PropertiesUtil;
import weixin.swork.entity.AttachBase;
import weixin.swork.entity.User;
import weixin.swork.service.CallServiceKey;
import weixin.swork.service.RequestCode;
import weixin.swork.service.SworkCommonServiceI;
import weixin.swork.service.WebServiceKey;
import org.apache.axis2.AxisFault;
import weixin.swork.util.JsonHelper;

import javax.xml.namespace.QName;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Properties;

/**
 * Created by dejian.zhang on 2016/3/3.
 */
public class SworkCommonServiceImpl implements SworkCommonServiceI {

    private String SERVER_ATTACH_URL = "ImageManager/services/AttachLoad?wsdl";
    private String SERVER_URL_LOGIN = "NetGridWebService/services/UserManager?wsdl";//NetGridWebService
    private String SERVER_URL_LOGIN_NAMESPACE = "http://login.gridwebservice.srit.com";
    private String SERVER_URL_OTHER = "NetGridWebService/services/WebService?wsdl";
    private String SERVER_URL_OTHER_NAMESPACE = "services/WebService";
    private String URL = "";
//    private String SERVER_URL_downLoad="http://file.api.weixin.qq.com/cgi-bin/media/get?access_token=" + access_token + "&media_id=" + media_id;;
    private static SworkCommonServiceImpl instance;
    private String SERVER_ATTACH_NAMESPACE = "http://impl.common.service.srit.com";

    private SworkCommonServiceImpl(){}
    public static SworkCommonServiceImpl getInstance() {
        if (instance==null) {
            instance = new SworkCommonServiceImpl();
            instance.init();
        }
        return instance;
    }

    @Override
    public User sworkUserOauthService(String openId) {
        HashMap<String, String> params = new HashMap<>();
        params.put(CallServiceKey.OPENID.getKey(), openId);
        String userStr = sworkCallService(RequestCode.OAUTH, "", params);
        User user = null;
        if (userStr!=null&&userStr.length()!=0){
            user = JSON.parseObject(userStr, User.class);
        }
        return user;
    }

    @Override
    public User sworkLoginService(String name, String passwd) {
        User user = new User();
        String result = login(name, passwd);
        result = result.trim();
        if(result.length()==0) return null;
        String[] ids = result.split(",");
        int i = 0;
        user.setToken(ids[i++]);
        user.setRoleID(ids[i]);
        user.setUserID(ids[i++]);
        user.setRealName(ids[i++]);
        user.setDepartID(ids[++i]);
        return user;
    }

    @Override
    public String sworkCallService(String requestCode, String token, HashMap<String, String> params) {
        String paraStr;
        params = JsonHelper.translateKeys(params,"callservice.properties");
        JSONObject object = new JSONObject();
        for (String key:params.keySet()){
            object.put(key,params.get(key));
        }
        object.put(CallServiceKey.OPCODE.getKey(), requestCode);
        Object[] parameters = new Object[]{token,object.toJSONString()};
        String methodName = "callService";
        return this.ConnectRPC(this.SERVER_URL_OTHER,this.SERVER_URL_OTHER_NAMESPACE,methodName, parameters);
    }

    @Override
    public String sworkAttachLoad(String token, AttachBase attach) {
        Object[] parameters = new Object[]{attach, token};
        String methodName = "creatAttachToLocalDB";
        return this.ConnectRPC(SERVER_ATTACH_URL,SERVER_ATTACH_NAMESPACE,methodName, parameters);
    }


    public void init(){
        PropertiesUtil properties = new PropertiesUtil("webservice.properties");
        URL = properties.readProperty(WebServiceKey.URL.getKey());
        SERVER_URL_LOGIN = URL + "/" + SERVER_URL_LOGIN;
        SERVER_URL_OTHER = URL + "/" + SERVER_URL_OTHER;
        SERVER_ATTACH_URL = URL + "/" + SERVER_ATTACH_URL;
        if(!this.SERVER_URL_OTHER_NAMESPACE.startsWith("http:")){
            this.SERVER_URL_OTHER_NAMESPACE = URL + "/" + this.SERVER_URL_OTHER_NAMESPACE;
        }
    }
    public String login(String userName,String password){
        Object[] parameters = new Object[]{userName,password,"","",""};
        String methodName = "loginAndroidNew";
        return this.ConnectRPC(this.SERVER_URL_LOGIN,this.SERVER_URL_LOGIN_NAMESPACE,methodName, parameters);
    }

    private Options buildOptions(String action, String methodName, EndpointReference targetEPR){
        Options options = new Options();
        options.setSoapVersionURI(SOAP11Constants.SOAP_ENVELOPE_NAMESPACE_URI);
        options.setAction(action+methodName);
        options.setTo(targetEPR);
        options.setTransportInProtocol(Constants.TRANSPORT_HTTP);
        options.setProperty(HTTPConstants.CHUNKED, "false");//设置不受限制.
        options.setProperty(Constants.Configuration.HTTP_METHOD, HTTPConstants.HTTP_METHOD_POST);
        return options;

    }
    public String ConnectRPC(String url,String nameSpace,String methodName,Object[] parameters){
        String rtn = "";
        try{
            RPCServiceClient client = new RPCServiceClient();
            EndpointReference end = new EndpointReference(url);
            Options options = this.buildOptions(nameSpace+"/", methodName, end);
            client.setOptions(options);

            Class<?>[] classes = new Class[] { String[].class };

            QName qname = new QName(nameSpace, methodName);
            //String[] strArray = (String[]) client.invokeBlocking(qname, parameters,classes)[0];
            String[] strArray = (String[])client.invokeBlocking(qname, parameters,classes)[0];
            if(strArray!=null){
                if (strArray.length>0)
                    rtn =  strArray[0];
            }else{
                rtn =  null;
            }
        }catch(AxisFault e){
            e.printStackTrace();
            System.out.println(e.getMessage());
        } catch(Exception ex){
            ex.printStackTrace();
            System.out.println(ex.getMessage());
        }
        return rtn;
    }

}
