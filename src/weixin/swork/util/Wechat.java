package weixin.swork.util;

import net.sf.json.JSONObject;

import org.jeecgframework.core.util.LogUtil;
import org.jeecgframework.core.util.PropertiesUtil;
import org.springframework.ui.Model;

import weixin.guanjia.core.util.WeixinUtil;
import weixin.p3.oauth2.def.WeiXinOpenConstants;
import weixin.swork.controller.SworkQuesrController;
import weixin.swork.entity.AttachBase;
import weixin.swork.entity.User;
import weixin.swork.service.impl.SworkCommonServiceImpl;

import javax.activation.MimetypesFileTypeMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.ProtocolException;
import java.net.URL;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.*;


public class Wechat {

    private String _accesstoken;
    private Date _accesstoken_date;

    private String _jsticket;
    private Date _jsticket_date;
    private User user;

    /**
     * @param token
     * @param signature//    微信加密签名
     * @param timestamp//    时间戳
     * @param nonce//        随机数
     * @param echostr//随机字符串
     * @return
     */
    public boolean vaild(String token, String signature, String timestamp, String nonce, String echostr) {
        //验证URL真实性    
        List<String> list = new ArrayList<String>();
        list.add(token);
        list.add(timestamp);
        list.add(nonce);
        //1. 将token、timestamp、nonce三个参数进行字典序排序
        Collections.sort(list, new Comparator<String>() {
            public int compare(String o1, String o2) {
                return o1.compareTo(o2);
            }
        });
        //2. 将三个参数字符串拼接成一个字符串进行sha1加密
        String temp = SHA1(list.get(0) + list.get(1) + list.get(2));
        return temp.equalsIgnoreCase(signature);
    }
    
//    获取验证wx.config是否通过的方法的参数
    public static Map<String , String> wxConfig(HttpServletRequest request,String endUrl){
    	PropertiesUtil properties = new PropertiesUtil("sysConfig.properties");
        String appId = properties.readProperty("appId");
        String appSecret = properties.readProperty("appSecret");
//        String urlEnd = "?hisDetail";
        String urlEnd = endUrl;
        // 动态获取url
        // request.getSchema()可以返回当前页面使用的协议，http 或是 https;
        // request.getServerName()可以返回当前页面所在的服务器的名字;
        // request.getServerPort()可以返回当前页面所在的服务器使用的端口,就是80;
        // request.getContextPath()可以返回当前页面所在的应用的名字;
        String url = request.getScheme() + "://" + request.getServerName()
                + request.getRequestURI()
                + urlEnd;
        System.out.println("url====>" + url);
        Map map = new Wechat().jsConfig(url, appId, appSecret);
//        model.addAttribute("map", map);
        return map;
    }
//    获取验证wx.config是否通过的方法的参数
    public static Map<String , String> suiConfig(HttpServletRequest request,String endUrl){
    	PropertiesUtil properties = new PropertiesUtil("sysConfig.properties");
    	String appId = properties.readProperty("appId");
    	String appSecret = properties.readProperty("appSecret");
//        String urlEnd = "?hisDetail";
    	String urlEnd = endUrl;
    	
    	System.out.println("urlend====>" + endUrl);
    	Map map = new Wechat().jsConfig(endUrl, appId, appSecret);
//        model.addAttribute("map", map);
    	return map;
    }
    
    
//    从微信服务器获取上传照片并保存到本地服务器方法
    public static String fileUpload(String	media_id,String userToken,String filePath) throws IOException{
   	 
//    	获取appid,aoosecret
    	PropertiesUtil properties = new PropertiesUtil("sysConfig.properties");
         String appId = properties.readProperty("appId");
         String appSecret = properties.readProperty("appSecret");

	    System.out.println("media_id: " + media_id);
	    String access_token = new Wechat().getAccessToken(appId,appSecret);
	    InputStream is = null;
	    String url = "http://file.api.weixin.qq.com/cgi-bin/media/get?access_token=" + access_token + "&media_id=" + media_id;
	      URL urlGet = new URL(url);
	      HttpURLConnection conn = (HttpURLConnection)urlGet.openConnection();
	      conn.setRequestMethod("GET");
	      conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
	      conn.setDoOutput(true);
	      conn.setDoInput(true);
	      System.setProperty("sun.net.client.defaultConnectTimeout", "30000");
	      System.setProperty("sun.net.client.defaultReadTimeout", "30000");
	      conn.connect();
	      is = conn.getInputStream();
//	    return "uploadImg";
        BufferedInputStream fileIn = new BufferedInputStream(is);
        String fn = new Date().getTime() + "_"+media_id+".jpg";
        System.out.println("fn=>"+fn);
        byte[] buf = new byte[1024];
//        System.out.println("request.getInputStream()===>" + request.getInputStream());
        //接收文件上传并保存到
        String Path = filePath;
//        String filePath = "d:/attach/";
        File files = new File(Path+"\\"+fn );
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
        byte[] data =new SworkQuesrController().toByteArray(in);
        in.close();
        
        FileOutputStream outs = new FileOutputStream(files);
        outs.write(data);
//        System.out.println("data+++++++++++++" + data);
        outs.close();
      //传入借口数据对象  返回ID
        AttachBase attachBase = new AttachBase();
        System.out.println("data===>"+data);
        attachBase.setBinaryInfo(data);
        
        attachBase.setAttachInfoisUrl("0");
        attachBase.setAttachType("3");// 视频4 音频5
        attachBase.setAttachExtendName("jpg");
        System.out.println("files.length===>"+String.valueOf(files.length()));
        attachBase.setAttachSize(String.valueOf(files.length()));
        String attStr = SworkCommonServiceImpl.getInstance().sworkAttachLoad(userToken, attachBase);
        map.put("attStr", attStr);
//        model.addAttribute("attStr", attStr);
        System.out.println("attStr====>"+attStr);
        files.length();
        fileOut.flush();
        fileOut.close();
        return attStr;
    }
    
    
    
