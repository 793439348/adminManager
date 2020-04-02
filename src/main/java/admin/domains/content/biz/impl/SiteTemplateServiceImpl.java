package admin.domains.content.biz.impl;

import admin.domains.pool.AdminDataFactory;
import javautils.StringUtil;
import javautils.jdbc.PageList;
import admin.domains.content.dao.SiteTemplateDao;
import admin.domains.content.entity.SiteTemplate;
import admin.domains.content.biz.SiteTemplateService;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *
 * </p>
 *
 * @author: zeng
 * @since: 2020-03-27
 */
@Service
public class SiteTemplateServiceImpl implements SiteTemplateService {

    @Autowired
    private AdminDataFactory adminDataFactory;

    @Autowired
    private SiteTemplateDao siteTemplateDao;

    @Override
    public SiteTemplate getBeanByCode(String code) {
        return siteTemplateDao.getBeanByCode(code);
    }

    @Override
    public SiteTemplate getBean(Integer id) {

        return siteTemplateDao.getBean(id);
    }

    @Override
    public List<SiteTemplate> findAll() {
        return siteTemplateDao.findAll();
    }

    @Override
    public PageList search(Integer type,String name,Integer page,Integer pageSize) {
        List<Criterion> criteria = new ArrayList<>();
        List<Order> orders = new ArrayList<>();

        if (type!=null && type>-1 && type<2)
            criteria.add((Criterion) Restrictions.eq("type", type));

        if (StringUtil.isNotNull(name))
            criteria.add((Criterion) Restrictions.like("name",name));


        return siteTemplateDao.find(criteria,orders,page,pageSize);
    }

    @Override
    public boolean add(SiteTemplate siteTemplate) {
        return siteTemplateDao.add(siteTemplate);
    }

    @Override
    public boolean update(SiteTemplate siteTemplate) {
        return siteTemplateDao.update(siteTemplate);
    }
}
