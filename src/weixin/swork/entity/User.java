package weixin.swork.entity;

import com.alibaba.fastjson.annotation.JSONField;

/**
 * Created by lee on 2016/3/8.
 */
public class User {
    @JSONField(name="USER_ID")
    private String userID;
    private String token;
    private String departID;
    private String departName;
    @JSONField(name="GRID_ID")
    private String gridID;
    @JSONField(name="USER_REAL_NM")
    private String realName;
    @JSONField(name="ROLE_ID")
    private String roleID;
    @JSONField(name="OPEN_ID")
    private String openID;
    @JSONField(name="ROLE_NAME")
    private String roleName;

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getDepartID() {
        return departID;
    }

    public void setDepartID(String departID) {
        this.departID = departID;
    }

    public String getDepartName() {
        return departName;
    }

    public void setDepartName(String departName) {
        this.departName = departName;
    }

    public String getGridID() {
        return gridID;
    }

    public void setGridID(String gridID) {
        this.gridID = gridID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public String getRoleID() {
        return roleID;
    }

    @Override
    public String toString(){
       return token+" "+userID+" "+realName;
    }

    public String getOpenID() {
        return openID;
    }

    public void setOpenID(String openID) {
        this.openID = openID;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }
}
