package admin.web.content;

import admin.domains.content.entity.AdminUser;
import admin.web.WebJSONObject;
import admin.web.helper.AbstractActionController;
import javautils.http.HttpUtil;
import admin.domains.content.biz.SiteTemplateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * <p>
 *
 * </p>
 *
 * @author: zeng
 * @since: 2020-03-27
 */
@Controller
public class SiteTemplateController extends AbstractActionController {

    @Autowired
    private SiteTemplateService siteTemplateService;

    @RequestMapping(value = "/site-template/list",method = RequestMethod.POST)
    public void SITE_TEMPLATE_LIST(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        final String actionKey = "/site-template/list";
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

    @RequestMapping(value = "/site-template/add",method = RequestMethod.POST)
    public void SITE_TEMPLATE_ADD(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        final String actionKey = "/site-template/add";
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
    public void SITE_TEMPLATE_UPDATE(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        final String actionKey = "/site-template/update";
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
}