    public static String UploadImg(String appid, String accessToken, Map<String, String> textMap, Map<String, String> fileMap) {
//	    String accessToken = new Wechat().getAccessToken(appid, secret);
//	    user = (User) request.getSession().getAttribute("wx_user_info");
        String postUrl = "https://api.weixin.qq.com/cgi-bin/media/upload?access_token=" + accessToken + "&type=image";

        String res = "";
        HttpURLConnection conn = null;
        String BOUNDARY = "----------参数分隔";
        try {
            URL url = new URL(postUrl);

            conn = (HttpURLConnection) url.openConnection();
            conn.setConnectTimeout(5000);
            conn.setReadTimeout(30000);

            conn.setDoOutput(true);
            conn.setDoInput(true);
            conn.setUseCaches(false);
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Connection", "Keep-Alive");
            conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN; rv:1.9.2.6)");
            conn.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + BOUNDARY);
            OutputStream out = new DataOutputStream(conn.getOutputStream());

            if (textMap != null) {
                StringBuffer strBuf = new StringBuffer();
                Iterator iter = textMap.entrySet().iterator();
                while (iter.hasNext()) {
                    Map.Entry entry = (Map.Entry) iter.next();
                    String inputName = (String) entry.getKey();
                    String inputValue = (String) entry.getValue();
                    if (inputValue == null) {
                        continue;
                    }
                    strBuf.append("\r\n").append("--").append(BOUNDARY).append(
                            "\r\n");
                    strBuf.append("Content-Disposition: form-data; name=\"" +
                            inputName + "\"\r\n\r\n");
                    strBuf.append(inputValue);
                }
                out.write(strBuf.toString().getBytes());
            }

            if (fileMap != null) {
                Iterator iter = fileMap.entrySet().iterator();
                while (iter.hasNext()) {
                    Map.Entry entry = (Map.Entry) iter.next();
                    String inputName = (String) entry.getKey();
                    String inputValue = (String) entry.getValue();
                    if (inputValue == null) {
                        continue;
                    }
                    File file = new File(inputValue);
                    String filename = file.getName();
                    String contentType = new MimetypesFileTypeMap().getContentType(file);

                    if (filename.endsWith(".png")) {
                        contentType = "image/png";
                    }
                    if ((contentType == null) || (contentType.equals(""))) {
                        contentType = "application/octet-stream";
                    }
                    StringBuffer strBuf = new StringBuffer();
                    strBuf.append("\r\n").append("--").append(BOUNDARY).append("\r\n");
                    strBuf.append("Content-Disposition: form-data; name=\"" + inputName + "\"; filename=\"" + filename + "\"\r\n");
                    strBuf.append("Content-Type:" + contentType + "\r\n\r\n");
                    out.write(strBuf.toString().getBytes());
                    DataInputStream in = new DataInputStream(new FileInputStream(file));
                    int bytes = 0;
                    byte[] bufferOut = new byte[1024];
                    while ((bytes = in.read(bufferOut)) != -1) {
                        out.write(bufferOut, 0, bytes);
                    }
                    in.close();
                }
            }
            byte[] endData = ("\r\n--" + BOUNDARY + "--\r\n").getBytes();
            out.write(endData);
            out.flush();
            out.close();

