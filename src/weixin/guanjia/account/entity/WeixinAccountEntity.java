package weixin.guanjia.account.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**   
 * @Title: Entity
 * @Description: 微信公众帐号信息
 * @author onlineGenerator
 * @date 2014-05-21 00:53:47
 * @version V1.0   
 *
 */
@Entity
@Table(name = "weixin_account", schema = "")
@SuppressWarnings("serial")
public class WeixinAccountEntity implements java.io.Serializable {
	
	/**主键*/
	private String id;
	/**公众帐号名称*/
	private String accountname;
	/**公众帐号TOKEN*/
	private String accounttoken;
	/**公众微信号*/
	private String accountnumber;
	/**公众原始ID*/
	private String weixin_accountid;
	/**公众号类型*/
	private String accounttype;
	/**电子邮箱*/
	private String accountemail;
	/**公众帐号描述*/
	private String accountdesc;
	/**公众帐号APPID*/
	private String accountappid;
	/**公众帐号APPSECRET*/
	private String accountappsecret;
	/**ACCESS_TOKEN*/
	private String accountaccesstoken;
	/**TOKEN获取时间*/
	private java.util.Date addtoekntime;
	/**所属系统用户**/
	private String userName;
	
	/**微信卡券JS API的临时票据*/
	private String apiticket;
	/**微信卡券JS API的临时票据的获取时间*/
	private java.util.Date apiticketttime;
	/**jsapi调用接口临时凭证*/
	private String jsapiticket;
	/**jsapi调用接口临时凭证的获取时间*/
	private java.util.Date jsapitickettime;
	
	public String getApiticket() {
		return apiticket;
	}

	public void setApiticket(String apiticket) {
		this.apiticket = apiticket;
	}

	public java.util.Date getApiticketttime() {
		return apiticketttime;
	}

	public void setApiticketttime(java.util.Date apiticketttime) {
		this.apiticketttime = apiticketttime;
	}
	@Column(name ="jsapiticket",nullable=true,length=1000)
	public String getJsapiticket() {
		return jsapiticket;
	}

	public void setJsapiticket(String jsapiticket) {
		this.jsapiticket = jsapiticket;
	}
	@Column(name ="jsapitickettime",nullable=true)
	public java.util.Date getJsapitickettime() {
		return jsapitickettime;
	}

	public void setJsapitickettime(java.util.Date jsapitickettime) {
		this.jsapitickettime = jsapitickettime;
	}
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  主键
	 */
	
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
	@Column(name ="ID",nullable=false,length=36)
	public String getId(){
		return this.id;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  主键
	 */
	public void setId(String id){
		this.id = id;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  公众帐号名称
	 */
	@Column(name ="ACCOUNTNAME",nullable=true,length=200)
	public String getAccountname(){
		return this.accountname;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  公众帐号名称
	 */
	public void setAccountname(String accountname){
		this.accountname = accountname;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  公众帐号TOKEN
	 */
	@Column(name ="ACCOUNTTOKEN",nullable=true,length=200)
	public String getAccounttoken(){
		return this.accounttoken;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  公众帐号TOKEN
	 */
	public void setAccounttoken(String accounttoken){
		this.accounttoken = accounttoken;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  公众微信号
	 */
	@Column(name ="ACCOUNTNUMBER",nullable=true,length=200)
	public String getAccountnumber(){
		return this.accountnumber;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  公众微信号
	 */
	public void setAccountnumber(String accountnumber){
		this.accountnumber = accountnumber;
	}
	
	public String getWeixin_accountid() {
		return weixin_accountid;
	}

	public void setWeixin_accountid(String weixin_accountid) {
		this.weixin_accountid = weixin_accountid;
	}

	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  公众号类型
	 */
	@Column(name ="ACCOUNTTYPE",nullable=true,length=50)
	public String getAccounttype(){
		return this.accounttype;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  公众号类型
	 */
	public void setAccounttype(String accounttype){
		this.accounttype = accounttype;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  电子邮箱
	 */
	@Column(name ="ACCOUNTEMAIL",nullable=true,length=200)
	public String getAccountemail(){
		return this.accountemail;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  电子邮箱
	 */
	public void setAccountemail(String accountemail){
		this.accountemail = accountemail;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  公众帐号描述
	 */
	@Column(name ="ACCOUNTDESC",nullable=true,length=500)
	public String getAccountdesc(){
		return this.accountdesc;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  公众帐号描述
	 */
	public void setAccountdesc(String accountdesc){
		this.accountdesc = accountdesc;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  公众帐号APPID
	 */
	@Column(name ="ACCOUNTAPPID",nullable=true,length=200)
	public String getAccountappid(){
		return this.accountappid;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  公众帐号APPID
	 */
	public void setAccountappid(String accountappid){
		this.accountappid = accountappid;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  公众帐号APPSECRET
	 */
	@Column(name ="ACCOUNTAPPSECRET",nullable=true,length=500)
	public String getAccountappsecret(){
		return this.accountappsecret;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  公众帐号APPSECRET
	 */
	public void setAccountappsecret(String accountappsecret){
		this.accountappsecret = accountappsecret;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  ACCESS_TOKEN
	 */
	@Column(name ="ACCOUNTACCESSTOKEN",nullable=true,length=1000)
	public String getAccountaccesstoken(){
		return this.accountaccesstoken;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  ACCESS_TOKEN
	 */
	public void setAccountaccesstoken(String accountaccesstoken){
		this.accountaccesstoken = accountaccesstoken;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  TOKEN获取时间
	 */
	@Column(name ="ADDTOEKNTIME",nullable=true,length=100)
	public java.util.Date getAddtoekntime(){
		return this.addtoekntime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  TOKEN获取时间
	 */
	public void setAddtoekntime(java.util.Date addtoekntime){
		this.addtoekntime = addtoekntime;
	}
	
	@Column(name ="USERNAME",nullable=true,length=50)
	public String getUserName() {
		return userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
}
