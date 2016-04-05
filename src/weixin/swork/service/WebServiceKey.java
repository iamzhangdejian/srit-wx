package weixin.swork.service;

/**
 * Created by lee on 2016/3/8.
 */
public enum WebServiceKey {
    URL("url");
    private String key;
    private WebServiceKey(String key){
        this.key = key;
    }

    public String getKey(){
        return key;
    }
}
