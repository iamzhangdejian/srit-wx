package weixin.swork.controller;


import org.apache.log4j.Logger;
import org.jeecgframework.core.common.controller.BaseController;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 登陆主界面控制器
 *
 * @author dejian.zhang
 */
@Scope("prototype")
@Controller
@RequestMapping("/SworkMainController")
public class SworkMainController extends BaseController {

    private Logger log = Logger.getLogger(SworkMainController.class);


}
