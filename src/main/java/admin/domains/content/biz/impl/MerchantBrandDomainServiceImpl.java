package admin.domains.content.biz.impl;

import admin.domains.pool.AdminDataFactory;
import javautils.StringUtil;
import javautils.jdbc.PageList;
import admin.domains.content.dao.MerchantBrandDomainDao;
import admin.domains.content.entity.MerchantBrandDomain;
import admin.domains.content.biz.MerchantBrandDomainService;
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
public class MerchantBrandDomainServiceImpl implements MerchantBrandDomainService {

    @Autowired
    private AdminDataFactory adminDataFactory;

    @Autowired
    private MerchantBrandDomainDao domainDao;

    @Override
    public PageList search(String name, Integer status, String domain, Integer page, Integer pageSize) {
        final List<Criterion> criterions = new ArrayList<Criterion>();
        final List<Order> orders = new ArrayList<Order>();

        if (StringUtil.isNotNull(name))
            criterions.add((Criterion) Restrictions.like("name", name));

        if (StringUtil.isNotNull(domain))
            criterions.add((Criterion) Restrictions.like("domain", domain));

        if (status != null && status > -1 && status < 2)
            criterions.add((Criterion) Restrictions.eq("status", status));

        orders.add(Order.desc("id"));

        return domainDao.find(criterions,orders,page,pageSize);
    }

    @Override
    public boolean add(MerchantBrandDomain domain) {
        return domainDao.add(domain);
    }

    @Override
    public boolean update(MerchantBrandDomain domain) {
        return domainDao.update(domain);
    }

    @Override
    public boolean delete(MerchantBrandDomain domain) {
        return domainDao.delete(domain);
    }
}
