package com.salesmanager.shop.model.order.v1.checkout;

import java.io.Serializable;
import java.util.List;

public class CheckoutInformationEntity implements Serializable {
  private static final long serialVersionUID = -1580332324531600179L;

  private boolean enabled;
  private List<CIType> types;

  public boolean isEnabled() {
    return enabled;
  }

  public void setEnabled(boolean enabled) {
    this.enabled = enabled;
  }

  public List<CIType> getTypes() {
    return types;
  }

  public void setTypes(List<CIType> types) {
    this.types = types;
  }
}
