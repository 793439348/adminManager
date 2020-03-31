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

    @Override
    public SiteTemplate getBean(Integer id) {
        String hql = "from SiteTemplate where id = ?0";
        Object[] objs = {id};
        return (SiteTemplate) superDao.unique(hql,objs);
    }

    @Override
    public List<SiteTemplate> findAll() {
        String hql = "from SiteTemplate";
        return superDao.list(hql);
    }

    public boolean add(SiteTemplate siteTemplate) {
        return superDao.save(siteTemplate);
    }

    public boolean delete(SiteTemplate siteTemplate) {
        return superDao.delete(siteTemplate);
    }

    public boolean update(SiteTemplate siteTemplate) {
        String hql = "update SiteTemplate set name = ?0,type = ?1,smallImage=?2,bigImage=?3 where id = ?4";
        Object[] objs = {siteTemplate.getName(), siteTemplate.getType(), siteTemplate.getSmallImage(),
                siteTemplate.getBigImage(),siteTemplate.getId()};
        return superDao.update(hql, objs);
    }

    public PageList find(List<Criterion> condition, List<Order> sort, int page, int pageSize) {
        final String propertyName = "id";
        return superDao.findPageList(SiteTemplate.class, propertyName, condition, sort, page, pageSize);
    }
}
