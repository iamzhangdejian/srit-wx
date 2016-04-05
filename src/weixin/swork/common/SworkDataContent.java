package weixin.swork.common;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by ejian.zhang on 2016/2/25.
 */
public class SworkDataContent {
    public static final String SWORK_CONTENT_KEY = "sworkData";
    //在swork数据中，加上一层封装
    private static final Map<String,Object> sworkContent = new HashMap<String,Object>();
    private static final Map<String,Object> sworkData = new HashMap<String,Object>();

    /**
     * 保存数据到swork容器
     */
    public static void put(String key,Object object){
        sworkData.put(key, object);
    }

    /**
     * 从swork容器，取值
     * @param key
     */
    public static Object get(String key){
        return sworkData.get(key);
    }

    /**
     * 获取swork容器
     * @return
     */
    public static Map<String,Object> loadContent(){
        sworkContent.put(SWORK_CONTENT_KEY, sworkData);
        return sworkContent;
    }
}
