package com.salesmanager.shop.model.configuration;

import java.io.Serializable;
import java.math.BigDecimal;

public class ConvenienceFeeConfigurationEntity implements Serializable {
  private static final long serialVersionUID = -6592204492235293462L;

  private boolean enabled;
  private BigDecimal convenienceFee;

  public static long getSerialversionuid() {
    return serialVersionUID;
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
