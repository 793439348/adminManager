package admin.domains.content.biz;

import javautils.jdbc.PageList;
import admin.domains.content.entity.SiteTemplate;

/**
 * <p>
 *
 * </p>
 *
 * @author: zeng
 * @since: 2020-03-27
 */
public interface SiteTemplateService {

    PageList search(Integer type,String name,Integer page,Integer pageSize);

    boolean add(SiteTemplate siteTemplate);

    boolean update(SiteTemplate siteTemplate);
}
