package admin.web.content;

import admin.domains.content.entity.AdminUser;
import admin.web.WebJSONObject;
import admin.web.helper.AbstractActionController;
import javautils.http.HttpUtil;
import admin.domains.content.biz.MerchantBrandDomainService;
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
public class MerchantBrandDomainController extends AbstractActionController {

    @Autowired
    private MerchantBrandDomainService domainService;

    @RequestMapping(value = "/merchant-brand-domain/list",method = RequestMethod.POST)
    public void MERCHANT_BRAND_DOMAIN_LIST(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        final String actionKey = "/merchant-brand-domain/list";
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

    @RequestMapping(value = "/merchant-brand-domain/add",method = RequestMethod.POST)
    public void MERCHANT_BRAND_DOMAIN_ADD(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        final String actionKey = "/merchant-brand-domain/add";
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

    @RequestMapping(value = "/merchant-brand-domain/delete",method = RequestMethod.POST)
    public void MERCHANT_BRAND_DOMAIN_DELETE(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        final String actionKey = "/merchant-brand-domain/delete";
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

    @RequestMapping(value = "/merchant-brand-domain/update",method = RequestMethod.POST)
    public void MERCHANT_BRAND_DOMAIN_UPDATE(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        final String actionKey = "/merchant-brand-domain/update";
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
