package com.salesmanager.core.model.conveniencefee;

import java.math.BigDecimal;
import org.json.simple.JSONAware;
import org.json.simple.JSONObject;

/**
 * Convenience fee settings saved in MerchantConfiguration
 *
 * @author Bao Le
 */
public class ConvenienceFeeConfiguration implements JSONAware {
  private boolean enabled;
  private BigDecimal convenienceFee;

  @SuppressWarnings("unchecked")
  @Override
  public String toJSONString() {
    JSONObject data = new JSONObject();
    data.put("enabled", enabled);
    data.put("convenienceFee", convenienceFee);

    return data.toJSONString();
  }

  public boolean isEnabled() {
    return enabled;
  }

  public void setEnabled(boolean enabled) {
    this.enabled = enabled;
  }

  public BigDecimal getConvenienceFee() {
    return convenienceFee;
  }

  public void setConvenienceFee(BigDecimal convenienceFee) {
    this.convenienceFee = convenienceFee;
  }
}
