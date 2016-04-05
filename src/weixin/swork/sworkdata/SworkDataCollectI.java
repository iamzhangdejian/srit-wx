package weixin.swork.sworkdata;

import java.util.Map;

/**
 * Created by dejian.zhang on 2016/2/25.
 */
public interface SworkDataCollectI {

    /**
     * 通过SWORK数据收集器方法，返回用户需要的数据
     */
    public void collect(Map<String, String> params);


}
