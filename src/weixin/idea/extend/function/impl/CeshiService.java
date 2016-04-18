package weixin.idea.extend.function.impl;

import org.jeecgframework.core.util.ApplicationContextUtil;
import weixin.guanjia.account.service.WeixinAccountServiceI;
import weixin.guanjia.core.entity.message.resp.Article;
import weixin.guanjia.core.entity.message.resp.NewsMessageResp;
import weixin.guanjia.core.entity.message.resp.TextMessageResp;
import weixin.guanjia.core.util.MessageUtil;
import weixin.idea.extend.function.KeyServiceI;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.ResourceBundle;

/**
 * 微网站
 * @author zhangdaihao
 *
 */
public class CeshiService implements KeyServiceI {
	
	public String excute(String content, TextMessageResp defaultMessage,
			HttpServletRequest request) {
		WeixinAccountServiceI weixinAccountService =(WeixinAccountServiceI)ApplicationContextUtil.getContext().getBean("weixinAccountService");
		ResourceBundle bundler = ResourceBundle.getBundle("sysConfig");
		List<Article> articleList = new ArrayList<Article>();
		Article article = new Article();
		article.setTitle("通州三网融合测试信息1");
		article.setDescription("");
		article.setPicUrl(bundler.getString("domain")+ "/webpage/weixin/cms/images/index.jpg");
		// 此userid后期需要通过高级接口获取到微信帐号，此处先以加密后的ID为参数进行传递
		article.setUrl("http://www.sina.cn");
		Article article1 = new Article();
		article1.setTitle("通州三网融合测试信息2");
		article1.setDescription("");
		article1.setPicUrl(bundler.getString("domain")+ "/webpage/weixin/cms/images/index.jpg");
		// 此userid后期需要通过高级接口获取到微信帐号，此处先以加密后的ID为参数进行传递
		article1.setUrl("http://www.baidu.com");
		articleList.add(article);
		articleList.add(article1);
		NewsMessageResp newsMessage = new NewsMessageResp();
		newsMessage.setToUserName(defaultMessage.getToUserName());
		newsMessage.setFromUserName(defaultMessage.getFromUserName());
		newsMessage.setCreateTime(new Date().getTime());
		newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
		newsMessage.setArticleCount(articleList.size());
		newsMessage.setArticles(articleList);
		return MessageUtil.newsMessageToXml(newsMessage);
	}

	@Override
	public String getKey() {

		return "微信测试,CS";
	}

}
