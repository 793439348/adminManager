package admin.domains.content.dao.impl;

import javautils.jdbc.PageList;
import javautils.jdbc.hibernate.HibernateSuperDao;
import admin.domains.content.dao.SiteTemplateDao;
import admin.domains.content.entity.SiteTemplate;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 * 商户模板
 * </p>
 *
 * @author: zeng
 * @since: 2020-03-26
 */
@Repository
public class SiteTemplateDaoImpl implements SiteTemplateDao {

    @Autowired
    private HibernateSuperDao<SiteTemplate> superDao;

    public boolean add(SiteTemplate siteTemplate) {
        return superDao.save(siteTemplate);
    }

    public boolean delete(SiteTemplate siteTemplate) {
        return superDao.delete(siteTemplate);
    }

    public boolean update(SiteTemplate siteTemplate) {
        return superDao.update(siteTemplate);
    }

    public PageList find(List<Criterion> condition, List<Order> sort, int page, int pageSize) {
        final String propertyName = "id";
        return superDao.findPageList(SiteTemplate.class, propertyName, condition, sort, page, pageSize);
    }
}
