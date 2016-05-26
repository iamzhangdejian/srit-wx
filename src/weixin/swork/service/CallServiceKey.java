package weixin.swork.service;

/**
 * Created by lee on 2016/3/8.
 */
public enum CallServiceKey {
    //事项类别
    CASE_TYPE_ID("case_type_id"),
    //案件描述
    CASE_DESC("case_desc"),
    //位置描述
    CASE_POS_DESC("case_pos_desc"),
    //影响范围
    CASE_EFFECT_DESC("case_effect_desc"),
    //影响范围单位
    CASE_EFFECT_LID("case_effect_lid"),
    //问题程度
    DAMAGE_LID("damage_lid"),
    //问题程度级别
    CASE_LID("case_lid"),
    //网格
    GRID_ID("grid_id"),
    //上报时间
    OCCUR_TIME("occur_time"),
    //X坐标
    POS_X("pos_x"),
    //Y坐标
    POS_Y("pos_y"),
    //附件ID
    RPT_ATTACH("rpt_attach"),
    //操作码
    OPCODE("opCode"),
    //openid
    OPENID("openid"),
    //电话号码
    PHONE_NUM("phone_num"),
    //用户密码
    PASSWORD("password"),
    //用户名称
    USER_NAME("user_name"),
    //邮箱名称
    EMAIL_ADDRESS("email"),
    //邮箱名称
    SYNC_TYPE("sync_type"),
    //分页参数-当前页
    CURRENT_PAGE("current_page"),
    //分页参数-总页数
    PAGE_SIZE("page_size"),
    //核查核实type——id
    CASE_BIZ_TYPE_ID("case_biz_type_id"),
    CASE_BIZ_SN("case_biz_sn"),
    //反馈描述
    VERIFY_EXAMINE_DESC("verify_examine_desc"),
    //反馈备注
    VERIFY_EXAMINE_REMARKS("verify_examine_remarks"),
    //反馈结果
    OP_RESULT_ID("op_result_id"),
    //核查核实附件ID
    ATTACH_LIST("attach_list"),
    //案件CASE_ID
    CASE_ID("case_id"),
    //返回值
    RESULT("result"),
    //新闻id
    NEWS_ID("news_id"),
    //主题
    V_POST_SUBJECT_NAME("v_post_subject_name"),
    //主题编码
    V_POST_TYPE_ID("v_post_type_id"),
    //主题编码筛选条件
    POST_TYPE_ID("post_type_id"),
    //帖子内容
    V_POST_CONTENT("v_post_content"),
    //上报人id
    V_POST_RPT_USER_ID("v_post_rpt_user_id"),
    //上报人姓名
    V_POST_RPT_USER_NAME("v_post_rpt_user_name"),
    //帖子id筛选条件
    POST_ID("post_id"),
    V_POST_ID("v_post_id"),
    //品论内容
    V_POST_REPLY_CONTENT("v_post_reply_content"),
    //评论者id
    V_POST_REPLY_USER_ID("v_post_reply_user_id"),
    //评论者姓名
    V_POST_REPLY_USER_NAME("v_post_reply_user_name"),;

    private String key;

    private CallServiceKey(String key) {
        this.key = key;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }
}
