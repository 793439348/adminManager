package admin.web.content;

import admin.domains.content.entity.AdminUser;
import admin.domains.content.entity.MerchantBrand;
import admin.domains.content.entity.MerchantBrandDomain;
import admin.domains.content.vo.MerchantDomainVO;
import admin.domains.pool.AdminDataFactory;
import admin.web.WebJSONObject;
import admin.web.helper.AbstractActionController;
import com.alibaba.fastjson.JSON;
import javautils.http.HttpUtil;
import admin.domains.content.biz.MerchantBrandDomainService;
import javautils.jdbc.PageList;
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
public class MerchantBrandDomainController extends AbstractActionController {

    @Autowired
    private MerchantBrandDomainService domainService;
    @ResponseBody
    @RequestMapping(value = "/merchant-brand-domain/list", method = RequestMethod.POST)
    public void MERCHANT_BRAND_DOMAIN_LIST(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        final String actionKey = "/merchant-brand-domain/list";
        final WebJSONObject json = new WebJSONObject(super.getAdminDataFactory());
        final AdminUser uEntity = super.getCurrUser(session, request, response);

        List<MerchantDomainVO> all = domainService.findAll();
        HttpUtil.write(response, JSON.toJSONString(all), "text/json");

        /*if (uEntity != null) {
            if (super.hasAccess(uEntity, actionKey)){

            }else
                json.set(2,"");
        }else
            json.set(2,"");*/
//        HttpUtil.write(response,json.toString(),"text/json");
    }
    @ResponseBody
    @RequestMapping(value = "/merchant-brand-domain/add", method = RequestMethod.POST)
    public void MERCHANT_BRAND_DOMAIN_ADD(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        final String actionKey = "/merchant-brand-domain/add";
        final WebJSONObject json = new WebJSONObject(super.getAdminDataFactory());
        final AdminUser uEntity = super.getCurrUser(session, request, response);

        Integer brand = HttpUtil.getIntParameter(request, "brandId");
        String domain = request.getParameter("domain");
        System.out.println(brand+"==========="+domain);

        MerchantBrandDomain brandDomain = new MerchantBrandDomain(brand,domain);

        boolean add = domainService.add(brandDomain);
        HttpUtil.write(response, JSON.toJSONString(add), "text");
        /*if (uEntity != null) {
            if (super.hasAccess(uEntity, actionKey)) {

            } else
                json.set(2, "");
        } else
            json.set(2, "");
        HttpUtil.write(response, json.toString(), "text/json");*/
    }
    @ResponseBody
    @RequestMapping(value = "/merchant-brand-domain/delete", method = RequestMethod.POST)
    public void MERCHANT_BRAND_DOMAIN_DELETE(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        final String actionKey = "/merchant-brand-domain/delete";
        final WebJSONObject json = new WebJSONObject(super.getAdminDataFactory());
        final AdminUser uEntity = super.getCurrUser(session, request, response);

        Integer id = HttpUtil.getIntParameter(request,"id");
        boolean delete = domainService.delete(id);
        HttpUtil.write(response, JSON.toJSONString(delete), "text");
        /*if (uEntity != null) {
            if (super.hasAccess(uEntity, actionKey)) {

            } else
                json.set(2, "");
        } else
            json.set(2, "");
        HttpUtil.write(response, json.toString(), "text/json");*/
    }
    @ResponseBody
    @RequestMapping(value = "/merchant-brand-domain/update", method = RequestMethod.POST)
    public void MERCHANT_BRAND_DOMAIN_UPDATE(MerchantBrandDomain brandDomain,HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        final String actionKey = "/merchant-brand-domain/update";
        final WebJSONObject json = new WebJSONObject(super.getAdminDataFactory());
        final AdminUser uEntity = super.getCurrUser(session, request, response);

        log.info("domain modify:[{}]",brandDomain);

        boolean update = domainService.update(brandDomain);
        HttpUtil.write(response,String.valueOf(update),"text");
        /*if (uEntity != null) {
            if (super.hasAccess(uEntity, actionKey)) {

            } else
                json.set(2, "");
        } else
            json.set(2, "");
        HttpUtil.write(response, json.toString(), "text/json");*/
    }
    @ResponseBody
    @RequestMapping(value = "/merchant-brand-domain/get", method = RequestMethod.POST)
    public void MERCHANT_BRAND_DOMAIN_GET(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        final WebJSONObject json = new WebJSONObject(super.getAdminDataFactory());
        final AdminUser uEntity = super.getCurrUser(session, request, response);
        Integer id = HttpUtil.getIntParameter(request, "id");

        MerchantDomainVO domain = domainService.getBean(id);
        log.info("GET BEAN:{}",domain);
        HttpUtil.write(response, JSON.toJSONString(domain), "text/json");
    }
    @ResponseBody
    @RequestMapping(value = "/merchant-brand-domain/search",method = RequestMethod.POST)
    public void searchDomain(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        Integer brand = HttpUtil.getIntParameter(request,"brand");
        String domain = request.getParameter("domain");
        Integer page = HttpUtil.getIntParameter(request,"page");
        Integer pageSize = HttpUtil.getIntParameter(request,"pageSize");
        log.info("search domain:[{} - {} - {} - {}]",brand,domain,page,pageSize);
        final WebJSONObject json = new WebJSONObject(super.getAdminDataFactory());
        PageList pList = domainService.search(brand, domain, page, pageSize);
        if (pList != null) {
            json.accumulate("totalCount", pList.getCount());
            json.accumulate("data", pList.getList());
        } else {
            json.accumulate("totalCount", 0);
            json.accumulate("data", "[]");
        }
        json.set(0, "0-3");

        HttpUtil.write(response,json.toString(),"text/json");

    }
}
