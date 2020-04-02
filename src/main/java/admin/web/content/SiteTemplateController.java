package admin.web.content;

import admin.domains.content.entity.AdminUser;
import admin.domains.content.entity.Merchant;
import admin.domains.content.entity.SiteTemplate;
import admin.web.WebJSONObject;
import admin.web.helper.AbstractActionController;
import com.alibaba.fastjson.JSON;
import javautils.http.HttpUtil;
import admin.domains.content.biz.SiteTemplateService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * <p>
 *
 * </p>
 *
 * @author: zeng
 * @since: 2020-03-27
 */
@Slf4j
@Controller
public class SiteTemplateController extends AbstractActionController {

    @Autowired
    private SiteTemplateService siteTemplateService;

    @RequestMapping(value = "/site-template/list",method = RequestMethod.POST)
    public void SITE_TEMPLATE_LIST(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        final String actionKey = "/site-template/list";
        final WebJSONObject json = new WebJSONObject(super.getAdminDataFactory());
        final AdminUser uEntity = super.getCurrUser(session, request, response);

        List<SiteTemplate> all = siteTemplateService.findAll();
        HttpUtil.write(response, JSON.toJSONString(all),"text/json");

        /*if (uEntity != null) {
            if (super.hasAccess(uEntity, actionKey)){

            }else
                json.set(2,"");
        }else
            json.set(2,"");
        HttpUtil.write(response,json.toString(),"text/json");*/
    }

    @RequestMapping(value = "/site-template/add",method = RequestMethod.POST)
    public void SITE_TEMPLATE_ADD(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        final String actionKey = "/site-template/add";
        final WebJSONObject json = new WebJSONObject(super.getAdminDataFactory());
        final AdminUser uEntity = super.getCurrUser(session, request, response);

        String code = request.getParameter("code");
        String name = request.getParameter("name");
        Integer type = HttpUtil.getIntParameter(request, "type");
        String smallImage = request.getParameter("smallImage");
        String bigImage = request.getParameter("bigImage");

        SiteTemplate siteTemplate = new SiteTemplate(code, name, type, smallImage, bigImage);

        log.info("SITE_TEMPLATE_ADD :{}", siteTemplate);
        boolean add = siteTemplateService.add(siteTemplate);
        HttpUtil.write(response,JSON.toJSONString(add),"text");
        /*if (uEntity != null) {
            if (super.hasAccess(uEntity, actionKey)){

            }else
                json.set(2,"");
        }else
            json.set(2,"");
        HttpUtil.write(response,json.toString(),"text/json");*/
    }

    @RequestMapping(value = "/site-template/delete",method = RequestMethod.POST)
    public void SITE_TEMPLATE_DELETE(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        final String actionKey = "/site-template/delete";
        final WebJSONObject json = new WebJSONObject(super.getAdminDataFactory());
        final AdminUser uEntity = super.getCurrUser(session, request, response);

        if (uEntity != null) {
            if (super.hasAccess(uEntity, actionKey)){

            }else
                json.set(2,"");
        }else
            json.set(2,"");
        HttpUtil.write(response,json.toString(),"text/json");
    }

    @RequestMapping(value = "/site-template/update",method = RequestMethod.POST)
    public void SITE_TEMPLATE_UPDATE(SiteTemplate siteTemplate,HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        final String actionKey = "/site-template/update";
        final WebJSONObject json = new WebJSONObject(super.getAdminDataFactory());
        final AdminUser uEntity = super.getCurrUser(session, request, response);

        log.info("SITE_TEMPLATE_UPDATE :{}",siteTemplate);
        boolean add = siteTemplateService.update(siteTemplate);
        HttpUtil.write(response,JSON.toJSONString(add),"text");
       /* if (uEntity != null) {
            if (super.hasAccess(uEntity, actionKey)){

            }else
                json.set(2,"");
        }else
            json.set(2,"");
        HttpUtil.write(response,json.toString(),"text/json");*/
    }

    @ResponseBody
    @RequestMapping(value = "/site-template/get", method = RequestMethod.POST)
    public void getMerchant(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        Integer id = HttpUtil.getIntParameter(request, "id");
        SiteTemplate siteTemplate = siteTemplateService.getBean(id);
        HttpUtil.write(response, JSON.toJSONString(siteTemplate),"text/json");
    }
    @ResponseBody
    @RequestMapping(value = "/site-template/getbycode", method = RequestMethod.POST)
    public void getMerchantByCode(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        String code = request.getParameter("code");
        SiteTemplate siteTemplate = siteTemplateService.getBeanByCode(code);
        HttpUtil.write(response, JSON.toJSONString(siteTemplate),"text/json");
    }
}
