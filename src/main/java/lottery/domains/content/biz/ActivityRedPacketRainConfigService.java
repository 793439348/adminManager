package lottery.domains.content.biz;

import lottery.domains.content.entity.ActivityRedPacketRainConfig;

public interface ActivityRedPacketRainConfigService
{
    ActivityRedPacketRainConfig getConfig();
    
    boolean updateConfig(final int p0, final String p1, final String p2, final int p3);
    
    boolean updateStatus(final int p0, final int p1);
}
