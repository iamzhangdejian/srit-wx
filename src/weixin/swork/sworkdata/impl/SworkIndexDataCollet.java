package weixin.swork.sworkdata.impl;

import weixin.swork.common.SworkConstant;
import weixin.swork.common.SworkDataContent;
import weixin.swork.sworkdata.SworkDataCollectI;

import java.util.Map;

/**
 * Created by dejian.zhang on 2016/2/25.
 */
public class SworkIndexDataCollet implements SworkDataCollectI {
    @Override
    public void collect(Map<String, String> params) {
        String res = SworkConstant.SWORK_ROOT_PATH + "/" + params.get(SworkConstant.SWORK_STYLE_NAME);
        SworkDataContent.put(SworkConstant.BASE, "");
    }
}
