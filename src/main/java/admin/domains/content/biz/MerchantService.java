package admin.domains.content.biz;

import javautils.jdbc.PageList;
import admin.domains.content.entity.Merchant;

/**
 * <p>
 *
 * </p>
 *
 * @author: zeng
 * @since: 2020-03-27
 */
public interface MerchantService {

    boolean add(Merchant merchant);

    PageList search(String name,String code,Integer status,Integer page,Integer pageSize);

    boolean updateMerchant(Merchant merchant);

    Merchant getMerchant(Integer id);

}
