package lottery.domains.content.vo.user;

import lottery.domains.content.entity.LotteryPlayRulesGroup;
import lottery.domains.content.entity.LotteryPlayRules;
import lottery.domains.content.entity.Lottery;
import lottery.domains.pool.LotteryDataFactory;
import lottery.domains.content.entity.UserBets;

public class UserBetsVO
{
    private String username;
    private String lottery;
    private String mname;
    private UserBets bean;
    
    public UserBetsVO(final UserBets bean, final LotteryDataFactory lotteryDataFactory, final boolean isShowNum) {
        this.bean = bean;
        final UserVO tmpUser = lotteryDataFactory.getUser(bean.getUserId());
        if (tmpUser != null) {
            this.username = tmpUser.getUsername();
        }
        final Lottery lottery = lotteryDataFactory.getLottery(bean.getLotteryId());
        if (lottery != null) {
            this.lottery = lottery.getShowName();
        }
        final LotteryPlayRules playRules = lotteryDataFactory.getLotteryPlayRules(bean.getRuleId());
        if (playRules != null) {
            final LotteryPlayRulesGroup group = lotteryDataFactory.getLotteryPlayRulesGroup(playRules.getGroupId());
            if (group != null) {
                this.mname = "[" + group.getName() + "_" + playRules.getName() + "]";
            }
        }
        if (!isShowNum) {
            this.bean.setCodes(null);
        }
    }
    
    public String getUsername() {
        return this.username;
    }
    
    public void setUsername(final String username) {
        this.username = username;
    }
    
    public String getLottery() {
        return this.lottery;
    }
    
    public void setLottery(final String lottery) {
        this.lottery = lottery;
    }
    
    public String getMname() {
        return this.mname;
    }
    
    public void setMname(final String mname) {
        this.mname = mname;
    }
    
    public UserBets getBean() {
        return this.bean;
    }
    
    public void setBean(final UserBets bean) {
        this.bean = bean;
    }
}
