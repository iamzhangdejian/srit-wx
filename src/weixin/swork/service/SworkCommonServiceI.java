package weixin.swork.service;

import weixin.swork.entity.AttachBase;
import weixin.swork.entity.User;

import java.util.HashMap;

/**
 * Created by dejian.zhang on 2016/3/3.
 */
public interface SworkCommonServiceI {
    public User sworkUserOauthService(String openId);

    public User sworkLoginService(String name, String passwd);

    public String sworkCallService(String requestCode, String token, HashMap<String, String> params);

    public String sworkAttachLoad(String token, AttachBase attach);
}
