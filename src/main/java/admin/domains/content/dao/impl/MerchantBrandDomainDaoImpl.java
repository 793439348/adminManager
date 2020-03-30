package admin.domains.content.dao.impl;

import javautils.jdbc.PageList;
import javautils.jdbc.hibernate.HibernateSuperDao;
import admin.domains.content.dao.MerchantBrandDomainDao;
import admin.domains.content.entity.MerchantBrandDomain;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 * 商户域名
 * </p>
 *
 * @author: zeng
 * @since: 2020-03-26
 */
@Repository
public class MerchantBrandDomainDaoImpl implements MerchantBrandDomainDao {

    @Autowired
    private HibernateSuperDao<MerchantBrandDomain> superDao;

    public boolean add(MerchantBrandDomain merchantBrandDomain) {
        return superDao.save(merchantBrandDomain);
    }

    public boolean delete(MerchantBrandDomain merchantBrandDomain) {
        return superDao.delete(merchantBrandDomain);
    }

    public boolean update(MerchantBrandDomain merchantBrandDomain) {
        return superDao.update(merchantBrandDomain);
    }

    public PageList find(List<Criterion> condition, List<Order> sort, int page, int pageSize) {
        final String propertyName = "id";
        return superDao.findPageList(MerchantBrandDomain.class,propertyName,condition,sort,page,pageSize);
    }
}
