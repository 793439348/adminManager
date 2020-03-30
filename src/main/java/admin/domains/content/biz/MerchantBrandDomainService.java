package admin.domains.content.biz;

import javautils.jdbc.PageList;
import admin.domains.content.entity.MerchantBrandDomain;

/**
 * <p>
 *
 * </p>
 *
 * @author: zeng
 * @since: 2020-03-27
 */
public interface MerchantBrandDomainService {

    PageList search(String name,Integer status,String domain,Integer page,Integer pageSize);

    boolean add(MerchantBrandDomain domain);

    boolean update(MerchantBrandDomain domain);

    boolean delete(MerchantBrandDomain domain);


}
