package weixin.swork.entity;

/**
 * Created by lee on 2016/3/14.
 */
public class AttachBase  implements java.io.Serializable {
    private java.lang.String attachExt1;
    private java.lang.String attachExt2;
    private java.lang.String attachExtendName;
    private java.lang.String attachInfoisUrl;
    private java.lang.String attachName;
    private java.lang.String attachNewUrl;
    private java.lang.String attachOwner;
    private java.lang.String attachSize;
    private java.lang.String attachSourceUrl;
    private java.lang.String attachType;
    private byte[] binaryInfo;
    private java.lang.String retURLType;

    public String getAttachExt1() {
        return attachExt1;
    }

    public void setAttachExt1(String attachExt1) {
        this.attachExt1 = attachExt1;
    }

    public String getAttachExt2() {
        return attachExt2;
    }

    public void setAttachExt2(String attachExt2) {
        this.attachExt2 = attachExt2;
    }

    public String getAttachExtendName() {
        return attachExtendName;
    }

    public void setAttachExtendName(String attachExtendName) {
        this.attachExtendName = attachExtendName;
    }

    public String getAttachInfoisUrl() {
        return attachInfoisUrl;
    }

    public void setAttachInfoisUrl(String attachInfoisUrl) {
        this.attachInfoisUrl = attachInfoisUrl;
    }

    public String getAttachName() {
        return attachName;
    }

    public void setAttachName(String attachName) {
        this.attachName = attachName;
    }

    public String getAttachNewUrl() {
        return attachNewUrl;
    }

    public void setAttachNewUrl(String attachNewUrl) {
        this.attachNewUrl = attachNewUrl;
    }

    public String getAttachOwner() {
        return attachOwner;
    }

    public void setAttachOwner(String attachOwner) {
        this.attachOwner = attachOwner;
    }

    public String getAttachSize() {
        return attachSize;
    }

    public void setAttachSize(String attachSize) {
        this.attachSize = attachSize;
    }

    public String getAttachSourceUrl() {
        return attachSourceUrl;
    }

    public void setAttachSourceUrl(String attachSourceUrl) {
        this.attachSourceUrl = attachSourceUrl;
    }

    public String getAttachType() {
        return attachType;
    }

    public void setAttachType(String attachType) {
        this.attachType = attachType;
    }

    public byte[] getBinaryInfo() {
        return binaryInfo;
    }

    public void setBinaryInfo(byte[] binaryInfo) {
        this.binaryInfo = binaryInfo;
    }

    public String getRetURLType() {
        return retURLType;
    }

    public void setRetURLType(String retURLType) {
        this.retURLType = retURLType;
    }
}