            StringBuffer strBuf = new StringBuffer();
            BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            String line = null;
            while ((line = reader.readLine()) != null) {
                strBuf.append(line).append("\n");
            }
            res = strBuf.toString();
            reader.close();
            reader = null;
        } catch (Exception e) {
            System.out.println("发送POST请求出错。" + postUrl);
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.disconnect();
                conn = null;
            }
        }
        System.out.println("res:" + res);
        return res;
    }


    public String getAccessToken(String appId, String appSecret) {
        String requestUrl = WeixinUtil.access_token_url.replace("APPID", appId).replace("APPSECRET", appSecret);
        JSONObject jsonObject = WeixinUtil.httpRequest(requestUrl, "GET", null);
        String accessToken = "";
        if (null != jsonObject) {
            try {
                accessToken = jsonObject.getString("access_token");
            } catch (Exception e) {
                LogUtil.info("---------------------定时任务异常--【获取api凭证】--------------" + e.toString());
            }
        }
        return accessToken;
    }

    /**
     * 获取js-ticket
     *
     * @param access_token
     */
    private String getJsTicket(String access_token) {//[3].获取jsapi凭证
        String jsapiticket = null;
        try {
            String jsapi_ticket_url = WeiXinOpenConstants.JSAPI_TICKET_URL.replace("ACCESS_TOKEN", access_token);
            JSONObject jsapi_ticket_json = WeixinUtil.httpRequest(jsapi_ticket_url, "GET", null);
            if (null != jsapi_ticket_json) {
                try {
                    jsapiticket = jsapi_ticket_json.getString("ticket");
                    LogUtil.info("定时任务重置超过2小时失效token:" + "获取Jsapiticket成功");
                } catch (Exception e) {
                    //获取jsapi凭证失败
                    LogUtil.info("获取Jsapiticket失败");
                }
            }
        } catch (Exception e) {
            LogUtil.info("---------------------定时任务异常--【获取jsapi凭证】--------------" + e.toString());
        }
        return jsapiticket;
    }

    public Map<String, String> jsConfig(String url, String appId, String appSecret) {
        String timestamp = Long.toString(System.currentTimeMillis() / 1000L);
        Map map = new HashMap();

        String accessToken = getAccessToken(appId, appSecret);
        System.out.println("accessToken===>>" + accessToken);
        String jsapiTicket = "";
        if (accessToken != null && !"".equals(accessToken)) {
            jsapiTicket = getJsTicket(accessToken);
        }
        System.out.println("jsapiTicket===>>" + jsapiTicket);

        map.put("noncestr", getRandomStringByLength(32));
        map.put("jsapi_ticket", jsapiTicket);
        map.put("timestamp", timestamp);
        map.put("url", url);

        map.put("signature", getJsSign(map));
        map.put("appid", appId);

        System.out.println("mapStr:" + map);
        return map;
    }

    /**
     * 获取一定长度的随机字符串
     *
     * @param length 指定字符串长度
     * @return 一定长度的字符串
     */
    public static String getRandomStringByLength(int length) {
        String base = "abcdefghijklmnopqrstuvwxyz0123456789";
        Random random = new Random();
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < length; i++) {
            int number = random.nextInt(base.length());
            sb.append(base.charAt(number));
        }
        return sb.toString();
    }

//    生成signature
    public String getJsSign(Map<String, String> map) {
        ArrayList<String> list = new ArrayList<String>();
        for (Map.Entry<String, String> entry : map.entrySet()) {
            if (entry.getValue() != "") {
                list.add(entry.getKey() + "=" + entry.getValue() + "&");
            }
        }
        int size = list.size();
        String[] arrayToSort = list.toArray(new String[size]);
        Arrays.sort(arrayToSort, String.CASE_INSENSITIVE_ORDER);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < size; i++) {
            sb.append(arrayToSort[i]);
        }
        String result = sb.toString().substring(0, sb.length() - 1);
        result = SHA1(result);
        
        return result.toLowerCase();
    }

    /**
     * SHA1 加密
     *
     * @param str 代加密字符串
     * @return
     */
    public static String SHA1(String str) {
        if (str == null) {
            return null;
        }
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("SHA1");
            messageDigest.update(str.getBytes());
            byte[] b = messageDigest.digest();
            String hs = "";
            String stmp = "";
            for (int n = 0; n < b.length; n++) {
                stmp = (java.lang.Integer.toHexString(b[n] & 0XFF));
                if (stmp.length() == 1)
                    hs = hs + "0" + stmp;
                else
                    hs = hs + stmp;
            }
            return hs.toUpperCase();

            //以下算法结果同上
//            int len = b.length;  
//            StringBuilder buf = new StringBuilder(len * 2);  
//            // 把密文转换成十六进制的字符串形式  
//            char[] HEX_DIGITS = {'0', '1', '2', '3', '4', '5',  
//                    '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'}; 
//            for (int j = 0; j < len; j++) {  
//                buf.append(HEX_DIGITS[(b[j] >> 4) & 0x0f]);  
//                buf.append(HEX_DIGITS[b[j] & 0x0f]);  
//            }  
//            return buf.toString().toUpperCase(); 

        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }


}
