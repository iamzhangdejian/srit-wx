package weixin.swork.util;

import freemarker.template.Configuration;
import freemarker.template.Template;

import java.io.File;
import java.io.IOException;
import java.io.StringWriter;
import java.util.Map;

/**
 * Created by lenovo on 2016/2/25.
 */
public class SworkFreemarkerHelper {
    private static Configuration _tplConfig = new Configuration();

    public SworkFreemarkerHelper(String dir) {
        try {
            _tplConfig.setDirectoryForTemplateLoading(new File(dir));
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    /**
     * 解析ftl
     *
     * @param tplName  模板名
     * @param encoding 编码
     * @param paras    参数
     * @return
     */
    public String parseTemplate(String tplName, String encoding,
                                Map<String, Object> paras) {
        try {
            StringWriter swriter = new StringWriter();
            Template mytpl = null;
            mytpl = _tplConfig.getTemplate(tplName, encoding);
            mytpl.process(paras, swriter);
            return swriter.toString();
        } catch (Exception e) {
            e.printStackTrace();
            return e.toString();
        }

    }

    public String parseTemplate(String tplName, Map<String, Object> paras) {
        return this.parseTemplate(tplName, "utf-8", paras);
    }
}
