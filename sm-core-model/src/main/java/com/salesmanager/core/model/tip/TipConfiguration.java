package com.salesmanager.core.model.tip;

import org.json.simple.JSONAware;
import org.json.simple.JSONObject;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Set of various customer tip configuration settings saved in MerchantConfiguration
 *
 * @author Bao Le
 */
public class TipConfiguration implements JSONAware {

	private List<TipRate> tipRates = new ArrayList<>(Collections.singletonList(TipRate.NONE));

	@SuppressWarnings("unchecked")
	@Override
	public String toJSONString() {
		JSONObject data = new JSONObject();
		data.put("tipRates", tipRates);

		return data.toJSONString();
	}

	public List<TipRate> getTipRates() {
		return tipRates;
	}

	public void setTipRates(List<TipRate> tipRates) {
		this.tipRates = tipRates;
	}
}
