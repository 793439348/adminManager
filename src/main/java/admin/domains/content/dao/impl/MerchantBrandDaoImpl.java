package admin.domains.content.dao.impl;

import javautils.jdbc.PageList;
import javautils.jdbc.hibernate.HibernateSuperDao;
import admin.domains.content.dao.MerchantBrandDao;
import admin.domains.content.entity.MerchantBrand;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 * 商户品牌
 * </p>
 *
 * @author: zeng
 * @since: 2020-03-26
 */
@Repository
public class MerchantBrandDaoImpl implements MerchantBrandDao {
    @Autowired
    private HibernateSuperDao<MerchantBrand> superDao;

    @Override
    public List<MerchantBrand> findAll() {
        String hql = "from MerchantBrand";
        return superDao.list(hql);
    }

    public boolean add(MerchantBrand merchantBrand) {
        return superDao.save(merchantBrand);
    }

    public boolean delete(MerchantBrand merchantBrand) {
        return superDao.delete(merchantBrand);
    }

    public boolean update(MerchantBrand merchantBrand) {
        return superDao.update(merchantBrand);
    }

    public PageList find(List<Criterion> condition, List<Order> sort, int page, int pageSize) {
        /*主键，用于查询总条数*/
        final String propertyName = "id";
        return superDao.findPageList(MerchantBrand.class, propertyName, condition, sort, page, pageSize);
    }
}
