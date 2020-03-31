package admin.domains.content.vo;

import admin.domains.content.entity.Merchant;
import admin.domains.content.entity.MerchantBrand;
import admin.domains.content.entity.MerchantBrandDomain;
import lombok.Data;

/**
 * <p>
 *
 * </p>
 *
 * @author: zeng
 * @since: 2020-03-31
 */
@Data
public class MerchantDomainVO {
    private Integer id ;
    private String merchantCode;
    private String brandName;
    private String name;
    private Integer type;
    private String domain;
    private Integer isfalse;
    private Integer status;

    public MerchantDomainVO() {
    }

    public MerchantDomainVO(Merchant merchant, MerchantBrand brand,MerchantBrandDomain domain) {
        this.id = domain.getId();
        this.merchantCode = merchant.getCode();
        this.brandName = brand.getName();
        this.domain = domain.getDomain();
        this.type = 0;
        this.name = "";
        this.isfalse = 0;
        this.status = 0;
    }
}